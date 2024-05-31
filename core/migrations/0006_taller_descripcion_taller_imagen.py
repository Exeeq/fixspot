# Generated by Django 5.0.6 on 2024-05-31 01:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0005_alter_usuariocustom_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='taller',
            name='descripcion',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='taller',
            name='imagen',
            field=models.ImageField(blank=True, null=True, upload_to='taller_imagenes/'),
        ),
    ]