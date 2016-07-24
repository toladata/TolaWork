from django.shortcuts import get_object_or_404
from forms import FeedbackForm, RegistrationForm
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm
from django.http import HttpResponseRedirect
from django.shortcuts import render
from helpdesk.models import DocumentationApp, FAQ
from django.contrib.auth.views import login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from helpdesk.github import latest_release
from helpdesk.models import Ticket
from tasks.models import Task
from django.conf import settings
from django.db.models import Count, Sum
import os
from project.models import LoggedUser

def splash(request):
    if request.user.is_authenticated():

        return home(request)
        
    return render(request, "splash.html")
def user (request):
    #tickets
    email = request.GET.get('email')
    all_tickets = Ticket.objects.filter(submitter_email=email).values('status').annotate(total=Count('status')).order_by('total')
    tickets = get_tickets_by_user(email)

    #tasks
    all_tasks = Task.objects.all().values('status').annotate(total=Count('status')).order_by('total')
    tasks = Task.objects.all().order_by('-created_date')[:5]

    return render(request, "user.html", {'all_tickets': all_tickets,'tickets': tickets, 'all_tasks': all_tasks, 'tasks': tasks  })

def home(request):

    #Ping Tola servers
    activity_up = os.system("ping -c 1 " + "http://tola-activity.mercycorps.org")
    data_up = os.system("ping -c 1 " + "http://tola-tables.mercycorps.org")

    #GitHub releases for status
    tola_repo = settings.GITHUB_REPO_1
    tola_activity_repo = settings.GITHUB_REPO_2

    tola = latest_release(tola_repo)
    if tola:
        tola_url = tola['html_url']
        tola_number = tola['tag_name']
    else:
        tola_url = None
        tola_number = None

    tola_activity = latest_release(tola_activity_repo)
    if tola_activity:
        tola_activity_url = tola_activity['html_url']
        tola_activity_number = tola_activity['tag_name']
    else:
        tola_activity_url = None
        tola_activity_number = None

    tickets = Ticket.objects.all().values('status').annotate(total=Count('status')).order_by('total')

    recent_tickets = Ticket.objects.all().exclude(status__in='4').order_by('-created')[:5]
    votes_tickets = Ticket.objects.all().exclude(status__in='4').filter(type=2).order_by('-votes')[:5]
    tasks = Task.objects.all().order_by('-created_date')[:5]

    closed_resolved = 0
    assigned_to_me = 0
    created_by_me = 0
    closed = []
    tome = []
    byme = []
    if (request.user.is_authenticated()):
        # open & reopened tickets, assigned to current user
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

    num_tickets = len(Ticket.objects.all())

#----Data From Tola Tools APIs----####
    tolaActivityData = get_TolaActivity_data()

    tolaTablesData = {}
    if request.user.is_authenticated():

        tolaTablesData = get_TolaTables_data(request)

    logged_users = logged_in_users(request)

    return render(request, 'home.html', {'home_tab': 'active', 'tola_url': tola_url,'tola_number': tola_number, \
                                         'tola_activity_url': tola_activity_url, 'tola_activity_number': tola_activity_number, \
                                         'activity_up': activity_up, 'data_up': data_up, 'tickets': tickets, \
                                         'recent_tickets': recent_tickets,'votes_tickets': votes_tickets, 'num_tickets': num_tickets, 'tasks': tasks, \
                                         'closed_resolved': closed_resolved,'assigned_to_me':assigned_to_me,'created_by_me':created_by_me,\
                                         'closed':closed,'tome':tome,'byme':byme,'tolaActivityData': tolaActivityData, 'tolaTablesData':tolaTablesData, 'logged_users':logged_users})


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

    return render(request, "contact.html", {'form': form, 'helper': FeedbackForm.helper})


def faq(request):
    """
    Get FAQ and display them on template
    """

    getFAQ = FAQ.objects.all()

    return render(request, 'faq.html', {'getFAQ': getFAQ})


def documentation(request):
    """
    Get Documentation and display them on template
    """

    getDocumentation = DocumentationApp.objects.all()

    return render(request, 'documentation.html', {'getDocumentation': getDocumentation})


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


def permission_denied(request):
    """
    Something unauthorized happened
    """
    return render(request, '401.html')

###Tola Tools API Views
import requests

def get_TolaActivity_data():

    url = 'http://127.0.0.1:8100/tolaactivitydata' #TolaActivity Url

    try:
        response = requests.get(url)

        # Consider any status other than 2xx an error
        if not response.status_code // 100 == 2:
            return {}

        json_obj = response.json()

        return json_obj

    except requests.exceptions.RequestException as e:
        # A serious problem happened, like an SSLError or InvalidURL
        return {}

    except ValueError:

        return {}

def get_TolaTables_data(request):
    import json

    url = 'http://127.0.0.1:8200/api/tolatablesdata' #TolaActivity Url
    email = request.user.email

    payload = {'email': email}

    #print email
    try:
        response = requests.get(url, params = payload)

        # Consider any status other than 2xx an error
        if not response.status_code // 100 == 2:
            return {}

        json_obj = response.json()

        return json_obj

    except requests.exceptions.RequestException as e:
        # A serious problem happened, like an SSLError or InvalidURL
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

    tickets = Ticket.objects.filter(submitter_email= email).order_by('-created')[:6]
    
    return tickets

#Update tickets on github
from django.conf import settings
from helpdesk.github import  update_issue,get_issue

@login_required
def update_issue_on_github(request):

    #Update tickets Status in Github
    tickets = Ticket.objects.select_related('queue').exclude(
            status__in=[Ticket.CLOSED_STATUS, Ticket.RESOLVED_STATUS],
        )

    # check status in github
    for ticket in tickets:

        #if there is a github issue check it's status in github
        if ticket.github_issue_number:
            if str(ticket.queue) == "Tola Tables":
                repo = settings.GITHUB_REPO_1
            else:
                repo = settings.GITHUB_REPO_2

            # getstatus from github
            github_status = get_issue(repo,ticket.github_issue_number)

            #if status has been updated in github update here
            if github_status:
                if github_status['state'] == "open" and ticket.status != 1:
                    Ticket.objects.filter(id=ticket.id).update(status=1)
                elif github_status['state'] == "closed" and ticket.status != 3:
                    Ticket.objects.filter(id=ticket.id).update(status=3)

            #update issue in github with local changes and comments
            update_issue(repo,ticket)
    return HttpResponseRedirect('/home')


