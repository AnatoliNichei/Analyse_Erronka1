from django.shortcuts import render, get_object_or_404, redirect
from cukysapp.models import *
from .forms import FormRegisterForm
from django.core.mail import send_mail


def index_list(request):
    user = request.user if request.user.is_authenticated else None
    return render(request, 'cukys/index.html', {"user": user})


def aboutgu_list(request):
    user = request.user if request.user.is_authenticated else None
    return render(request, 'cukys/about.html', {"user": user})


def kontaktua_list(request):
    user = request.user if request.user.is_authenticated else None
    return render(request, 'cukys/contact.html', {"user": user})


def menu_list_parametro(request, motaid=None):
    user = request.user if request.user.is_authenticated else None
    if motaid is None:
        products = Produktua.objects.all()
        return render(request, 'cukys/menu.html/index.html', {"user": user, 'products': products})
    else:
        products = Produktua.objects.filter(mota=motaid)
        return render(request,'cukys/menu.html/index.html', {"user": user, 'products': products})


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
        return redirect(index_list)

    context = {'form': form}

    return render(request, 'cukys/register.html', context)


def update_product_similarities():
    """ TO DO """
    pass
