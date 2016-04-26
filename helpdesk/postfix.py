from helpdesk.models import EmailTemplate
from django.shortcuts import get_object_or_404
from django.core.mail import send_mail

try:
    from django.utils import timezone
except ImportError:
    from datetime import datetime as timezone

def assigned_to_ticket(ticket):
    if ticket.assigned_to:
        assigned_to_email = ticket.assigned_to.email
    else:
        assigned_to_email = ticket.submitter_email
    return assigned_to_email

def open_notify(ticket,comment):
    open_template = get_object_or_404(EmailTemplate, template_name='open')
    assignee = assigned_to_ticket(ticket)
    send_mail('New Ticket: ' + ticket.title,
              ticket.description + open_template.html + comment,
              'toladatawork@gmail.com',
              [ticket.submitter_email, assignee],
              fail_silently=False)
    print 'Mail sent for Open Ticket'

def reopen_notify(ticket,comment):
    reopen_template = get_object_or_404(EmailTemplate, template_name='reopen')
    assignee = assigned_to_ticket(ticket)
    send_mail('Re-Opened: ' + ticket.title,
              ticket.description + reopen_template.html + comment,
              'toladatawork@gmail.com',
              [ticket.submitter_email, assignee],
              fail_silently=False)
    print 'Mail sent for Re-opened Ticket'

def close_notify(ticket,comment):
    closed_template = get_object_or_404(EmailTemplate, template_name='closed')
    assignee = assigned_to_ticket(ticket)
    send_mail('Closed: ' + ticket.title,
              ticket.description + closed_template.html + comment,
              'toladatawork@gmail.com',
              [ticket.submitter_email, assignee],
              fail_silently=False)
    print 'Mail sent for Closed Ticket'

def resolve_notify(ticket,comment):
    resolve_template = get_object_or_404(EmailTemplate, template_name='resolved')
    assignee = assigned_to_ticket(ticket)
    send_mail('Resolved: ' + ticket.title,
              ticket.description + resolve_template.html + comment,
              'toladatawork@gmail.com',
              [ticket.submitter_email, assignee],
              fail_silently=False)
    print 'Mail sent for Resolved Ticket'

def duplicate_notify(ticket,comment):
    duplicate_template = get_object_or_404(EmailTemplate, template_name='duplicate')
    assignee = assigned_to_ticket(ticket)
    send_mail('Duplicated: ' + ticket.title,
              ticket.description + duplicate_template.html + comment,
              'toladatawork@gmail.com',
              [ticket.submitter_email, assignee],
              fail_silently=False)
    print 'Mail sent for Duplicated Ticket'

