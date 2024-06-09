from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import *
import requests

class AddressForm(forms.Form):
    address = forms.CharField(label='Enter Address', max_length=255)


#REGISTRAR USUARIO:
class RegisterForm(UserCreationForm):
    username = forms.CharField(label='Nombre de usuario', help_text='Mínimo 6 caracteres')
    run = forms.CharField(label='RUN (Rol Único Nacional)', help_text='Ejemplo: 12345678-9')
    correo = forms.EmailField(label='Correo electrónico', help_text='Ejemplo: ejemplo@gmail.com')
    pnombre = forms.CharField(label='Primer Nombre', help_text='Ejemplo: Fabian')
    ap_paterno = forms.CharField(label='Apellido Paterno', help_text='Ejemplo: Ruiz')
    direccion = forms.CharField(label='Dirección', widget=forms.TextInput(attrs={'placeholder': 'Calle, número'}))
    comuna = forms.ModelChoiceField(queryset=Comuna.objects.all(), label='Comuna')

    class Meta:
        model = UsuarioCustom
        fields = ['username', 'run', 'correo', 'pnombre', 'ap_paterno', 'direccion', 'comuna']

#FORMULARIO TALLER:
class TallerForm(forms.Form):
    nombreTaller = forms.CharField(label='Nombre del taller', help_text='Ejemplo: Taller de Roberto')
    descripcion = forms.CharField(label='Descripción', widget=forms.Textarea(attrs={'rows': 3}))
    direccion = forms.CharField(label='Dirección', widget=forms.TextInput(attrs={'placeholder': 'Calle número'}))
    telefono = forms.CharField(label='Teléfono', widget=forms.TextInput(attrs={'placeholder': '+569 **** ****'}))
    comuna = forms.ChoiceField(label='Comuna', choices=[], initial='', required=True)
    encargadoTaller = forms.ChoiceField(label='Usuario', choices=[], initial='', required=True)
    imagen = forms.ImageField(label='Imagen', required=False)

    def __init__(self, *args, **kwargs):
        super(TallerForm, self).__init__(*args, **kwargs)
        self.fields['comuna'].choices = self.get_comuna_choices()
        self.fields['encargadoTaller'].choices = self.get_encargado_choices()
    
    def get_comuna_choices(self):
        response = requests.get('http://localhost:8000/api/comunas/')
        choices = [('','Seleccione...')]  
        choices += [(comuna['idComuna'], comuna['nombreComuna']) for comuna in response.json()]
        return choices
    
    def get_encargado_choices(self):
        response = requests.get('http://localhost:8000/api/usuarios/')
        choices = [('','Seleccione...')]  
        choices += [(usuario['id'], usuario['pnombre']) for usuario in response.json()]
        return choices
    
class AgendaForm(forms.ModelForm):
    class Meta:
        model = Agenda
        fields = ['fechaAtencion', 'horaAtencion', 'idTipoAgenda', 'idVehiculo']

    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        super(AgendaForm, self).__init__(*args, **kwargs)
        self.fields['fechaAtencion'].widget = forms.DateInput(attrs={'type': 'date'})
        self.fields['horaAtencion'].widget = forms.TimeInput(attrs={'type': 'time'})

        if user:
            self.fields['idVehiculo'].queryset = Vehiculo.objects.filter(idUsuario=user)

class VehiculoForm(forms.ModelForm):
    class Meta:
        model = Vehiculo
        exclude = ['idUsuario']