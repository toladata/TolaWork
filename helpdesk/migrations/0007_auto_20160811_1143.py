# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0006_auto_20160811_1131'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticket',
            name='t_url',
            field=models.CharField(max_length=255, null=True, blank=True),
        ),
    ]
