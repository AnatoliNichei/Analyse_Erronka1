from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Bezeroa (models.Model):
    erabiltzailea = models.CharField()
    izena = models.CharField()
    abizena = models.CharField()
    helbidea = models.CharField()
    telefonoa = models.IntegerField(max_length=9)
    nan = models.CharField(max_length=9)
    pasahitza = models.CharField()
    emaila = models.EmailField

class Saskia (models.Model):
    saski_kodea = models.CharField()
    eskaera_data = models.DateTimeField
    entrega_data = models.DateTimeField
    erabiltzailea = models.ForeignKey(Bezeroa,on_delete=models.CASCADE)

class Mota (models.Model):
    mota_kodea = models.IntegerField()
    izena = models.CharField()

class Produktuak (models.Model):
    produktu_kodea = models.CharField()
    izena = models.CharField()
    prezioa = models.FloatField()
    irudia = models.CharField()
    iruzkina = models.CharField()
    mota = models.ManyToManyField(Mota)

class Eskaera (models.Model):
    produktu_kodea = models.ForeignKey(Produktuak,on_delete=models.CASCADE)
    saski_kodea = models.ForeignKey(Saskia,on_delete=models.CASCADE)
    kantitatea = models.IntegerField



