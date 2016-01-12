# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticket',
            name='github_issue_id',
            field=models.CharField(max_length=255, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='ticket',
            name='github_issue_number',
            field=models.CharField(max_length=255, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='ticket',
            name='github_issue_url',
            field=models.CharField(max_length=255, null=True, blank=True),
        ),
    ]
