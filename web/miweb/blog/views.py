from django.shortcuts import render,get_object_or_404
from django.utils import timezone

from .models import Post
from .forms import PostForm
from django.shortcuts import redirect


def post_list(request):
    #posts=Post.objects.filter(slug="ez")
    posts = Post.objects.all()
    return render(request,'../templates/blog/post_list.html',{'posts':posts})

def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post=form.save(commit=False)
            post.author=request.user
            post.published_date = timezone.now()
            post.save()
            #return redirect(blog_post_detail,pk=post.pk)
        else:
            form=PostForm()

    return render(request, 'blog/post_edit.html',{'form':form})