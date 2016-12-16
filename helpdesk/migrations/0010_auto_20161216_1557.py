# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0009_auto_20161216_1552'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticket',
            name='remind_date',
            field=models.DateTimeField(default=datetime.datetime(2016, 12, 16, 15, 57, 15, 413161), help_text='Date the last reminder was sent', verbose_name='Reminder', blank=True),
        ),
    ]
