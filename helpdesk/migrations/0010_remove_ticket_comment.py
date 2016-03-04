# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0009_auto_20160227_2332'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='ticket',
            name='comment',
        ),
    ]
