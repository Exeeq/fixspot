# Generated by Django 5.0.6 on 2024-06-10 21:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0010_taller_latitud_taller_longitud'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuariocustom',
            name='correo',
            field=models.EmailField(default=1, max_length=254),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='usuariocustom',
            name='email',
            field=models.EmailField(blank=True, max_length=254, verbose_name='email address'),
        ),
    ]
