# Generated by Django 3.2.8 on 2021-10-22 07:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cukysapp', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Produktuak',
            new_name='Produktua',
        ),
        migrations.AlterModelOptions(
            name='bezeroa',
            options={'verbose_name_plural': 'Bezeroak'},
        ),
        migrations.AlterModelOptions(
            name='eskaera',
            options={'verbose_name_plural': 'Eskaerak'},
        ),
        migrations.AlterModelOptions(
            name='mota',
            options={'verbose_name_plural': 'Motak'},
        ),
        migrations.AlterModelOptions(
            name='produktua',
            options={'verbose_name_plural': 'Produktuak'},
        ),
        migrations.AlterModelOptions(
            name='saskia',
            options={'verbose_name_plural': 'Saskiak'},
        ),
        migrations.AlterField(
            model_name='bezeroa',
            name='telefonoa',
            field=models.IntegerField(),
        ),
    ]