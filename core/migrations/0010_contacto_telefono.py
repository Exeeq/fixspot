# Generated by Django 5.0.6 on 2024-07-07 00:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0009_contacto'),
    ]

    operations = [
        migrations.AddField(
            model_name='contacto',
            name='telefono',
            field=models.CharField(default=1, max_length=15),
            preserve_default=False,
        ),
    ]
