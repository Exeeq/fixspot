from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import *

class AddressForm(forms.Form):
    address = forms.CharField(label='Enter Address', max_length=255)


#REGISTRAR USUARIO
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