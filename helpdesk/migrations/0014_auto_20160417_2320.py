# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0013_auto_20160410_1048'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='kbcategory',
            name='supercategory',
        ),
        migrations.DeleteModel(
            name='SuperKBCategory',
        ),
    ]
