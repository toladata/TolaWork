from django.contrib import admin
from tasks.models import Tasks
# Register your models here.
class TasksAdmin(admin.ModelAdmin):
    list_display = ('task', 'priority', 'due_date')

admin.site.register(Tasks)