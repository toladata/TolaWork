from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, Http404, HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from django.template import loader, Context, RequestContext
from django.conf import settings
import os
from helpdesk.hackpad import Hackpad
import requests
import json


def index(request, entry=0):

    temp = Hackpad('tola',settings.HACKPAD_CLIENT_ID,settings.HACKPAD_SECRET)
    my_hackpads = temp.list_all()

    if entry ==0:
        entry = my_hackpads[0]

    next = my_hackpads[0]
    previous = my_hackpads[-1]

    return render_to_response('blog/base.html',RequestContext(request, {'hackpad': my_hackpads, 'entry': entry, 'previous':previous, 'next':next }))