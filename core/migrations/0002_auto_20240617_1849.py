# Generated by Django 3.1.2 on 2024-06-17 22:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='detalleboleta',
            name='idAgenda',
        ),
        migrations.RemoveField(
            model_name='detalleboleta',
            name='nFolio',
        ),
        migrations.AlterField(
            model_name='agenda',
            name='estado',
            field=models.ForeignKey(blank=True, default=1, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.estadoagenda'),
        ),
        migrations.DeleteModel(
            name='Boleta',
        ),
        migrations.DeleteModel(
            name='DetalleBoleta',
        ),
    ]
