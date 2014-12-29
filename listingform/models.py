import os
SETTINGS_DIR = os.path.dirname(__file__)
PROJECT_PATH = os.path.join(SETTINGS_DIR, os.pardir)
PROJECT_PATH = os.path.abspath(PROJECT_PATH)
MEDIA_PATH = os.path.join(PROJECT_PATH,'media')


from django.db import models
from django.template.defaultfilters import slugify

# Create your models here.
class GenProduct(models.Model):
	owner_id=models.CharField(max_length=128)
	# rsf=models.CharField(max_length=20)
	cat_id=models.IntegerField()
	subcat_id=models.IntegerField()
	product_title=models.CharField(max_length=128)
	product_details=models.TextField(blank=True,null=True,default=None)
	# price=models.IntegerField()
	buyingprice=models.IntegerField(blank=True,null=True,default=None)
	price=models.CharField(max_length=128,default='0')
	sellprice=models.CharField(max_length=128,default='0')
	pickup=models.TextField()
	pickup_lat=models.CharField(max_length=128)
	pickup_long=models.CharField(max_length=128)
	pickup_city=models.CharField(max_length=128,default='0')
	pickup_state = models.CharField(max_length=128,default='0')
	pickup_country = models.CharField(max_length=128,default='0')
	pincode=models.IntegerField()
	# product_pic = models.ImageField(upload_to='users',blank=True,default=None)
	warranty=models.CharField(max_length=12)
	explicit_terms_conditions=models.TextField(blank=True,null=True)
	# rate_item_condition=models.IntegerField()
	availability=models.CharField(max_length=12)
	logistics=models.CharField(max_length=12)
	rent=models.CharField(max_length=12)
	sell=models.CharField(max_length=12)
	# daily_rental=models.IntegerField(blank=True,null=True,default=None)
	# weekly_rental=models.IntegerField(blank=True,null=True,default=None)
	# monthly_rental=models.IntegerField(blank=True,null=True,default=None)
	# sp=models.IntegerField(blank=True,null=True,default=None)
	security_deposits=models.CharField(max_length=128,blank=True,default='0')
	product_pic = models.ImageField(upload_to='media/%Y/%m/%d/%H/%M/%S/',max_length=1000)
	slug = models.SlugField()
	# logistics=models.CharField(max_length=128,default='1')
	# security_deposits=models.CharField(max_length=128)
	# available_dates=models.CharField(max_length=1000,blank=True,null=True,default=None)
	
	def __unicode__(self):
		return str(self.product_title) + " - " + str(self.cat_id)

	def save(self, *args, **kwargs):
		self.slug = slugify(self.product_title)
		super(GenProduct, self).save(*args, **kwargs)

        