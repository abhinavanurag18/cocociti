# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='fbuser',
            fields=[
                ('userid', models.CharField(max_length=100, serialize=False, primary_key=True)),
                ('username', models.CharField(max_length=100)),
                ('aliasname', models.CharField(max_length=100)),
                ('email', models.EmailField(max_length=75)),
                ('phoneno1', models.CharField(max_length=13)),
                ('phoneno2', models.CharField(max_length=13)),
                ('address', models.TextField()),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='justuser',
            fields=[
                ('userid', models.CharField(max_length=100, serialize=False, primary_key=True)),
                ('username', models.CharField(max_length=100)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
