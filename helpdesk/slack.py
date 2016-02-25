import requests
import json
from helpdesk.models import Ticket
from django.shortcuts import get_object_or_404

def post_slack(ticket_id):


    ticket = get_object_or_404(Ticket, id=ticket_id)
    hook_URL = 'https://hooks.slack.com/services/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'

    attachments = [
      {
         'fallback':'Submitted By: ' + str(ticket.submitter_email) ,
         'pretext':'Submitted By: ' + str(ticket.submitter_email) ,
         'color':'#D00000',
         'fields':[
            {
               'title':'Ticket # ' + str(ticket.id),
               'value':' - ' + str(ticket.description) ,
               #'short': false
            }
         ]
      }
    ]
    payload = {'channel': '#tola-work', 'username': 'Tola-Work', 'attachments': attachments, 'icon_emoji': ':panda_face:'}

    r = requests.post(hook_URL, data=json.dumps(payload))

    return r.status_code


