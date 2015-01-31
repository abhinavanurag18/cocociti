from django.http import HttpResponse , HttpResponseRedirect
from django.template import RequestContext
from django.shortcuts import render_to_response,render,redirect
from listingform.models import GenProduct
from checkout.models import rcart,scart
from login.models import fbuser
from checkout.models import checkuout
import json as simplejson
from django.core import serializers
import datetime
from landingpage.models import Category, Sub_Category
from landingpage.views import cartlength
def viewcart(request):
	# render_to_response('cart/index.html')
	uid = request.session['userid']
	fu = fbuser.objects.get(userid=uid)
	rc = rcart.objects.filter(cart_customer_id=fu)
	sc = scart.objects.filter(cart_customer_id=fu)
	return render(request,'cart/index.html',{'pagehead':'My Cart', 'rc':rc,'sc':sc })

def rentcart(request):
	st = request.GET['start']
	s = st.split("/")
	start = datetime.date(int(s[2]),int(s[1]),int(s[0]))
	en = request.GET['end']
	e = en.split("/")
	end = datetime.date(int(e[2]),int(e[1]),int(e[0]))
	days = request.GET['day']
	product = request.GET['product']
	userid = request.session['userid']
	user = fbuser.objects.get(userid=userid)
	noprod = request.GET['noprod']
	prosplit = product.split('/')
	ownerid = prosplit[0]
	product_slug = prosplit[1]
	p = GenProduct.objects.get(owner_id=ownerid,slug=product_slug)
	product_id = p
	status = {}
	rc = rcart.objects.filter(cart_item_id = p, cart_customer_id = user)
	if len(rc) != 0:
		status['suc'] = 2
	else:
		pp = rcart.objects.create(cart_item_id=product_id,cart_customer_id=user,cart_item_quantity=noprod,rent_start=start,rent_end=end,rent_days=int(days))
		try:
			pp.save()
			request.session['cartlength'] = cartlength(request.session['userid'])
			status['suc'] = 1
			status['cartlength'] = cartlength(request.session['userid'])
		except:
			status['suc'] = 0
			status['cartlength'] = cartlength(request.session['userid'])
	
	json = simplejson.dumps(status)
	return HttpResponse(json, content_type='application/json')

def salecart(request):
	product = request.GET['product']
	userid = request.session['userid']
	user = fbuser.objects.get(userid=userid)
	noprod = request.GET['noprod']
	prosplit = product.split('/')
	ownerid = prosplit[0]
	product_slug = prosplit[1]
	p = GenProduct.objects.get(owner_id=ownerid,slug=product_slug)
	product_id = p
	status = {}
	sc = scart.objects.filter(cart_item_id = product_id, cart_customer_id = user)
	if len(sc) != 0:
		status['suc'] = 2
	else :		
		pp = scart.objects.create(cart_item_id=product_id,cart_customer_id=user,cart_item_quantity=noprod)
		try:
			pp.save()
			request.session['cartlength'] = cartlength(request.session['userid'])
			status['suc'] = 1
			status['cartlength'] = cartlength(request.session['userid'])
		except:
			status['suc'] = 0
			status['cartlength'] = cartlength(request.session['userid'])
	
	json = simplejson.dumps(status)
	return HttpResponse(json, content_type='application/json')

def deleteFromRentCart(request):
	# userid = request.GET['userid']
	# productid = request.GET['productid']
	# u = fbuser.objects.get(userid=userid)
	# p = GenProduct.objects.get(id=productid)
	rid = request.GET['id']
	c = rcart.objects.filter(id=rid)
	status = {}
	try:
		c.delete()
		status['suc'] = 1
		uid = request.session['userid']
		fu = fbuser.objects.get(userid=uid)
		rc = rcart.objects.filter(cart_customer_id=fu)
		sc = scart.objects.filter(cart_customer_id=fu)
		total = 0
		for i in rc:
			total+=int(i.price)
		for j in sc:
			total+=int(j.price)

		status['total'] = total
		status['cartlength'] = cartlength(request.session['userid'])
	except:
		status['suc'] = 0
		status['cartlength'] = cartlength(request.session['userid'])
	request.session['cartlength'] = cartlength(request.session['userid'])
	json = simplejson.dumps(status)
	return HttpResponse(json,content_type = 'application/json')


def deleteFromSaleCart(request):
	# userid = request.GET['userid']
	# productid = request.GET['productid']
	# u = fbuser.objects.get(userid=userid)
	# p = GenProduct.objects.get(id=productid)
	sid = request.GET['id']
	c = scart.objects.filter(id=sid)
	status = {}
	try:
		c.delete()
		status['suc'] = 1
		uid = request.session['userid']
		fu = fbuser.objects.get(userid=uid)
		rc = rcart.objects.filter(cart_customer_id=fu)
		sc = scart.objects.filter(cart_customer_id=fu)
		total = 0
		for i in rc:
			total+=int(i.price)
		for j in sc:
			total+=int(j.price)

		status['total'] = total
		status['cartlength'] = cartlength(request.session['userid'])
	except:
		status['suc'] = 0
		status['cartlength'] = cartlength(request.session['userid'])

	request.session['cartlength'] = cartlength(request.session['userid'])
	json = simplejson.dumps(status)
	return HttpResponse(json,content_type = 'application/json')

def index(request):
	
	if 'userid' not in request.session :
		return render(request,'login/login.html',{ 'pagehead':'Home', })

	else :
		catlist = Category.objects.all()
		subcatlist = Sub_Category.objects.all()
		uid = request.session['userid']
		fu = fbuser.objects.get(userid=uid)
		rc = rcart.objects.filter(cart_customer_id=fu)
		sc = scart.objects.filter(cart_customer_id=fu)
		total = 0
		for i in rc:
			total+=int(i.price)
		for j in sc:
			total+=int(j.price)
		return render(request,'checkout/index.html',{'pagehead':'Checkout', 'rc':rc,'sc':sc,'total':total,'catlist':catlist,'subcatlist':subcatlist,})

def checkoutform(request):
	c = checkuout()
	customer_id = request.session['userid']
	fu = fbuser.objects.get(userid=customer_id)
	c.checkout_customer = fu
	rc = rcart.objects.filter(cart_customer_id=fu)
	sc = scart.objects.filter(cart_customer_id=fu)
	c.delivery_name = request.POST['name']
	c.delivery_add_1 = request.POST['add1']
	c.delivery_add_2 = request.POST['add2']
	c.delivery_city = request.POST['city']
	c.delivery_state = request.POST['state']
	c.delivery_country = "India"
	c.delivery_pincode = request.POST['pincode']
	c.delivery_phone = request.POST['phone']
	c.delivery_email = fu.email
	c.checkout_numr = 0
	c.checkout_nums = 0
	c.save()
	ii = 0
	jj = 0
	for i in rc:
		ii = ii+1
		c.checkout_item_rcart.add(i)

	for j in sc:
		jj = jj+1
		c.checkout_item_scart.add(j)

	c.checkout_numr = ii
	c.checkout_nums = jj
	c.save()
	clearcart(customer_id)
	return redirect("/")

def clearcart(userid):
	u = fbuser.objects.get(userid=userid)
	rc = rcart.objects.filter(cart_customer_id = u )
	sc = scart.objects.filter(cart_customer_id = u )
	for i in rc:
		i.delete()
	for j in sc:
		j.delete()
	return 1
