"""
import json data from API
IMPORTANT!! you must turn off pagination for this to work from a URL and get all
country records
Install module django-extensions
Runs twice via function calls at bottom once
"""

from django.contrib.auth.models import User
from project.models import TolaUser, Country, Organization


def run():
    print "Migrating User from Django to TolaUser"

def getAllData():
    getUsers = User.objects.all()
    for item in getUsers:
        try:
            get_user = TolaUser.objects.get(user=item)
        except TolaUser.DoesNotExist:
            get_user = None
        try:
            get_org = Organization.objects.get(name="Mercy Corps")
        except Country.DoesNotExist:
            get_org = None
        if get_user:
            print get_user 
        else:
            if not item.last_name :
		name="No name"
	    else:
		name = item.first_name + " " + item.last_name			
            get_user = TolaUser.objects.create(
            name=name,
            user=item,
            activity_url="https://tola-activity.mercycorps.org",
	    table_url="https://tola-tables.mercycorps.org",
	    organization=get_org
            )
            get_user.save()

getAllData()
