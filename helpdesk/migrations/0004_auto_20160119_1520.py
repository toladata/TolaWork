# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0003_auto_20150928_1004'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='queuemembership',
            name='queues',
        ),
        migrations.RemoveField(
            model_name='queuemembership',
            name='user',
        ),
        migrations.DeleteModel(
            name='QueueMembership',
        ),
    ]
