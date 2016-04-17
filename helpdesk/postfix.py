from helpdesk.models import EmailTemplate
from django.shortcuts import get_object_or_404
from django.core.mail import send_mail

try:
    from django.utils import timezone
except ImportError:
    from datetime import datetime as timezone

def close_email(ticket):

    closed_template = get_object_or_404(EmailTemplate, template_name='closed')
    send_mail(ticket.title,
              str(ticket.description) + closed_template.html,
              'toladatawork@gmail.com',
              [ticket.submitter_email],
              fail_silently=False)

    print 'Mail sent for Closed Ticket'

