from django.http import HttpResponse , HttpResponseRedirect
from django.template import RequestContext
from django.shortcuts import render_to_response,render,redirect
from login.models import fbuser
from listingform.models import GenProduct
from landingpage.models import Category, Sub_Category
# Create your views here.

def index(request,ownerid):
	catlist = Category.objects.all()
	subcatlist = Sub_Category.objects.all()
	u = fbuser.objects.get(userid=ownerid)
	p = GenProduct.objects.filter(owner_id=ownerid)
	return render(request,'userprofile/user_admin/profile.html',{ 'pagehead':'Home','user':u,'products':p,'catlist':catlist,'subcatlist':subcatlist})

def edituserinfo(request,ownerid):
	u = fbuser.objects.get(userid=ownerid)
	u.phoneno1 = request.POST["phone1"]
	u.phoneno2 = request.POST["phone2"]
	u.address = request.POST["add"]
	u.email = request.POST["email"]
	u.save()
	un = fbuser.objects.get(userid=ownerid)
	p = GenProduct.objects.filter(owner_id=ownerid)
	return redirect("/user-admin/"+ownerid+"/")

def manage(request,ownerid,productid,slug):
	catlist = Category.objects.all()
	subcatlist = Sub_Category.objects.all()
	p = GenProduct.objects.get(id = productid)
	cat = Category.objects.get(id=p.cat_id)
	sub_cat=Sub_Category.objects.filter(cat_id_id=p.cat_id)
	# return HttpResponse(p.product_title)
	return render(request,'userprofile/user_admin/new/%s.html' % (cat.name),{ 'pagehead':'Home','p':p,'category':cat,'sub_category':sub_cat,'catlist':catlist,'subcatlist':subcatlist,})

def editproductinfo(request,pid):
	p = GenProduct.objects.get(id=pid)

	p.product_title=request.POST['product_title']
	p.product_details=request.POST['productdetail']
	p.buyingprice=request.POST['bp']
	p.sellingprice=request.POST['sp']
	p.price = request.POST['rp']
	p.warranty=len(request.POST.getlist('warranty'))
	p.explicit_terms_conditions=request.POST['terms_conditions']
	p.availability=len(request.POST.getlist('available'))

	

	p.security_deposits=request.POST['security_deposit']
	pickup=request.POST['pickuplocation']
	p.pickup = pickup
	from geopy.geocoders import Nominatim
	geolocator = Nominatim()
	location = geolocator.geocode(pickup)
	p.pickup_lat = location.latitude
	p.pickup_long = location.longitude


	# pickuplat=request.POST['pickuplat']
	# pickuplng=request.POST['pickuplang']
	# fadd = request.POST['fadd']
	p.pincode=request.POST['pincode']
	# rs=request.POST.getlist('rs')	
	p.rent = len(request.POST.getlist('rent'))
	p.sell = len(request.POST.getlist('sell'))
	p.logistics = len(request.POST.getlist('logistics'))

	p.save()

	pn = GenProduct.objects.get(id = pid)
	cat = Category.objects.get(id=p.cat_id)
	sub_cat=Sub_Category.objects.filter(cat_id_id=p.cat_id)
	# return HttpResponse(p.product_title)
	return redirect("/manage/"+pn.owner_id+"/"+pid+"/"+pn.slug+"/")
	
