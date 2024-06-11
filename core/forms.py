from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import *
import requests
from datetime import datetime, timedelta, time

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
class TallerForm(forms.ModelForm):
    class Meta:
        model = Taller
        fields = ['nombreTaller', 'descripcion', 'direccion', 'telefono', 'idComuna', 'idUsuario', 'imagen']
        labels = {
            'nombreTaller': 'Nombre del taller',
            'descripcion': 'Descripción',
            'direccion': 'Dirección',
            'telefono': 'Teléfono',
            'idComuna': 'Comuna',
            'idUsuario': 'Encargado del taller',
            'imagen': 'Imagen',
        }

    def __init__(self, *args, **kwargs):
        super(TallerForm, self).__init__(*args, **kwargs)
        self.fields['nombreTaller'].required = True
        self.fields['descripcion'].required = True
        self.fields['direccion'].required = True
        self.fields['telefono'].required = True
        self.fields['idComuna'].required = True
        self.fields['idUsuario'].required = True
        self.fields['imagen'].required = False
    
class AgendaForm(forms.ModelForm):
    class Meta:
        model = Agenda
        fields = ['fechaAtencion', 'horaAtencion', 'idTipoAgenda', 'idVehiculo']
        labels = {
            'fechaAtencion': 'Fecha de Atención',
            'horaAtencion': 'Hora de Atención',
            'idTipoAgenda': 'Tipo de Agenda',
            'idVehiculo': 'Vehículo',
        }

    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        self.taller = kwargs.pop('taller', None)
        super(AgendaForm, self).__init__(*args, **kwargs)

        self.fields['fechaAtencion'].widget = forms.DateInput(attrs={'type': 'date', 'min': datetime.today().date()})
        self.fields['horaAtencion'].widget = forms.Select()

        if user:
            self.fields['idVehiculo'].queryset = Vehiculo.objects.filter(idUsuario=user)
        
        self.fields['horaAtencion'].widget.choices = self.get_available_hours()

    def get_available_hours(self):
        available_hours = [(time(hour=h), f"{h:02}:00") for h in range(9, 19)]
        if self.is_bound and 'fechaAtencion' in self.data:
            selected_date = self.data.get('fechaAtencion')
            if selected_date:
                reserved_hours = Agenda.objects.filter(
                    fechaAtencion=selected_date,
                    idTaller=self.taller
                ).values_list('horaAtencion', flat=True)
                available_hours = [
                    (time(hour=h), f"{h:02}:00") for h in range(9, 19)
                    if time(hour=h) not in reserved_hours
                ]
        return available_hours

    def clean(self):
        cleaned_data = super().clean()
        fecha = cleaned_data.get('fechaAtencion')
        hora = cleaned_data.get('horaAtencion')

        if fecha and hora and self.taller:
            if fecha.weekday() >= 5: 
                raise forms.ValidationError("Las reservas solo están disponibles de lunes a viernes.")

            if Agenda.objects.filter(fechaAtencion=fecha, horaAtencion=hora, idTaller=self.taller).exists():
                raise forms.ValidationError("La hora seleccionada ya está reservada. Por favor, elija otra hora.")

        return cleaned_data

class VehiculoForm(forms.ModelForm):
    class Meta:
        model = Vehiculo
        exclude = ['idUsuario']


class UsuarioCustomForm(forms.ModelForm):
    class Meta:
        model = UsuarioCustom
        fields = ['username','run', 'correo', 'pnombre', 'ap_paterno', 'direccion', 'idRol', 'idComuna']
        labels = {
            'username': 'Nombre de usuario',
            'run': 'RUN',
            'correo': 'Correo Electrónico',
            'pnombre': 'Primer Nombre',
            'ap_paterno': 'Apellido Paterno',
            'direccion': 'Dirección',
            'idRol': 'Rol',
            'idComuna': 'Comuna',
        }
        widgets = {
            'run': forms.TextInput(attrs={'class': 'form-control'}),
            'correo': forms.EmailInput(attrs={'class': 'form-control'}),
            'pnombre': forms.TextInput(attrs={'class': 'form-control'}),
            'ap_paterno': forms.TextInput(attrs={'class': 'form-control'}),
            'direccion': forms.TextInput(attrs={'class': 'form-control'}),
            'idRol': forms.Select(attrs={'class': 'form-control'}),
            'idComuna': forms.Select(attrs={'class': 'form-control'}),
        }

class UsuarioCustomCreationForm(UserCreationForm):
    username = forms.CharField(max_length=150, label='Nombre de usuario', widget=forms.TextInput(attrs={'class': 'form-control'}))
    run = forms.CharField(max_length=12, label='RUN', widget=forms.TextInput(attrs={'class': 'form-control'}))
    correo = forms.EmailField(label='Correo Electrónico', widget=forms.EmailInput(attrs={'class': 'form-control'}))
    pnombre = forms.CharField(max_length=20, label='Primer Nombre', widget=forms.TextInput(attrs={'class': 'form-control'}))
    ap_paterno = forms.CharField(max_length=24, label='Apellido Paterno', widget=forms.TextInput(attrs={'class': 'form-control'}))
    direccion = forms.CharField(max_length=100, label='Dirección', widget=forms.TextInput(attrs={'class': 'form-control'}))
    idRol = forms.ModelChoiceField(queryset=rolUsuario.objects.all(), label='Rol', widget=forms.Select(attrs={'class': 'form-control'}))
    idComuna = forms.ModelChoiceField(queryset=Comuna.objects.all(), label='Comuna', widget=forms.Select(attrs={'class': 'form-control'}))
    password1 = forms.CharField(label='Contraseña', widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    password2 = forms.CharField(label='Confirmar Contraseña', widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    class Meta(UserCreationForm.Meta):
        model = UsuarioCustom
        fields = ['username', 'run', 'correo', 'pnombre', 'ap_paterno', 'direccion', 'idRol', 'idComuna', 'password1', 'password2']

    def save(self, commit=True):
        user = super().save(commit=False)
        user.set_password(self.cleaned_data['password1'])
        if commit:
            user.save()
        return user
    
class UsuarioCustomPerfilForm(forms.ModelForm):
    class Meta:
        model = UsuarioCustom
        fields = ['username','run', 'correo', 'pnombre', 'ap_paterno', 'direccion', 'idComuna']
        labels = {
            'username': 'Nombre de usuario',
            'run': 'RUN',
            'correo': 'Correo Electrónico',
            'pnombre': 'Primer Nombre',
            'ap_paterno': 'Apellido Paterno',
            'direccion': 'Dirección',
            'idComuna': 'Comuna',
        }
        widgets = {
            'run': forms.TextInput(attrs={'class': 'form-control'}),
            'correo': forms.EmailInput(attrs={'class': 'form-control'}),
            'pnombre': forms.TextInput(attrs={'class': 'form-control'}),
            'ap_paterno': forms.TextInput(attrs={'class': 'form-control'}),
            'direccion': forms.TextInput(attrs={'class': 'form-control'}),
            'idComuna': forms.Select(attrs={'class': 'form-control'}),
        }