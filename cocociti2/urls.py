from django.conf.urls import patterns, include, url
from django.contrib import admin

from django.conf import settings
from django.conf.urls.static import static
urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'cocociti2.views.home', name='home'),
    url(r'^$', 'landingpage.views.index'),
    url(r'^subcatselect/(?P<subcatid>\d+)/$', 'searchfilter.views.index'),
    url(r'^subcatselect/(?P<subcatid>\d+)/rent/$', 'searchfilter.views.indexrent'),
    url(r'^subcatselect/(?P<subcatid>\d+)/sale/$', 'searchfilter.views.indexsale'),
    url(r'^checkout/$', 'checkout.views.index'),
    url(r'^checkoutform/$','checkout.views.checkoutform'),
    url(r'^login/$', 'login.views.loginindex'),
    url(r'^login/(?P<ownerid>\d+)/(?P<productid>\d+)/(?P<slug>[-\w\d]+)/$', 'login.views.logintocart'),
    url(r'^register/$', 'login.views.registerindex'),
    url(r'^register/(?P<ownerid>\d+)/(?P<productid>\d+)/(?P<slug>[-\w\d]+)$', 'login.views.registertocart'),
    url(r'^listing/$', 'listingform.views.index'),
    url(r'^listsubcatselect/(?P<catid>\d+)$', 'listingform.views.form'),
    url(r'^login-landing/','login.views.loginland'),
    url(r'^reg-submit/','login.views.register'),
    url(r'^sessionset/','login.views.sessionset'),
    url(r'^logout/','login.views.logout'),
    url(r'^product-listing-submit','listingform.views.product_listing_submit'),
    url(r'^product-page/(?P<ownerid>\d+)/(?P<productid>\d+)/(?P<slug>[-\w\d]+)/$','productpage.views.index'),
    url(r'^add-to-rent-cart/','checkout.views.rentcart'),
    url(r'^add-to-sale-cart/','checkout.views.salecart'),
    url(r'^delete-from-rent-cart','checkout.views.deleteFromRentCart'),
    url(r'^delete-from-sale-cart','checkout.views.deleteFromSaleCart'),
    url(r'^user-admin/(?P<ownerid>\d+)/$','userprofile.views.index'),
    url(r'^edit-user-info-submit/(?P<ownerid>\d+)/$','userprofile.views.edituserinfo'),
    url(r'^manage/(?P<ownerid>\d+)/(?P<productid>\d+)/(?P<slug>[-\w\d]+)/$','userprofile.views.manage'),
    url(r'^product-listing-manage/(?P<pid>\d+)/$','userprofile.views.editproductinfo'),
     url(r'^subscribe/','landingpage.views.subscribe'),
    url(r'^admin/', include(admin.site.urls)),

)+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
