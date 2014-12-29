import os
SETTINGS_DIR = os.path.dirname(__file__)
PROJECT_PATH = os.path.join(SETTINGS_DIR, os.pardir)
PROJECT_PATH = os.path.abspath(PROJECT_PATH)
MEDIA_PATH = os.path.join(PROJECT_PATH,'media')

from django.db import models
from django.contrib.auth.models import User

class fbuser(models.Model):
	userid=models.CharField(max_length=100,primary_key=True)
	username=models.CharField(max_length=100)
	aliasname=models.CharField(max_length=100)
	email=models.EmailField()
	phoneno1=models.CharField(max_length=13)
	phoneno2=models.CharField(max_length=13)
	address=models.TextField()
	# profile_pic = models.ImageField(upload_to='media/users/%Y/%m/%d/%H/%M/%S/',null=True)

	def __unicode__(self):
		return self.username

class justuser(models.Model):
	userid=models.CharField(max_length=100,primary_key=True)
	username=models.CharField(max_length=100)

	def __unicode__(self):
		return self.username