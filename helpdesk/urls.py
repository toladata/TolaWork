
from django.conf.urls import *
from django.contrib.auth.decorators import login_required


urlpatterns = patterns('helpdesk.views.staff',
    url(r'^dashboard/$',
        'dashboard',
        name='helpdesk_dashboard'),

    url(r'^tickets/$',
        'ticket_list',
        name='helpdesk_list'),

    url(r'^tickets/update/$',
        'mass_update',
        name='helpdesk_mass_update'),

    url(r'^tickets/submit/$',
        'create_ticket',
        name='helpdesk_submit'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/$',
        'view_ticket',
        name='helpdesk_view'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/followup_edit/(?P<followup_id>[0-9]+)/$',
        'followup_edit',
        name='helpdesk_followup_edit'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/followup_delete/(?P<followup_id>[0-9]+)/$',
        'followup_delete',
        name='helpdesk_followup_delete'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/edit/$',
        'edit_ticket',
        name='helpdesk_edit'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/update/$',
        'update_ticket',
        name='helpdesk_update'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/delete/$',
        'delete_ticket',
        name='helpdesk_delete'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/hold/$',
        'hold_ticket',
        name='helpdesk_hold'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/unhold/$',
        'unhold_ticket',
        name='helpdesk_unhold'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/cc/$',
        'ticket_cc',
        name='helpdesk_ticket_cc'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/cc/add/$',
        'ticket_cc_add',
        name='helpdesk_ticket_cc_add'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/cc/delete/(?P<cc_id>[0-9]+)/$',
        'ticket_cc_del',
        name='helpdesk_ticket_cc_del'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/dependency/add/$',
        'ticket_dependency_add',
        name='helpdesk_ticket_dependency_add'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/dependency/delete/(?P<dependency_id>[0-9]+)/$',
        'ticket_dependency_del',
        name='helpdesk_ticket_dependency_del'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/attachment_delete/(?P<attachment_id>[0-9]+)/$',
        'attachment_del',
        name='helpdesk_attachment_del'),

    url(r'^tickets/(?P<ticket_id>[0-9]+)/send_to_github/$',
        'send_to_github',
        name='send_to_github'),

    url(r'^raw/(?P<type>\w+)/$',
        'raw_details',
        name='helpdesk_raw'),

    url(r'^rss/$',
        'rss_list',
        name='helpdesk_rss_index'),

    url(r'^reports/$',
        'report_index',
        name='helpdesk_report_index'),

    url(r'^reports/(?P<report>\w+)/$',
        'run_report',
        name='helpdesk_run_report'),

    url(r'^save_query/$',
        'save_query',
        name='helpdesk_savequery'),

    url(r'^delete_query/(?P<id>[0-9]+)/$',
        'delete_saved_query',
        name='helpdesk_delete_query'),

    url(r'^settings/$',
        'user_settings',
        name='helpdesk_user_settings'),

    url(r'^ignore/$',
        'email_ignore',
        name='helpdesk_email_ignore'),

    url(r'^ignore/add/$',
        'email_ignore_add',
        name='helpdesk_email_ignore_add'),

    url(r'^ignore/delete/(?P<id>[0-9]+)/$',
        'email_ignore_del',
        name='helpdesk_email_ignore_del'),
)

urlpatterns += patterns('helpdesk.views.public',
    url(r'^$',
        'homepage',
        name='helpdesk_home'),

    url(r'^view/$',
        'view_ticket',
        name='helpdesk_public_view'),

    url(r'^change_language/$',
        'change_language',
        name='helpdesk_public_change_language'),

    url(r'^all_tickets/$',
        'public_ticket_list',
        name='public_list'),

    url(r'^vote_up/(?P<id>[0-9]+)/$',
        'vote_up',
        name='vote_up'),

    url(r'^vote_down/(?P<id>[0-9]+)/$',
        'vote_down',
        name='vote_down'),
)

urlpatterns += patterns('helpdesk.views.kb',
    url(r'^kb/$',
        'index', name='helpdesk_kb_index'),

    url(r'^kb/(?P<item>[0-9]+)/$',
        'item', name='helpdesk_kb_item'),

    url(r'^kb/(?P<item>[0-9]+)/vote/$',
        'vote', name='helpdesk_kb_vote'),

    url(r'^kb/(?P<slug>[A-Za-z0-9_-]+)/$',
        'category', name='helpdesk_kb_category'),
)

urlpatterns += patterns('helpdesk.views.blog',
    url(r'^blog/$',
        'index', name='blog'),

    url(r'^blog/(?P<entry>\w+)/$',
        'index', name='blog'),
)
