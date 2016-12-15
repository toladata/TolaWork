# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0006_auto_20161005_2132'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticket',
            name='remind_date',
            field=models.DateTimeField(default=datetime.datetime(2016, 11, 2, 6, 58, 11, 559764), help_text='Date the last reminder was sent', verbose_name='Reminder', blank=True),
        ),
    ]
