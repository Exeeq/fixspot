# Generated by Django 5.0.6 on 2024-07-05 19:14

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0007_ticket_respuestaticket'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='ticket',
            name='respuestaTicket',
        ),
    ]
