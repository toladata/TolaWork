# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0005_merge'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticket',
            name='t_url',
            field=models.CharField(max_length=255, blank=True),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='assigned_to',
            field=models.ForeignKey(related_name='assigned_to', verbose_name='Assigned to', blank=True, to=settings.AUTH_USER_MODEL, null=True),
        ),
    ]
