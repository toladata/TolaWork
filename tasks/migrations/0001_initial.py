# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone
import tasks.models
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
                ('priority', models.IntegerField(choices=[(1, 'High'), (2, 'Normal'), (3, 'Low')])),
                ('project_agreement', models.TextField(null=True, blank=True)),
                ('table', models.TextField(null=True, blank=True)),
                ('assigned_to', models.ForeignKey(related_name='task_assigned_to', verbose_name='Assigned to', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
                ('created_by', models.ForeignKey(related_name='task_created_by', verbose_name='Created By', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'ordering': ['priority'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='TaskAttachment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('file', models.FileField(upload_to=tasks.models.attachment_path, max_length=1000, verbose_name='File')),
                ('filename', models.CharField(max_length=1000, verbose_name='Filename')),
                ('mime_type', models.CharField(max_length=255, verbose_name='MIME Type')),
                ('size', models.IntegerField(help_text='Size of this file in bytes', verbose_name='Size')),
                ('task', models.ForeignKey(verbose_name='Task', to='tasks.Task')),
            ],
            options={
                'ordering': ['filename'],
                'verbose_name': 'Attachment',
                'verbose_name_plural': 'Attachments',
            },
        ),
        migrations.CreateModel(
            name='TaskComment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateTimeField(default=django.utils.timezone.now, verbose_name='Date')),
                ('comment', models.TextField(null=True, verbose_name='Comment', blank=True)),
                ('task', models.ForeignKey(verbose_name='Task', to='tasks.Task')),
                ('user', models.ForeignKey(verbose_name='User', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'ordering': ['date'],
                'verbose_name': 'Task-Comment',
                'managed': True,
                'verbose_name_plural': 'Task-Comments',
            },
        ),
    ]
