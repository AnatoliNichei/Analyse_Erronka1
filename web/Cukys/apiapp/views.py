from django.shortcuts import render, get_object_or_404
from .models import *

# Create your views here.


def get_table(request, formato):
    bezeroak = Bezeroa.objects.all()
    motak = Mota.objects.all()
    produktuak = Produktua.objects.all()
    d = {'bezeroak':[], 'produktuak':[], 'motak':[]}
    for bezero in bezeroak:
        bezero = {Bezeroa.erabiltzailea: }
    if formato == 'json':
        return JsonResponse(d)
    elif formato == 'xml':
        return render(request, 'templates/datuak.xml', {'data': d})
    else:


