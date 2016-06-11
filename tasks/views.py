from django.shortcuts import render, render_to_response
from django.template import RequestContext, loader, Context
from django.contrib.auth.models import User
from tasks.models import Task
from datetime import datetime
# Create your views here.
def task_list(request):

    tasks = Task.objects.all()
    assignable_users = User.objects.filter(is_active=True).order_by(User.USERNAME_FIELD)
    created_by = ''
    if request.user.is_authenticated():
    	created_by = request.user

    return render(request, 'tasks/task_index.html', {
        'tasks': tasks,
        'assignable_users': assignable_users,
        'created_by': created_by,

        })

def create_task(request):
	if request.method == 'POST':
		title = request.POST.get('title')
		submitter_mail = request.POST.get('submitter_mail')
		status = request.POST.get('status')
		priority = request.POST.get('priority')
		due_date = datetime.strptime(request.POST.get('due_date'), "%Y-%m-%d %H:%M:%S")
		completed_date = datetime.strptime(request.POST.get('completed_date'),"%Y-%m-%d %H:%M:%S")
		created_by = request.POST.get('created_by')
		assigned_to = request.POST.get('assigned_to')
		note = request.POST.get('note')

		task = Task(task=title, submitter_email=submitter_mail, status=status, priority=priority, due_date=due_date, completed_date=completed_date,created_by_id=created_by, assigned_to_id=assigned_to, note=note)
		task.save()

		print (task)
	tasks = Task.objects.all()

	return render_to_response('tasks/task_index.html',
        RequestContext(request, {
        	'tasks':tasks,
            
        }))


