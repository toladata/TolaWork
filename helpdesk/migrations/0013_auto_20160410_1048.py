# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0012_auto_20160322_0901'),
    ]

    operations = [
        migrations.CreateModel(
            name='SuperKBCategory',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=100, verbose_name='Title')),
                ('slug', models.SlugField(verbose_name='Slug')),
                ('description', models.TextField(verbose_name='Description')),
            ],
            options={
                'ordering': ['title'],
                'verbose_name': 'Knowledge base supercategory',
                'verbose_name_plural': 'Knowledge base supercategories',
            },
        ),
        migrations.AlterModelOptions(
            name='kbcategory',
            options={'ordering': ['title'], 'verbose_name': 'KnCatowledge base category', 'verbose_name_plural': 'Knowledge base categories'},
        ),
        migrations.RemoveField(
            model_name='ticket',
            name='tag',
        ),
        migrations.DeleteModel(
            name='TicketTag',
        ),
        migrations.AddField(
            model_name='kbcategory',
            name='supercategory',
            field=models.ForeignKey(default=1, verbose_name='SuperCategory', to='helpdesk.SuperKBCategory'),
            preserve_default=False,
        ),
    ]
