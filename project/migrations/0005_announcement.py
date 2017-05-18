# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('project', '0004_auto_20170323_1355'),
    ]

    operations = [
        migrations.CreateModel(
            name='Announcement',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(default=b'Announcement', max_length=255, verbose_name=b'Title', blank=True)),
                ('description', models.TextField(max_length=765, null=True, verbose_name=b'Description', blank=True)),
                ('create_date', models.DateTimeField(null=True, blank=True)),
            ],
        ),
    ]
