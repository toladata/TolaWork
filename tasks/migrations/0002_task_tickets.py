# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0013_auto_20170323_1430'),
        ('tasks', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='task',
            name='tickets',
            field=models.ManyToManyField(related_name='task_tickets', to='helpdesk.Ticket', blank=True),
        ),
    ]
