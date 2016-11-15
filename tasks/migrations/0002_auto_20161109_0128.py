# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='task',
            name='project_agreement',
            field=models.TextField(null=True, blank=True),
        ),
        migrations.AddField(
            model_name='task',
            name='table',
            field=models.TextField(null=True, blank=True),
        ),
    ]
