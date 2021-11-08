from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^$', views.index_list, name="Index"),
    url('about/', views.aboutgu_list),
    url('contact/', views.kontaktua_list),
#    url('login/', views.login_list),
    url('register/', views.register_list),
    url('menu/', views.menu_list, name="Filter"),
    url('redo-distances/', views.update_product_similarities, name="simils"),
]
