from django.shortcuts import render
from django.http import HttpResponse , HttpResponseRedirect
from django.template import RequestContext
from django.shortcuts import render_to_response,render,redirect
import json as simplejson
from django.core import serializers
from listingform.models import GenProduct
from login.models import fbuser,justuser
from landingpage.models import Category,Sub_Category
# Create your views here.

def index(request,ownerid,productid,slug):
	catlist = Category.objects.all()
	subcatlist = Sub_Category.objects.all()
	p = GenProduct.objects.get(id=productid)
	ownerid = p.owner_id
	o = fbuser.objects.get(userid=ownerid)
	# fo = follower.objects.filter(userid=ownerid)
	# nofol = len(fo)
	# fols = follower.objects.filter(followerid=request.session['userid'])
	# follow = {}

	# if len(fols) == 0:
		# follow['follows']=0
	# else:
		# follow['follows']=1
	return render(request,'productpage/index.html',{'product':p,'owner':o,'pagehead':'Product Page','catlist':catlist,'subcatlist':subcatlist})
	
