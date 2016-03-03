# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0008_ticket_comment'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticket',
            name='comment',
            field=models.TextField(null=True, verbose_name='Comment', blank=True),
        ),
    ]
