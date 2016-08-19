"""
views/staff.py - The bulk of the application - provides most business logic and
                 renders all staff-facing views.
                 It combines Knowledgebase logic and the Public logic
"""

from __future__ import unicode_literals

from datetime import datetime, timedelta
from dateutil import relativedelta

from django.contrib.auth.decorators import login_required
try:
    from django.contrib.auth import get_user_model
    User = get_user_model()
except ImportError:
    from django.contrib.auth.models import User
from django.contrib.auth.models import User
from django.contrib.auth.decorators import user_passes_test
from django.core.urlresolvers import reverse
from django.core.exceptions import ValidationError
from django.db import connection
from django.db.models import Q
from django.http import HttpResponseRedirect, Http404, HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext, loader, Context
from django.utils.dates import MONTHS_3
from django.utils.translation import ugettext as _
from django.utils.html import escape
from django.utils.decorators import method_decorator
from django.contrib import messages
from django.conf import settings
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.core import paginator
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.utils.safestring import mark_safe

try:
    from django.utils import timezone
except ImportError:
    from datetime import datetime as timezone


import requests
import json

from helpdesk.serializer import UserSerializer, TicketSerializer, QueueSerializer, FollowUpSerializer, TicketDependencySerializer, AttachmentSerializer, TicketChangeSerializer
from helpdesk.forms import TicketForm, UserSettingsForm, CommentTicketForm, CommentFollowUpForm, EmailIgnoreForm, EditTicketForm, TicketCCForm, EditFollowUpForm, TicketDependencyForm, PublicTicketForm
from helpdesk.lib import send_templated_mail, query_to_dict, apply_query, safe_template_context
from helpdesk.models import Ticket, UserVotes, Queue, UserSettings, KBCategory, Tag, KBItem, FollowUp, TicketChange, PreSetReply, Attachment, SavedSearch, IgnoreEmail, TicketCC, TicketDependency, EmailTemplate
from helpdesk.github import new_issue, get_issue_status, add_comments, open_issue, close_issue, queue_repo, get_label
from helpdesk.slack import post_slack,post_tola_slack
from helpdesk.email import email

staff_member_required = user_passes_test(lambda u: u.is_authenticated() and u.is_active and u.is_staff)

superuser_required = user_passes_test(lambda u: u.is_authenticated() and u.is_active and u.is_superuser)


###------>>>>>>>>>>>>>>>>>>>>>PUBLIC VIEW<<<<<<<<<<<<<<<<<<<<<<<----###
@login_required

def homepage(request):

    if (request.user.is_staff):
        try:
            if getattr(request.user.usersettings.settings, 'login_view_ticketlist', False):
                return HttpResponseRedirect(reverse('helpdesk_list'))
            else:
                return HttpResponseRedirect(reverse('helpdesk_list'))
        except UserSettings.DoesNotExist:
            return HttpResponseRedirect(reverse('helpdesk_list'))

    if request.method == 'POST':
        form = PublicTicketForm(request.POST, request.FILES)
        form.fields['queue'].choices = [('', '--------')] + [[q.id, q.title] for q in Queue.objects.filter(allow_public_submission=True)]
        if form.is_valid():
            if text_is_spam(form.cleaned_data['body'], request):
                # This submission is spam. Let's not save it.
                return render_to_response('helpdesk/public_spam.html', RequestContext(request, {}))
            else:
                ticket = form.save()
                return HttpResponseRedirect('%s?ticket=%s&email=%s'% (
                    reverse('helpdesk_public_view'),
                    ticket.ticket_for_url,
                    ticket.submitter_email)
                    )
    else:
        try:
            queue = Queue.objects.get(slug=request.GET.get('queue', None))
        except Queue.DoesNotExist:
            queue = None
        initial_data = {}
        if queue:
            initial_data['queue'] = queue.id

        if request.user.email:
            initial_data['submitter_email'] = request.user.email

        form = PublicTicketForm(initial=initial_data)
        form.fields['queue'].choices = [('', '--------')] + [[q.id, q.title] for q in Queue.objects.filter(allow_public_submission=True)]

    knowledgebase_categories = KBCategory.objects.all()

    return render_to_response('helpdesk/public_homepage.html',
        RequestContext(request, {
            'form': form,
            'kb_categories': knowledgebase_categories
        }))

@login_required
def public_view_ticket(request):
    ticket_req = request.GET.get('ticket', '')
    ticket = False
    email = request.GET.get('email', '')
    error_message = ''

    if ticket_req and email:
        parts = ticket_req.split('-')
        queue = '-'.join(parts[0:-1])
        ticket_id = parts[-1]

        try:
            ticket = Ticket.objects.get(id=ticket_id, queue__slug__iexact=queue, submitter_email__iexact=email)
        except:
            ticket = False
            error_message = _('Invalid ticket ID or e-mail address. Please try again.')

        if ticket:

            if request.user.is_staff:
                redirect_url = reverse('helpdesk_view', args=[ticket_id])
                if 'close' in request.GET:
                    redirect_url += '?close'
                return HttpResponseRedirect(redirect_url)

            if 'close' in request.GET and ticket.status == Ticket.RESOLVED_STATUS:
                from helpdesk.views.staff import update_ticket
                # Trick the update_ticket() view into thinking it's being called with
                # a valid POST.
                request.POST = {
                    'new_status': Ticket.CLOSED_STATUS,
                    'public': 1,
                    'title': ticket.title,
                    'comment': _('Submitter accepted resolution and closed ticket'),
                    }
                if ticket.assigned_to:
                    request.POST['owner'] = ticket.assigned_to.id
                request.GET = {}

                return update_ticket(request, ticket_id, public=True)


            # redirect user back to this ticket if possible.
            redirect_url = ''

            return render_to_response('helpdesk/public_view_ticket.html',
                RequestContext(request, {
                    'ticket': ticket,
                    'next': redirect_url,

                }))

    return render_to_response('helpdesk/public_view_form.html',
        RequestContext(request, {
            'ticket': ticket,
            'email': email,
            'error_message': error_message
        }))

@login_required
def public_ticket_list(request):
    context = {}

    # Query_params will hold a dictionary of parameters relating to
    # a query, to be saved if needed:
    query_params = data_query_params()

    from_saved_query = False

    # If the user is coming from the header/navigation search box, lets' first
    # look at their query to see if they have entered a valid ticket number. If
    # they have, just redirect to that ticket number. Otherwise, we treat it as
    # a keyword search.

    if request.GET.get('search_type', None) == 'header':
        query = request.GET.get('q')
        filter = None
        if query.find('-') > 0:
            try:
                queue, id = query.split('-')
                id = int(id)
            except ValueError:
                id = None

            if id:
                filter = {'queue__slug': queue, 'id': id }
        else:
            try:
                query = int(query)
            except ValueError:
                query = None

            if query:
                filter = {'id': int(query) }

        if filter:
            try:
                ticket = Ticket.objects.get(**filter)
                return HttpResponseRedirect(ticket.staff_url)
            except Ticket.DoesNotExist:
                # Go on to standard keyword searching
                pass

    saved_query = None
    if request.GET.get('saved_query', None):
        from_saved_query = True
        try:
            saved_query = SavedSearch.objects.get(pk=request.GET.get('saved_query'))
        except SavedSearch.DoesNotExist:
            return HttpResponseRedirect(reverse('helpdesk_list'))
        if not (saved_query.shared or saved_query.user == request.user):
            return HttpResponseRedirect(reverse('helpdesk_list'))

        try:
            import pickle
        except ImportError:
            import cPickle as pickle
        from helpdesk.lib import b64decode
        query_params = pickle.loads(b64decode(str(saved_query.query)))
    elif not (  'queue' in request.GET
            or  'assigned_to' in request.GET
            or  'status' in request.GET
            or  'q' in request.GET
            or  'sort' in request.GET
            or  'sortreverse' in request.GET
                ):

        # Fall-back if no querying is being done, force the list to only
        # show open/reopened/resolved (not closed) cases sorted by creation
        # date.

        query_params = {
            'filtering': {'status__in': [1, 2, 3]},
            'sorting': 'created',
        }
    else:
        queues = request.GET.getlist('queue')
        if queues:
            try:
                queues = [int(q) for q in queues]
                query_params['filtering']['queue__id__in'] = queues
            except ValueError:
                pass

        owners = request.GET.getlist('assigned_to')
        if owners:
            try:
                owners = [int(u) for u in owners]
                query_params['filtering']['assigned_to__id__in'] = owners
            except ValueError:
                pass

        statuses = request.GET.getlist('status')
        if statuses:
            try:
                statuses = [int(s) for s in statuses]
                query_params['filtering']['status__in'] = statuses
            except ValueError:
                pass

        types = request.GET.getlist('types')
        if types:
            try:
                types = [int(s) for s in types]
                query_params['filtering']['type__in'] = types
            except ValueError:
                pass

        date_from = request.GET.get('date_from')
        if date_from:
            query_params['filtering']['created__gte'] = date_from

        date_to = request.GET.get('date_to')
        if date_to:
            query_params['filtering']['created__lte'] = date_to

        ### KEYWORD SEARCHING
        key_word_searching(request, context, query_params)

        ### SORTING
        data_sorting(request,query_params)


    tickets = Ticket.objects.select_related()
    queue_choices = Queue.objects.all()

    #query and paination

    tickets = data_query_pagination(request, tickets, query_params)

    search_message = ''

    from helpdesk.lib import b64encode

    try:
        import pickle
    except ImportError:
        import cPickle as pickle
    urlsafe_query = b64encode(pickle.dumps(query_params))

    user_saved_queries = SavedSearch.objects.filter(Q(user=request.user) | Q(shared__exact=True))

    querydict = request.GET.copy()
    querydict.pop('page', 1)

    print "TICKET TYPES:"
    print Ticket.TICKET_TYPE

    return render_to_response('helpdesk/public_ticket_list.html',
        RequestContext(request, dict(
            context,
            query_string=querydict.urlencode(),
            tickets=tickets,
            user_choices=User.objects.filter(is_active=True,is_staff=True),
            queue_choices=queue_choices,
            status_choices=Ticket.STATUS_CHOICES,
            type_choices=Ticket.TICKET_TYPE,
            urlsafe_query=urlsafe_query,
            user_saved_queries=user_saved_queries,
            query_params=query_params,
            from_saved_query=from_saved_query,
            saved_query=saved_query,
            search_message=search_message,
        )))


