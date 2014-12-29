from django.http import HttpResponse , HttpResponseRedirect
from django.template import RequestContext
from django.shortcuts import render_to_response,render,redirect
from landingpage.models import Category, Sub_Category
# from listing import models
from listingform.models import GenProduct 
from geopy import *

def index(request):
	catlist = Category.objects.all()
	subcatlist = Sub_Category.objects.all()
	return render(request,'listingform/index.html',{'pagehead':'Select an appropriate category','catlist':catlist,'subcatlist':subcatlist,})

# def rent_selectcategory(request):
# 	p=Category.objects.all()
# 	return render(request,'listingforms/rent/selectcategory.html',{'category_list':p,})


# def sell_selectcategory(request):
# 	p=Category.objects.all()
# 	return render(request,'listingforms/sell/selectcategory.html',{'category_list':p,})

# def book(request):
# 	return render(request,'listingforms/book.html')

# def rent_product_listing_submit(request):
# 	sid=request.POST['subcategory']
# 	cid=Sub_Category.objects.get(id=sid)

# 	pt=request.POST['product_title']
# 	pd=request.POST['productdetail']
# 	p=request.POST['price']
# 	iow=request.POST['iow']
# 	# pic=request.POST['productpic']
# 	tc=request.POST['terms_conditions']
# 	t=request.POST['tenure_option']
# 	sd=request.POST['security_deposit']
# 	request.encoding = 'koi8-r'
# 	pp=Product.objects.create(owner_id=request.session['userid'],rsf='r',cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,price2=p,in_out_Of_warranty=iow,explicit_terms_conditions=tc,renting_tenure_option=t,security_deposits=sd)
# 	pp.save()
# 	return redirect('/')

def product_listing_submit(request):
	sid=request.POST['subcategory']
	cid=Sub_Category.objects.get(id=sid)

	pt=request.POST['product_title']
	pd=request.POST['productdetail']
	bp=request.POST['bp']
	sp=request.POST['sp']
	rp = request.POST['rp']
	war=len(request.POST.getlist('warranty'))
	pics=request.FILES['pics']
	tc=request.POST['terms_conditions']
	avl=len(request.POST.getlist('available'))

	

	sd=request.POST['security_deposit']
	pickup=request.POST['pickuplocation']

	from geopy.geocoders import Nominatim
	geolocator = Nominatim()
	location = geolocator.geocode(pickup)
	pickuplat = location.latitude
	pickuplng = location.longitude


	# pickuplat=request.POST['pickuplat']
	# pickuplng=request.POST['pickuplang']
	# fadd = request.POST['fadd']
	pincode=request.POST['pincode']
	# rs=request.POST.getlist('rs')	
	r = len(request.POST.getlist('rent'))
	s = len(request.POST.getlist('sell'))
	log = len(request.POST.getlist('logistics'))
	
	
	
	request.encoding = 'koi8-r'
	pp=GenProduct.objects.create(owner_id=request.session['userid'],product_pic=pics,cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,buyingprice=bp,sellprice=sp,price=rp,pickup=pickup,pickup_lat=pickuplat,pickup_long=pickuplng,pincode=pincode,warranty=war,explicit_terms_conditions=tc,availability=avl,security_deposits=sd,logistics=log,rent=r,sell=s)
	pp.save()
	return redirect('/')
	# return render(request,"listingforms/rs.html",{'rs':cki_date})

# def books_product_listing_submit(request):
# 	modelname = {1:adventure,2:books,3:electronics,4:home,5:misc,6:party,7:dress,8:tools,9:vacationhome,10:vehicle}
# 	sid=request.POST['subcategory']
# 	cid=Sub_Category.objects.get(id=sid)

# 	pt=request.POST['product_title']
# 	pd=request.POST['productdetail']
# 	p=request.POST['price']
# 	iow=request.POST['iow']
# 	# pic=request.POST['productpic']
# 	tc=request.POST['terms_conditions']
# 	t=request.POST['tenure_option']
# 	cki_date=''
# 	if t==3:
# 		cki_date=request.POST['cki-date']

# 	sd=request.POST['security_deposit']
# 	pickup=request.POST['pickuplocation']
# 	pickuplat=request.POST['cityLat']
# 	pickuplng=request.POST['cityLng']
# 	pincode=request.POST['pincode']
# 	rs=request.POST.getlist('rs')	
# 	log=request.POST['logistics']

	
# 	dr=0
# 	wr=0
# 	mr=0
# 	sp=0

# 	if 'r' in rs:
# 		dr=request.POST['dailyrentals']
# 		wr=request.POST['weeklyrentals']
# 		mr=request.POST['monthlyrentals']

