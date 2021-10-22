from django.shortcuts import render,get_object_or_404
from django.utils import timezone

from cukysapp.models import *
from django.shortcuts import redirect


def post_list(request):
    #posts=Post.objects.filter(slug="ez")
    # posts = Post.objects.all()
   # return render(request,'../templates/blog/post_list.html',{'posts':posts})
    return render(request, 'cukys/index.html')