from django.conf.urls import *
from django.contrib import admin
from . import views

urlpatterns = patterns('tasks.views',
    url(r'^admin/', admin.site.urls),
    url(r'^$', views.task_list, name='task_list'),
)
