# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('listingform', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='genproduct',
            name='explicit_terms_conditions',
            field=models.TextField(default=b'No Terms or Conditions.', null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='genproduct',
            name='price',
            field=models.IntegerField(default=b'0', null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='genproduct',
            name='security_deposits',
            field=models.CharField(default=b'0', max_length=128, blank=True),
        ),
    ]
