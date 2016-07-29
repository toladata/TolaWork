from django.contrib import admin
from tasks.models import Task, TaskFollowUp, TaskChange
# Register your models here.
class TasksAdmin(admin.ModelAdmin):
    list_display = ('task', 'priority', 'due_date')
class TaskChangeInline(admin.StackedInline):
    model = TaskChange
class TaskFollowUpAdmin(admin.ModelAdmin):
    inlines = [TaskChangeInline]
    list_display = ('task', 'date', 'task_name', 'comment')
    list_display_links = ('task',)
admin.site.register(Task)
admin.site.register(TaskFollowUp, TaskFollowUpAdmin)