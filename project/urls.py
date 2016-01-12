from django.conf.urls import patterns, include, url
from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import login, logout
from views import profile, register, faq, contact, home, documentation

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    #Auth backend URL's
    url('', include('django.contrib.auth.urls', namespace='auth')),
    url('', include('social.apps.django_app.urls', namespace='social')),

    #Home page
    url(r'^$', 'project.views.home', name='index'),

    #base template include
    url(r'^$', TemplateView.as_view(template_name='base.html')),

    #admin
    url(r'^admin/', include(admin.site.urls)),

    #home
    url(r'^home', 'project.views.home', name='home'),
    url(r'^contact', 'project.views.contact', name='contact'),
    url(r'^faq', 'project.views.faq', name='faq'),
    url(r'^documentation', 'project.views.documentation', name='documentation'),

    #local login
    url(r'^login/$', 'django.contrib.auth.views.login', name='login'),
    url(r'^accounts/login/$', 'django.contrib.auth.views.login', name='login'),

    url(r'^accounts/logout/$', 'project.views.logout_view', name='logout'),

    #accounts
    url(r'^accounts/profile/$', 'project.views.profile', name='profile'),
    url(r'^accounts/register/$', 'project.views.register', name='register'),

    #app include of activitydb urls
    url(r'^helpdesk/', include('helpdesk.urls')),



)   + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
