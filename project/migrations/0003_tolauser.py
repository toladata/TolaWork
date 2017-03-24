# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('project', '0002_loggeduser_email'),
    ]

    operations = [
        migrations.CreateModel(
            name='TolaUser',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name=b'Given Name')),
                ('tables_api_token', models.CharField(max_length=255, null=True, blank=True)),
                ('activity_api_token', models.CharField(max_length=255, null=True, blank=True)),
                ('activity_url', models.CharField(max_length=255, null=True, blank=True)),
                ('table_url', models.CharField(max_length=255, null=True, blank=True)),
                ('user', models.OneToOneField(related_name='tolawork_user', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ('name',),
                'verbose_name_plural': 'Tola Users',
            },
        ),
    ]