# 	if 's' in rs:
# 		sp=request.POST['sellingprice']
# 	# request.encoding = 'koi8-r'
# 	modelname[cid.cat_id_id](request,rs,cid,sid,pt,pd,p,pickup,pickuplat,pickuplng,pincode,iow,tc,t,sd,dr,wr,mr,sp,cki_date)
# 	# pp=models.BooksProduct.objects.create(owner_id=request.session['userid'],rsf=rs,cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,buyingprice=p,pickup=pickup,pickup_lat=pickuplat,pickup_long=pickuplng,pincode=pincode,in_out_Of_warranty=iow,explicit_terms_conditions=tc,renting_tenure_option=t,security_deposits=sd,daily_rental=dr,weekly_rental=wr,monthly_rental=mr,sp=sp,available_dates=cki_date)
# 	# pp.save()
# 	return redirect('/')
# 	# return render(request,"listingforms/rs.html",{'rs':cki_date})



# def sell_product_listing_submit(request):
# 	sid=request.POST['subcategory']
# 	cid=Sub_Category.objects.get(id=sid)
# 	pt=request.POST['product_title']
# 	pd=request.POST['productdetail']
# 	p=request.POST['price']
# 	iow=request.POST['iow'],rs,cid,sid,pt,pd,p,pickup,pickuplat,pickuplng,pincode,iow,tc,t,sd,dr,wr,mr,sp,cki_date
# 	pic=request.POST['productpic']
# 	tc=request.POST['terms_conditions']
# 	t=request.POST['tenure_option']
# 	sd=request.POST['security_deposit']
# 	request.encoding = 'koi8-r'
# 	pp=Product.objects.create(owner_id=request.session['userid'],rsf='s',cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,price2=p,in_out_Of_warranty=iow,explicit_terms_conditions=tc,renting_tenure_option=t,security_deposits=sd)
# 	pp.save()
# 	return redirect('/')
def form(request,catid):
	# cat=request.POST['category']
	catlist = Category.objects.all()
	subcatlist = Sub_Category.objects.all()
	a=Category.objects.get(id=catid)
	sub_cat=Sub_Category.objects.filter(cat_id_id=catid)
	# return render(request,'listingform/new/Electronics.html')
	return render(request,'listingform/new/%s.html' % (a.name),{'sub_category':sub_cat,'category':a,'pagehead':'List your items','catlist':catlist,'subcatlist':subcatlist})

# def sell_category_selected(request):
# 	cat=request.POST['category']
# 	a=Category.objects.get(id=cat)
# 	sub_cat=Sub_Category.objects.filter(cat_id_id=cat)
# 	return render(request,'listingforms/sell/%s.html' % (a),{'sub_category':sub_cat,'category':a})

# def adventure(request,rs,cid,sid,pt,pd,p,pickup,pickuplat,pickuplng,pincode,iow,tc,t,sd,dr,wr,mr,sp,cki_date):
# 	request.encoding = 'koi8-r'
# 	pp=models.AdventureProduct.objects.create(owner_id=request.session['userid'],rsf=rs,cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,buyingprice=p,pickup=pickup,pickup_lat=pickuplat,pickup_long=pickuplng,pincode=pincode,in_out_Of_warranty=iow,explicit_terms_conditions=tc,renting_tenure_option=t,security_deposits=sd,daily_rental=dr,weekly_rental=wr,monthly_rental=mr,sp=sp,available_dates=cki_date)
# 	pp.save()

# def books(request,rs,cid,sid,pt,pd,p,pickup,pickuplat,pickuplng,pincode,iow,tc,t,sd,dr,wr,mr,sp,cki_date):
# 	request.encoding = 'koi8-r'
# 	pp=models.BooksProduct.objects.create(owner_id=request.session['userid'],rsf=rs,cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,buyingprice=p,pickup=pickup,pickup_lat=pickuplat,pickup_long=pickuplng,pincode=pincode,in_out_Of_warranty=iow,explicit_terms_conditions=tc,renting_tenure_option=t,security_deposits=sd,daily_rental=dr,weekly_rental=wr,monthly_rental=mr,sp=sp,available_dates=cki_date)
# 	pp.save()

# def electronics(request,rs,cid,sid,pt,pd,p,pickup,pickuplat,pickuplng,pincode,iow,tc,t,sd,dr,wr,mr,sp,cki_date):
# 	request.encoding = 'koi8-r'
# 	pp=models.ElectronicsProduct.objects.create(owner_id=request.session['userid'],rsf=rs,cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,buyingprice=p,pickup=pickup,pickup_lat=pickuplat,pickup_long=pickuplng,pincode=pincode,in_out_Of_warranty=iow,explicit_terms_conditions=tc,renting_tenure_option=t,security_deposits=sd,daily_rental=dr,weekly_rental=wr,monthly_rental=mr,sp=sp,available_dates=cki_date)
# 	pp.save()

# def home(request,rs,cid,sid,pt,pd,p,pickup,pickuplat,pickuplng,pincode,iow,tc,t,sd,dr,wr,mr,sp,cki_date):
# 	request.encoding = 'koi8-r'
# 	pp=models.HomeProduct.objects.create(owner_id=request.session['userid'],rsf=rs,cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,buyingprice=p,pickup=pickup,pickup_lat=pickuplat,pickup_long=pickuplng,pincode=pincode,in_out_Of_warranty=iow,explicit_terms_conditions=tc,renting_tenure_option=t,security_deposits=sd,daily_rental=dr,weekly_rental=wr,monthly_rental=mr,sp=sp,available_dates=cki_date)
# 	pp.save()

