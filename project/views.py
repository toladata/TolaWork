from django.shortcuts import get_object_or_404
from forms import FeedbackForm, RegistrationForm
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.shortcuts import render
from helpdesk.models import DocumentationApp, FAQ
from django.contrib.auth.views import login, logout
from django.contrib.auth import authenticate
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from helpdesk.github import latest_release, new_issue, update_issue, get_issue, queue_repo, get_issue_status, get_label
from helpdesk.models import Ticket, Queue, FollowUp, FundingOpportunity
from tasks.models import Task
from django.conf import settings
from django.db.models import Count, Sum
import os
from project.models import LoggedUser, TolaUser, Announcement
from helpdesk.forms import TicketForm, PublicTicketForm
from datetime import datetime as timezone
from helpdesk.views.staff import file_attachment
from helpdesk.views.staff import data_query_pagination
from helpdesk.slack import post_slack,post_tola_slack
import json
from django.contrib.sessions.models import Session
try:
    from django.utils import timezone
except ImportError:
    from datetime import datetime as timezone

from helpdesk.views.staff import form_data, user_tickets
from django.contrib.auth.decorators import login_required
from django.db.models import Q
import requests


def splash(request):
    if request.user.is_authenticated():

        return home(request)
        
    return render(request, "splash.html")

@login_required
def user (request):
    email = request.GET.get('email')
    username = request.GET.get('username')
    user = User.objects.filter(email=email).values('username').all()[:1]

    try:
        user_id = User.objects.get(username=user).id
    except Exception, e:
        user_id = 0

    all_tickets = {}
    total_tickets = 0
    all_tasks = {}
    tickets_created = {}
    total_tickets_created = 0
    tickets_assigned = {}
    total_tickets_assigned = 0
    tickets_closed_resolved = {}
    total_tickets_closed_resolved = 0
    tasks_created = {}
    tasks_assigned = {}
    total_tasks = {}
    total_tasks_created = 0
    total_tasks_assigned = 0
    tasks_completed = {}
    total_tasks_completed = 0

    #tickets
    if user_id:
        try:
            tickets = Ticket.objects.filter(status__in=[1,2,3])
            all_tickets = (tickets).values('status').annotate(total=Count('status')).order_by('total')
            total_tickets = len(tickets)

            #created by logged_in user
            tickets_created = (tickets).select_related('queue').filter(submitter_email=request.user.email).order_by('-created')
            total_tickets_created = len(tickets_created)

            #assigned to the user
            tickets_assigned = Ticket.objects.select_related('queue').filter(
                    assigned_to=user_id,
                 ).exclude(
                    status__in=([3,4,5]),
                ).order_by('-created')

            total_tickets_assigned=len(tickets_assigned)

            #closed and resolved by user
            tickets_closed_resolved = Ticket.objects.select_related('queue').filter(
                assigned_to=user_id,
                    status__in=[3,4],
                ).order_by('-created')

            total_tickets_closed_resolved = len(tickets_closed_resolved)

            #tasks
            tasks = Task.objects.filter(created_by = request.user)
            all_tasks = (tasks).values('status').annotate(total=Count('status')).order_by('total')
            total_tasks= len(tasks)

            #tasks created by user
            all_tasks_created = (tasks).exclude(status__in=([3,4])).order_by('created_date')
            tasks_created = all_tasks_created.reverse
            total_tasks_created = len(all_tasks_created)

            #tasks assigned to the user
            all_tasks_assigned = Task.objects.filter(assigned_to_id=user_id).exclude(status__in=([3,4])).order_by('created_date')
            tasks_assigned = all_tasks_assigned.reverse
            total_tasks_assigned = len(all_tasks_assigned)

            #tasks completed by the user
            all_tasks_completed = (tasks).filter(status__in='3').order_by('created_date')
            tasks_completed = all_tasks_completed.reverse
            total_tasks_completed = len (all_tasks_completed)

        except Exception, e:
            pass  



    logged_users = logged_in_users(request)
    form = form_data(request)

    return render(request, "user.html", {'all_tickets': all_tickets,'total_tickets': total_tickets, \
                                        'logged_users': logged_users, 'username': username,'tickets_created': tickets_created, 'total_tickets_created':total_tickets_created, \
                                        'tickets_assigned': tickets_assigned, 'total_tickets_assigned': total_tickets_assigned, 'tickets_closed_resolved': tickets_closed_resolved, \
                                        'total_tickets_closed_resolved': total_tickets_closed_resolved,'tasks_created': tasks_created, 'tasks_assigned': tasks_assigned, \
                                        'total_tasks': total_tasks, 'total_tasks_created': total_tasks_created,'total_tasks_assigned': total_tasks_assigned, 'tasks_completed': tasks_completed,\
                                         'total_tasks_completed': total_tasks_completed, 'form': form})


