# Generated by Django 3.1.2 on 2024-06-28 18:54

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_auto_20240618_1030'),
    ]

    operations = [
        migrations.CreateModel(
            name='EstadoTicket',
            fields=[
                ('idEstado', models.AutoField(primary_key=True, serialize=False)),
                ('NombreEstado', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Ticket',
            fields=[
                ('idTicket', models.AutoField(primary_key=True, serialize=False)),
                ('asunto', models.TextField()),
                ('EstadoTicket', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.estadoticket')),
                ('solicitante', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]