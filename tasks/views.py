from __future__ import unicode_literals
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, render_to_response
from django.template import RequestContext, loader, Context
from django.contrib.auth.models import User
from tasks.models import Task
from datetime import datetime
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
from tasks.forms import TaskForm
from tasks.models import Task
staff_member_required = user_passes_test(lambda u: u.is_authenticated() and u.is_active and u.is_staff)


superuser_required = user_passes_test(lambda u: u.is_authenticated() and u.is_active and u.is_superuser)
# Create your views here.
@login_required
def task_list(request):

    created_by = request.user
    assignable_users = User.objects.filter(is_active=True).order_by(User.USERNAME_FIELD)

    tasks = Task.objects.all()
    created_by = request.user
    assignable_users = User.objects.filter(is_active=True).order_by(User.USERNAME_FIELD)

    return render_to_response('tasks/task_index.html',
        RequestContext(request, {
        'tasks': tasks,
        'assignable_users': assignable_users,
        'created_by': created_by,

        }))

@login_required
def create_task(request):
    
    created_by = request.user
    assignable_users = User.objects.filter(is_active=True).order_by(User.USERNAME_FIELD)

    if request.method == 'POST':
		title = request.POST.get('title')
		submitter_mail = request.POST.get('submitter_mail')
		status = request.POST.get('status')
		priority = request.POST.get('priority')
		due_date = datetime.strptime(request.POST.get('due_date'), "%Y-%m-%d")
		created_date = datetime.strptime(request.POST.get('created_date'),"%Y-%m-%d")
		created_by = request.POST.get('created_by')
		assigned_to = request.POST.get('assigned_to')
		note = request.POST.get('note')

		task = Task(task=title, submitter_email=submitter_mail, status=status, priority=priority, due_date=due_date, created_date=created_date,created_by_id=created_by, assigned_to_id=assigned_to, note=note)
		task.save()

		print (task)

    tasks = Task.objects.all()
    return render_to_response('tasks/task_index.html',
        RequestContext(request, {
        	'tasks':Task.objects.all(),
            'assignable_users': assignable_users,
            'created_by': created_by,

            
        }))

@login_required
def view_task(request, task_id):
    task = get_object_or_404(Task, id=task_id)
    task_state = get_object_or_404(Task, id=task_id)

    if 'take' in request.GET:

        request.POST = {
            'owner': request.user.id,
            'public': 1,
            'title': task_state.title,
            'comment': ''
        }
        return task(request, task_id)



    users = User.objects.filter(is_active=True).order_by(User.USERNAME_FIELD)
    return render_to_response('tasks/task_view.html',
        RequestContext(request, {
            'task': task_state,
            'active_users': users,
            'created_by': task_state.created_by,
            'assigned_to': task_state.assigned_to,
            'priority': task_state.priority,
            'due_date': task_state.due_date,
            'state': task_state.status,
            'submitter_email': task_state.submitter_email

        }))
def task_edit(request, task_id):
    task = get_object_or_404(Task, id=task_id)
    if request.method == 'POST':
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
    return render_to_response('tasks/task_view.html',
        RequestContext(request, {
        	'task': request.POST.get('task'),
            'owner': request.POST.get('owner'),
            'priority': request.POST.get('priority'),



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
