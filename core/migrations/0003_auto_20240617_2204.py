# Generated by Django 3.1.2 on 2024-06-18 02:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_auto_20240617_1849'),
    ]

    operations = [
        migrations.AlterField(
            model_name='taller',
            name='imagen',
            field=models.ImageField(default=1, upload_to='taller_imagenes/'),
            preserve_default=False,
        ),
    ]
