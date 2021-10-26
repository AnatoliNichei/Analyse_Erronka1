from django.shortcuts import render
from . import models
from django.http import JsonResponse, Http404

# Create your views here.


def get_table(request, formato):
    motak = models.Mota.objects.all()
    produktuak = models.Produktua.objects.all()
    d = {'produktuak': {}, 'motak': {}}
    for produktua in produktuak:
        d['produktuak'][produktua.produktu_kodea] = {
            'izena': produktua.izena,
            'iruzkina': produktua.iruzkina,
            'irudia': produktua.irudia,
            'prezioa': produktua.prezioa,
            'motak': list(
                produktua.mota.all().values_list('mota_kodea', flat=True)
            ),
        }
    for mota in motak:
        d['motak'][mota.mota_kodea] = {
            'izena': mota.izena,
            'produktuak': list(mota.produktua_set.all().values_list(
                    'produktu_kodea',
                    flat=True
            )),
        }
    if formato == 'json':
        return JsonResponse(d)
    elif formato == 'xml':
        return render(request, 'datuak.xml', {'data': d},
                    content_type='text/xml')
    else:
        raise Http404
