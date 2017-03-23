# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('project', '0004_auto_20170323_1355'),
        ('helpdesk', '0012_auto_20170323_0953'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticket',
            name='organization',
            field=models.ForeignKey(verbose_name='Organization', to='project.Organization', null=True),
        ),
        migrations.AddField(
            model_name='ticket',
            name='submitter',
            field=models.ForeignKey(to='project.TolaUser', null=True),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='remind_date',
            field=models.DateTimeField(help_text='Date the last reminder was sent', verbose_name='Reminder', blank=True),
        ),
    ]
