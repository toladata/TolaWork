# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0002_auto_20150902_1446'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticket',
            name='type',
            field=models.IntegerField(default=1, help_text='Type of Ticket', verbose_name='Ticket Type', choices=[(1, 'Problem'), (2, 'Enhancement'), (3, 'Bug or Error')]),
        ),
        migrations.AddField(
            model_name='ticket',
            name='votes',
            field=models.IntegerField(default=0),
        ),
    ]