def home(request):

    tickets = Ticket.objects.all().values('status').annotate(total=Count('status')).order_by('total')

    recent_tickets = Ticket.objects.all().exclude(status__in='4').order_by('-created')[:5]
    votes_tickets = Ticket.objects.all().exclude(status__in='4').filter(type=2).order_by('-votes')[:5]
    num_tickets = len(Ticket.objects.filter(status__in=[1,2,3]))

    closed_resolved = 0
    assigned_to_me = 0
    created_by_me = 0
    closed = []
    tome = []
    byme = []
    num_tasks = 0
    recent_tasks = []
    tasks_created = []
    total_tasks_created = 0
    tasks_assigned = []
    total_tasks_assigned = 0
    tasks_completed = []
    total_tasks_completed = 0
    if (request.user.is_authenticated()):
        #tickets
        # open & reopened tickets
        closedresolved = Ticket.objects.select_related('queue').filter(
            assigned_to=request.user,
            status__in=[Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS],
        )
        closed=(closedresolved).order_by('-created')[:5]
        closed_resolved = len(closedresolved)

        # Tickets assigned to current user
        assigned_tome = Ticket.objects.select_related('queue').filter(
            assigned_to=request.user,
         ).exclude(
            status__in=[Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS],
        )
        tome=(assigned_tome).order_by('-created')[:5]
        assigned_to_me=len(assigned_tome)


        # Tickets created by current user
        created_byme = Ticket.objects.select_related('queue').filter(
               submitter_email=request.user.email,
            ).exclude(
               status__in=[Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS],
           )
        byme=(created_byme).order_by('-created')[:5]

        created_by_me = len(created_byme)

        #Tasks
        tasks = Task.objects.filter(created_by = request.user)

        #tasks created by user
        tasks_created = (tasks).exclude(status__in=([3,4])).order_by('created_date')
        total_tasks_created = len(tasks_created)

        #tasks assigned to the user
        tasks_assigned = Task.objects.filter(assigned_to_id=request.user).exclude(status__in=([3,4])).order_by('created_date')
        total_tasks_assigned = len(tasks_assigned)

        #tasks completed by the user
        tasks_completed = (tasks).filter(status__in='3').order_by('created_date')
        total_tasks_completed = len (tasks_completed)

        #recent tasks
        recent_tasks = Task.objects.filter(Q(created_by=request.user) | Q(assigned_to=request.user) ).exclude(status__in=([3,4])).order_by('created_date')
        num_tasks = recent_tasks.count

    #create ticket modal
    assignable_users = User.objects.filter(is_active=True).order_by(User.USERNAME_FIELD)
    initial_data = {}
    try:
        if request.user.is_authenticated and request.user.email:
            initial_data['submitter_email'] = request.user.email

    except Exception, e:
        pass

    form = form_data(request)

    users = get_current_users()
    
    # Announcement
    announcements = Announcement.objects.all().order_by('create_date')

    return render(request, 'home.html', {'home_tab': 'active', 'tickets': tickets, \
                                         'recent_tickets': recent_tickets,'votes_tickets': votes_tickets, 'num_tickets': num_tickets, 'recent_tasks': recent_tasks, \
                                         'closed_resolved': closed_resolved,'assigned_to_me':assigned_to_me,'created_by_me':created_by_me,\
                                         'closed':closed,'tome':tome,'byme':byme, 'tasks_created': tasks_created, 'tasks_assigned': tasks_assigned, \
                                          'num_tasks': num_tasks, 'total_tasks_created': total_tasks_created, \
                                        'total_tasks_assigned': total_tasks_assigned, 'tasks_completed': tasks_completed, 'total_tasks_completed': total_tasks_completed,\
                                         'logged_users':users, 'form':form, 'helper':form.helper, 'announcements':announcements,})


def contact(request):
    """
    Feedback form
    """
    form = FeedbackForm(initial={'submitter': request.user})

    if request.method == 'POST':
        form = FeedbackForm(request.POST)  # A form bound to the POST data
        if form.is_valid():  # All validation rules pass
            form.save()
            messages.error(request, 'Thank you', fail_silently=False)
        else:
            messages.error(request, 'Invalid', fail_silently=False)
            print form.errors

    form = form_data(request)
    return render(request, "contact.html", {'form': form, 'helper': FeedbackForm.helper, 'form':form})


