from django.shortcuts import render, redirect
import requests
from django.shortcuts import render
from .forms import AddressForm
from .models import *
from django.http import JsonResponse
from .forms import *
from rest_framework import viewsets
from .serializers import *
from django.http import HttpResponse

#SERIALIZERS (API):
class RolUsuarioViewSet(viewsets.ModelViewSet):
    queryset = rolUsuario.objects.all()
    serializer_class = RolUsuarioSerializer

class RegionViewSet(viewsets.ModelViewSet):
    queryset = Region.objects.all()
    serializer_class = RegionSerializer

class ComunaViewSet(viewsets.ModelViewSet):
    queryset = Comuna.objects.all()
    serializer_class = ComunaSerializer

class UsuarioCustomViewSet(viewsets.ModelViewSet):
    queryset = UsuarioCustom.objects.all()
    serializer_class = UsuarioCustomSerializer

class TallerViewSet(viewsets.ModelViewSet):
    queryset = Taller.objects.all()
    serializer_class = TallerSerializer

class MarcaViewSet(viewsets.ModelViewSet):
    queryset = Marca.objects.all()
    serializer_class = MarcaSerializer

class TipoVehiculoViewSet(viewsets.ModelViewSet):
    queryset = TipoVehiculo.objects.all()
    serializer_class = TipoVehiculoSerializer

class VehiculoViewSet(viewsets.ModelViewSet):
    queryset = Vehiculo.objects.all()
    serializer_class = VehiculoSerializer

class TipoAgendaViewSet(viewsets.ModelViewSet):
    queryset = TipoAgenda.objects.all()
    serializer_class = TipoAgendaSerializer

class AgendaViewSet(viewsets.ModelViewSet):
    queryset = Agenda.objects.all()
    serializer_class = AgendaSerializer

class BoletaViewSet(viewsets.ModelViewSet):
    queryset = Boleta.objects.all()
    serializer_class = BoletaSerializer

class DetalleBoletaViewSet(viewsets.ModelViewSet):
    queryset = DetalleBoleta.objects.all()
    serializer_class = DetalleBoletaSerializer

def index(request):
	return render(request, 'core/index.html')

def administrar_reservas(request):
	return render(request, 'core/administrar_reservas.html')

def administrar_talleres(request):
    # Obtener los talleres desde la API
    response = requests.get('http://localhost:8000/api/talleres/')
    talleres = response.json()

    # Obtener los detalles de cada encargado del taller y cada comuna
    for taller in talleres:
        # Obtener el nombre del encargado del taller
        id_encargado = taller['idUsuario']
        response_usuario = requests.get(f'http://localhost:8000/api/usuarios/{id_encargado}/')
        if response_usuario.status_code == 200:
            encargado_data = response_usuario.json()
            taller['encargadoTaller'] = f"{encargado_data['pnombre']} {encargado_data['ap_paterno']}"
        else:
            taller['encargadoTaller'] = "Desconocido"

        # Obtener el nombre de la comuna
        id_comuna = taller['idComuna']
        response_comuna = requests.get(f'http://localhost:8000/api/comunas/{id_comuna}/')
        if response_comuna.status_code == 200:
            comuna_data = response_comuna.json()
            taller['comuna'] = comuna_data['nombreComuna']
        else:
            taller['comuna'] = "Desconocida"

    return render(request, 'core/administrar_talleres.html', {'talleres': talleres})

def crear_taller(request):
    if request.method == 'POST':
        form = TallerForm(request.POST)
        if form.is_valid():
            nombreTaller = form.cleaned_data['nombreTaller']
            direccion = form.cleaned_data['direccion']
            telefono = form.cleaned_data['telefono']
            idComuna = form.cleaned_data['comuna']
            idUsuario = form.cleaned_data['encargadoTaller']

            data = {
                'nombreTaller': nombreTaller,
                'direccion': direccion,
                'telefono': telefono,
                'idComuna': idComuna,
                'idUsuario': idUsuario,
            }
            
            response = requests.post('http://localhost:8000/api/talleres/', json=data)
            if response.status_code == 201:  
                return redirect('administrar_talleres')  
            else:
                form.add_error(None, 'Hubo un error al crear el taller. Inténtalo nuevamente.')
    else:
        form = TallerForm()

    return render(request, 'core/crear_taller.html', {'form': form})

def modificar_taller(request, id_taller):
    response = requests.get(f'http://localhost:8000/api/talleres/{id_taller}/')
    if response.status_code == 200:
        taller_data = response.json()
        if request.method == 'POST':
            form = TallerForm(request.POST)
            if form.is_valid():
                # Actualizar los datos del taller con los datos del formulario
                taller_data.update({
                    'nombreTaller': form.cleaned_data['nombreTaller'],
                    'direccion': form.cleaned_data['direccion'],
                    'telefono': form.cleaned_data['telefono'],
                    'idComuna': form.cleaned_data['comuna'],
                    'idUsuario': form.cleaned_data['encargadoTaller'],
                })

                response = requests.put(f'http://localhost:8000/api/talleres/{id_taller}/', json=taller_data)
                if response.status_code == 200:
                    return redirect('administrar_talleres')
                else:
                    return HttpResponse("Error al actualizar el taller", status=response.status_code)
        else:
            form = TallerForm(initial={
                'nombreTaller': taller_data.get('nombreTaller', ''),
                'direccion': taller_data.get('direccion', ''),
                'telefono': taller_data.get('telefono', ''),
                'comuna': taller_data.get('idComuna', ''),
                'encargadoTaller': taller_data.get('idUsuario', ''),
            })
        return render(request, 'core/modificar_taller.html', {'form': form})
    else:
        return HttpResponse("Taller no encontrado", status=404)

def eliminar_taller(request, id_taller):
    response = requests.delete(f'http://localhost:8000/api/talleres/{id_taller}/')
    if response.status_code == 204:
        return redirect('administrar_talleres')
    else:
        return HttpResponse("Error al eliminar el taller", status=response.status_code)

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
    try:
        if request.method == 'POST':
            form = AddressForm(request.POST)
            if form.is_valid():
                address = form.cleaned_data['address']
                api_key = '855d3348e0ee4298b17b00e020377da5'
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
                        return render(request, 'core/test.html', {'form': form, 'coordinates': coordinates})
    except Exception as e:
        print(e)
    
    form = AddressForm()
    return render(request, 'core/test.html', {'form': form})

def administracion(request):
    return render(request, 'core/administracion.html')




