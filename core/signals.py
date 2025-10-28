from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import *

@receiver(post_save, sender=UsuarioCustom)
def crear_preferencias_si_no_existen(sender, instance, created, **kwargs):
    if created:
        PreferenciasUsuario.objects.get_or_create(usuario=instance)
