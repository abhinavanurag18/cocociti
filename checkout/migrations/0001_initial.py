# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0001_initial'),
        ('listingform', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='checkuout',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('checkout_numr', models.IntegerField()),
                ('checkout_nums', models.IntegerField()),
                ('delivery_name', models.CharField(max_length=200)),
                ('delivery_add_1', models.CharField(max_length=200)),
                ('delivery_add_2', models.CharField(max_length=200, blank=True)),
                ('delivery_city', models.CharField(max_length=100)),
                ('delivery_state', models.CharField(max_length=100)),
                ('delivery_country', models.CharField(max_length=100)),
                ('delivery_pincode', models.CharField(max_length=8)),
                ('delivery_phone', models.CharField(max_length=11)),
                ('delivery_email', models.EmailField(max_length=75)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('checkout_customer', models.ForeignKey(to='login.fbuser')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rcart',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('cart_item_quantity', models.IntegerField()),
                ('rent_start', models.DateField()),
                ('rent_end', models.DateField()),
                ('rent_days', models.IntegerField()),
                ('cart_customer_id', models.ForeignKey(to='login.fbuser')),
                ('cart_item_id', models.ForeignKey(to='listingform.GenProduct')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='scart',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('cart_item_quantity', models.IntegerField()),
                ('cart_customer_id', models.ForeignKey(to='login.fbuser')),
                ('cart_item_id', models.ForeignKey(to='listingform.GenProduct')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='checkuout',
            name='checkout_item_rcart',
            field=models.ManyToManyField(to='checkout.rcart'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='checkuout',
            name='checkout_item_scart',
            field=models.ManyToManyField(to='checkout.scart'),
            preserve_default=True,
        ),
    ]
