# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0006_uservotes'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticket',
            name='slack_status',
            field=models.IntegerField(default=0, verbose_name='Slack Status'),
        ),
    ]
