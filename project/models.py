from django.db import models
from django.contrib.auth.signals import user_logged_in, user_logged_out 
from urllib2 import urlopen
import json
from django.contrib.auth.models import User

class LoggedUser(models.Model):

  	username = models.CharField(max_length=30, primary_key=True)
  	country = models.CharField(max_length=100, blank=False)
  	email = models.CharField(max_length=100, blank=False)
  	
  	def __unicode__(self):
		return self.username

	def login_user(sender, request, user, **kwargs):
		country = get_user_country(request)

	  	LoggedUser(username=user.username, country=country,email=user.email ).save()

	def logout_user(sender, request, user, **kwargs):

		try:
			user = LoggedUser.objects.get(pk=user.username)
			user.delete()

		except LoggedUser.DoesNotExist:
			pass
	    
	user_logged_in.connect(login_user)
	user_logged_out.connect(logout_user)


def get_user_country(request):

    # Automatically geolocate the connecting IP
    ip = request.META.get('REMOTE_ADDR')
    try:
        response = urlopen('http://ipinfo.io/'+ip+'/json').read()
        response = json.loads(response)
        return response['country'].lower()

    except Exception, e:
    	response = "undefined"
        return response

class TolaUser(models.Model):
  name = models.CharField("Given Name", blank=False, null=False, max_length=100)
  user = models.OneToOneField(User, unique=True, related_name='tolawork_user')
  tables_api_token = models.CharField(blank=True, null=True, max_length=255)
  activity_api_token = models.CharField(blank=True, null=True, max_length=255)
  organization_url = models.CharField(blank=True, null=True, max_length=255)
  country = models.CharField("Country Name", max_length=255, blank=True)

  class Meta:
        verbose_name_plural = 'Tola Users'
        ordering = ('name',)

  def __unicode__(self):
        return self.name
   
    
