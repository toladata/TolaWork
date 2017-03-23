# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0011_auto_20161216_1559'),
    ]

    operations = [
        migrations.AlterField(
            model_name='followup',
            name='new_status',
            field=models.IntegerField(blank=True, help_text='If the status was changed, what was it changed to?', null=True, verbose_name='New Status', choices=[(1, 'Open'), (2, 'Reopened'), (3, 'Resolved'), (4, 'Closed'), (5, 'Duplicate'), (6, 'In Progress'), (7, 'In  Dev Queue')]),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='remind_date',
            field=models.DateTimeField(default=datetime.datetime(2017, 3, 23, 9, 53, 13, 64253), help_text='Date the last reminder was sent', verbose_name='Reminder', blank=True),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='status',
            field=models.IntegerField(default=1, verbose_name='Status', choices=[(1, 'Open'), (2, 'Reopened'), (3, 'Resolved'), (4, 'Closed'), (5, 'Duplicate'), (6, 'In Progress'), (7, 'In  Dev Queue')]),
        ),
    ]
