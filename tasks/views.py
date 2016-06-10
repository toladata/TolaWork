from __future__ import unicode_literals
from django.shortcuts import render, render_to_response
from datetime import datetime, timedelta

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
from django.core import paginator
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
try:
    from django.utils import timezone
except ImportError:
    from datetime import datetime as timezone

import requests
import json
from tasks.forms import TaskForm, CommentTaskForm, EditTaskForm,TaskFollowUp
from tasks.models import Task
staff_member_required = user_passes_test(lambda u: u.is_authenticated() and u.is_active and u.is_staff)


superuser_required = user_passes_test(lambda u: u.is_authenticated() and u.is_active and u.is_superuser)
# Create your views here.

def task_list(request):
    task = Task.objects.all()
    if not request.user.is_authenticated():
        return HttpResponseRedirect(reverse('login'))

    assignable_users = User.objects.filter(is_active=True).order_by(User.USERNAME_FIELD)

    return render_to_response('tasks/task_index.html',
        RequestContext(request, {
            'task': task,

        }))

def create_task(request):

    if not request.user.is_authenticated():
        return HttpResponseRedirect(reverse('login'))
    form = TaskForm()
    assignable_users = User.objects.filter(is_active=True).order_by(User.USERNAME_FIELD)
    messages.add_message(request, messages.SUCCESS,'Create your tasks and assign them to yourself or others to help!!',)

    if request.method == 'POST':
        if request.user.is_active:

            form = TaskForm(request.POST, request.FILES)
            form.fields['priority'].choices = [('', '--------')] + [[task.id, task.task] for task in Task.objects.all()]
            form.fields['assigned_to'].choices = [('', '--------')] + [[u.id, u.get_username()] for u in assignable_users]
        else:
            print "Sign in to create a task"


        if form.is_valid():

            task = form.save(user=request.POST.get('assigned_to'))

            comment = ""
            f = TaskFollowUp(task=task, date=timezone.now(), comment=comment)
            print f
            f.save()

            messages.add_message(request, messages.SUCCESS, 'New task created')
            form.save(user=request)
            return HttpResponseRedirect('task_list')
    else:
        initial_data = {}
        if request.user.email:
            initial_data['submitter_email'] = request.user.email
        if 'priority_choices' in request.GET:
            initial_data['priority_choices'] = request.GET['priority_choices']
    return render(request, 'tasks/task_index.html', {
        'form': form,

        })
    return HttpResponseRedirect('view_task')


def task_edit(request, task_id):
    task = get_object_or_404(Task, id=task_id)
    if request.method == 'POST':
        form = CommentTaskForm(request.POST)
        if form.is_valid():
            task_id = task.id
            task = request.POST.get('task')
            owner = request.POST.get('owner')
            priority = request.POST.get('priority_choices')
            note = request.POST.get('note')
            email = request.POST.get('email')
            due_date = task.due_date
            update_comments = Task(id=task_id, task=task, note=note, assigned_to_id=owner,
                                     submitter_email=email, priority=priority, due_date=due_date,)
            update_comments.save(update_fields=['task','assigned_to_id','priority','note','submitter_email', 'due_date'])
    return HttpResponseRedirect(reverse('task_view', args=[task.id]))


def view_task(request):
    task_req = request.GET.get('task', '')
    task = False
    email = request.GET.get('email', '')
    error_message = ''

    if task_req and email:
        parts = task_req.split('-')
        task_id = parts[-1]

        try:
            task = Task.objects.get(id=task_id,submitter_email__iexact=email)
        except:
            task = False
            error_message = _('Invalid task ID or e-mail address. Please try again.')

        if task:

            if request.user.is_staff:
                redirect_url = reverse('tasks_view', args=[task_id])
                if 'close' in request.GET:
                    redirect_url += '?close'
                return HttpResponseRedirect(redirect_url)

            if 'close' in request.GET and task.status == Task.CANCELLED_STATUS:

                request.POST = {
                    'new_status': Task.CLOSED_STATUS,
                    'public': 1,
                    'title': task.title,
                    'comment': _('Submitter accepted resolution and closed task'),
                    }
                if task.assigned_to:
                    request.POST['owner'] = task.assigned_to.id
                request.GET = {}

                return task(request, task_id, public=True)

            # redirect user back to this task if possible.
            redirect_url = ''

            return render_to_response('tasks/task_index.html',
                RequestContext(request, {
                    'task': task,
                    'next': redirect_url,
                }))

    return render_to_response('tasks/task_index.html',
        RequestContext(request, {
            'task': task,
            'email': email,
            'error_message': error_message
        }))

def delete_task(request, task_id):
    task = get_object_or_404(Task, id=task_id)

    if request.method == 'GET':
        return render_to_response('tasks/delete_task.html',
            RequestContext(request, {
                'task': task,
            }))
    else:
        task.delete()
        return HttpResponseRedirect(reverse('task_list'))
delete_task = staff_member_required(delete_task)