def change_language(request):
    return_to = ''
    if 'return_to' in request.GET:
        return_to = request.GET['return_to']

    return render_to_response('helpdesk/public_change_language.html',
        RequestContext(request, {'next': return_to}))

@login_required
def vote_up(request, id):
    current_user = request.user
    date = datetime.now()
    ticket = Ticket.objects.get(id=id)
    user_vote = UserVotes(current_user=current_user, ticket_voted=ticket, user_vote='1', vote_date=date)
    ticket_new_value = ticket.votes + 1
    #pull out the record with the same ticket_id and user_id as the currently logged in user
    try:
        voted_ticket = UserVotes.objects.get(ticket_voted=ticket,current_user=current_user)
        messages.add_message(request, messages.SUCCESS, 'You can\'t vote on this ticket...See, you already voted for this ticket. Can you vote again? Certainly not!')
    except UserVotes.DoesNotExist:
        voted_ticket = None
    if voted_ticket == None:
        user_vote.save()
        Ticket.objects.filter(id=id).update(votes=ticket_new_value)
        messages.add_message(request, messages.SUCCESS, 'Vote counted. You just voted up for this ticket. Now, let us hope more folks will vote too!')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'),RequestContext(request))
@login_required
def vote_down(request, id):
    current_user = request.user
    date = datetime.now()
    ticket = Ticket.objects.get(id=id)
    user_vote = UserVotes(current_user=current_user, ticket_voted=ticket, user_vote='-1', vote_date=date)

    ticket_new_value = ticket.votes - 1
    try:
        voted_ticket = UserVotes.objects.get(ticket_voted=ticket,current_user=current_user)
        messages.add_message(request, messages.SUCCESS, 'You can\'t vote down this ticket...See, you already voted for this ticket. Can you vote again? Certainly not!')
    except UserVotes.DoesNotExist:
        voted_ticket = None

    if voted_ticket == None:
        user_vote.save()
        Ticket.objects.filter(id=id).update(votes=ticket_new_value)
        messages.add_message(request, messages.SUCCESS, 'Vote counted. You just voted down for this ticket. Now, let us hope more folks will vote too!')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'),RequestContext(request))

def email(ticket,comment, status_text):

    if ticket.get_assigned_to == "Unassigned":
        assignee = ticket.submitter_email
    else:
        assignee = ticket.assigned_to.email

    txt_message = render_to_string('email/notify.txt', {'ticket': ticket, 'status': status_text, 'comment': comment, 'assignee': assignee})
    html_message = render_to_string('email/notify.html', {'ticket': ticket, 'status': status_text, 'comment': comment, 'assignee': assignee})

    send_mail('[TolaWork] ' + ticket.title, txt_message,'TolaData <toladatawork@gmail.com>',[ticket.submitter_email, assignee],fail_silently=False, html_message=html_message)

