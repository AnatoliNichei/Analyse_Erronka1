from django.db import models
from django.contrib.auth.models import User

# Create your models here.


class Bezeroa (models.Model):
    erabiltzailea = models.OneToOneField(User, on_delete=models.CASCADE)
    #erabiltzailea = models.CharField(max_length=255)
    izena = models.CharField(max_length=255)
    abizena = models.CharField(max_length=255)
    helbidea = models.CharField(max_length=255)
    telefonoa = models.IntegerField()
    nan = models.CharField(max_length=9)
    #pasahitza = models.CharField(max_length=255)
    #emaila = models.EmailField()
    antzeko = models.ManyToManyField(
            'self',
            related_name="is_antzeko_to",
            symmetrical=False,
            blank=True
    )

    def __str__(self):
        return self.izena

    class Meta:
        verbose_name_plural = "Bezeroak"


class Saskia (models.Model):
    eskaera_data = models.DateTimeField()
    entrega_data = models.DateTimeField()
    erabiltzailea = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.saski_kodea

    class Meta:
        verbose_name_plural = "Saskiak"


class Mota (models.Model):
    mota_kodea = models.IntegerField()
    izena = models.CharField(max_length=255)

    def __str__(self):
        return self.izena

    class Meta:
        verbose_name_plural = "Motak"


class Produktua (models.Model):
    produktu_kodea = models.CharField(max_length=255)
    izena = models.CharField(max_length=255)
    prezioa = models.FloatField()
    irudia = models.CharField(max_length=255)
    iruzkina = models.CharField(max_length=255)
    mota = models.ManyToManyField(Mota)

    def __str__(self):
        return self.izena

    class Meta:
        verbose_name_plural = "Produktuak"


class Eskaera (models.Model):
    produktu_kodea = models.ForeignKey(Produktua, on_delete=models.CASCADE)
    saski_kodea = models.ForeignKey(Saskia, on_delete=models.CASCADE)
    kantitatea = models.IntegerField(default=0)

    def __str__(self):
        return self.produktu_kodea

    class Meta:
        verbose_name_plural = "Eskaerak"


class Puntuazioa(models.Model):
    produktu_kodea = models.ForeignKey(Produktua, on_delete=models.CASCADE)
    erabiltzailea = models.ForeignKey(User, on_delete=models.CASCADE)
    puntuazioa = [(x, x) for x in range(6)]

    class Meta:
        verbose_name_plural = "Puntuazioak"
