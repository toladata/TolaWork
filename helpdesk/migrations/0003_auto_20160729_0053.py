# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import tinymce.models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0002_auto_20160720_2350'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='kbcategory',
            options={'ordering': ['title'], 'verbose_name': 'KnCatowledge base category', 'verbose_name_plural': 'Knowledge base categories'},
        ),
        migrations.AlterField(
            model_name='faq',
            name='answer',
            field=tinymce.models.HTMLField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='followup',
            name='new_status',
            field=models.IntegerField(blank=True, help_text='If the status was changed, what was it changed to?', null=True, verbose_name='New Status', choices=[(1, 'Open'), (2, 'Reopened'), (3, 'Resolved'), (4, 'Closed'), (5, 'Duplicate'), (6, 'Progress')]),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='assigned_to',
            field=models.ForeignKey(related_name='assigned_to', default='', verbose_name='Assigned to', blank=True, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='description',
            field=models.TextField(default='', help_text='The content of the customers query.', verbose_name='Description', blank=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='ticket',
            name='error_msg',
            field=models.TextField(default='', help_text='Error message as it appears', verbose_name='Error Message', blank=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='ticket',
            name='github_issue_id',
            field=models.CharField(default='', max_length=255, blank=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='ticket',
            name='github_issue_number',
            field=models.CharField(default='', max_length=255, blank=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='ticket',
            name='github_issue_url',
            field=models.CharField(default='', max_length=255, blank=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='ticket',
            name='resolution',
            field=models.TextField(default='', help_text='The resolution provided to the customer by our staff.', verbose_name='Resolution', blank=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='ticket',
            name='status',
            field=models.IntegerField(default=1, verbose_name='Status', choices=[(1, 'Open'), (2, 'Reopened'), (3, 'Resolved'), (4, 'Closed'), (5, 'Duplicate'), (6, 'Progress')]),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='tags',
            field=models.ManyToManyField(related_name='ticket_tags', to='helpdesk.Tag', blank=True),
        ),
    ]
