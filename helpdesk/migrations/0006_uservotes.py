# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('helpdesk', '0005_ticket_error_msg'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserVotes',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('user_vote', models.IntegerField(help_text='Whether the user voted up or voted down', verbose_name='User Vote')),
                ('vote_date', models.DateTimeField(verbose_name='Date')),
                ('current_user', models.ForeignKey(verbose_name='User', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
                ('ticket_voted', models.ForeignKey(verbose_name='Ticket', to='helpdesk.Ticket')),
            ],
        ),
    ]
