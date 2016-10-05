
from django.views.generic import TemplateView

from django.conf.urls import *
from django.contrib.auth.decorators import login_required
from feed import views
from feed.views import *
from django.conf.urls import patterns, include, url
from django.views.generic import TemplateView
from rest_framework.routers import DefaultRouter
from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework import routers, serializers, viewsets
from django.conf import settings
from django.conf.urls.static import static
from rest_framework.authtoken import views as auth_views

from django.contrib.auth.views import login, logout
from views import profile, register, faq, contact, home, documentation
from django.contrib import admin
admin.autodiscover()

handler401 = 'project.views.permission_denied'
handler403 = 'project.views.permission_denied'

#REST FRAMEWORK
router = routers.DefaultRouter()
router.register(r'tickets', TicketViewSet)

urlpatterns = patterns('feed.views',
    # rest framework

    url(r'^api/', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^api-token-auth/', auth_views.obtain_auth_token),
)

urlpatterns += patterns('',
    #Auth backend URL's
    url('', include('django.contrib.auth.urls', namespace='auth')),
    url('', include('social.apps.django_app.urls', namespace='social')),

    #splash screen
    url(r'^$', 'project.views.splash', name='index'),

    #base template include
    url(r'^$', TemplateView.as_view(template_name='base.html')),

    #admin
    url(r'^admin_tools/', include('admin_tools.urls')),
    url(r'^admin/', include(admin.site.urls)),


    #home

    url(r'^home', 'project.views.home', name='home'),
    url(r'^user', 'project.views.user', name='user'),
    url(r'^contact', 'project.views.contact', name='contact'),
    url(r'^faq', 'project.views.faq', name='faq'),
    url(r'^splash', 'project.views.splash', name='splash'),
    url(r'^documentation', 'project.views.documentation', name='documentation'),
    url(r'^githubSync', 'project.views.githubSync', name='githubSync'),
    url(r'^create_funding_opportunity', 'project.views.create_funding_opportunity', name='create_funding_opportunity'),

    #local login
    url(r'^login/$', 'django.contrib.auth.views.login', name='login'),

    url(r'^accounts/login/$', 'django.contrib.auth.views.login', name='login'),
    url(r'^accounts/logout/$', 'project.views.logout_view', name='logout'),

    #accounts
    url(r'^accounts/profile/$', 'project.views.profile', name='profile'),
    url(r'^accounts/register/$', 'project.views.register', name='register'),

    #app include of activitydb urls
    url(r'^helpdesk/', include('helpdesk.urls')),
    url(r'^tasks/', include('tasks.urls')),
    #tinymce formatting
    url(r'^tinymce/', include('tinymce.urls')),

)   + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
