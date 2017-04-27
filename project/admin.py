from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin
from models import *


class TolaUserAdmin(admin.ModelAdmin):
	list_filter = ( 'activity_url',)

admin.site.register(TolaUser, TolaUserAdmin)

admin.site.register(Announcement)