def faq(request):
    """
    Get FAQ and display them on template
    """

    getFAQ = FAQ.objects.all()

    form = form_data(request)

    return render(request, 'faq.html', {'getFAQ': getFAQ, 'form':form})


def documentation(request):
    """
    Get Documentation and display them on template
    """

    getDocumentation = DocumentationApp.objects.all()

    form = form_data(request)

    return render(request, 'documentation.html', {'getDocumentation': getDocumentation, 'form':form})


def register(request):
    """
    Register a new User profile using built in Django Users Model
    """
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/login")
    else:
        form = UserCreationForm()
    return render(request, "registration/register.html", {
        'form': form,
    })


def profile(request):
    """
    Update a User profile using built in Django Users Model if the user is logged in
    otherwise redirect them to registration version
    """
    if request.user.is_authenticated():
        obj = get_object_or_404(User, username=request.user)
        form = RegistrationForm(request.POST or None, instance=obj,initial={'username': request.user})

        if request.method == 'POST':
            if form.is_valid():
                form.save()
                messages.error(request, 'Your profile has been updated.', fail_silently=False)

        return render(request, "registration/profile.html", {
            'form': form, 'helper': RegistrationForm.helper
        })
    else:
        return HttpResponseRedirect("/accounts/register")


def logout_view(request):
    """
    Logout a user
    """
    logout(request)
    # Redirect to a success page.
    return HttpResponseRedirect("/home")

def login_view(request):
    """Login a User"""

    form = form_data(request)
    password = username = error_message = ''

    if request.POST:
        username = request.POST['username']
        password = request.POST['password']

        logged_user = authenticate(username=username, password=password)
        if logged_user is not None:
            if logged_user.is_active:
                login(request, user)
                return HttpResponseRedirect('/home')
            error_message =  'You are profile Status is inactive. Contact the admin.'
        error_message = 'Kindly confirm your Credentials (Both Username and Password are case sensitive).'
        return render(request, "registration/login.html", {'form':form, 'error_message': error_message})

    login(request)
    return render(request, "registration/login.html", {'form':form})

def permission_denied(request):
    """
    Something unauthorized happened
    """
    return render(request, '401.html')

###Tola Tools API Views
@login_required
def get_TolaActivity_data(request):

    token = settings.TOLA_ACTIVITY_TOKEN
    url = 'http://activity.toladata.io/api/projectagreements/'

    user_details = None
    try:
        user_details = get_object_or_404(TolaUser, user=request.user)
    except Exception, e:
        pass

    if user_details:

        if user_details.activity_api_token and user_details.activity_url:
            token = user_details.activity_api_token
            url = str(user_details.activity_url)+"/api/projectagreements/"

    header = {'Authorization': 'token %s' % token}

    try:
        response = requests.get(url, headers=header)

        # Consider any status other than 2xx an error
        if not response.status_code // 100 == 2:
            return {}

        json_obj = response.json()
        return json_obj

    except requests.exceptions.RequestException as e:
        return {}

    except ValueError:

        return {}

def get_TolaActivity_loggedUser():

    #TolaActivity Url
    url = 'http://activity.toladata.io/api/loggedusers/' 

    token = settings.TOLA_ACTIVITY_TOKEN

    header = {'Authorization': 'token %s' % token}

    try:
        response = requests.get(url, headers=header)

        # Consider any status other than 2xx an error
        if not response.status_code // 100 == 2:
            return {}

        json_obj = response.json()
        return json_obj

    except requests.exceptions.RequestException as e:

        return {}

    except ValueError:

        return {}

