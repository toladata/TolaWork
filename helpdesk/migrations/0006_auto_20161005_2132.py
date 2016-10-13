# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0005_auto_20161004_1933'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticket',
            name='remind_date',
            field=models.DateTimeField(default=datetime.datetime(2016, 10, 5, 21, 32, 35, 752507), help_text='Date the last reminder was sent', verbose_name='Reminder', blank=True),
        ),
    ]
