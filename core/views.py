from django.shortcuts import render, redirect
import requests
from django.shortcuts import render
from .forms import AddressForm
from .models import *
from django.http import JsonResponse
from .forms import *

def index(request):
	return render(request, 'core/index.html')

def administrar_reservas(request):
	return render(request, 'core/administrar_reservas.html')

def administrar_talleres(request):
	return render(request, 'core/administrar_talleres.html')

def agendar_hora(request):
	return render(request, 'core/agendar_hora.html')

def agendar(request):
	return render(request, 'core/agendar.html')

def contactanos(request):
	return render(request, 'core/contactanos.html')

def login(request):
	return render(request, 'core/login.html')

def mapa(request):
	return render(request, 'core/mapa.html')

def mis_reservas(request):
	return render(request, 'core/mis_reservas.html')

def mis_vehiculos(request):
	return render(request, 'core/mis_vehiculos.html')

def realizar_ticket(request):
	return render(request, 'core/realizar_ticket.html')

def register_taller(request):
	return render(request, 'core/register_taller.html')

def register_vehiculo(request):
	return render(request, 'core/register_vehiculo.html')

def register(request):
    form = RegisterForm()
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)

            user.idRol = rolUsuario.objects.get(nombreRol='Cliente')
            user.idComuna = form.cleaned_data['comuna']
            user.email = user.email
            
            user.save()
            return redirect("index")

    return render(request, 'registration/register.html', {'form': form})

def sobre_nosotros(request):
	return render(request, 'core/sobre_nosotros.html')

def talleres(request):
	return render(request, 'core/talleres.html')

def tickets(request):
	return render(request, 'core/tickets.html')


def get_coordinates(request):
    coordinates = None
    if request.method == 'POST':
        form = AddressForm(request.POST)
        if form.is_valid():
            address = form.cleaned_data['address']
            api_key = 'TU_OPENCAGE_API_KEY'  # Reemplaza con tu API Key
            base_url = 'https://api.opencagedata.com/geocode/v1/json'
            params = {'q': address, 'key': api_key}
            response = requests.get(base_url, params=params)
            if response.status_code == 200:
                data = response.json()
                if data['results']:
                    location = data['results'][0]['geometry']
                    coordinates = {
                        'lat': location['lat'],
                        'lng': location['lng']
                    }
    else:
        form = AddressForm()
    
    return render(request, 'core/te.html', {'form': form, 'coordinates': coordinates})