# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='GenProduct',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('owner_id', models.CharField(max_length=128)),
                ('cat_id', models.IntegerField()),
                ('subcat_id', models.IntegerField()),
                ('product_title', models.CharField(max_length=128)),
                ('product_details', models.TextField(default=None, null=True, blank=True)),
                ('buyingprice', models.IntegerField(default=None, null=True, blank=True)),
                ('price', models.IntegerField(default=None, null=True, blank=True)),
                ('sellprice', models.CharField(default=b'0', max_length=128)),
                ('pickup', models.TextField()),
                ('pickup_lat', models.CharField(max_length=128)),
                ('pickup_long', models.CharField(max_length=128)),
                ('pickup_city', models.CharField(default=b'0', max_length=128)),
                ('pickup_state', models.CharField(default=b'0', max_length=128)),
                ('pickup_country', models.CharField(default=b'0', max_length=128)),
                ('pincode', models.IntegerField()),
                ('warranty', models.CharField(max_length=12)),
                ('explicit_terms_conditions', models.TextField(default=None, null=True, blank=True)),
                ('availability', models.CharField(max_length=12)),
                ('logistics', models.CharField(max_length=12)),
                ('rent', models.CharField(max_length=12)),
                ('sell', models.CharField(max_length=12)),
                ('security_deposits', models.CharField(default=None, max_length=128, blank=True)),
                ('product_pic', models.ImageField(max_length=1000, upload_to=b'media/%Y/%m/%d/%H/%M/%S/')),
                ('slug', models.SlugField()),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
