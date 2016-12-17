# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0008_merge'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticket',
            name='remind_date',
            field=models.DateTimeField(default=datetime.datetime(2016, 12, 16, 15, 52, 29, 226933), help_text='Date the last reminder was sent', verbose_name='Reminder', blank=True),
        ),
    ]
