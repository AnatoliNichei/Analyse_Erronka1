from django import forms
from django.contrib.auth.models import User
from .models import Bezeroa
from django.core.validators import RegexValidator

class FormRegisterForm(forms.Form):
    erabiltzailea = forms.CharField(max_length=255)
    izena = forms.CharField(max_length=255, validators=[RegexValidator("^([A-Za-z]+[,.]?[ ]?|[A-Za-z]+['-]?)+$")])
    abizena = forms.CharField(max_length=255, validators=[RegexValidator("^([A-Za-z]+[,.]?[ ]?|[A-Za-z]+['-]?)+$")])
    helbidea = forms.CharField(max_length=255)
    telefonoa = forms.IntegerField()
    nan = forms.CharField(max_length=9)
    pasahitza = forms.CharField(max_length=255)
    emaila = forms.EmailField()

    def save(self):
        user = User.objects.create_user(self.data['erabiltzailea'], self.data['emaila'], self.data['pasahitza'])
        erabiltzailea = Bezeroa(erabiltzailea=user, izena=self.data['izena'], abizena=self.data['abizena'], helbidea=self.data['helbidea'],
                                telefonoa=self.data['telefonoa'], nan=self.data['nan'])
        user.save()
        erabiltzailea.save()
