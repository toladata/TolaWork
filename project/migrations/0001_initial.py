# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Announcement',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(default=b'Announcement', max_length=255, verbose_name=b'Title', blank=True)),
                ('description', models.TextField(max_length=765, null=True, verbose_name=b'Description', blank=True)),
                ('create_date', models.DateTimeField(null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('country', models.CharField(max_length=255, verbose_name=b'Country Name', blank=True)),
                ('code', models.CharField(max_length=4, verbose_name=b'2 Letter Country Code', blank=True)),
                ('description', models.TextField(max_length=765, verbose_name=b'Description/Notes', blank=True)),
                ('latitude', models.CharField(max_length=255, null=True, verbose_name=b'Latitude', blank=True)),
                ('longitude', models.CharField(max_length=255, null=True, verbose_name=b'Longitude', blank=True)),
                ('zoom', models.IntegerField(default=5, verbose_name=b'Zoom')),
                ('create_date', models.DateTimeField(null=True, blank=True)),
                ('edit_date', models.DateTimeField(null=True, blank=True)),
            ],
            options={
                'ordering': ('country',),
                'verbose_name_plural': 'Countries',
            },
        ),
        migrations.CreateModel(
            name='LoggedUser',
            fields=[
                ('username', models.CharField(max_length=30, serialize=False, primary_key=True)),
                ('country', models.CharField(max_length=100)),
                ('email', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Organization',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=b'TolaData', max_length=255, verbose_name=b'Organization Name', blank=True)),
                ('description', models.TextField(max_length=765, null=True, verbose_name=b'Description/Notes', blank=True)),
                ('organization_url', models.CharField(max_length=255, null=True, blank=True)),
                ('level_1_label', models.CharField(default=b'Program', max_length=255, verbose_name=b'Project/Program Organization Level 1 label', blank=True)),
                ('level_2_label', models.CharField(default=b'Project', max_length=255, verbose_name=b'Project/Program Organization Level 2 label', blank=True)),
                ('level_3_label', models.CharField(default=b'Component', max_length=255, verbose_name=b'Project/Program Organization Level 3 label', blank=True)),
                ('level_4_label', models.CharField(default=b'Activity', max_length=255, verbose_name=b'Project/Program Organization Level 4 label', blank=True)),
                ('create_date', models.DateTimeField(null=True, blank=True)),
                ('edit_date', models.DateTimeField(null=True, blank=True)),
            ],
            options={
                'ordering': ('name',),
                'verbose_name_plural': 'Organizations',
            },
        ),
        migrations.CreateModel(
            name='TolaUser',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name=b'Given Name')),
                ('activity_api_token', models.CharField(max_length=255, null=True, blank=True)),
                ('tables_api_token', models.CharField(max_length=255, null=True, blank=True)),
                ('activity_url', models.CharField(max_length=255, null=True, blank=True)),
                ('table_url', models.CharField(max_length=255, null=True, blank=True)),
                ('country', models.ForeignKey(blank=True, to='project.Country', null=True)),
                ('organization', models.ForeignKey(default=1, blank=True, to='project.Organization', null=True)),
                ('user', models.OneToOneField(related_name='tolawork_user', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ('name',),
                'verbose_name_plural': 'Tola Users',
            },
        ),
        migrations.AddField(
            model_name='country',
            name='organization',
            field=models.ForeignKey(default=1, to='project.Organization'),
        ),
    ]
