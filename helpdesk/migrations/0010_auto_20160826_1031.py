# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import datetime


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('helpdesk', '0009_merge'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserDefaultSort',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('sort', models.CharField(max_length=50)),
                ('user_id', models.ForeignKey(related_name='userdefaultsort', verbose_name='User', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name_plural': 'userdefaultsorts',
            },
        ),
        migrations.AlterField(
            model_name='ticket',
            name='remind_date',
            field=models.DateTimeField(default=datetime.datetime(2016, 8, 26, 10, 31, 18, 139769), help_text='Date the last reminder was sent', verbose_name='Reminder', blank=True),
        ),
    ]
