from django.conf.urls import *
from django.contrib import admin
from . import views

urlpatterns = patterns('tasks.views',

    url(r'^admin/', admin.site.urls),
    
    url(r'^tasks/$',
        'task_list',
        name='task_list'),

    url(r'^task/(?P<task_id>[0-9]+)$',
        'task',
        name='task'),

    url(r'^tasks/submit/$',
        'create_task',
        name='task_submit'),
    
    url(r'^tasks/(?P<task_id>[0-9]+)/task_edit/$',
        'task_edit',
        name='task_edit'),
    url(r'^tasks/(?P<task_id>[0-9]+)/delete/$',
        'delete_task',
        name='delete_task'),

    url(r'^tasks/tickets/',
        'get_tickets',
        name='ticket_objects'),

    url(r'^comment/(?P<task_id>[0-9]+)/$',
        'task_comment',
        name='task_comment'),

)
