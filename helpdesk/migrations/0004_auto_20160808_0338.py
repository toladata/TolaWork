# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0003_auto_20160729_0053'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticket',
            name='assigned_to',
            field=models.ForeignKey(related_name='assigned_to', verbose_name='Assigned to', blank=True, to=settings.AUTH_USER_MODEL, null=True),
        ),
        migrations.AddField(
            model_name='ticket',
            name='t_url',
            field=models.CharField(max_length=255, blank=True),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='t_url',
            field=models.CharField(max_length=255, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='ticket',
            name='remind',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='ticket',
            name='remind_date',
            field=models.DateTimeField(default=datetime.datetime(2016, 8, 15, 12, 10, 32, 6007), help_text='Date the last reminder was sent', verbose_name='Reminder', blank=True),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='t_url',
            field=models.CharField(default=None, max_length=255, blank=True),
            preserve_default=False,
        ),
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

    ]
