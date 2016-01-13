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
from django.conf import settings
from django.db.models import Count
import os


def home(request):

    #Ping Tola servers
    activity_up = os.system("ping -c 1 " + "http://tola-activity.mercycorps.org")
    data_up = os.system("ping -c 1 " + "http://tola.mercycorps.org")

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

    recent_tickets = Ticket.objects.all().exclude(status__in='4').order_by('-created')[:7]
    votes_tickets = Ticket.objects.all().exclude(status__in='4').filter(type=2).order_by('-votes')[:4]

    return render(request, 'home.html', {'home_tab': 'active', 'tola_url': tola_url,'tola_number': tola_number, \
                                         'tola_activity_url': tola_activity_url, 'tola_activity_number': tola_activity_number, \
                                         'activity_up': activity_up, 'data_up': data_up, 'tickets': tickets, \
                                         'recent_tickets': recent_tickets,'votes_tickets': votes_tickets})


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
            return HttpResponseRedirect("/")
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
    return HttpResponseRedirect("/")
