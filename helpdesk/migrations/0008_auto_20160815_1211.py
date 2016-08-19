# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0007_auto_20160811_1143'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticket',
            name='remind',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='ticket',
            name='remind_date',
            field=models.DateTimeField(default=datetime.datetime(2016, 8, 15, 12, 10, 32, 6007), help_text='Date the last reminder was sent', verbose_name='Reminder', blank=True),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='t_url',
            field=models.CharField(default=None, max_length=255, blank=True),
            preserve_default=False,
        ),
    ]
