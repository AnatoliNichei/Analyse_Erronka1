from django.db import models
from django.contrib.auth.models import User

# Create your models here.


class Bezeroa (models.Model):
    erabiltzailea = models.CharField(max_length=255)
    izena = models.CharField(max_length=255)
    abizena = models.CharField(max_length=255)
    helbidea = models.CharField(max_length=255)
    telefonoa = models.IntegerField()
    nan = models.CharField(max_length=9)
    pasahitza = models.CharField(max_length=255)
    emaila = models.EmailField

    class Meta:
        verbose_name_plural = "Bezeroak"


class Saskia (models.Model):
    saski_kodea = models.CharField(max_length=255)
    eskaera_data = models.DateTimeField
    entrega_data = models.DateTimeField()
    erabiltzailea = models.ForeignKey(Bezeroa,on_delete=models.CASCADE)

    class Meta:
        verbose_name_plural = "Saskiak"


class Mota (models.Model):
    mota_kodea = models.IntegerField()
    izena = models.CharField(max_length=255)

    class Meta:
        verbose_name_plural = "Motak"


class Produktua (models.Model):
    produktu_kodea = models.CharField(max_length=255)
    izena = models.CharField(max_length=255)
    prezioa = models.FloatField()
    irudia = models.CharField(max_length=255)
    iruzkina = models.CharField(max_length=255)
    mota = models.ManyToManyField(Mota)

    class Meta:
        verbose_name_plural = "Produktuak"

class Eskaera (models.Model):
    produktu_kodea = models.ForeignKey(Produktua,on_delete=models.CASCADE)
    saski_kodea = models.ForeignKey(Saskia,on_delete=models.CASCADE)
    kantitatea = models.IntegerField

    class Meta:
        verbose_name_plural = "Eskaerak"



