# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0004_auto_20160119_1520'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticket',
            name='error_msg',
            field=models.TextField(help_text='Error message as it appears', null=True, verbose_name='Error Message', blank=True),
        ),
    ]
