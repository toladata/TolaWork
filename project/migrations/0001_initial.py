# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='LoggedUser',
            fields=[
                ('username', models.CharField(max_length=30, serialize=False, primary_key=True)),
                ('country', models.CharField(max_length=100)),
            ],
        ),
    ]