@login_required
def get_TolaTables_data(request):
    user = {}
    my_tables = []
    my_silos = []
    table_data = {}

    token = 'bd43de0c16ac0400bc404c6598a6fe0e4ce73aa2'
    user_url = 'http://tables.toladata.io/api/users' 
    public_table_url ='http://tables.toladata.io/api/public_tables'
    silo_url = 'http://tables.toladata.io/api/silo'

    user_details = None

    try:
        user_details = get_object_or_404(TolaUser, user=request.user)
    except Exception, e:
        pass
        
    if user_details:
        if user_details.tables_api_token and user_details.table_url:
            token = user_details.tables_api_token
            user_url = str(user_details.table_url)+'/api/users' 
            public_table_url =str(user_details.table_url)+'/api/public_tables'
            silo_url = str(user_details.table_url)+'/api/silo'

    header = {'Authorization': 'token %s' % token}

    try:
        user_response = requests.get(user_url, headers=header)
        public_table_response = requests.get(public_table_url, headers=header)
        silo_response = requests.get(silo_url, headers=header)

        # Consider any status other than 2xx an error
        if not user_response.status_code // 100 == 2 and public_table_response.status_code // 100 == 2:
            return {}

        elif not user_response.status_code // 100 == 2 and silo_response.status_code // 100 == 2:
            return {}
        else:
            json_obj = user_response.json()
            json_obj2 = public_table_response.json()
            json_obj3 = silo_response.json()


            email = request.user.email

            for data in json_obj:
                if data['email'] == email:
                    user = data
            if user:
                try:
                    for table in json_obj2:
                        if table['owner'] == user['url']:
                            my_tables.append(table)
                except Exception, e:
                    pass

                #get silos    
                try:
                    for silo in json_obj3:
                        if silo['owner'] == user['url']:
                            my_silos.append(silo)
                except Exception, e:
                    pass


            table_data = {'my_tables': my_tables, 'my_silos': my_silos}

            return table_data

    except requests.exceptions.RequestException as e:
        return {}

    except ValueError:

        return {}


#return users logged into TolaWork 
def logged_in_users(request):

    logged_users = {}
    username = request.user.username

    logged_users = LoggedUser.objects.all().exclude(username=username).order_by('username')

    return logged_users

#get tickets of a logged in user
def  get_tickets_by_user(email):

    tickets = Ticket.objects.filter(submitter_email= email)
    
    return tickets

#get tasks of a logged_in user
def  get_tasks_by_user(email):
    tasks = Task.objects.filter(submitter_email= email)
    return tasks

#GitHub Sync
@login_required
def githubSync(request, ticket_id):

    ticket = get_object_or_404(Ticket, id=ticket_id)

    try:
        queue = queue_repo(ticket)

        label = ''
        status = ''
        ticket_resp = {}

        if not ticket.github_issue_number:
           pass
           
        else:

           response = get_issue_status(queue,ticket)

           update_label = get_label(queue,ticket)

           if update_label == 200:
                print 'Label Updated for ticket -#' + str(ticket.id)

           if response == 200:
               print 'GitHubSync Success - #' + str(ticket.github_issue_number)

           ticket_resp = {'id': ticket.id, 'status_lbl': 'Success'}

        return HttpResponse(json.dumps(ticket_resp), content_type="application/json")

    except Exception, e:
        lable_status = {'id': ticket.id, 'status_lbl': 'Failed'}

        return HttpResponse(json.dumps(lable_status), content_type="application/json" )



def ticket_objects(request):

    tickets = Ticket.objects.all().exclude(github_issue_number__exact="", github_issue_number__isnull=True,
           status__in=[Ticket.RESOLVED_STATUS, Ticket.CLOSED_STATUS]).values('id', 'title').distinct()
    if tickets:
        from django.core.serializers.json import DjangoJSONEncoder

        ticket_object = json.dumps(list(tickets), cls=DjangoJSONEncoder)

        final_dict = { 'tickets': ticket_object }

        return JsonResponse(final_dict, safe=False) 

    else:

        return {}

#Get users with active sessions
def get_current_users():
    active_sessions = Session.objects.filter(expire_date__gte=timezone.now())
    user_id_list = []
    for session in active_sessions:
        data = session.get_decoded()
        user_id_list.append(data.get('_auth_user_id', None))

    # Query all logged in users based on id list
    logged_users = User.objects.filter(id__in=user_id_list)
    for user in logged_users:
        user.email = User.objects.get(username=user).email
    return logged_users

from django.views.decorators.csrf import ensure_csrf_cookie
import json

@ensure_csrf_cookie
def create_funding_opportunity(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        phone = request.POST.get('phone')
        email = request.POST.get('email')
        project_description = request.POST.get('project_description')
        project_start_date = request.POST.get('project_start_date')
        total_estimated_amount = request.POST.get('total_estimated_amount')
        additional_comments = request.POST.get('additional_comments')

        response_data = {}

        f_opportunity = FundingOpportunity(name=name, phone=phone, email=email, project_description=project_description, project_start_date=project_start_date, total_estimated_amount=total_estimated_amount, additional_comments=additional_comments)

        f_opportunity.save()

        return HttpResponse(
                json.dumps(response_data),
                content_type="application/json"
            )
    else:
        return HttpResponse(
            json.dumps({"response": "there was an error"}),
            content_type="application/json"
        )
