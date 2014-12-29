from django.db import models
from login.models import fbuser
from listingform.models import GenProduct
# Create your models here.
class scart(models.Model):
	cart_item_id = models.ForeignKey(GenProduct)
	cart_customer_id = models.ForeignKey(fbuser)
	cart_item_quantity = models.IntegerField()
	def __unicode__(self):
		return str(self.cart_item_id.product_title)+'-'+str(self.cart_item_quantity)
	@property
	def price(self):
		return int(self.cart_item_id.sellprice)*self.cart_item_quantity

class rcart(models.Model):
	cart_item_id = models.ForeignKey(GenProduct)
	cart_customer_id = models.ForeignKey(fbuser)
	cart_item_quantity = models.IntegerField()
	rent_start = models.DateField()
	rent_end = models.DateField()
	rent_days = models.IntegerField()
	def __unicode__(self):
		return str(self.cart_item_id.product_title)+'-'+str(self.cart_item_quantity)
	@property
	def price(self):
		return int(self.cart_item_id.price)*self.cart_item_quantity*self.rent_days

class checkuout(models.Model):
	checkout_customer = models.ForeignKey(fbuser)
	checkout_item_rcart = models.ManyToManyField(rcart)
	checkout_item_scart = models.ManyToManyField(scart)
	checkout_numr = models.IntegerField()
	checkout_nums = models.IntegerField()
	delivery_name = models.CharField(max_length=200)
	delivery_add_1 = models.CharField(max_length=200)
	delivery_add_2 = models.CharField(max_length=200,blank=True)
	delivery_city = models.CharField(max_length=100)
	delivery_state = models.CharField(max_length=100)
	delivery_country = models.CharField(max_length = 100)
	delivery_pincode = models.CharField(max_length=8)
	delivery_phone = models.CharField(max_length=11)
	delivery_email = models.EmailField()
	created = models.DateTimeField(auto_now_add=True,blank=True)

	def __unicode__(self):
		return str(self.checkout_customer)+'-'+str(self.id)