# def misc(request,rs,cid,sid,pt,pd,p,pickup,pickuplat,pickuplng,pincode,iow,tc,t,sd,dr,wr,mr,sp,cki_date):
# 	request.encoding = 'koi8-r'
# 	pp=models.MiscProduct.objects.create(owner_id=request.session['userid'],rsf=rs,cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,buyingprice=p,pickup=pickup,pickup_lat=pickuplat,pickup_long=pickuplng,pincode=pincode,in_out_Of_warranty=iow,explicit_terms_conditions=tc,renting_tenure_option=t,security_deposits=sd,daily_rental=dr,weekly_rental=wr,monthly_rental=mr,sp=sp,available_dates=cki_date)
# 	pp.save()

# def party(request,rs,cid,sid,pt,pd,p,pickup,pickuplat,pickuplng,pincode,iow,tc,t,sd,dr,wr,mr,sp,cki_date):
# 	request.encoding = 'koi8-r'
# 	pp=models.PartyProduct.objects.create(owner_id=request.session['userid'],rsf=rs,cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,buyingprice=p,pickup=pickup,pickup_lat=pickuplat,pickup_long=pickuplng,pincode=pincode,in_out_Of_warranty=iow,explicit_terms_conditions=tc,renting_tenure_option=t,security_deposits=sd,daily_rental=dr,weekly_rental=wr,monthly_rental=mr,sp=sp,available_dates=cki_date)
# 	pp.save()

# def dress(request,rs,cid,sid,pt,pd,p,pickup,pickuplat,pickuplng,pincode,iow,tc,t,sd,dr,wr,mr,sp,cki_date):
# 	request.encoding = 'koi8-r'
# 	pp=models.DressProduct.objects.create(owner_id=request.session['userid'],rsf=rs,cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,buyingprice=p,pickup=pickup,pickup_lat=pickuplat,pickup_long=pickuplng,pincode=pincode,in_out_Of_warranty=iow,explicit_terms_conditions=tc,renting_tenure_option=t,security_deposits=sd,daily_rental=dr,weekly_rental=wr,monthly_rental=mr,sp=sp,available_dates=cki_date,mwk=1,size='m')
# 	pp.save()

# def tools(request,rs,cid,sid,pt,pd,p,pickup,pickuplat,pickuplng,pincode,iow,tc,t,sd,dr,wr,mr,sp,cki_date):
# 	request.encoding = 'koi8-r'
# 	pp=models.ToolsProduct.objects.create(owner_id=request.session['userid'],rsf=rs,cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,buyingprice=p,pickup=pickup,pickup_lat=pickuplat,pickup_long=pickuplng,pincode=pincode,in_out_Of_warranty=iow,explicit_terms_conditions=tc,renting_tenure_option=t,security_deposits=sd,daily_rental=dr,weekly_rental=wr,monthly_rental=mr,sp=sp,available_dates=cki_date)
# 	pp.save()

# def vacationhome(request,rs,cid,sid,pt,pd,p,pickup,pickuplat,pickuplng,pincode,iow,tc,t,sd,dr,wr,mr,sp,cki_date):
# 	request.encoding = 'koi8-r'
# 	pp=models.VacationhomeProduct.objects.create(owner_id=request.session['userid'],rsf=rs,cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,buyingprice=p,pickup=pickup,pickup_lat=pickuplat,pickup_long=pickuplng,pincode=pincode,in_out_Of_warranty=iow,explicit_terms_conditions=tc,renting_tenure_option=t,security_deposits=sd,daily_rental=dr,weekly_rental=wr,monthly_rental=mr,sp=sp,available_dates=cki_date)
# 	pp.save()

# def vehicle(request,rs,cid,sid,pt,pd,p,pickup,pickuplat,pickuplng,pincode,iow,tc,t,sd,dr,wr,mr,sp,cki_date):
# 	mmy = request.POST['manmonyear']
# 	mileage = request.POST['mileage']
# 	request.encoding = 'koi8-r'
# 	pp=models.VehicleProduct.objects.create(owner_id=request.session['userid'],rsf=rs,cat_id=cid.cat_id_id,subcat_id=sid,product_title=pt,product_details=pd,buyingprice=p,pickup=pickup,pickup_lat=pickuplat,pickup_long=pickuplng,pincode=pincode,in_out_Of_warranty=iow,explicit_terms_conditions=tc,renting_tenure_option=t,security_deposits=sd,daily_rental=dr,weekly_rental=wr,monthly_rental=mr,sp=sp,available_dates=cki_date,man_mon_year=mmy,mileage=mileage)
# 	pp.save()


