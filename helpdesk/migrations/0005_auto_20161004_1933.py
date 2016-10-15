# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0004_auto_20160808_0338'),
    ]

    operations = [
        migrations.CreateModel(
            name='FundingOpportunity',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name='Name')),
                ('phone', models.CharField(max_length=15, verbose_name='Phone Number')),
                ('email', models.EmailField(max_length=254, null=True, verbose_name='E-Mail Address', blank=True)),
                ('project_description', models.TextField(help_text='Short Description of Project.', verbose_name='Project Description', blank=True)),
                ('project_start_date', models.DateTimeField(help_text='Anticipated Start Date of Project', verbose_name='Project Start Date', blank=True)),
                ('total_estimated_amount', models.DecimalField(verbose_name='Estimated Amount', max_digits=10, decimal_places=2)),
                ('additional_comments', models.TextField(null=True, verbose_name='Comment', blank=True)),
            ],
            options={
                'ordering': ['name'],
                'verbose_name': 'Funding Opportunity',
                'verbose_name_plural': 'Funding Opportunities',
            },
        ),
        migrations.AlterField(
            model_name='ticket',
            name='remind_date',
            field=models.DateTimeField(default=datetime.datetime(2016, 10, 4, 19, 33, 39, 412600), help_text='Date the last reminder was sent', verbose_name='Reminder', blank=True),
        ),
    ]
