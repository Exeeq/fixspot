from django.urls import path, include
from .views import *

urlpatterns = [
    path('', index, name="index"),
    path('administrar_reservas', administrar_reservas, name="administrar_reservas"),
    path('administrar_talleres', administrar_talleres, name="administrar_talleres"),
    path('agendar_hora', agendar_hora, name="agendar_hora"),
    path('agendar', agendar, name="agendar"),
    path('contactanos', contactanos, name="contactanos"),
    path('login', login, name="login"),
    path('mapa', mapa, name="mapa"),
    path('mis_reservas', mis_reservas, name="mis_reservas"),
    path('mis_vehiculos', mis_vehiculos, name="mis_vehiculos"),
    path('realizar_ticket', realizar_ticket, name="realizar_ticket"),
    path('register_taller', register_taller, name="register_taller"),
    path('register_vehiculo', register_vehiculo, name="register_vehiculo"),
    path('register', register, name="register"),
    path('sobre_nosotros', sobre_nosotros, name="sobre_nosotros"),
    path('talleres', talleres, name="talleres"),
    path('tickets', tickets, name="tickets"),
    path('test', get_coordinates, name="test"),
]