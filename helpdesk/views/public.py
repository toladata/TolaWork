from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils.translation import ugettext as _
from django.core.exceptions import ValidationError
from django.db.models import Q
from django.core import paginator
from django.contrib.auth.models import User

from helpdesk.forms import PublicTicketForm
from helpdesk.lib import text_is_spam, apply_query
from helpdesk.models import Ticket, Queue, UserSettings, KBCategory, SavedSearch


def homepage(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect(reverse('login'))

    if (request.user.is_staff or (request.user.is_authenticated())):
        try:
            if getattr(request.user.usersettings.settings, 'login_view_ticketlist', False):
                return HttpResponseRedirect(reverse('helpdesk_list'))
            else:
                return HttpResponseRedirect(reverse('helpdesk_dashboard'))
        except UserSettings.DoesNotExist:
            return HttpResponseRedirect(reverse('helpdesk_dashboard'))

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

        if request.user.is_authenticated() and request.user.email:
            initial_data['submitter_email'] = request.user.email

        form = PublicTicketForm(initial=initial_data)
        form.fields['queue'].choices = [('', '--------')] + [[q.id, q.title] for q in Queue.objects.filter(allow_public_submission=True)]

    knowledgebase_categories = KBCategory.objects.all()

    return render_to_response('helpdesk/public_homepage.html',
        RequestContext(request, {
            'form': form,
            'kb_categories': knowledgebase_categories
        }))


def view_ticket(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect(reverse('login'))
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


def public_ticket_list(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect(reverse('login'))
    context = {}

    # Query_params will hold a dictionary of parameters relating to
    # a query, to be saved if needed:
    query_params = {
        'filtering': {},
        'sorting': None,
        'sortreverse': False,
        'keyword': None,
        'other_filter': None,
        }

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

        date_from = request.GET.get('date_from')
        if date_from:
            query_params['filtering']['created__gte'] = date_from

        date_to = request.GET.get('date_to')
        if date_to:
            query_params['filtering']['created__lte'] = date_to

        ### KEYWORD SEARCHING
        q = request.GET.get('q', None)

        if q:
            qset = (
                Q(title__icontains=q) |
                Q(description__icontains=q) |
                Q(resolution__icontains=q) |
                Q(submitter_email__icontains=q)
            )
            context = dict(context, query=q)

            query_params['other_filter'] = qset

        ### SORTING
        sort = request.GET.get('sort', None)
        if sort not in ('status', 'assigned_to', 'created', 'title', 'queue', 'priority'):
            sort = 'created'
        query_params['sorting'] = sort

        sortreverse = request.GET.get('sortreverse', None)
        query_params['sortreverse'] = sortreverse

    tickets = Ticket.objects.select_related()
    queue_choices = Queue.objects.all()


    try:
        ticket_qs = apply_query(tickets, query_params)
    except ValidationError:
        # invalid parameters in query, return default query
        query_params = {
            'filtering': {'status__in': [1, 2, 3]},
            'sorting': 'created',
        }
        ticket_qs = apply_query(tickets, query_params)

    ticket_paginator = paginator.Paginator(ticket_qs, 20)
    try:
        page = int(request.GET.get('page', '1'))
    except ValueError:
        page = 1

    try:
        tickets = ticket_paginator.page(page)
    except (paginator.EmptyPage, paginator.InvalidPage):
        tickets = ticket_paginator.page(ticket_paginator.num_pages)

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


    return render_to_response('helpdesk/public_ticket_list.html',
        RequestContext(request, dict(
            context,
            query_string=querydict.urlencode(),
            tickets=tickets,
            user_choices=User.objects.filter(is_active=True,is_staff=True),
            queue_choices=queue_choices,
            status_choices=Ticket.STATUS_CHOICES,
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

def vote_up(request, id):
    if not request.user.is_authenticated():
        return HttpResponseRedirect(reverse('login'))
    ticket = Ticket.objects.get(id=id)

    ticket_new_value = ticket.votes + 1

    Ticket.objects.filter(id=id).update(votes=ticket_new_value)

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def vote_down(request, id):
    if not request.user.is_authenticated():
        return HttpResponseRedirect(reverse('login'))

    ticket = Ticket.objects.get(id=id)

    ticket_new_value = ticket.votes - 1

    Ticket.objects.filter(id=id).update(votes=ticket_new_value)

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))