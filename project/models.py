from django.db import models
from django.contrib.auth.signals import user_logged_in, user_logged_out 
from urllib2 import urlopen
import json

class LoggedUser(models.Model):

  	username = models.CharField(max_length=30, primary_key=True)
  	country = models.CharField(max_length=100, blank=False)
  
	def __unicode__(self):
		return self.username

	def login_user(sender, request, user, **kwargs):
		country = get_user_country(request)

	  	LoggedUser(username=user.username, country=country ).save()

	def logout_user(sender, request, user, **kwargs):

		try:
			user = LoggedUser.objects.get(pk=user.username)
			user.delete()

		except LoggedUser.DoesNotExist:
			pass

	def get_user_country(request):

	    # Automatically geolocate the connecting IP
	    ip = request.META.get('REMOTE_ADDR')
	    try:
	        response = urlopen('http://ipinfo.io/'+ip+'/json').read()
	        response = json.loads(response)
	        return response['country'].lower()

	    except Exception, e:
	        pass
	    
	user_logged_in.connect(login_user)
	user_logged_out.connect(logout_user)