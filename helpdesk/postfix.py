from helpdesk.models import EmailTemplate
from django.shortcuts import get_object_or_404
from django.core.mail import send_mail

try:
    from django.utils import timezone
except ImportError:
    from datetime import datetime as timezone

def open_notify(ticket,comment):
    open_template = get_object_or_404(EmailTemplate, template_name='open')
    send_mail('New Ticket: ' + ticket.title,
              ticket.description + ' Comments: ' + comment + open_template.html,
              'toladatawork@gmail.com',
              [ticket.submitter_email],
              fail_silently=False)
    print 'Mail sent for Open Ticket'

def reopen_notify(ticket,comment):
    reopen_template = get_object_or_404(EmailTemplate, template_name='reopen')
    send_mail('Re-Opened: ' + ticket.title,
              ticket.description + ' Comments: ' + comment + reopen_template.html,
              'toladatawork@gmail.com',
              [ticket.submitter_email],
              fail_silently=False)
    print 'Mail sent for Re-opened Ticket'

def close_notify(ticket,comment):
    closed_template = get_object_or_404(EmailTemplate, template_name='closed')
    send_mail('Closed: ' + ticket.title,
              ticket.description + ' Comments: ' + comment + closed_template.html,
              'toladatawork@gmail.com',
              [ticket.submitter_email],
              fail_silently=False)
    print 'Mail sent for Closed Ticket'

def resolve_notify(ticket,comment):
    resolve_template = get_object_or_404(EmailTemplate, template_name='resolved')
    send_mail('Resolved: ' + ticket.title,
              ticket.description + ' Comments: ' + comment + resolve_template.html,
              'toladatawork@gmail.com',
              [ticket.submitter_email],
              fail_silently=False)
    print 'Mail sent for Resolved Ticket'

def duplicate_notify(ticket,comment):
    duplicate_template = get_object_or_404(EmailTemplate, template_name='duplicate')
    send_mail('Duplicated: ' + ticket.title,
              ticket.description + ' Comments: ' + comment + duplicate_template.html,
              'toladatawork@gmail.com',
              [ticket.submitter_email],
              fail_silently=False)
    print 'Mail sent for Duplicated Ticket'

