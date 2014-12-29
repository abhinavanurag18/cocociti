# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('listingform', '0002_auto_20141226_1741'),
    ]

    operations = [
        migrations.AlterField(
            model_name='genproduct',
            name='price',
            field=models.CharField(default=b'0', max_length=128),
        ),
    ]
