from django.shortcuts import render, get_object_or_404, redirect
from cukysapp.models import *
from .forms import FormRegisterForm
from django.core.mail import send_mail
from cukysapp import funtzioak
from django.http import Http404


def index_list(request):
    user = request.user if request.user.is_authenticated else None
    return render(request, 'cukys/index.html', {"user": user})


def aboutgu_list(request):
    user = request.user if request.user.is_authenticated else None
    return render(request, 'cukys/about.html', {"user": user})


def kontaktua_list(request):
    user = request.user if request.user.is_authenticated else None
    return render(request, 'cukys/contact.html', {"user": user})


def menu_list(request):
    user = request.user if request.user.is_authenticated else None
    products = Produktua.objects.all()
    motak = Mota.objects.all()
    return render(request, 'cukys/menu.html/index.html', {"user": user, 'products': products, 'motak': motak})


def login_list(request):
    return render(request, 'cukys/login.html')


def register_list(request):
    form = FormRegisterForm(request.POST or None)
    if form.is_valid():
        form.save()
        """send_mail(
            'Ongi Etorri',
            '''Eskerrik asko Cukys kontu bat sortzeagatik. Hau bezero berriei
            bidalitako mezua da, esateko gure web orriaren kodigoa hurrengo
            helbidean dagoela: \n
            https://github.com/AnatoliNichei/Analyse_Erronka1 \n
            Geure kodigoa ireki dugu edonork hobekuntzak proposatu eta
            implementatu dezan. \n
            Lagundu nahi badiguzu, etorri zaitez eta hobekuntzak proposatu.
            Onartu ezkero, guk implementatu ditzakegu aldaketak, eta zure
            hatza egongo da gure web orrian!''',
            'noreply@erronka21.com',
            [form.data['emaila']],
            fail_silently=False
        )"""
        return redirect("/login/")

    context = {'form': form}

    return render(request, 'cukys/register.html', context)


def update_rels(request):
    funtzioak.update_product_similarities()
    return redirect(index_list)


def recieve_message(request):
    try:
        send_mail(
            f'Message from {request.POST["izena"]}',
            f'izena: {request.POST["izena"]}\n'
            f'emaila: {request.POST["emaila"]}\n'
            '\n'
            f'{request.POST["mezua"]}',
            'kontaktua@erronka21.com',
            'admin@erronka21.com',
            fail_silently=False,
        )
    except:
        raise Http404
