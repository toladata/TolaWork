from __future__ import unicode_literals
from django.db import models
from django.contrib import admin
from django.contrib.auth.models import User, Group
from django.conf import settings
from datetime import datetime
from django.utils import timezone
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
        (1, _('High')),
        (2, _('Normal')),
        (3, _('Low')),

    )

    task = models.CharField(max_length=140)
    created_date = models.DateTimeField(auto_now=True, blank=True)
    due_date = models.DateTimeField(blank=True, null=True, )
    status = models.IntegerField(choices=STATUS_CHOICES, default=ACTIVE_STATUS)
    completed_date = models.DateTimeField(blank=True, null=True)
    created_by = models.ForeignKey(User,blank=True,null=True,verbose_name=_('Created By'), related_name='task_created_by')
    submitter_email = models.EmailField(_('Submitter E-Mail'),blank=True,null=True,help_text=_('The submitter will receive an email for all public follow-ups left for this task.'),)
    assigned_to = models.ForeignKey(User,blank=True,null=True,verbose_name=_('Assigned to'),related_name='task_assigned_to')
    note = models.TextField(blank=True, null=True)
    priority = models.IntegerField(choices=PRIORITY_CHOICES)
    project_agreement = models.TextField(blank=True, null=True)
    table = models.TextField(blank=True, null=True)

    def _get_assigned_to(self):
        """ Custom property to allow us to easily print 'Unassigned' if a
        task has no owner, or the users name if it's assigned. If the user
        has a full name configured, we use that, otherwise their username. """
        if not self.assigned_to:
            return _('Unassigned')
        else:
            if self.assigned_to.get_full_name():
                return self.assigned_to.get_full_name()
            else:
                return self.assigned_to.get_username()
    get_assigned_to = property(_get_assigned_to)
    # Has due date for an instance of this object passed?

    def _get_created_by(self):
        """ Custom property to allow us to easily print 'Unassigned' if a
        task has no owner, or the users name if it's assigned. If the user
        has a full name configured, we use that, otherwise their username. """
        if self.created_by.get_username():
            return self.created_by.get_username()
        
    get_created_by = property(_get_created_by)

    def overdue_status(self):
        "Returns whether the item's due date has passed or not."
        if self.due_date and datetime.date.today() > self.due_date:
            return 1

    def __str__(self):
        return self.task

    def __unicode__(self):
        return u'%s %s' % (self.id, self.task)

    """def get_absolute_url(self):
        return ('task_list', (self.id,))
    get_absolute_url = models.permalink(get_absolute_url)"""
    # Auto-set the item creation / completed date
    def save(self, *args, **kwargs):
        if not self.id:
        # This is a new task as no ID yet exists.
            self.created = timezone.now()
        if not self.priority:
            self.priority = 3
        self.modified = timezone.now()
        # If Item is being marked complete, set the completed_date
        # if self.completed_date:
        #     self.completed_date = datetime.datetime.now()
        super(Task, self).save(*args, **kwargs)


    class Meta:
        ordering = ["priority"]
        managed = True




class TaskComment(models.Model):

    task = models.ForeignKey(Task,verbose_name=_('Task'),)
    date = models.DateTimeField(_('Date'),default = timezone.now)
    comment = models.TextField(_('Comment'),blank=True,null=True,)
    user = models.ForeignKey(settings.AUTH_USER_MODEL,blank=True,null=True,verbose_name=_('User'),)

    class Meta:
        ordering = ['date']
        verbose_name = _('Task-Comment')
        verbose_name_plural = _('Task-Comments')
        managed = True

    def __unicode__(self):
        return u'%s' %(self.comment)
