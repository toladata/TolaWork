# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0007_ticket_slack_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticket',
            name='comment',
            field=models.CharField(max_length=255, null=True, verbose_name='Comment', blank=True),
        ),
    ]