def post_comment(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    if request.method == 'POST':
        form = CommentFollowUpForm(request.POST)

        if form.is_valid():
            ticket_id = ticket.id
            title = form.cleaned_data['title']
            comment = request.POST.get('comment', '')
            f_public = request.POST.get('public', False)
            status = request.POST.get('new_status')

            if int(status) == 1:
                status_text = 'OPEN'

                if ticket.github_issue_id:
                    #if there are comments, update github
                    repo = queue_repo(ticket)
                    if not comment == '':
                        add_comments(comment,repo,ticket)

                #email notification for 'Open' issue
                email(ticket, comment, status_text)

            elif int(status) == 2:
                status_text = 'RE-OPENED'

                if ticket.github_issue_id:

                    repo = queue_repo(ticket)
                    if not comment == '':
                        add_comments(comment,repo,ticket)

                    #re-open issue in GitHUb
                    response = open_issue(repo,ticket)

                    if int(response) == 200:
                        messages.success(request, 'Success, ticket also re-opened in Github')
                    else:
                        messages.success(request, str(response) + ': There was a problem re-opening the ticket in GitHub')
                    print response

                #email notification for 'Re-Opened' issue
                email(ticket, comment, status_text)

            elif int(status) == 3:
                status_text = 'RESOLVED'

                #email notification for 'Resolved' issue
                email(ticket, comment, status_text)

            elif int(status) == 4:
                status_text = 'CLOSED'

                if ticket.github_issue_id:

                    repo = queue_repo(ticket)
                    if not comment == '':
                        add_comments(comment,repo,ticket)

                    #close issue in GitHUb
                    response=close_issue(repo,ticket)

                    if int(response) == 200:
                        messages.success(request, 'Success, ticket also closed in Github')
                    else:
                        messages.success(request, str(response) + ': There was a problem closing the ticket in GitHub')
                    print response

                #email notification for 'Closed' issue
                email(ticket, comment, status_text)

            elif int(status) == 5:
                status_text = 'DUPLICATE'

                #email notification for 'Duplicate' issue
                email(ticket, comment, status_text)

            else:
                status_text = 'Not a status'

            created = ticket.created

            #check the person whom the ticket is assigned to
            if not ticket.get_assigned_to == 'Unassigned':
                assigned = str(ticket.assigned_to).upper()
            else:
                assigned = None

            on_hold = ticket.on_hold
            description = ticket.description
            resolution = ticket.resolution
            priority = ticket.priority
            due_date = ticket.due_date

            if ticket.tags.all():
                tags = [t.pk for t in ticket.tags.all()]
            else:
                tags = ""

            last_escalation = ticket.last_escalation
            github_id = ticket.github_issue_id
            github_no = ticket.github_issue_number
            github_url = ticket.github_issue_url
            type = ticket.type
            votes = ticket.votes
            queue = ticket.queue
            error = ticket.error_msg
            slack_status = ticket.slack_status

            new_comment = request.POST.get('comment', '')
            if not new_comment == '':
                f_comments = str(request.user.email.upper())  + ' added a comment ' + '  - ' + str(new_comment)
            else:
                f_comments = str(request.user.email.upper())  + ' changed ticket status from ['  + str(ticket.get_status) + '] to [ ' + str(status_text) + ']'


            update_comments = Ticket(id=ticket_id, title=title, created=created,
                                     modified=timezone.now(), description=description,
                                     submitter_email=request.POST.get('submitter_email',request.user.email.upper()), status=status,
                                     on_hold=on_hold, resolution=resolution,
                                     priority=priority, due_date=due_date,
                                     last_escalation=last_escalation, assigned_to=assigned,
                                     queue=queue, github_issue_id=github_id, github_issue_number=github_no,
                                     github_issue_url=github_url, type=type, votes=votes,
                                     error_msg=error, slack_status=slack_status)
            update_comments.save(update_fields=['status','assigned_to'])

            new_followup = FollowUp(title=title, date=timezone.now(), ticket_id=ticket_id, comment=f_comments, public=f_public, new_status=status)
            new_followup.save()

            #Attach a File
            file_attachment(request, new_followup)

    return HttpResponseRedirect(reverse('helpdesk_view', args=[ticket.id]))

def taskview(request):

    return render_to_response('tasks/task_index.html',
        RequestContext(request, {


        }))
taskview = staff_member_required(taskview)

def send_to_github(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    repo = queue_repo(ticket)

    if not ticket.github_issue_id:
        response = new_issue(repo,ticket)

        if int(response) == 201:
            messages.success(request, 'Success, ticket sent to Github')

        else:
            messages.success(request, 'There was a problem sending the ticket to GitHub')
            print response

    return HttpResponseRedirect(reverse('helpdesk_view', args=[ticket.id]))

#@method_decorator(staff_member_required)
def delete_ticket(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)

    if request.method == 'GET':
        return render_to_response('helpdesk/delete_ticket.html',
            RequestContext(request, {
                'ticket': ticket,
            }))
    else:
        ticket.delete()
        return HttpResponseRedirect(reverse('helpdesk_home'))
delete_ticket = staff_member_required(delete_ticket)


def followup_edit(request, ticket_id, followup_id):
    "Edit followup options with an ability to change the ticket."
    followup = get_object_or_404(FollowUp, id=followup_id)
    ticket = get_object_or_404(Ticket, id=ticket_id)
    if request.method == 'GET':
        form = EditFollowUpForm(initial=
                                     {'title': escape(followup.title),
                                      'ticket': followup.ticket,
                                      'comment': escape(followup.comment),
                                      'public': followup.public,
                                      'new_status': followup.new_status,
                                      })

        ticketcc_string, SHOW_SUBSCRIBE = return_ticketccstring_and_show_subscribe(request.user, ticket)

        return render_to_response('helpdesk/followup_edit.html',
            RequestContext(request, {
                'followup': followup,
                'ticket': ticket,
                'form': form,
                'ticketcc_string': ticketcc_string,
        }))
    elif request.method == 'POST':
        form = EditFollowUpForm(request.POST)
        if form.is_valid():
            title = form.cleaned_data['title']
            _ticket = form.cleaned_data['ticket']
            comment = form.cleaned_data['comment']
            public = form.cleaned_data['public']
            new_status = form.cleaned_data['new_status']
            #will save previous date
            old_date = followup.date
            new_followup = FollowUp(title=title, date=old_date, ticket=_ticket, comment=comment, public=public, new_status=new_status, )
            # keep old user if one did exist before.
            if followup.user:
                new_followup.user = followup.user
            new_followup.save()


            #send to github if needed
            if ticket.github_issue_id:
                if str(ticket.queue) == "Tola Tables":
                    repo = settings.GITHUB_REPO_1
                else:
                    repo = settings.GITHUB_REPO_2
                add_comments(repo, ticket, new_followup)
            # get list of old attachments & link them to new_followup
            attachments = Attachment.objects.filter(followup = followup)
            for attachment in attachments:
                attachment.followup = new_followup
                attachment.save()
            # delete old followup
            followup.delete()
        return HttpResponseRedirect(reverse('helpdesk_view', args=[ticket.id]))
followup_edit = staff_member_required(followup_edit)

def followup_delete(request, ticket_id, followup_id):
    ''' followup delete for superuser'''

    ticket = get_object_or_404(Ticket, id=ticket_id)
    if not request.user.is_superuser:
        return HttpResponseRedirect(reverse('helpdesk_view', args=[ticket.id]))

    followup = get_object_or_404(FollowUp, id=followup_id)
    followup.delete()
    return HttpResponseRedirect(reverse('helpdesk_view', args=[ticket.id]))
followup_delete = staff_member_required(followup_delete)


@login_required
def view_ticket(request, ticket_id):
    if not (request.user.is_active):
        return HttpResponseRedirect('%s?next=%s' % (reverse('login'), request.path))
    ticket = get_object_or_404(Ticket, id=ticket_id)

    #check Ticket status (open or re-opened) and TO DO - send email reminders
    months = reminder(ticket.id)
    ticket_status = ticket.status
    print "Ticket Status :" + str(ticket_status)

    if ticket_status == 1 or ticket_status == 2:
        if months == 0:
            print "Reminder Email : No reminder"
        elif months == 1:
            print "Send 1st Reminder Email after 1 Month, Update ticket.remind == 1 and ticket.remind_date"
        elif months == 2:
            print "Send 2nd Reminder Email after 2 Months, Update ticket.remind == 2 and ticket.remind_date"
        elif months == 3:
            print "Send 3rd Reminder Email after 3 Months, Update ticket.remind == 3 and ticket.remind_date"
        else:
            print "Ticket is " + str(months) + " Months old. Move this into a dashboard"

    if not ticket.t_url:
        ticket.t_url = request.build_absolute_uri()
        ticket.save(update_fields=['t_url'])

    progress=''
    if ticket.github_issue_id:
        repo = queue_repo(ticket)
        #check status of ticket in GitHub
        response = get_issue_status(repo,ticket)

        if response == 200:

            #synced status wth github
            ticket_state = get_object_or_404(Ticket, id=ticket_id)
            status = ticket_state.status
            if status == 4:
                state = 'Closed'
            else:
                state = 'Open'
            print 'Ticket status in Github is: [' + str(state) + ']'
        else:
            print 'Check ticket status in GitHub'
        #check github label
        label_response = get_label(repo,ticket)
        print label_response

    ticket_state = get_object_or_404(Ticket, id=ticket_id)
    if 'take' in request.GET:
        # Allow the user to assign the ticket to themselves whilst viewing it.

        # Trick the update_ticket() view into thinking it's being called with
        # a valid POST.
        request.POST = {
            'owner': request.user.id,
            'public': 1,
            'title': ticket_state.title,
            'comment': ''
        }
        return post_comment(request, ticket_id)

    if 'subscribe' in request.GET:
        # Allow the user to subscribe him/herself to the ticket whilst viewing it.
        ticketcc_string, SHOW_SUBSCRIBE = return_ticketccstring_and_show_subscribe(request.user, ticket_state)
        if SHOW_SUBSCRIBE:
            subscribe_staff_member_to_ticket(ticket_state, request.user)
            return HttpResponseRedirect(reverse('helpdesk_view', args=[ticket_state.id]))

    if 'close' in request.GET and ticket_state.status == Ticket.RESOLVED_STATUS:
        if not ticket_state.assigned_to:
            owner = ''
        else:
            owner = ticket_state.assigned_to.id

        # Trick the update_ticket() view into thinking it's being called with
        # a valid POST.
        request.POST = {
            'new_status': Ticket.CLOSED_STATUS,
            'public': 1,
            'owner': owner,
            'title': ticket_state.title,
            'comment': _('Accepted resolution and closed ticket'),
            }

        return post_comment(request, ticket_id)

    users = User.objects.filter(is_active=True).order_by(User.USERNAME_FIELD)
    q = Queue.objects.all()

    # TODO: shouldn't this template get a form to begin with?
    tags = [t.pk for t in ticket.tags.all()]
    form = TicketForm(initial={'due_date':ticket_state.due_date, 'tags':tags})
    tags = Tag.objects.all()

    """
    progress = ''
    if ticket:
       if request.user.is_active:
           if ticket.assigned_to:
               if ticket.status ==1:
                   progress= "Ticket In Progress"
               elif ticket.status == 2:
                   progress = "Ticket reopened and is in progress"
               else:
                   progress = " "

    """
    #ticketcc_string, SHOW_SUBSCRIBE = return_ticketccstring_and_show_subscribe(request.user, ticket_state)

    #tickets, reported by current user

    tickets_reported =''

    if request.user.email:
        tickets_reported = Ticket.objects.select_related('queue').filter(
                submitter_email=request.user.email,
            ).order_by('status')

    #tickets, resolved by current user
    tickets_closed = Ticket.objects.select_related('queue').filter(
        assigned_to=request.user,
        status__in=[Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS])

    #display tickets assigned to current user
    tickets_assigned = Ticket.objects.select_related('queue')\
                    .filter(assigned_to=request.user,)\
                    .exclude(status__in=[Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS],)
    #display tickets created by current user
    tickets_created = Ticket.objects.select_related('queue')\
                    .filter(submitter_email=request.user.email,)\
                    .exclude(status__in=[Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS],)


    return render_to_response('helpdesk/ticket.html',
        RequestContext(request, {
            'ticket': ticket_state,
            'form': form,
            #'progress': progress,
            'tags': tags,
            'tickets_assigned': len(tickets_assigned),
            'tickets_created':len(tickets_created),
            'tickets_reported':len(tickets_reported),
            'tickets_closed':len(tickets_closed),
            'active_users': users,
            'priorities': Ticket.PRIORITY_CHOICES,
            'ticket_type': Ticket.TICKET_TYPE,
            'ticket_queue': q,
            'preset_replies': PreSetReply.objects.filter(Q(queues=ticket.queue) | Q(queues__isnull=True)),
            #'ticketcc_string': ticketcc_string,
            #'SHOW_SUBSCRIBE': SHOW_SUBSCRIBE,
        }))

def return_ticketccstring_and_show_subscribe(user, ticket):
    ''' used in view_ticket() and followup_edit()'''
    # create the ticketcc_string and check whether current user is already
    # subscribed
    username = user.get_username().upper()
    useremail = user.email.upper()
    strings_to_check = list()
    strings_to_check.append(username)
    strings_to_check.append(useremail)

    ticketcc_string = ''
    all_ticketcc = ticket.ticketcc_set.all()
    counter_all_ticketcc = len(all_ticketcc) - 1
    SHOW_SUBSCRIBE = True
    for i, ticketcc in enumerate(all_ticketcc):
        ticketcc_this_entry = str(ticketcc.display)
        ticketcc_string = ticketcc_string + ticketcc_this_entry
        if i < counter_all_ticketcc:
            ticketcc_string = ticketcc_string + ', '
        if strings_to_check.__contains__(ticketcc_this_entry.upper()):
            SHOW_SUBSCRIBE = False

    # check whether current user is a submitter or assigned to ticket
    assignedto_username = str(ticket.assigned_to).upper()
    submitter_email = ticket.submitter_email.upper()

    strings_to_check = list()
    strings_to_check.append(assignedto_username)
    strings_to_check.append(submitter_email)
    if strings_to_check.__contains__(username) or strings_to_check.__contains__(useremail):
        SHOW_SUBSCRIBE = False

    return ticketcc_string, SHOW_SUBSCRIBE

def subscribe_staff_member_to_ticket(ticket, user):
    ''' used in view_ticket() and update_ticket() '''
    ticketcc = TicketCC()
    ticketcc.ticket = ticket
    ticketcc.user = user
    ticketcc.can_view = True
    ticketcc.can_update = True
    ticketcc.save()

def return_to_ticket(user, ticket):
    ''' Helpder function for update_ticket '''

    if user.is_staff:
        return HttpResponseRedirect(ticket.get_absolute_url())
    else:
        return HttpResponseRedirect(ticket.get_absolute_url())

def tickets_dependency(request,ticket_id):
    d_ticket = Ticket.objects.get(id=ticket_id)

    context = {}

    # Query_params will hold a dictionary of parameters relating to
    # a query, to be saved if needed:
    query_params = data_query_params()

    from_saved_query = False

    # If the user is coming from the header/navigation search box, lets' first
    # look at their query to see if they have entered a valid ticket number. If
    # they have, just redirect to that ticket number. Otherwise, we treat it as
    # a keyword search.

    if request.GET.get('search_type', None) == 'header':
        query = request.GET.get('q')
        filter = None
        if query.find('-') > 0:
            try:
                queue, id = query.split('-')
                id = int(id)
            except ValueError:
                id = None

            if id:
                filter = {'queue__slug': queue, 'id': id }
        else:
            try:
                query = int(query)
            except ValueError:
                query = None

            if query:
                filter = {'id': int(query) }

        if filter:
            try:
                ticket = Ticket.objects.get(**filter)
                return HttpResponseRedirect(ticket.staff_url)
            except Ticket.DoesNotExist:
                # Go on to standard keyword searching
                pass

    saved_query = None
    if request.GET.get('saved_query', None):
        from_saved_query = True
        try:
            saved_query = SavedSearch.objects.get(pk=request.GET.get('saved_query'))
        except SavedSearch.DoesNotExist:
            return HttpResponseRedirect(reverse('helpdesk_list'))
        if not (saved_query.shared or saved_query.user == request.user):
            return HttpResponseRedirect(reverse('helpdesk_list'))

        try:
            import pickle
        except ImportError:
            import cPickle as pickle
        from helpdesk.lib import b64decode
        query_params = pickle.loads(b64decode(str(saved_query.query)))
    elif not (  'queue' in request.GET
            or  'assigned_to' in request.GET
            or  'status' in request.GET
            or  'q' in request.GET
            or  'sort' in request.GET
            or  'sortreverse' in request.GET
                ):

        # Fall-back if no querying is being done, force the list to only
        # show open/reopened/resolved (not closed) cases sorted by creation
        # date.

        query_params = {
            'filtering': {'status__in': [1, 2, 3]},
            'sorting': 'created',
        }
    else:
        queues = request.GET.getlist('queue')
        if queues:
            try:
                queues = [int(q) for q in queues]
                query_params['filtering']['queue__id__in'] = queues
            except ValueError:
                pass

        owners = request.GET.getlist('assigned_to')
        if owners:
            try:
                owners = [int(u) for u in owners]
                query_params['filtering']['assigned_to__id__in'] = owners
            except ValueError:
                pass

        statuses = request.GET.getlist('status')
        if statuses:
            try:
                statuses = [int(s) for s in statuses]
                query_params['filtering']['status__in'] = statuses
            except ValueError:
                pass

        types = request.GET.getlist('types')
        if types:
            try:
                types = [int(s) for s in types]
                query_params['filtering']['type__in'] = types
            except ValueError:
                pass
        votes = request.GET.getlist('votes')

        if types:
            try:
                votes = [int(s) for s in votes]
                query_params['filtering']['votes__in'] = votes
            except ValueError:
                pass

        date_from = request.GET.get('date_from')
        if date_from:
            query_params['filtering']['created__gte'] = date_from

        date_to = request.GET.get('date_to')
        if date_to:
            query_params['filtering']['created__lte'] = date_to

        ### KEYWORD SEARCHING
        key_word_searching(request, context, query_params)

        ### SORTING
        data_sorting(request,query_params)

    tickets = Ticket.objects.select_related()
    queue_choices = Queue.objects.all()

    tickets = data_query_pagination(request, tickets, query_params)
    search_message = ''
    if 'query' in context and settings.DATABASES['default']['ENGINE'].endswith('sqlite'):
        search_message = _('<p><strong>Note:</strong> The keyword search is case sensitive. This means the search will <strong>not</strong> be accurate.')


    try:
        import pickle
    except ImportError:
        import cPickle as pickle
    from helpdesk.lib import b64encode
    urlsafe_query = b64encode(pickle.dumps(query_params))

    user_saved_queries = SavedSearch.objects.filter(Q(user=request.user) | Q(shared__exact=True))

    querydict = request.GET.copy()
    querydict.pop('page', 1)

    print "TICKET TYPES:"
    print Ticket.TICKET_TYPE

    return render_to_response('helpdesk/ticket_depend_list.html',
        RequestContext(request, dict(
            context,
            query_string=querydict.urlencode(),
            tickets=tickets,
            user_choices=User.objects.filter(is_active=True,is_staff=True),
            queue_choices=queue_choices,
            status_choices=Ticket.STATUS_CHOICES,
            type_choices=Ticket.TICKET_TYPE,
            urlsafe_query=urlsafe_query,
            user_saved_queries=user_saved_queries,
            query_params=query_params,
            from_saved_query=from_saved_query,
            saved_query=saved_query,
            search_message=search_message,
            d_ticket=d_ticket,

        )))

def ticket_dependency_add(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    if request.method == 'POST':
        form = TicketDependencyForm(request.POST)
        print "Dependency Form"
        if form.is_valid():
            ticketdependency = form.save(commit=False)
            ticketdependency.ticket = ticket
            if ticketdependency.ticket != ticketdependency.depends_on:
                ticketdependency.save()
            return ticket_list(request)
    else:

        form = TicketDependencyForm()
    return render_to_response('helpdesk/ticket_dependency_add.html',
        RequestContext(request, {
            'ticket': ticket,
            'form': form,
        }))
ticket_dependency_add = staff_member_required(ticket_dependency_add)

def reminder(ticket_id):

    ticket = get_object_or_404(Ticket, id=ticket_id)

    create_date = datetime.strptime(str(ticket.created)[:19],'%Y-%m-%d %H:%M:%S')
    today_date = datetime.strptime(str(datetime.now())[:19],'%Y-%m-%d %H:%M:%S')

    r = relativedelta.relativedelta(today_date, create_date)
    print "Date Created :" + str(create_date)
    print "Reminder Months : " + str(r.months) + " Months"
    return r.months

@login_required
def ticket_list(request):
    #create ticket
    assignable_users = User.objects.filter(is_active=True).order_by(User.USERNAME_FIELD)
    initial_data = {}
    try:
        if request.user.is_authenticated and request.user.email:
            initial_data['submitter_email'] = request.user.email

    except Exception, e:
        pass
    
    form = PublicTicketForm(initial=initial_data)
    form.fields['queue'].choices = [('', '--------')] + [[q.id, q.title] for q in Queue.objects.all()]
    if request.method == 'POST':
        if request.user.is_staff:

            form = TicketForm(request.POST, request.FILES)
            form.fields['queue'].choices = [('', '--------')] + [[q.id, q.title] for q in Queue.objects.all()]
            form.fields['assigned_to'].choices = [('', '--------')] + [[u.id, u.get_username()] for u in assignable_users]
        else:
            form = PublicTicketForm(request.POST, request.FILES)
            form.fields['queue'].choices = [('', '--------')] + [[q.id, q.title] for q in Queue.objects.all()]

        if form.is_valid():

            try:
                ticket = form.save(user=request.POST.get('assigned_to'))

            except Exception, e:
                ticket = form.save(user = None)


            #save tickettags
            tags = request.POST.getlist('tags')
            for tag in tags:
                ticket.tags.add(tag)

            #ticket.comment = ''
            comment = ""
            f = FollowUp(ticket=ticket, date=timezone.now(), comment=comment)
            f.save()

            #Attch a File
            file_attachment(request, f)
                   
            #autopost new ticket to #tola-work slack channel in Tola
            post_tola_slack(ticket.id)

            messages.add_message(request, messages.SUCCESS, 'New ticket submitted')
    else:
        initial_data = {}
        try:
            if request.user.email:
                initial_data['submitter_email'] = request.user.email
            if 'queue' in request.GET:
                initial_data['queue'] = request.GET['queue']

            if request.user.is_staff:
                form = TicketForm(initial=initial_data)
                form.fields['queue'].choices = [('', '--------')] + [[q.id, q.title] for q in Queue.objects.all()]
                form.fields['assigned_to'].choices = [('', '--------')] + [[u.id, u.get_username()] for u in assignable_users]
            
        except Exception, e:
            form = PublicTicketForm(initial=initial_data)
            form.fields['queue'].choices = [('', '--------')] + [[q.id, q.title] for q in Queue.objects.all()]

   #ticket_list 
    context = {}
    # Query_params will hold a dictionary of parameters relating to
    # a query, to be saved if needed:
    query_params = data_query_params()

    from_saved_query = False

    # If the user is coming from the header/navigation search box, lets' first
    # look at their query to see if they have entered a valid ticket number. If
    # they have, just redirect to that ticket number. Otherwise, we treat it as
    # a keyword search.

    if request.GET.get('search_type', None) == 'header':
        query = request.GET.get('q')
        filter = None
        if query.find('-') > 0:
            try:
                queue, id = query.split('-')
                id = int(id)
            except ValueError:
                id = None

            if id:
                filter = {'queue__slug': queue, 'id': id }
        else:
            try:
                query = int(query)
            except ValueError:
                query = None

            if query:
                filter = {'id': int(query) }

        if filter:
            try:
                ticket = Ticket.objects.get(**filter)
                return HttpResponseRedirect(ticket.staff_url)
            except Ticket.DoesNotExist:
                # Go on to standard keyword searching
                pass

    saved_query = None
    if request.GET.get('saved_query', None):
        from_saved_query = True
        try:
            saved_query = SavedSearch.objects.get(pk=request.GET.get('saved_query'))
        except SavedSearch.DoesNotExist:
            return HttpResponseRedirect(reverse('helpdesk_list'))
        if not (saved_query.shared or saved_query.user == request.user):
            return HttpResponseRedirect(reverse('helpdesk_list'))

        try:
            import pickle
        except ImportError:
            import cPickle as pickle
        from helpdesk.lib import b64decode
        query_params = pickle.loads(b64decode(str(saved_query.query)))
    elif not (  'queue' in request.GET
            or  'assigned_to' in request.GET
            or  'status' in request.GET
            or  'q' in request.GET
            or  'sort' in request.GET
            or  'sortreverse' in request.GET
                ):

        # Fall-back if no querying is being done, force the list to only
        # show open/reopened/resolved (not closed) cases sorted by creation
        # date.

        query_params = {
            'filtering': {'status__in': [1, 2, 3]},
            'sorting': 'created',
        }
    else:
        queues = request.GET.getlist('queue')
        if queues:
            try:
                queues = [int(q) for q in queues]
                query_params['filtering']['queue__id__in'] = queues
            except ValueError:
                pass

        owners = request.GET.getlist('assigned_to')
        if owners:
            try:
                owners = [int(u) for u in owners]
                query_params['filtering']['assigned_to__id__in'] = owners
            except ValueError:
                pass

        submitter_email = request.GET.getlist('submitter_email')
        if submitter_email:
            try:

                query_params['filtering']['submitter_email__in'] = submitter_email
                print query_params
            except ValueError:
                pass
        statuses = request.GET.getlist('status')
        if statuses:
            try:
                statuses = [int(s) for s in statuses]
                query_params['filtering']['status__in'] = statuses
            except ValueError:
                pass

        types = request.GET.getlist('types')
        if types:
            try:
                types = [int(s) for s in types]
                query_params['filtering']['type__in'] = types
            except ValueError:
                pass

        date_from = request.GET.get('date_from')
        if date_from:
            query_params['filtering']['created__gte'] = date_from

        date_to = request.GET.get('date_to')
        if date_to:
            query_params['filtering']['created__lte'] = date_to

        #additional filters for my tickets section
        created_by_me = []
        my_email = request.GET.get('created')
        created_by_me.append(my_email)
        if my_email:
            try:
                query_params['filtering']['submitter_email__in'] = created_by_me
            except Exception, e:
                pass

        assigned_to_me = []
        my_email = request.GET.get('assigned')
        if my_email:
            try:
                assigned_id = request.user.id
                assigned_to_me.append(assigned_id)
                query_params['filtering']['assigned_to__id__in'] = assigned_to_me
            except Exception, e:
                pass

        clossed_by_me = []
        my_statuses =  [Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS]
        print my_statuses
        my_email = request.GET.get('clossed')
        if my_email:
            try:
                assigned_id = request.user.id
                clossed_by_me.append(assigned_id)
                query_params['filtering']['assigned_to__id__in'] = clossed_by_me
                query_params['filtering']['status__in'] = my_statuses
            except Exception, e:
                pass

        ### KEYWORD SEARCHING
        key_word_searching(request, context, query_params)

        ### SORTING
        data_sorting(request,query_params)


    tickets = Ticket.objects.select_related()
    num_tickets = tickets.count()

    for ticket in tickets:
        if ticket.tags.all():
            ticket.tags = [t.pk for t in ticket.tags.all()]
        else:
            ticket.tags = ""

    queue_choices = Queue.objects.all()

    all_tickets_reported_by_current_user = []
    assigned_to_me = []
    tickets_closed_resolved = []
    created_by_me = []
    user_saved_queries = []
    if (request.user.is_authenticated()):
        # all tickets, reported by current user
        email_current_user = request.user.email
        if email_current_user:
            all_tickets_reported_by_current_user = Ticket.objects.select_related('queue').filter(
                    submitter_email=email_current_user,
                ).order_by('status')

        #tickets for the user
        # Tickets assigned to current user
        assigned_to_me = Ticket.objects.select_related('queue').filter(
            assigned_to=request.user,
         ).exclude(
            status__in=[Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS],
        )

        # open & reopened tickets, assigned to current user
        tickets_closed_resolved = Ticket.objects.select_related('queue').filter(
            assigned_to=request.user,
            status__in=[Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS])

        # Tickets created by current user
        created_by_me = Ticket.objects.select_related('queue').filter(
               submitter_email=request.user.email,
            ).exclude(
               status__in=[Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS],
           )
        #saved Queries
        user_saved_queries = SavedSearch.objects.filter(Q(user=request.user) | Q(shared__exact=True))


    try:
        ticket_qs = apply_query(tickets, query_params)
    except ValidationError:
        # invalid parameters in query, return default query
        query_params = {
            'filtering': {'status__in': [1, 2, 3]},
            'sorting': 'created',
        }
        ticket_qs = apply_query(tickets, query_params)


    #Change items per_page by a user
    items_per_page = 10
    user_choice_pageItems = request.GET.get('items_per_page')

    if user_choice_pageItems:
        items_per_page = user_choice_pageItems

    ticket_paginator = paginator.Paginator(ticket_qs, items_per_page)
    try:
        page = int(request.GET.get('page', '1'))
    except ValueError:
        page = 1

    try:
        tickets = ticket_paginator.page(page)
    except (paginator.EmptyPage, paginator.InvalidPage):
        tickets = ticket_paginator.page(ticket_paginator.num_pages)

    search_message = ''
    if 'query' in context and settings.DATABASES['default']['ENGINE'].endswith('sqlite'):
        search_message = _('<p><strong>Note:</strong> The keyword search is case sensitive. This means the search will <strong>not</strong> be accurate.')


    try:
        import pickle
    except ImportError:
        import cPickle as pickle
    from helpdesk.lib import b64encode
    urlsafe_query = b64encode(pickle.dumps(query_params))


    querydict = request.GET.copy()
    querydict.pop('page', 1)

    """
    progress = ''
    for ticket in tickets:
       if request.user.is_active and ticket.assigned_to :
               if ticket.status ==1:
                   ticket.progress= "Ticket In Progress"
               elif ticket.status == 2:
                   ticket.progress = "Ticket reopened and is in progress"
               else:
                   ticket.progress = " "
    """
    q = Queue.objects.all()
    tags = Tag.objects.all()

    return render_to_response('helpdesk/ticket_list.html',
        RequestContext(request, dict(
            context,
            query_string=querydict.urlencode(),
            query = request.GET.get('q'),
            tickets=tickets,
            tags=tags,
            priorities = Ticket.PRIORITY_CHOICES,
            ticket_queue=q,
            ticket_type=Ticket.TICKET_TYPE,
            my_tickets = len(created_by_me),
            items_per_page=items_per_page,
            number_of_tickets=len(ticket_qs),
            assigned_to_me=len(assigned_to_me),
            num_tickets=num_tickets,
            tickets_closed_resolved=len(tickets_closed_resolved),
            all_tickets_reported_by_current_user=len(all_tickets_reported_by_current_user),
            user_choices=User.objects.filter(is_active=True,is_staff=True),
            queue_choices=queue_choices,
            type_choices=Ticket.TICKET_TYPE,
            status_choices=Ticket.STATUS_CHOICES,
            urlsafe_query=urlsafe_query,
            user_saved_queries=user_saved_queries,
            query_params=query_params,
            from_saved_query=from_saved_query,
            saved_query=saved_query,
            search_message=search_message,
            active_users=assignable_users,
            form=form,
            helper=form.helper

        )))
    ticket_list = staff_member_required(ticket_list)

def ticket_edit(request):
    ticket_id = request.GET.get('ticket_id')

    ticket = get_object_or_404(Ticket, id=ticket_id)
    if request.method == 'POST':
        form = CommentTicketForm(request.POST)
        if form.is_valid():
            ticket_id = ticket.id
            title = request.POST.get('title')
            if ticket.github_issue_id:
                queue = ticket.queue_id
            else:
                queue = request.POST.get('queue')

            type = request.POST.get('type')
            owner = request.POST.get('owner')
            priority = request.POST.get('priority')
            error_msg = request.POST.get('error_msg')
            description = request.POST.get('description')
            email = request.POST.get('email')
            due_date = ticket.due_date
            tags = request.POST.getlist('edit_tags')
            update_comments = Ticket(id=ticket_id, title=title, description=description, assigned_to_id=owner,
                                     submitter_email=email, priority=priority, due_date=due_date,
                                     queue_id=queue, type=type, error_msg=error_msg)
            update_comments.save(update_fields=['title','queue_id','type','assigned_to_id','error_msg','priority','description','submitter_email', 'due_date'])

            #updating tags
            Ticket.tags.through.objects.filter(ticket_id = ticket_id).delete()
            for tag in tags:
                ticket.tags.add(tag)

    return ticket_list(request)

@login_required
def create_ticket(request):
    assignable_users = User.objects.filter(is_active=True).order_by(User.USERNAME_FIELD)
    #messages.add_message(request, messages.SUCCESS, 'We recommend that you search for your ticket or request before you enter a new ticket. Just check if a similar ticket has not been raised<br>If you have done a search, ignore this message!')

    if request.method == 'POST':
        if request.user.is_staff:

            form = TicketForm(request.POST, request.FILES)
            form.fields['queue'].choices = [('', '--------')] + [[q.id, q.title] for q in Queue.objects.all()]
            form.fields['assigned_to'].choices = [('', '--------')] + [[u.id, u.get_username()] for u in assignable_users]
        else:
            form = PublicTicketForm(request.POST, request.FILES)
            form.fields['queue'].choices = [('', '--------')] + [[q.id, q.title] for q in Queue.objects.all()]

        if form.is_valid():

            ticket = form.save(user=request.POST.get('assigned_to'))

            #save tickettags
            tags = request.POST.getlist('tags')
            for tag in tags:
                ticket.tags.add(tag)

            #ticket.comment = ''
            comment = ""
            f = FollowUp(ticket=ticket, date=timezone.now(), comment=comment)
            f.save()

            #Attch a File
            file_attachment(request, f)
                   
            #autopost new ticket to #tola-work slack channel in Tola
            post_tola_slack(ticket.id)

            messages.add_message(request, messages.SUCCESS, 'New ticket submitted')

            return HttpResponseRedirect(ticket.get_absolute_url())
    else:
        initial_data = {}
        if request.user.email:
            initial_data['submitter_email'] = request.user.email
        if 'queue' in request.GET:
            initial_data['queue'] = request.GET['queue']

        if request.user.is_staff:
            form = TicketForm(initial=initial_data)
            form.fields['queue'].choices = [('', '--------')] + [[q.id, q.title] for q in Queue.objects.all()]
            form.fields['assigned_to'].choices = [('', '--------')] + [[u.id, u.get_username()] for u in assignable_users]
        else:
            form = PublicTicketForm(initial=initial_data)
            form.fields['queue'].choices = [('', '--------')] + [[q.id, q.title] for q in Queue.objects.all()]
    #tickets, reported by current user

    tickets_reported =''

    if request.user.email:
        tickets_reported = Ticket.objects.select_related('queue').filter(
                submitter_email=request.user.email,
            ).order_by('status')

    #tickets, resolved by current user
    tickets_closed = Ticket.objects.select_related('queue').filter(
        assigned_to=request.user,
        status__in=[Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS])

    #display tickets assigned to current user
    tickets_assigned = Ticket.objects.select_related('queue')\
                    .filter(assigned_to=request.user,)\
                    .exclude(status__in=[Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS],)
    #display tickets created by current user
    tickets_created = Ticket.objects.select_related('queue')\
                    .filter(submitter_email=request.user.email,)\
                    .exclude(status__in=[Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS],)

    return render_to_response('helpdesk/create_ticket.html',
        RequestContext(request, {
            'form': form,
            'helper': form.helper,
            'tickets_assigned': len(tickets_assigned),
            'tickets_created':len(tickets_created),
            'tickets_reported':len(tickets_reported),
            'tickets_closed':len(tickets_closed),
        }))

def raw_details(request, type):
    # TODO: This currently only supports spewing out 'PreSetReply' objects,
    # in the future it needs to be expanded to include other items. All it
    # does is return a plain-text representation of an object.

    if not type in ('preset',):
        raise Http404

    if type == 'preset' and request.GET.get('id', False):
        try:
            preset = PreSetReply.objects.get(id=request.GET.get('id'))
            return HttpResponse(preset.body)
        except PreSetReply.DoesNotExist:
            raise Http404

    raise Http404
raw_details = staff_member_required(raw_details)


def hold_ticket(request, ticket_id, unhold=False):
    ticket = get_object_or_404(Ticket, id=ticket_id)

    if unhold:
        ticket.on_hold = False
        title = _('Ticket taken off hold')
    else:
        ticket.on_hold = True
        title = _('Ticket placed on hold')

    f = FollowUp(
        ticket = ticket,
        user = request.user,
        title = title,
        date = timezone.now(),
        public = True,
    )
    f.save()

    ticket.save()

    return ticket_list(request)
#hold_ticket = staff_member_required(hold_ticket)


def unhold_ticket(request, ticket_id):
    return hold_ticket(request, ticket_id, unhold=True)
#unhold_ticket = staff_member_required(unhold_ticket)


def rss_list(request):
    return render_to_response('helpdesk/rss_list.html',
        RequestContext(request, {
            'queues': Queue.objects.all(),
        }))
rss_list = staff_member_required(rss_list)


def report_index(request):
    number_tickets = Ticket.objects.all().count()
    saved_query = request.GET.get('saved_query', None)
    return render_to_response('helpdesk/report_index.html',
        RequestContext(request, {
            'number_tickets': number_tickets,
            'saved_query': saved_query,
        }))
report_index = staff_member_required(report_index)


def run_report(request, report):
    if Ticket.objects.all().count() == 0 or report not in ('queuemonth', 'usermonth', 'queuestatus', 'queuepriority', 'userstatus', 'userpriority', 'userqueue', 'daysuntilticketclosedbymonth'):
        return HttpResponseRedirect(reverse("helpdesk_report_index"))

    report_queryset = Ticket.objects.all().select_related()
    limit_queues_by_user = not request.user.is_superuser
    from_saved_query = False
    saved_query = None

    if request.GET.get('saved_query', None):
        from_saved_query = True
        try:
            saved_query = SavedSearch.objects.get(pk=request.GET.get('saved_query'))
        except SavedSearch.DoesNotExist:
            return HttpResponseRedirect(reverse('helpdesk_report_index'))
        if not (saved_query.shared or saved_query.user == request.user):
            return HttpResponseRedirect(reverse('helpdesk_report_index'))

        try:
            import pickle
        except ImportError:
            import cPickle as pickle
        from helpdesk.lib import b64decode
        query_params = pickle.loads(b64decode(str(saved_query.query)))
        report_queryset = apply_query(report_queryset, query_params)

    from collections import defaultdict
    summarytable = defaultdict(int)
    # a second table for more complex queries
    summarytable2 = defaultdict(int)

    month_name = lambda m: MONTHS_3[m].title()

    first_ticket = Ticket.objects.all().order_by('created')[0]
    first_month = first_ticket.created.month
    first_year = first_ticket.created.year

    last_ticket = Ticket.objects.all().order_by('-created')[0]
    last_month = last_ticket.created.month
    last_year = last_ticket.created.year

    periods = []
    year, month = first_year, first_month
    working = True
    periods.append("%s %s" % (month_name(month), year))

    while working:
        month += 1
        if month > 12:
            year += 1
            month = 1
        if (year > last_year) or (month > last_month and year >= last_year):
            working = False
        periods.append("%s %s" % (month_name(month), year))

    if report == 'userpriority':
        title = _('User by Priority')
        col1heading = _('User')
        possible_options = [t[1].title() for t in Ticket.PRIORITY_CHOICES]
        charttype = 'bar'

    elif report == 'userqueue':
        title = _('User by Queue')
        col1heading = _('User')
        queue_options = Queue.objects.all()
        possible_options = [q.title.encode('utf-8') for q in queue_options]
        charttype = 'bar'

    elif report == 'userstatus':
        title = _('User by Status')
        col1heading = _('User')
        possible_options = [s[1].title() for s in Ticket.STATUS_CHOICES]
        charttype = 'bar'

    elif report == 'usermonth':
        title = _('User by Month')
        col1heading = _('User')
        possible_options = periods
        charttype = 'date'

    elif report == 'queuepriority':
        title = _('Queue by Priority')
        col1heading = _('Queue')
        possible_options = [t[1].title() for t in Ticket.PRIORITY_CHOICES]
        charttype = 'bar'

    elif report == 'queuestatus':
        title = _('Queue by Status')
        col1heading = _('Queue')
        possible_options = [s[1].title() for s in Ticket.STATUS_CHOICES]
        charttype = 'bar'

    elif report == 'queuemonth':
        title = _('Queue by Month')
        col1heading = _('Queue')
        possible_options = periods
        charttype = 'date'

    elif report == 'daysuntilticketclosedbymonth':
        title = _('Days until ticket closed by Month')
        col1heading = _('Queue')
        possible_options = periods
        charttype = 'date'

    metric3 = False
    for ticket in report_queryset:
        if report == 'userpriority':
            metric1 = u'%s' % ticket.get_assigned_to
            metric2 = u'%s' % ticket.get_priority_display()

        elif report == 'userqueue':
            metric1 = u'%s' % ticket.get_assigned_to
            metric2 = u'%s' % ticket.queue.title

        elif report == 'userstatus':
            metric1 = u'%s' % ticket.get_assigned_to
            metric2 = u'%s' % ticket.get_status_display()

        elif report == 'usermonth':
            metric1 = u'%s' % ticket.get_assigned_to
            metric2 = u'%s %s' % (month_name(ticket.created.month), ticket.created.year)

        elif report == 'queuepriority':
            metric1 = u'%s' % ticket.queue.title
            metric2 = u'%s' % ticket.get_priority_display()

        elif report == 'queuestatus':
            metric1 = u'%s' % ticket.queue.title
            metric2 = u'%s' % ticket.get_status_display()

        elif report == 'queuemonth':
            metric1 = u'%s' % ticket.queue.title
            metric2 = u'%s %s' % (month_name(ticket.created.month), ticket.created.year)

        elif report == 'daysuntilticketclosedbymonth':
            metric1 = u'%s' % ticket.queue.title
            metric2 = u'%s %s' % (month_name(ticket.created.month), ticket.created.year)
            metric3 = ticket.modified - ticket.created
            metric3 = metric3.days


        summarytable[metric1, metric2] += 1
        if metric3:
            if report == 'daysuntilticketclosedbymonth':
                summarytable2[metric1, metric2] += metric3


    table = []

    if report == 'daysuntilticketclosedbymonth':
        for key in summarytable2.keys():
            summarytable[key] = summarytable2[key] / summarytable[key]

    header1 = sorted(set(list( i.encode('utf-8') for i,_ in summarytable.keys() )))

    column_headings = [col1heading] + possible_options

    # Pivot the data so that 'header1' fields are always first column
    # in the row, and 'possible_options' are always the 2nd - nth columns.
    for item in header1:
        data = []
        for hdr in possible_options:
            data.append(summarytable[item, hdr])
        table.append([item] + data)

    return render_to_response('helpdesk/report_output.html',
        RequestContext(request, {
            'title': title,
            'charttype': charttype,
            'data': table,
            'headings': column_headings,
            'from_saved_query': from_saved_query,
            'saved_query': saved_query,
        }))
run_report = staff_member_required(run_report)


def save_query(request):
    if request.user.is_staff:
        title = request.POST.get('title', None)
        shared = request.POST.get('shared', False)
        query_encoded = request.POST.get('query_encoded', None)

        if not title or not query_encoded:
            return HttpResponseRedirect(reverse('helpdesk_list'))

        query = SavedSearch(title=title, shared=shared, query=query_encoded, user=request.user)
        query.save()

        return HttpResponseRedirect('%s?saved_query=%s' % (reverse('helpdesk_list'), query.id))
save_query = staff_member_required(save_query)


def delete_saved_query(request, id):
    query = get_object_or_404(SavedSearch, id=id, user=request.user)

    if request.method == 'POST':
        query.delete()
        return HttpResponseRedirect(reverse('helpdesk_list'))
    else:
        return render_to_response('helpdesk/confirm_delete_saved_query.html',
            RequestContext(request, {
                'query': query,
                }))
delete_saved_query = staff_member_required(delete_saved_query)


def user_settings(request):
    s = request.user.usersettings
    if request.POST:
        form = UserSettingsForm(request.POST)
        if form.is_valid():
            s.settings = form.cleaned_data
            s.save()
    else:
        form = UserSettingsForm(s.settings)

    return render_to_response('helpdesk/user_settings.html',
        RequestContext(request, {
            'form': form,
        }))
user_settings = staff_member_required(user_settings)


def email_ignore(request):
    return render_to_response('helpdesk/email_ignore_list.html',
        RequestContext(request, {
            'ignore_list': IgnoreEmail.objects.all(),
        }))
email_ignore = superuser_required(email_ignore)


def email_ignore_add(request):
    if request.method == 'POST':
        form = EmailIgnoreForm(request.POST)
        if form.is_valid():
            ignore = form.save()
            return HttpResponseRedirect(reverse('helpdesk_email_ignore'))
    else:
        form = EmailIgnoreForm(request.GET)

    return render_to_response('helpdesk/email_ignore_add.html',
        RequestContext(request, {
            'form': form,
        }))
email_ignore_add = superuser_required(email_ignore_add)


def email_ignore_del(request, id):
    ignore = get_object_or_404(IgnoreEmail, id=id)
    if request.method == 'POST':
        ignore.delete()
        return HttpResponseRedirect(reverse('helpdesk_email_ignore'))
    else:
        return render_to_response('helpdesk/email_ignore_del.html',
            RequestContext(request, {
                'ignore': ignore,
            }))
email_ignore_del = superuser_required(email_ignore_del)

def ticket_cc(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    copies_to = ticket.ticketcc_set.all()
    return render_to_response('helpdesk/ticket_cc_list.html',
        RequestContext(request, {
            'copies_to': copies_to,
            'ticket': ticket,
        }))
ticket_cc = staff_member_required(ticket_cc)

def ticket_cc_add(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    if request.method == 'POST':
        form = TicketCCForm(request.POST)
        if form.is_valid():
            ticketcc = form.save(commit=False)
            ticketcc.ticket = ticket
            ticketcc.save()
            return HttpResponseRedirect(reverse('helpdesk_ticket_cc', kwargs={'ticket_id': ticket.id}))
    else:
        form = TicketCCForm()
    return render_to_response('helpdesk/ticket_cc_add.html',
        RequestContext(request, {
            'ticket': ticket,
            'form': form,
        }))
ticket_cc_add = staff_member_required(ticket_cc_add)

def ticket_cc_del(request, ticket_id, cc_id):
    cc = get_object_or_404(TicketCC, ticket__id=ticket_id, id=cc_id)
    if request.method == 'POST':
        cc.delete()
        return HttpResponseRedirect(reverse('helpdesk_ticket_cc', kwargs={'ticket_id': cc.ticket.id}))
    return render_to_response('helpdesk/ticket_cc_del.html',
        RequestContext(request, {
            'cc': cc,
        }))
ticket_cc_del = staff_member_required(ticket_cc_del)


def ticket_dependency_del(request, ticket_id, dependency_id):
    dependency = get_object_or_404(TicketDependency, ticket__id=ticket_id, id=dependency_id)
    if request.method == 'POST':
        dependency.delete()
        return HttpResponseRedirect(reverse('helpdesk_view', args=[ticket_id]))
    return render_to_response('helpdesk/ticket_dependency_del.html',
        RequestContext(request, {
            'dependency': dependency,
        }))
ticket_dependency_del = staff_member_required(ticket_dependency_del)

def attachment_del(request, ticket_id, attachment_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    attachment = get_object_or_404(Attachment, id=attachment_id)
    attachment.delete()
    return HttpResponseRedirect(reverse('helpdesk_view', args=[ticket_id]))
attachment_del = staff_member_required(attachment_del)

def calc_average_nbr_days_until_ticket_resolved(Tickets):
    nbr_closed_tickets = len(Tickets)
    days_per_ticket = 0
    days_each_ticket = list()

    for ticket in Tickets:
        time_ticket_open = ticket.modified - ticket.created
        days_this_ticket = time_ticket_open.days
        days_per_ticket += days_this_ticket
        days_each_ticket.append(days_this_ticket)

    if nbr_closed_tickets > 0:
        mean_per_ticket = days_per_ticket / nbr_closed_tickets
    else:
        mean_per_ticket = 0

    return mean_per_ticket

def calc_basic_ticket_stats(Tickets):
    # all not closed tickets (open, reopened, resolved,) - independent of user
    all_open_tickets = Tickets.exclude(status = Ticket.CLOSED_STATUS)
    today = datetime.today()

    date_30 = date_rel_to_today(today, 30)
    date_60 = date_rel_to_today(today, 60)
    date_30_str = date_30.strftime('%Y-%m-%d')
    date_60_str = date_60.strftime('%Y-%m-%d')

    # > 0 & <= 30
    ota_le_30 = all_open_tickets.filter(created__gte = date_30_str)
    N_ota_le_30 = len(ota_le_30)

    # >= 30 & <= 60
    ota_le_60_ge_30 = all_open_tickets.filter(created__gte = date_60_str, created__lte = date_30_str)
    N_ota_le_60_ge_30 = len(ota_le_60_ge_30)

    # >= 60
    ota_ge_60 = all_open_tickets.filter(created__lte = date_60_str)
    N_ota_ge_60 = len(ota_ge_60)

    # (O)pen (T)icket (S)tats
    ots = list()
    # label, number entries, color, sort_string
    ots.append(['< 30 days', N_ota_le_30, get_color_for_nbr_days(N_ota_le_30), sort_string(date_30_str, ''), ])
    ots.append(['30 - 60 days', N_ota_le_60_ge_30, get_color_for_nbr_days(N_ota_le_60_ge_30), sort_string(date_60_str, date_30_str), ])
    ots.append(['> 60 days', N_ota_ge_60, get_color_for_nbr_days(N_ota_ge_60), sort_string('', date_60_str), ])

    # all closed tickets - independent of user.
    all_closed_tickets = Tickets.filter(status = Ticket.CLOSED_STATUS)
    average_nbr_days_until_ticket_closed = calc_average_nbr_days_until_ticket_resolved(all_closed_tickets)
    # all closed tickets that were opened in the last 60 days.
    all_closed_last_60_days = all_closed_tickets.filter(created__gte = date_60_str)
    average_nbr_days_until_ticket_closed_last_60_days = calc_average_nbr_days_until_ticket_resolved(all_closed_last_60_days)

    # put together basic stats
    basic_ticket_stats = {  'average_nbr_days_until_ticket_closed': average_nbr_days_until_ticket_closed,
                            'average_nbr_days_until_ticket_closed_last_60_days': average_nbr_days_until_ticket_closed_last_60_days,
                            'open_ticket_stats': ots, }

    return basic_ticket_stats

def get_color_for_nbr_days(nbr_days):
    ''' '''
    if nbr_days < 5:
        color_string = 'green'
    elif nbr_days >= 5 and nbr_days < 10:
        color_string = 'orange'
    else: # more than 10 days
        color_string = 'red'

    return color_string

def days_since_created(today, ticket):
    return (today - ticket.created).days

def date_rel_to_today(today, offset):
    return today - timedelta(days = offset)

def sort_string(begin, end):
    return 'sort=created&date_from=%s&date_to=%s&status=%s&status=%s&status=%s' %(begin, end, Ticket.OPEN_STATUS, Ticket.REOPENED_STATUS, Ticket.RESOLVED_STATUS)

#add ticket to slack channel
def post_to_slack(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)

    response = post_slack(ticket.id)

    if int(response) == 200:
        messages.success(request, 'Success, ticket sent to Slack')
        #update the slack_status field in ticket from 0 to 1
        ticket.slack_status = 1
        ticket.save(update_fields=["slack_status"])
    else:
        messages.success(request, 'Code : ' + str(response) + ' - Sorry, the ticket was not sent to Slack')
        print response

    return HttpResponseRedirect(reverse('helpdesk_view', args=[ticket.id]))


#KB view
def index(request):
    category_list = KBCategory.objects.all()

    if ('q' in request.GET) and request.GET['q'].strip():
        query_string = request.GET.get('q')
        item_list = KBItem.objects.filter((Q(title__icontains=query_string) | Q(question__icontains=query_string) | Q(answer__icontains=query_string )))

    else:
        item_list = KBItem.objects.all()

    paginator = Paginator(item_list, 10) # Show 15 items per page

    page = request.GET.get('page')
    try:
        item_list = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        item_list = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        item_list = paginator.page(paginator.num_pages)

    # TODO: It'd be great to have a list of most popular items here.
    return render_to_response('helpdesk/kb_index.html',
        RequestContext(request, {
            'kb_categories': category_list,
            'kb_items': item_list
        }))


def category(request, slug):
    category = get_object_or_404(KBCategory, slug__iexact=slug)
    items = category.kbitem_set.all()
    return render_to_response('helpdesk/kb_category.html',
        RequestContext(request, {
            'category': category,
            'items': items,
        }))

def item(request, item):
    from django.utils.html import escape, format_html
    item = get_object_or_404(KBItem, pk=item)
    item.answer = format_html(item.answer) 

    return render_to_response('helpdesk/kb_item.html',
        RequestContext(request, {
            'item': item
        }))


def vote(request, item):
    item = get_object_or_404(KBItem, pk=item)
    vote = request.GET.get('vote', None)
    if vote in ('up', 'down'):
        item.votes += 1
        if vote == 'up':
            item.recommendations += 1
        item.save()

    return HttpResponseRedirect(item.get_absolute_url())

def kb_list(request):

    context = {}

    # Query_params will hold a dictionary of parameters relating to
    # a query, to be saved if needed:
    query_params = data_query_params()

    from_saved_query = False

    # If the user is coming from the header/navigation search box, lets' first
    # look at their query to see if they have entered a valid ticket number. If
    # they have, just redirect to that ticket number. Otherwise, we treat it as
    # a keyword search.

    if request.GET.get('search_type', None) == 'header':
        query = request.GET.get('q')
        filter = None
        if query.find('-') > 0:
            try:
                queue, id = query.split('-')
                id = int(id)
            except ValueError:
                id = None

            if id:
                filter = {'queue__slug': queue, 'id': id }
        else:
            try:
                query = int(query)
            except ValueError:
                query = None

            if query:
                filter = {'id': int(query) }

        if filter:
            try:
                ticket = Ticket.objects.get(**filter)
                return HttpResponseRedirect(ticket.staff_url)
            except Ticket.DoesNotExist:
                # Go on to standard keyword searching
                pass

    saved_query = None
    if request.GET.get('saved_query', None):
        from_saved_query = True
        try:
            saved_query = SavedSearch.objects.get(pk=request.GET.get('saved_query'))
        except SavedSearch.DoesNotExist:
            return HttpResponseRedirect(reverse('helpdesk_kb_list'))
        if not (saved_query.shared or saved_query.user == request.user):
            return HttpResponseRedirect(reverse('helpdesk_kb_list'))

        try:
            import pickle
        except ImportError:
            import cPickle as pickle
        from helpdesk.lib import b64decode
        query_params = pickle.loads(b64decode(str(saved_query.query)))
    elif not (  'queue' in request.GET
            or  'assigned_to' in request.GET
            or  'status' in request.GET
            or  'q' in request.GET
            or  'sort' in request.GET
            or  'sortreverse' in request.GET
                ):

        # Fall-back if no querying is being done, force the list to only
        # show open/reopened/resolved (not closed) cases sorted by creation
        # date.

        query_params = {
            'filtering': {'status__in': [1, 2, 3]},
            'sorting': 'created',
        }
    else:
        queues = request.GET.getlist('queue')
        if queues:
            try:
                queues = [int(q) for q in queues]
                query_params['filtering']['queue__id__in'] = queues
            except ValueError:
                pass

        owners = request.GET.getlist('assigned_to')
        if owners:
            try:
                owners = [int(u) for u in owners]
                query_params['filtering']['assigned_to__id__in'] = owners
            except ValueError:
                pass

        statuses = request.GET.getlist('status')
        if statuses:
            try:
                statuses = [int(s) for s in statuses]
                query_params['filtering']['status__in'] = statuses
            except ValueError:
                pass

        types = request.GET.getlist('types')
        if types:
            try:
                types = [int(s) for s in types]
                query_params['filtering']['type__in'] = types
            except ValueError:
                pass

        date_from = request.GET.get('date_from')
        if date_from:
            query_params['filtering']['created__gte'] = date_from

        date_to = request.GET.get('date_to')
        if date_to:
            query_params['filtering']['created__lte'] = date_to

        ### KEYWORD SEARCHING
        key_word_searching(request, context, query_params)

        ### SORTING
        data_sorting(request,query_params)

    kb_items = KBItem.objects.select_related()
    queue_choices = Queue.objects.all()
    
    kb_items = data_query_pagination(request, kb_items,query_params )

    search_message = ''
    if 'query' in context and settings.DATABASES['default']['ENGINE'].endswith('sqlite'):
        search_message = _('<p><strong>Note:</strong> The keyword search is case sensitive. This means the search will <strong>not</strong> be accurate.')


    try:
        import pickle
    except ImportError:
        import cPickle as pickle
    from helpdesk.lib import b64encode
    urlsafe_query = b64encode(pickle.dumps(query_params))

    user_saved_queries = SavedSearch.objects.filter(Q(user=request.user) | Q(shared__exact=True))

    querydict = request.GET.copy()
    querydict.pop('page', 1)

    print "TICKET TYPES:"
    print Ticket.TICKET_TYPE

    return render_to_response('helpdesk/kb_list.html',
        RequestContext(request, dict(
            context,
            query_string=querydict.urlencode(),
            kb_items=kb_items,
            user_choices=User.objects.filter(is_active=True,is_staff=True),
            queue_choices=queue_choices,
            status_choices=Ticket.STATUS_CHOICES,
            type_choices=Ticket.TICKET_TYPE,
            urlsafe_query=urlsafe_query,
            user_saved_queries=user_saved_queries,
            query_params=query_params,
            from_saved_query=from_saved_query,
            saved_query=saved_query,
            search_message=search_message,

        )))

###-------------COMMON SUB-FUNCTIONS---------------------------------####
#Ticket query_params
def data_query_params():
    query_params = {
        'filtering': {},
        'sorting': None,
        'sortreverse': True,
        'keyword': None,
        'other_filter': None,
        }

    return query_params

#Keyword Searching
def key_word_searching(request, context, query_params):
    q = request.GET.get('q', None)

    if q:
        qset = (
            Q(title__icontains=q) |
            Q(description__icontains=q) |
            Q(resolution__icontains=q) |
            Q(submitter_email__icontains=q)
        )

        context = dict(context, query=q,
                       )

        query_params['other_filter'] = qset
    return

#Sorting
def data_sorting(request,query_params):
    sort = request.GET.get('sort', None)
    if sort not in ('status', 'assigned_to', 'created', 'title', 'queue', 'priority'):
        sort = 'created'
    query_params['sorting'] = sort

    sortreverse = request.GET.get('sortreverse', None)
    query_params['sortreverse'] = sortreverse

    return

#Data querying and pagination
def data_query_pagination(request, data_items, query_params):
    try:
        data_item_qs = apply_query(data_items, query_params)
    except ValidationError:
        # invalid parameters in query, return default query
        query_params = {
            'filtering': {'status__in': [1, 2, 3]},
            'sorting': 'created',
        }
        data_item_qs = apply_query(data_items, query_params)

    data_item_paginator = paginator.Paginator(data_item_qs, 5)
    try:
        page = int(request.GET.get('page', '1'))
    except ValueError:
        page = 1

    try:
        data_items = data_item_paginator.page(page)
    except (paginator.EmptyPage, paginator.InvalidPage):
        data_items = data_item_paginator.page(data_item_paginator.num_pages)

    return data_items

def mass_update(request, ticket_id):
    depend_ticket = Ticket.objects.get(id=ticket_id)

    tickets = request.POST.getlist('ticket_id')
    action = request.POST.get('action', None)
    if not (tickets and action):
        return HttpResponseRedirect(reverse('helpdesk_list'))

    if action.startswith('assign_'):
        parts = action.split('_')
        user = User.objects.get(id=parts[1])
        action = 'assign'
    elif action == 'take':
        user = request.user
        action = 'assign'

    for t in Ticket.objects.filter(id__in=tickets):


        if action == 'assign' and t.assigned_to != user:
            t.assigned_to = user
            t.save()
            f = FollowUp(ticket=t, date=timezone.now(), title=_('Assigned to %(username)s in bulk update' % {'username': user.get_username()}), public=True, user=request.user)
            f.save()
        elif action == 'depend':
            d = TicketDependency(ticket=depend_ticket, depends_on=t)
            if depend_ticket != t:
                d.save()

        elif action == 'unassign' and t.assigned_to is not None:
            t.assigned_to = None
            t.save()
            f = FollowUp(ticket=t, date=timezone.now(), title=_('Unassigned in bulk update'), public=True, user=request.user)
            f.save()
        elif action == 'close' and t.status != Ticket.CLOSED_STATUS:
            t.status = Ticket.CLOSED_STATUS
            t.save()
            f = FollowUp(ticket=t, date=timezone.now(), title=_('Closed in bulk update'), public=False, user=request.user, new_status=Ticket.CLOSED_STATUS)
            f.save()
        elif action == 'close_public' and t.status != Ticket.CLOSED_STATUS:
            t.status = Ticket.CLOSED_STATUS
            t.save()
            f = FollowUp(ticket=t, date=timezone.now(), title=_('Closed in bulk update'), public=True, user=request.user, new_status=Ticket.CLOSED_STATUS)
            f.save()
            # Send email to Submitter, Owner, Queue CC
            context = safe_template_context(t)
            context.update(
                resolution = t.resolution,
                queue = t.queue,
                )

            messages_sent_to = []

            if t.submitter_email:
                send_templated_mail(
                    'closed_submitter',
                    context,
                    recipients=t.submitter_email,
                    sender=t.queue.from_address,
                    fail_silently=True,
                    )
                messages_sent_to.append(t.submitter_email)

            for cc in t.ticketcc_set.all():
                if cc.email_address not in messages_sent_to:
                    send_templated_mail(
                        'closed_submitter',
                        context,
                        recipients=cc.email_address,
                        sender=t.queue.from_address,
                        fail_silently=True,
                        )
                    messages_sent_to.append(cc.email_address)

            if t.assigned_to and request.user != t.assigned_to and t.assigned_to.email and t.assigned_to.email not in messages_sent_to:
                send_templated_mail(
                    'closed_owner',
                    context,
                    recipients=t.assigned_to.email,
                    sender=t.queue.from_address,
                    fail_silently=True,
                    )
                messages_sent_to.append(t.assigned_to.email)

            if t.queue.updated_ticket_cc and t.queue.updated_ticket_cc not in messages_sent_to:
                send_templated_mail(
                    'closed_cc',
                    context,
                    recipients=t.queue.updated_ticket_cc,
                    sender=t.queue.from_address,
                    fail_silently=True,
                    )

        elif action == 'delete':
            t.delete()

    return HttpResponseRedirect(reverse('helpdesk_view', args=[ticket_id]))
mass_update = staff_member_required(mass_update)

#File Attachment
def file_attachment(request,f):
    files = []
    if request.FILES:
        import mimetypes, os
        for file in request.FILES.getlist('attachment'):
            filename = file.name.encode('ascii', 'ignore')
            a = Attachment(
                followup=f,
                filename=filename,
                mime_type=mimetypes.guess_type(filename)[0] or 'application/octet-stream',
                size=file.size,
                )
            a.file.save(filename, file, save=False)
            a.save()

            if file.size < getattr(settings, 'MAX_EMAIL_ATTACHMENT_SIZE', 512000):
                # Only files smaller than 512kb (or as defined in
                #settings.MAX_EMAIL_ATTACHMENT_SIZE) are sent via email.
                try:
                    files.append([a.filename, a.file])
                except NotImplementedError:
                    pass
    return
#Filter and Search Tickets by Tags
def filter_tickets_by_tags(taglist):
    tickets = Ticket.objects.annotate(count=Count('tags')).filter(tags=taglist[0])
    for tag in taglist[1:]:
        tickets = tickets.filter(taglist=tag)
    tickets = tickets.filter(count=len(taglist))
    return tickets

#FILTER TICKETS

from django.core import serializers
from rest_framework.response import Response
def filter_tickets(request):

    query_params = {
            'filtering': {'status__in': [1, 2, 3]},
            'sorting': 'created',
        }

    query_data = json.loads(request.body)

    queues = query_data['filtering']['queue__id__in']

    if queues:
        try:
            queues = [int(q) for q in queues]
            query_params['filtering']['queue__id__in'] = queues
        except ValueError:
            pass

    # # owners = query_data['filtering']['assigned_to__id__in']
    # # if owners:
    # #     try:
    # #         owners = [int(u) for u in owners]
    # #         query_params['filtering']['assigned_to__id__in'] = owners
    # #     except ValueError:
    # #         pass

    statuses = query_data['filtering']['status__in']
    if statuses:
        try:
            statuses = [int(s) for s in statuses]
            query_params['filtering']['status__in'] = statuses
        except ValueError:
            pass

    types = query_data['filtering']['type__in']
    if types:
        try:
            types = [int(s) for s in types]
            query_params['filtering']['type__in'] = types
        except ValueError:
            pass

    # # date_from = query_data['filtering']['created__gte']
    # # if date_from:
    # #     query_params['filtering']['created__gte'] = date_from

    # # date_to = query_data['filtering']['created__lte']
    # # if date_to:
    # #     query_params['filtering']['created__lte'] = date_to

    # keyword = query_data['keyword']
    # if keyword:
    #     try:
    #         query_params['keyword'] = keyword
    #     except ValueError:
    #         pass
    sort = query_data ['sorting']
    if sort not in ('status', 'assigned_to', 'created', 'title', 'queue', 'priority', 'type'):
       sort = 'created'
    query_params['sorting'] = sort    

    sortreverse = query_data['sortreverse']
    query_params['sortreverse'] = sortreverse
    print query_params

    follow_ups = []
    raw_tickets = Ticket.objects.prefetch_related()
    raw_tickets = apply_query(raw_tickets, query_params) 

    tickets = TicketSerializer(raw_tickets, many=True)

    tickets = tickets.data

    #tickets = serializers.serialize("json", raw_tickets)
    
    return HttpResponse(json.dumps(tickets))

#Get filter variables and send to Angular controller
def get_queues(request):
    queues = Queue.objects.all()
    queues = serializers.serialize("json", queues)

    return HttpResponse(queues, content_type="application/json")

def get_follow_ups(request):
    follow_ups = FollowUp.objects.all()
    follow_ups = FollowUpSerializer(follow_ups, many=True)
    follow_ups = follow_ups.data

    return HttpResponse(json.dumps(follow_ups))


def get_ticket_change(request):
    ticket_changes = TicketChange.objects.all()
    ticket_changes = TicketChangeSerializer(ticket_changes, many=True)
    ticket_changes = ticket_changes.data

    return HttpResponse(json.dumps(ticket_changes))

def get_attachments(request):
    attachments = Attachment.objects.all()
    attachments = AttachmentSerializer(attachments, many=True)
    attachments = attachments.data

    return HttpResponse(json.dumps(attachments))

def get_dependencies(request):
    dependencies = TicketDependency.objects.all()
    dependencies = TicketDependencySerializer(dependencies, many=True)
    dependencies = dependencies.data

    return HttpResponse(json.dumps(dependencies))

def get_tags(request):
    t_tags = Tag.objects.all()
    t_tags = serializers.serialize("json", t_tags)

    return HttpResponse(t_tags, content_type="application/json")

def get_my_tickets(request):
  my_tickets =  Ticket.objects.select_related('queue').filter(
          submitter_email=request.user.email,
       ).exclude(
          status__in=[4,5],
      )
  my_tickets = serializers.serialize("json", my_tickets)    
  return HttpResponse(my_tickets, content_type="application/json")

def get_tickets_assigned_to_me(request):
   tickets_assigned = Ticket.objects.select_related('queue').filter(
       assigned_to=request.user,
       ).exclude(
       status__in=[4,5],
       )

   tickets_assigned = serializers.serialize("json", tickets_assigned)    
   return HttpResponse(tickets_assigned, content_type="application/json")

def get_tickets_closed_by_me(request):
  tickets_closed = Ticket.objects.select_related('queue').filter(
       assigned_to=request.user,
       status__in=[4,5])
  tickets_closed = serializers.serialize("json", tickets_closed)    
  return HttpResponse(tickets_closed, content_type="application/json")
