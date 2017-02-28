from django.contrib import admin
from tasks.models import Task, TaskComment
# Register your models here.
class TasksAdmin(admin.ModelAdmin):
    list_display = ('task', 'priority', 'due_date')

class TaskCommentAdmin(admin.ModelAdmin):
    list_display = ('task', 'date', 'comment')
    list_display_links = ('task',)

admin.site.register(Task)
admin.site.register(TaskComment, TaskCommentAdmin)