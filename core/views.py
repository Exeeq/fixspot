from django.shortcuts import render, redirect, get_object_or_404
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
    talleres = Taller.objects.all()
    return render(request, 'core/administrar_talleres.html', {'talleres': talleres})

def crear_taller(request):
    
    if request.method == 'POST':
        form = TallerForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()  # Guardar el formulario directamente
            return redirect('administrar_talleres')
    else:
        form = TallerForm()
    return render(request, 'core/crear_taller.html', {'form': form})

def modificar_taller(request, id_taller):
    taller = get_object_or_404(Taller, idTaller=id_taller)
    if request.method == 'POST':
        form = TallerForm(request.POST, request.FILES, instance=taller)
        if form.is_valid():
            form.save()  # Guardar el formulario directamente
            return redirect('administrar_talleres')
    else:
        form = TallerForm(instance=taller)
    return render(request, 'core/modificar_taller.html', {'form': form})

def eliminar_taller(request, id_taller):
    taller = get_object_or_404(Taller, idTaller=id_taller)
    taller.delete()
    return redirect('administrar_talleres')

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
    agendas = Agenda.objects.filter(cliente=request.user)
    return render(request, 'core/mis_reservas.html', {'agendas': agendas})

def mis_vehiculos(request):
    vehiculos = Vehiculo.objects.filter(idUsuario=request.user)
    return render(request, 'core/mis_vehiculos.html', {'vehiculos': vehiculos})

def realizar_ticket(request):
	return render(request, 'core/realizar_ticket.html')

def solicitar_taller(request):
	return render(request, 'core/solicitar_taller.html')

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
    talleres = Taller.objects.all()
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

def agendar_hora(request, id_taller):
    taller = get_object_or_404(Taller, idTaller=id_taller)

    if request.method == 'POST':
        form = AgendaForm(request.POST, user=request.user, taller=taller)
        if form.is_valid():
            agenda = form.save(commit=False)
            agenda.idTaller = taller
            agenda.cliente = request.user
            agenda.save()
            return redirect('mis_reservas')
    else:
        form = AgendaForm(user=request.user, taller=taller)

    return render(request, 'core/agendar_hora.html', {'form': form, 'taller': taller})

def annadir_vehiculo(request):
    form = VehiculoForm()  

    if request.method == 'POST':
        form = VehiculoForm(request.POST)  

        if form.is_valid():
            vehiculo = form.save(commit=False)
            vehiculo.idUsuario = request.user  
            vehiculo.save()

            return redirect('mis_vehiculos')

    return render(request, 'core/annadir_vehiculo.html', {'form': form})

def modificar_vehiculo(request, vehiculo_id):
    # Obtener el vehículo a modificar
    vehiculo = Vehiculo.objects.get(idVehiculo=vehiculo_id)

    if request.method == 'POST':
        # Si el formulario se envió con datos, procesarlos
        form = VehiculoForm(request.POST, instance=vehiculo)
        if form.is_valid():
            form.save()  # Guardar los cambios en el vehículo
            return redirect('mis_vehiculos')  # Redirigir a la página de mis vehículos
    else:
        # Si es una solicitud GET, prellenar el formulario con los datos del vehículo
        form = VehiculoForm(instance=vehiculo)

    return render(request, 'core/modificar_vehiculo.html', {'form': form})

def eliminar_vehiculo(request, vehiculo_id):
    vehiculo = Vehiculo.objects.get(idVehiculo = vehiculo_id)
    vehiculo.delete()
    return redirect('mis_vehiculos')
   

def administrar_usuarios(request):
    usuarios = UsuarioCustom.objects.all()
    return render(request, 'core/administrar_usuarios.html', {'usuarios': usuarios})

def modificar_usuario(request, id):
    usuario = get_object_or_404(UsuarioCustom, id=id)
    if request.method == 'POST':
        form = UsuarioCustomForm(request.POST, instance=usuario)
        if form.is_valid():
            form.save()
            return redirect('administrar_usuarios')
    else:
        form = UsuarioCustomForm(instance=usuario)
    return render(request, 'core/modificar_usuario.html', {'form': form})

def eliminar_usuario(request, id):
    usuario = UsuarioCustom.objects.get(id = id)
    if request.method == 'POST':
        usuario.delete()
        return redirect('administrar_usuarios')
    
def crear_usuario(request):
    if request.method == 'POST':
        form = UsuarioCustomCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('administrar_usuarios')
    else:
        form = UsuarioCustomCreationForm()
    return render(request, 'core/crear_usuario.html', {'form': form})

def administrar_mi_taller(request):
    taller_del_usuario = Taller.objects.filter(idUsuario=request.user).first()

    return render(request, 'core/administrar_mi_taller.html', {'taller': taller_del_usuario})

def reservas_taller(request, idTaller):
    taller = Taller.objects.get(pk=idTaller)
    reservas = Agenda.objects.filter(idTaller=taller)
    data = {
        'taller': taller,
        'reservas': reservas
    }
    return render(request, 'core/reservas_taller.html', data)

