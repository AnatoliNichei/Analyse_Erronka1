from django.shortcuts import render, get_object_or_404, redirect
from cukysapp.models import *
from .forms import FormRegisterForm
from cukysapp import funtzioak
from pathlib import Path
from django.http import HttpResponse


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
        p = Path.home()
        if p.exists():
            p = p / '.cukys_messages.log'
            if p.exists():
                mode = 'a'
            else:
                mode = 'a+'
            with p.open(mode) as f:
                f.write(f'Message from {request.POST["izena"]}\n'
                        f'email: {request.POST["emaila"]}\n'
                        'mezua:\n'
                        f'{request.POST["mezua"]}\n\n')
    except:
        p = Path('/var/www/messages')
        if p.exists():
            p = p / 'cukys_messages.log'
            if p.exists():
                mode = 'a'
            else:
                mode = 'a+'
            with p.open(mode) as f:
                f.write(f'Message from {request.POST["izena"]}\n'
                        f'email: {request.POST["emaila"]}\n'
                        'mezua:\n'
                        f'{request.POST["mezua"]}\n\n')
        else:
            return HttpResponse(status=500)
    return HttpResponse(status=204)
