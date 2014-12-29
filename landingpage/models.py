from django.db import models
from django.contrib.auth.models import User
class Category(models.Model):
	name=models.CharField(max_length=128, unique=True)
	desc=models.TextField()
	def __unicode__(self):
		return self.name

class Sub_Category(models.Model):
	cat_id=models.ForeignKey(Category)
	name=models.CharField(max_length=128, unique=True)
	def __unicode__(self):
		return self.name

class Subscribe(models.Model):
	email = models.EmailField()
	def __unicode__(self):
		return self.email
