from django.shortcuts import render, render_to_response
from tasks.models import Task
# Create your views here.
def task_list(request):
    task = Task.objects.all()

    return render(request, 'tasks/task_index.html', {
        'task': task,

        })