from django.conf.urls import  include,url
from . import views

urlpatterns = [
    url(r'^get-data/(?P<formato>xml|json)/$', views.get_table, name="get_table"),

]
