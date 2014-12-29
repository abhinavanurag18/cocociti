from django.shortcuts import render
from django.http import HttpResponse , HttpResponseRedirect
from django.template import RequestContext
from django.shortcuts import render_to_response,render,redirect
from landingpage.models import Category, Sub_Category, Subscribe
from checkout.models import scart,rcart
import json as simplejson
from django.core import serializers

# Create your views here.
def index(request):
	catlist = Category.objects.all()
	subcatlist = Sub_Category.objects.all()
	if 'userid' not in request.session:
		request.session['cartlength'] = 0
	else :
		request.session['cartlength'] = cartlength(request.session['userid'])

	return render(request,'landingpage/index.html',{ 'pagehead':'Home','catlist':catlist,'subcatlist':subcatlist })

def cartlength(uid):
	
	sc = scart.objects.filter(cart_customer_id = uid)
	rc = rcart.objects.filter(cart_customer_id = uid)
	return len(sc)+len(rc)

def subscribe(request):
	email = request.POST["email"]
	sb = Subscribe.objects.filter(email=email)
	if len(sb) == 0:
		s = Subscribe.objects.create(email=email)
		s.save()
		
	return redirect("/")