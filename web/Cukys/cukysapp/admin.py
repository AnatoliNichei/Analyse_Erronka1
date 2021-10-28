from django.contrib import admin
from .models import *
found = True
try:
    from import_export.admin import ImportExportModelAdmin
except ImportError:
    found = False

# Register your models here.
if found:

    class BezeroaAdmin(ImportExportModelAdmin, admin.ModelAdmin):
        ...


    class SaskiaAdmin(ImportExportModelAdmin, admin.ModelAdmin):
        ...


    class MotaAdmin(ImportExportModelAdmin, admin.ModelAdmin):
        ...


    class ProduktuaAdmin(ImportExportModelAdmin, admin.ModelAdmin):
        ...


    class EskaeraAdmin(ImportExportModelAdmin, admin.ModelAdmin):
        ...



    admin.site.register(Bezeroa, BezeroaAdmin)
    admin.site.register(Saskia, SaskiaAdmin)
    admin.site.register(Mota, MotaAdmin)
    admin.site.register(Produktua, ProduktuaAdmin)
    admin.site.register(Eskaera, EskaeraAdmin)

