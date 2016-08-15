# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0003_auto_20160729_0053'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticket',
            name='assigned_to',
            field=models.ForeignKey(related_name='assigned_to', verbose_name='Assigned to', blank=True, to=settings.AUTH_USER_MODEL),
        ),
    ]
