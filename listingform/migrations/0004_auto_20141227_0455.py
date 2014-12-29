# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('listingform', '0003_auto_20141226_2016'),
    ]

    operations = [
        migrations.AlterField(
            model_name='genproduct',
            name='explicit_terms_conditions',
            field=models.TextField(null=True, blank=True),
        ),
    ]
