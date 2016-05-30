from __future__ import unicode_literals
from django.db import models
from django.contrib import admin
from django.contrib.auth.models import User, Group
from django.conf import settings
from datetime import datetime
from helpdesk.models import Queue
from django.utils.translation import ugettext_lazy as _

try:
    from django.utils import timezone
except ImportError:
    from datetime import datetime as timezone

class Task(models.Model):


    ACTIVE_STATUS = 1
    REOPENED_STATUS = 2
    COMPLETED_STATUS = 3
    CANCELLED_STATUS = 4


    STATUS_CHOICES = (
        (ACTIVE_STATUS, _('Active')),
        (REOPENED_STATUS, _('Reopened')),
        (COMPLETED_STATUS, _('Completed')),
        (CANCELLED_STATUS, _('Cancelled')),

    )


    PRIORITY_CHOICES = (
        (1, ('1. High')),
        (2, ('2. Normal')),
        (3, ('3. Low')),

    )

    task = models.CharField(max_length=140)
    created_date = models.DateField(auto_now=True)
    due_date = models.DateField(blank=True, null=True, )
    status = models.IntegerField(choices=STATUS_CHOICES, default=ACTIVE_STATUS)
    completed_date = models.DateField(blank=True, null=True)
    created_by = models.ForeignKey(User,blank=True,null=True,verbose_name=_('User'), related_name='task_created_by')
    assigned_to = models.ForeignKey(User,blank=True,null=True,verbose_name=_('User'),related_name='task_assigned_to')
    note = models.TextField(blank=True, null=True)
    priority = models.IntegerField(choices=PRIORITY_CHOICES)

    # Has due date for an instance of this object passed?
    def overdue_status(self):
        "Returns whether the item's due date has passed or not."
        if self.due_date and datetime.date.today() > self.due_date:
            return 1

    def __str__(self):
        return self.task


    # Auto-set the item creation / completed date
    def save(self):
        # If Item is being marked complete, set the completed_date
        if self.completed_date:
            self.completed_date = datetime.datetime.now()
        super(Task, self).save()

    class Meta:
        ordering = ["priority"]
