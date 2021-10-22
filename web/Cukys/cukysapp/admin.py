from django.contrib import admin
from .models import *
# Register your models here.
myModels = [Bezeroa, Saskia, Mota, Produktua, Eskaera]
admin.site.register(myModels)
