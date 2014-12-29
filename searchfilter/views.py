from django.shortcuts import render
from django.shortcuts import render
from django.http import HttpResponse , HttpResponseRedirect
from django.template import RequestContext
from django.shortcuts import render_to_response,render,redirect
from landingpage.models import Category, Sub_Category
from listingform.models import GenProduct
# Create your views here.
def index(request,subcatid):
	catlist = Category.objects.all()
	subcatlist = Sub_Category.objects.all()
	subcatobj = Sub_Category.objects.get(id = subcatid)
	subcat = subcatobj.name
	cat = subcatobj.cat_id.name

	products = GenProduct.objects.filter(subcat_id = subcatid)
	return render(request,'searchfilter/index.html',{ 'pagehead':'Home', 'catlist':catlist,'subcatlist':subcatlist,'products':products,'cat':cat,'subcat':subcat,'subcatid':subcatid })

def indexrent(request,subcatid):
	catlist = Category.objects.all()
	subcatlist = Sub_Category.objects.all()
	subcatobj = Sub_Category.objects.get(id = subcatid)
	subcat = subcatobj.name
	cat = subcatobj.cat_id.name

	products = GenProduct.objects.filter(subcat_id = subcatid,rent = '1')
	return render(request,'searchfilter/index.html',{ 'pagehead':'Home', 'catlist':catlist,'subcatlist':subcatlist,'products':products,'cat':cat,'subcat':subcat,'subcatid':subcatid })

def indexsale(request,subcatid):
	catlist = Category.objects.all()
	subcatlist = Sub_Category.objects.all()
	subcatobj = Sub_Category.objects.get(id = subcatid)
	subcat = subcatobj.name
	cat = subcatobj.cat_id.name

	products = GenProduct.objects.filter(subcat_id = subcatid,sell = '1')
	return render(request,'searchfilter/index.html',{ 'pagehead':'Home', 'catlist':catlist,'subcatlist':subcatlist,'products':products,'cat':cat,'subcat':subcat,'subcatid':subcatid })

