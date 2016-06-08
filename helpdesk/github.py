import requests
import json
from helpdesk.forms import CommentTicketForm
from helpdesk.models import Ticket, FollowUp
from django.conf import settings
from django.shortcuts import get_object_or_404
try:
    from django.utils import timezone
except ImportError:
    from datetime import datetime as timezone


def get_issue_status(repo,ticket):

    repo = repo + "/issues/" + ticket.github_issue_number
    r = requests.get(repo)

    if int(r.status_code) == 200:
        data = json.loads(r.content)

        title = data['title']
        updated_date = data['updated_at']

        state = data['state']
        if state == 'closed':
            status = 4
            state_txt = 'Closed'
        else:
            status = 1 #open
            state_txt = 'Open'

        comments = '[GitHub Sync] Ticket is ' + str(state_txt) + ' in GitHub'

        update_ticket = Ticket.objects.get(id=ticket.id)
        current_status = update_ticket.status

        if not int(current_status) == int(status):
            new_followup = FollowUp(title=title, date=updated_date, ticket_id=ticket.id, comment=comments, public=1, new_status=status, )
            new_followup.save()

        update_ticket.status = status
        update_ticket.save()

    return r.status_code

def new_issue(repo,ticket):

    ticket_comments = FollowUp.objects.filter(ticket_id=ticket.id).all()
    new_comment = ''
    for t in ticket_comments:
        new_comment = str(new_comment)  + str(t) + '<br>'

    attachment_note = ''
    ticket_attachments = FollowUp.objects.filter(ticket_id = ticket.id).prefetch_related('attachment_set')
    for ticket_attachment in ticket_attachments.all():
        for attachment in ticket_attachment.attachment_set.all():
            if attachment:
                attachment_note = 'This ticket has Attachments.'
            else:
                attachment_note = ''
    payload = {}
    labels = ['Tola-Work Ticket']
    payload['title'] = ticket.title
    payload['body'] = str(ticket.submitter_email) + " " + str(ticket.description) + "     #" + str(attachment_note) + " - " + str(new_comment)
    payload['labels'] = labels
    token = settings.GITHUB_AUTH_TOKEN
    repo = repo + "/issues"

    header = {'Authorization': 'token %s' % token}
    r = requests.post(repo,json.dumps(payload),headers=header)

    if int(r.status_code) == 201:
        data = json.loads(r.content)
        github_issue_url = data['html_url']
        github_issue_number = data['number']
        github_issue_id = data['id']

        update_ticket = Ticket.objects.get(id=ticket.id)
        update_ticket.github_issue_url = github_issue_url
        update_ticket.github_issue_number = github_issue_number
        update_ticket.github_issue_id = github_issue_id
        update_ticket.save()

    return r.status_code


def add_comments(comment,repo,ticket):
    payload = {}
    payload['title'] = ticket.title
    payload['state'] = "open"
    payload['body'] =  comment
    token = settings.GITHUB_AUTH_TOKEN
    repo = repo + "/issues/" + ticket.github_issue_number + "/comments"
    header = {'Authorization': 'token %s' % token}
    r = requests.post(repo,data=json.dumps(payload),headers=header)
    print 'comment Repo:' + repo

def queue_repo(ticket):
    if str(ticket.queue) == "Tola Tables":
        repo = settings.GITHUB_REPO_1
    else:
        repo = settings.GITHUB_REPO_2

    return repo

def close_issue(repo,ticket):
    payload = {}
    payload['title'] = ticket.title
    payload['state'] = "closed"
    payload['body'] =  "Closed"
    token = settings.GITHUB_AUTH_TOKEN
    repo = repo + "/issues/" + ticket.github_issue_number
    header = {'Authorization': 'token %s' % token}
    r = requests.patch(repo,data=json.dumps(payload),headers=header)
    print 'Closing:' + repo
    return r.status_code

def open_issue(repo,ticket):

    payload = {}
    payload['title'] = ticket.title
    payload['state'] = "open"
    payload['body'] = "Opened"
    token = settings.GITHUB_AUTH_TOKEN
    repo = repo + "/issues/" + ticket.github_issue_number
    header = {'Authorization': 'token %s' % token}
    r = requests.patch(repo,data=json.dumps(payload),headers=header)
    print 'open: ' + repo
    return r.status_code

def latest_release(repo):
    token = settings.GITHUB_AUTH_TOKEN
    repo = repo + "/releases/latest"
    print repo
    header = {'Authorization': 'token %s' % token}
    r = requests.get(repo,headers=header)
    print r
    if str(r.status_code) == "200":
        content = json.loads(r.text or r.content)
    else:
        content = json.loads(r.text or r.content)
        print content
        print r.status_code
        content = None
    return content
