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
from django.conf import settings

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
        form = TallerForm(request.POST, request.FILES)
        if form.is_valid():
            nombreTaller = form.cleaned_data['nombreTaller']
            descripcion = form.cleaned_data['descripcion']
            direccion = form.cleaned_data['direccion']
            telefono = form.cleaned_data['telefono']
            idComuna = form.cleaned_data['comuna']
            idUsuario = form.cleaned_data['encargadoTaller']
            imagen = form.cleaned_data['imagen']

            data = {
                'nombreTaller': nombreTaller,
                'descripcion': descripcion,
                'direccion': direccion,
                'telefono': telefono,
                'idComuna': idComuna,
                'idUsuario': idUsuario,
            }

            files = {}
            if imagen:
                files['imagen'] = imagen

            response = requests.post('http://localhost:8000/api/talleres/', data=data, files=files)
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
            form = TallerForm(request.POST, request.FILES)
            if form.is_valid():
                taller_data.update({
                    'nombreTaller': form.cleaned_data['nombreTaller'],
                    'descripcion': form.cleaned_data['descripcion'],
                    'direccion': form.cleaned_data['direccion'],
                    'telefono': form.cleaned_data['telefono'],
                    'idComuna': form.cleaned_data['comuna'],
                    'idUsuario': form.cleaned_data['encargadoTaller'],
                })

                files = {}
                if form.cleaned_data['imagen']:
                    files['imagen'] = form.cleaned_data['imagen']

                response = requests.put(f'http://localhost:8000/api/talleres/{id_taller}/', data=taller_data, files=files)
                if response.status_code == 200:
                    return redirect('administrar_talleres')
                else:
                    return HttpResponse("Error al actualizar el taller", status=response.status_code)
        else:
            form = TallerForm(initial={
                'nombreTaller': taller_data.get('nombreTaller', ''),
                'descripcion': taller_data.get('descripcion', ''),
                'direccion': taller_data.get('direccion', ''),
                'telefono': taller_data.get('telefono', ''),
                'comuna': taller_data.get('idComuna', ''),
                'encargadoTaller': taller_data.get('idUsuario', ''),
            })
            form.fields['imagen'].widget.attrs['data-initial-preview'] = [taller_data.get('imagen')]
            form.fields['imagen'].widget.attrs['data-initial-caption'] = [taller_data.get('nombreTaller')]
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
    def get_user_details(user_id):
        response = requests.get(f'http://localhost:8000/api/usuarios/{user_id}/')
        if response.status_code == 200:
            usuario = response.json()
            return f"{usuario['pnombre']} {usuario['ap_paterno']}"
        return "No disponible"
    
    def get_comuna_details(comuna_id):
        response = requests.get(f'http://localhost:8000/api/comunas/{comuna_id}/')
        if response.status_code == 200:
            comuna = response.json()
            return comuna['nombreComuna']  
        return "No disponible"

    response = requests.get('http://localhost:8000/api/talleres/')
    
    if response.status_code == 200:
        talleres = response.json() 
        for taller in talleres:
            taller['encargado'] = get_user_details(taller['idUsuario'])
            taller['comuna'] = get_comuna_details(taller['idComuna'])
    else:
        talleres = []  
    
    return render(request, 'core/talleres.html', {'talleres': talleres})

def tickets(request):
	return render(request, 'core/tickets.html')


# views.py
from django.shortcuts import render
from .forms import AddressForm
import requests

def get_coordinates(request):
    try:
        error_message=""
        success_message=""
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
                    print(data)  # Imprimir la respuesta JSON para depuración
                    if data['results']:
                        location = data['results'][0]['geometry']
                        address_details = data['results'][0]['components']

                        # Verificar si la dirección está en la Región Metropolitana
                        if 'state' in address_details and address_details['state'] == 'Santiago Metropolitan Region':
                            coordinates = {
                                'lat': location['lat'],
                                'lng': location['lng']
                            }
                            success_message = "La dirección seleccionada es válida"
                            return render(request, 'core/test.html', {'form': form, 'coordinates': coordinates, 'success_message':success_message})
                        else:
                            error_message = "La dirección seleccionada no está en la Región Metropolitana."
                            return render(request, 'core/test.html', {'form': form, 'error_message': error_message})
    except Exception as e:
        print(e)
    
    form = AddressForm()
    return render(request, 'core/test.html', {'form': form})



def autocomplete_address(request):
    if 'term' in request.GET:
        search_term = request.GET.get('term')
        url = 'https://nominatim.openstreetmap.org/search'
        params = {
            'q': search_term,
            'format': 'json',
            'addressdetails': 1,
            'limit': 5,
        }
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'
        }
        try:
            response = requests.get(url, params=params, headers=headers)
            response.raise_for_status()  # Will raise an HTTPError for bad responses
            suggestions = response.json()
            results = []
            for suggestion in suggestions:
                results.append(suggestion['display_name'])
            return JsonResponse(results, safe=False)
        except requests.RequestException as e:
            print(f"Error during requests to {url}: {str(e)}")
            return JsonResponse([], safe=False)
    return JsonResponse([], safe=False)

def administracion(request):
    return render(request, 'core/administracion.html')




