# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Task',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('task', models.CharField(max_length=140)),
                ('created_date', models.DateTimeField(auto_now=True)),
                ('due_date', models.DateTimeField(null=True, blank=True)),
                ('status', models.IntegerField(default=1, choices=[(1, 'Active'), (2, 'Reopened'), (3, 'Completed'), (4, 'Cancelled')])),
                ('completed_date', models.DateTimeField(null=True, blank=True)),
                ('submitter_email', models.EmailField(help_text='The submitter will receive an email for all public follow-ups left for this task.', max_length=254, null=True, verbose_name='Submitter E-Mail', blank=True)),
                ('note', models.TextField(null=True, blank=True)),
                ('priority', models.IntegerField(choices=[(1, '1. High'), (2, '2. Normal'), (3, '3. Low')])),
                ('assigned_to', models.ForeignKey(related_name='task_assigned_to', verbose_name='Assigned to', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
                ('created_by', models.ForeignKey(related_name='task_created_by', verbose_name='Created By', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'ordering': ['priority'],
            },
        ),
        migrations.CreateModel(
            name='TaskChange',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('field', models.CharField(max_length=100, verbose_name='Field')),
                ('old_value', models.TextField(null=True, verbose_name='Old Value', blank=True)),
                ('new_value', models.TextField(null=True, verbose_name='New Value', blank=True)),
            ],
            options={
                'verbose_name': 'Task change',
                'verbose_name_plural': 'Task changes',
            },
        ),
        migrations.CreateModel(
            name='TaskFollowUp',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateTimeField(default=django.utils.timezone.now, verbose_name='Date')),
                ('task_name', models.CharField(max_length=200, null=True, verbose_name='Task', blank=True)),
                ('comment', models.TextField(null=True, verbose_name='Comment', blank=True)),
                ('public', models.BooleanField(default=False, help_text='Public tasks can be viewed by other users while non-public tasks can only be viewed by the task owner', verbose_name='Public')),
                ('new_status', models.IntegerField(blank=True, help_text='If the status was changed, what was it changed to?', null=True, verbose_name='New Status', choices=[(1, 'Active'), (2, 'Reopened'), (3, 'Completed'), (4, 'Cancelled')])),
                ('task', models.ForeignKey(verbose_name='Task', to='tasks.Task')),
                ('user', models.ForeignKey(verbose_name='User', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'ordering': ['date'],
                'verbose_name': 'TaskFollow-up',
                'verbose_name_plural': 'TaskFollow-ups',
            },
        ),
        migrations.AddField(
            model_name='taskchange',
            name='taskfollowup',
            field=models.ForeignKey(verbose_name='TaskFollow-up', to='tasks.TaskFollowUp'),
        ),
    ]
