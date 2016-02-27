import requests
import json
from helpdesk.models import Ticket, FollowUp
from django.shortcuts import get_object_or_404

def post_slack(ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    hook_URL = 'https://hooks.slack.com/services/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'

    attachments = [
      {
         'fallback':'[ ' + str(ticket.queue) +' ] New Issue created By: ' + str(ticket.submitter_email) + ' On: ' + str(ticket.created) ,
         'pretext':'[ ' + str(ticket.queue) +' ] New Issue created By: ' + str(ticket.submitter_email) + ' On: ' + str(ticket.created) ,
         'color':'#D00000',
         'fields':[
            {
               'title':'Ticket # ' + str(ticket.id) + ' - ' + str(ticket.title),
               'value':' - '  + str(ticket.ticket_url) + " " +str(ticket.description) ,
               #'short': false
            }
         ]
      }
    ]
    payload = {'channel': '#tola-work', 'username': 'Tola-Work', 'attachments': attachments, 'icon_emoji': ':monkey:'}
    r = requests.post(hook_URL, data=json.dumps(payload))
    return r.status_code

def post_tola_slack(ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    hook_URL = 'https://hooks.slack.com/services/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'

    attachments = [
      {
         'fallback':'[ ' + str(ticket.queue) +' ] New Issue created By: ' + str(ticket.submitter_email) + ' On: ' + str(ticket.created) ,
         'pretext':'[ ' + str(ticket.queue) +' ] New Issue created By: ' + str(ticket.submitter_email) + ' On: ' + str(ticket.created) ,
         'color':'#D00000',
         'fields':[
            {
               'title':'Ticket # ' + str(ticket.id) + ' - ' + str(ticket.title),
               'value':' - '  + str(ticket.ticket_url) + " " +str(ticket.description) ,
               #'short': false
            }
         ]
      }
    ]
    payload = {'channel': '#tola-work', 'username': 'Tola-Work', 'attachments': attachments, 'icon_emoji': ':monkey:'}
    r = requests.post(hook_URL, data=json.dumps(payload))
    return r.status_code

