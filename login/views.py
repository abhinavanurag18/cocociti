from django.shortcuts import render
from django.http import HttpResponse , HttpResponseRedirect
from django.template import RequestContext
from django.shortcuts import render_to_response,render,redirect
import json as simplejson
from django.core import serializers
from login.models import justuser,fbuser
from landingpage.models import Category,Sub_Category
from listingform.models import GenProduct
import urllib2
from urlparse import urlparse
from django.core.files import File
from django.contrib.auth.views import logout as original_logout

# Create your views here.


def loginindex(request):
	return render(request,'login/login.html',{ 'pagehead':'Home', })

def logintocart(request,ownerid,productid,slug):
	return render(request,'login/login.html',{ 'ownerid':ownerid,'productid':productid,'slug':slug, })

def registerindex(request):
	return render(request,'login/register.html',{ 'pagehead':'Home', })

def registertocart(request,ownerid,productid,slug):
	return render(request,'login/register.html',{ 'pagehead':'Home','ownerid':ownerid,'productid':productid,'slug':slug, })

def loginland(request):
	userid = request.POST['userid']
	username = request.POST['username']
	request.session['userid']=userid
	request.session['username'] = username

	if justuser.objects.filter(userid=userid):
		registered = 1
		# return render(request,'listingforms/index.html')
	else:
		registered = 0
		s=justuser.objects.create(userid=userid,username=username)
		s.save()
		# return render(request,'landing/page_registration1.html')
	return HttpResponse(registered)
	
def register(request):
	ph1 = request.POST['phone1']
	ph2 = request.POST['phone2']
	email = request.POST['email']
	address = request.POST['address']
	ownerid = request.POST['ownerid']
	productid = request.POST['productid']
	slug = request.POST['slug']
	s = fbuser.objects.create(userid=request.session['userid'],username=request.session['username'],aliasname=request.session['username'],email=email,phoneno1=ph1,phoneno2=ph2,address=address)
	s.save()
	if len(productid) > 1 :
		p = GenProduct.objects.get(id=productid)
		ownerid = p.owner_id
		o = fbuser.objects.get(userid=ownerid)
		return render(request,'productpage/index.html',{'product':p,'owner':o,'pagehead':'Product Page',})
	else:
		return redirect("/")

def sessionset(request):
	userid = request.POST['userid']
	username = request.POST['username']
	request.session['userid']=userid
	request.session['username'] = username
	sessionset = 1
	return HttpResponse(sessionset)

def logout(request):
	catlist = Category.objects.all()
	subcatlist = Sub_Category.objects.all()
	# for sesskey in request.session.keys():
		# del request.session[sesskey]
	original_logout(request)
	# request.session['userid'] = ''
	# request.session['username'] = ''
	return redirect("/")