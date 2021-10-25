from django.shortcuts import render,get_object_or_404
from django.utils import timezone

from cukysapp.models import *
from django.shortcuts import redirect


def index_list(request):
    #posts=Post.objects.filter(slug="ez")
    # posts = Post.objects.all()
   # return render(request,'../templates/blog/post_list.html',{'posts':posts})
    return render(request, 'cukys/index.html')


def aboutgu_list(request):
    return render(request, 'cukys/about.html')


def kontaktua_list(request):
    return render(request, 'cukys/contact.html')


def menu_list(request):
    return render(request, 'cukys/menu.html/index.html')

def login_list(request):
    return render(request, 'cukys/login.html')

def register_list(request):
    return render(request, 'cukys/register.html')
