# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0010_remove_ticket_comment'),
    ]

    operations = [
        migrations.CreateModel(
            name='TicketTag',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('tag', models.CharField(default=None, max_length=200, null=True, verbose_name='tag', blank=True)),
                ('tag_description', models.TextField(default=None, null=True, verbose_name='tag_description', blank=True)),
            ],
            options={
                'verbose_name': 'TicketTag',
                'verbose_name_plural': 'TicketTags',
            },
        ),
        migrations.AddField(
            model_name='ticket',
            name='tag',
            field=models.ForeignKey(default=None, to='helpdesk.TicketTag', max_length=140, null=True, verbose_name='TicketTag'),
        ),
    ]
