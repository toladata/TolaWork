from django.db import models
from django.contrib.auth.signals import user_logged_in, user_logged_out 
from urllib2 import urlopen
import json
from django.contrib.auth.models import User
from django.contrib import admin
from datetime import datetime

try:
    from django.utils import timezone
except ImportError:
    from datetime import datetime as timezone


class Organization(models.Model):
    name = models.CharField("Organization Name", max_length=255, blank=True, default="TolaData")
    description = models.TextField("Description/Notes", max_length=765, null=True, blank=True)
    organization_url = models.CharField(blank=True, null=True, max_length=255)
    level_1_label = models.CharField("Project/Program Organization Level 1 label", default="Program", max_length=255, blank=True)
    level_2_label = models.CharField("Project/Program Organization Level 2 label", default="Project", max_length=255, blank=True)
    level_3_label = models.CharField("Project/Program Organization Level 3 label", default="Component", max_length=255, blank=True)
    level_4_label = models.CharField("Project/Program Organization Level 4 label", default="Activity", max_length=255, blank=True)
    create_date = models.DateTimeField(null=True, blank=True)
    edit_date = models.DateTimeField(null=True, blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name_plural = "Organizations"

    # on save add create date or update edit date
    def save(self, *args, **kwargs):
        if self.create_date == None:
            self.create_date = datetime.now()
        self.edit_date = datetime.now()
        super(Organization, self).save()

    # displayed in admin templates
    def __unicode__(self):
        return self.name


class OrganizationAdmin(admin.ModelAdmin):
    list_display = ('name', 'create_date', 'edit_date')
    display = 'Organization'


class Country(models.Model):
    country = models.CharField("Country Name", max_length=255, blank=True)
    organization = models.ForeignKey('Organization', default=1)
    code = models.CharField("2 Letter Country Code", max_length=4, blank=True)
    description = models.TextField("Description/Notes", max_length=765,blank=True)
    latitude = models.CharField("Latitude", max_length=255, null=True, blank=True)
    longitude = models.CharField("Longitude", max_length=255, null=True, blank=True)
    zoom = models.IntegerField("Zoom", default=5)
    create_date = models.DateTimeField(null=True, blank=True)
    edit_date = models.DateTimeField(null=True, blank=True)

    class Meta:
        ordering = ('country',)
        verbose_name_plural = "Countries"

    # on save add create date or update edit date
    def save(self, *args, **kwargs):
        if self.create_date == None:
            self.create_date = datetime.now()
        self.edit_date = datetime.now()
        super(Country, self).save()

    # displayed in admin templates
    def __unicode__(self):
        return self.country


class TolaUser(models.Model):
    name = models.CharField("Given Name", blank=False, null=False, max_length=100)
    user = models.OneToOneField(User, unique=True, related_name='tolawork_user')
    tables_api_token = models.CharField(blank=True, null=True, max_length=255)
    organization = models.ForeignKey('Organization', default=1, blank=True, null=True, )
    country = models.ForeignKey(Country, blank=True, null=True)
    activity_api_token = models.CharField(blank=True, null=True, max_length=255)
    activity_url = models.CharField(blank=True, null=True, max_length=255)
    table_url = models.CharField(blank=True, null=True, max_length=255)

    class Meta:
        verbose_name_plural = 'Tola Users'
        ordering = ('name',)

    def __unicode__(self):
        return self.name


class LoggedUser(models.Model):
    username = models.CharField(max_length=30, primary_key=True)
    country = models.CharField(max_length=100, blank=False)
    email = models.CharField(max_length=100, blank=False)

    def __unicode__(self):
        return self.username

    def login_user(sender, request, user, **kwargs):
        country = get_user_country(request)

        LoggedUser(username=user.username, country=country, email=user.email).save()

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