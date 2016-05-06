# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import tinymce.models


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0014_auto_20160417_2320'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='kbitem',
            name='question',
        ),
        migrations.AlterField(
            model_name='faq',
            name='answer',
            field=tinymce.models.HTMLField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='faq',
            name='question',
            field=tinymce.models.HTMLField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='kbitem',
            name='answer',
            field=tinymce.models.HTMLField(verbose_name='Answer'),
        ),
    ]
