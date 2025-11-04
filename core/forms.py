from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import *
import requests
from datetime import datetime, timedelta, time
from django.core.validators import MinValueValidator, MaxValueValidator, RegexValidator
import re
from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from datetime import date

class AddressForm(forms.Form):
    address = forms.CharField(label='Ingrese dirección', max_length=255)


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
from django import forms
from django.core.validators import RegexValidator
from .models import Taller, Servicio, TallerServicio

class TallerForm(forms.ModelForm):
    servicios = forms.ModelMultipleChoiceField(
        queryset=Servicio.objects.all().order_by('nombreServicio'),
        widget=forms.CheckboxSelectMultiple(),
        required=False,
        label="Servicios que ofrece el taller"
    )

    class Meta:
        model = Taller
        fields = [
            'nombreTaller',
            'descripcion',
            'telefono',
            'idComuna',
            'idUsuario',
            'imagen',
            'servicios'
        ]
        labels = {
            'nombreTaller': 'Nombre del taller',
            'descripcion': 'Descripción',
            'telefono': 'Teléfono',
            'idComuna': 'Comuna',
            'idUsuario': 'Encargado del taller',
            'imagen': 'Imagen',
            'servicios': 'Servicios disponibles',
        }

    telefono = forms.CharField(
        max_length=12,
        validators=[
            RegexValidator(
                regex=r'^\+569\d{8}$',
                message='El número de teléfono debe estar en el formato correcto: +569XXXXXXXX.',
                code='invalid_phone_number'
            )
        ],
        widget=forms.TextInput(attrs={'placeholder': '+56991005929'})
    )

    def __init__(self, *args, **kwargs):
        super(TallerForm, self).__init__(*args, **kwargs)

        # Definir orden visual más lógico
        self.order_fields([
            'nombreTaller',
            'descripcion',
            'telefono',
            'idComuna',
            'idUsuario',
            'imagen',
            'servicios',
        ])

        # Campos requeridos y estilos base
        for name, field in self.fields.items():
            if name != 'servicios':
                field.required = True
                field.widget.attrs.update({
                    'class': 'form-control form-field shadow-sm mb-3 rounded-3'
                })

        # Si el taller ya existe, marcar sus servicios
        if self.instance.pk:
            self.fields['servicios'].initial = Servicio.objects.filter(
                tallerservicio__idTaller=self.instance
            )

    def save(self, commit=True):
        taller = super().save(commit=commit)
        if commit:
            servicios = self.cleaned_data.get('servicios', [])
            TallerServicio.objects.filter(idTaller=taller).delete()
            for s in servicios:
                TallerServicio.objects.create(idTaller=taller, idServicio=s)
        return taller


class AgendaForm(forms.ModelForm):
    class Meta:
        model = Agenda
        fields = ['fechaAtencion', 'horaAtencion', 'idServicio', 'idVehiculo']
        labels = {
            'fechaAtencion': 'Fecha de Atención (Solo de lunes a viernes)',
            'horaAtencion': 'Hora de Atención',
            'idServicio': 'Servicio disponible',
            'idVehiculo': 'Vehículo',
        }

    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        self.taller = kwargs.pop('taller', None)
        super(AgendaForm, self).__init__(*args, **kwargs)

        # Definir el widget de fecha
        self.fields['fechaAtencion'].widget = forms.DateInput(
            attrs={'type': 'date', 'min': datetime.today().date()}
        )

        # Asignar horas disponibles
        self.fields['horaAtencion'].widget = forms.Select(choices=self.get_available_hours())

        # Filtrar vehículos del usuario logueado
        if user:
            self.fields['idVehiculo'] = forms.ModelChoiceField(
                queryset=Vehiculo.objects.filter(idUsuario=user),
                label='Vehículo',
                empty_label="Seleccione un vehículo",
                widget=forms.Select(attrs={'class': 'form-control'})
            )
            # Personalizar la representación de los vehículos (Marca, Modelo, Submodelo y Patente)
            self.fields['idVehiculo'].queryset = Vehiculo.objects.filter(idUsuario=user)
            self.fields['idVehiculo'].widget.choices = [
                (vehiculo.idVehiculo, f"{vehiculo.idMarca.nombreMarca} {vehiculo.modelo} {vehiculo.subModelo} - {vehiculo.patente}")
                for vehiculo in self.fields['idVehiculo'].queryset
            ]

        # Mostrar solo servicios del taller actual
        if self.taller:
            self.fields['idServicio'].queryset = Servicio.objects.filter(
                tallerservicio__idTaller=self.taller
            )
        else:
            self.fields['idServicio'].queryset = Servicio.objects.none()

    def get_available_hours(self):
        """
        Devuelve las horas disponibles para la atención, excluyendo la hora de la colación (2:00 PM).
        """
        # Primero, generamos las horas entre 9:00 AM y 7:00 PM, excluyendo las 14:00 PM (2:00 PM)
        available_hours = [(f"{h:02}:00", f"{h:02}:00") for h in range(9, 19) if h != 14]  # 14 es 2:00 PM

        if self.is_bound and 'fechaAtencion' in self.data:
            selected_date = self.data.get('fechaAtencion')
            if selected_date:
                # Excluir las horas reservadas de esa fecha
                reserved_hours = Agenda.objects.filter(
                    fechaAtencion=selected_date,
                    idTaller=self.taller
                ).values_list('horaAtencion', flat=True)

                # Convertir las horas reservadas a formato de cadena, si no están en formato texto
                reserved_hours = [f"{hour:02}:00" for hour in reserved_hours]

                # Filtramos las horas disponibles
                available_hours = [
                    (h, label) for h, label in available_hours
                    if label not in reserved_hours  # Comparamos cadenas de texto
                ]

        return available_hours

    def clean(self):
        cleaned_data = super().clean()
        fecha = cleaned_data.get('fechaAtencion')
        hora = cleaned_data.get('horaAtencion')

        if fecha and hora and self.taller:
            if fecha.weekday() >= 5:
                raise forms.ValidationError("Las reservas solo están disponibles de lunes a viernes.")

            # Validar que la hora no esté ya tomada
            if Agenda.objects.filter(fechaAtencion=fecha, horaAtencion=hora, idTaller=self.taller).exists():
                raise forms.ValidationError("La hora seleccionada ya está reservada. Por favor, elija otra hora.")

        return cleaned_data


class VehiculoForm(forms.ModelForm):
    class Meta:
        model = Vehiculo
        exclude = ['idUsuario']
        labels = {
            'patente': 'Patente del Vehículo',
            'idMarca': 'Marca',
            'modelo': 'Modelo',
            'subModelo': 'Sub-Modelo',
            'anno': 'Año',
            'idTipoVehiculo': 'Tipo de Vehículo',
        }
        widgets = {
            # el max se ajusta dinámicamente en __init__
            'anno': forms.NumberInput(),
        }

    # validadores “duros” (se refinan en clean_*)
    anno = forms.IntegerField(
        validators=[MinValueValidator(1950), MaxValueValidator(date.today().year)],
        widget=forms.NumberInput(),
        label='Año'
    )

    patente = forms.CharField(
        max_length=6,
        validators=[
            RegexValidator(
                regex=r'^[A-Z]{4}\d{2}$',
                message='Formato de patente permitido para autos/camionetas: 4 letras + 2 números (ej. HYRG34).',
                code='invalid_patente'
            )
        ],
        widget=forms.TextInput(attrs={'placeholder': 'HYRG34', 'style': 'text-transform:uppercase;'})
    )

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # 1) Excluir MOTO del selector (por nombre)
        self.fields['idTipoVehiculo'].queryset = (
            TipoVehiculo.objects.exclude(nombreTipo__iexact='Moto')
        )

        # 2) Año dinámico (máximo año actual)
        current = date.today().year
        self.fields['anno'].widget.attrs.update({'min': 1950, 'max': current})

    def clean_idTipoVehiculo(self):
        tv = self.cleaned_data['idTipoVehiculo']
        # Segundo seguro: si alguien fuerza el POST con “Moto”, rechazamos.
        if tv and tv.nombreTipo.strip().lower() in ('moto', 'motocicleta', 'motocicletas'):
            raise ValidationError('No se permiten motocicletas en este formulario.')
        return tv

    def clean_patente(self):
        p = (self.cleaned_data.get('patente') or '').upper()
        # Ya validamos 4L+2N con el RegexValidator. Aseguramos mayúsculas.
        return p

    def clean_anno(self):
        y = self.cleaned_data['anno']
        current = date.today().year
        if not (1950 <= y <= current):
            raise ValidationError(f'El año debe estar entre 1950 y {current}.')
        return y

class UsuarioCustomPerfilForm(forms.ModelForm):
    username = forms.CharField(
        label='Nombre de usuario',
        help_text='Solo letras y números',
        validators=[RegexValidator(regex=r'^[A-Za-z0-9]+$', message='Solo se permiten letras y números (sin espacios ni símbolos).')],
        widget=forms.TextInput(attrs={'class': 'form-control','pattern': '^[A-Za-z0-9]+$','title': 'Solo letras y números (sin espacios ni símbolos)'}),
    )

    # === Toggle promociones ===
    acepta_promociones = forms.BooleanField(
        required=False,
        label='Quiero recibir promociones por correo',
        widget=forms.CheckboxInput(attrs={"class":"form-check-input","role":"switch"})
    )

    class Meta:
        model = UsuarioCustom
        fields = ['username','run','correo','pnombre','ap_paterno','direccion','idComuna', 'acepta_promociones']
        help_texts = {'username': 'Solo letras y números'}
        widgets = {
            'run': forms.TextInput(attrs={'class': 'form-control'}),
            'correo': forms.EmailInput(attrs={'class': 'form-control'}),
            'pnombre': forms.TextInput(attrs={'class': 'form-control'}),
            'ap_paterno': forms.TextInput(attrs={'class': 'form-control'}),
            'direccion': forms.TextInput(attrs={'class': 'form-control'}),
            'idComuna': forms.Select(attrs={'class': 'form-select'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Inicializa el toggle desde PreferenciasUsuario
        if self.instance and self.instance.pk:
            pref, _ = PreferenciasUsuario.objects.get_or_create(usuario=self.instance)
            self.fields['acepta_promociones'].initial = bool(pref.acepta_promociones)

    def clean_username(self):
        u = self.cleaned_data.get('username', '')
        u = re.sub(r'[^A-Za-z0-9]', '', u)
        if not u:
            raise forms.ValidationError('Ingresa un nombre de usuario válido (solo letras y números).')
        return u

    def save(self, commit=True):
        user = super().save(commit=commit)
        acepta = self.cleaned_data.get('acepta_promociones', False)
        pref, _ = PreferenciasUsuario.objects.get_or_create(usuario=user)
        if pref.acepta_promociones != acepta:
            pref.acepta_promociones = acepta
            pref.save()
        return user

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
        fields = ['username','run','correo','pnombre','ap_paterno','direccion','idComuna']
        labels = {
            'username': 'Nombre de usuario',
            'run': 'RUN',
            'correo': 'Correo electrónico',
            'pnombre': 'Primer nombre',
            'ap_paterno': 'Apellido paterno',
            'direccion': 'Dirección',
            'idComuna': 'Comuna',
        }
        widgets = {
            'run': forms.TextInput(attrs={'class': 'form-control'}),
            'correo': forms.EmailInput(attrs={'class': 'form-control'}),
            'pnombre': forms.TextInput(attrs={'class': 'form-control'}),
            'ap_paterno': forms.TextInput(attrs={'class': 'form-control'}),
            'direccion': forms.TextInput(attrs={'class': 'form-control'}),
            'idComuna': forms.Select(attrs={'class': 'form-select'}),
        }

class ReportePagoForm(forms.ModelForm):
    class Meta:
        model = ReportePago
        fields = ['comentario', 'monto']
        widgets = {
            'comentario': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
            'monto': forms.NumberInput(attrs={'class': 'form-control', 'min': 100}),
        }

    def clean_comentario(self):
        comentario = self.cleaned_data.get('comentario')
        if not comentario:
            raise forms.ValidationError('Este campo es obligatorio.')
        return comentario

    def clean_monto(self):
        monto = self.cleaned_data.get('monto')
        if monto is None or monto < 100:
            raise forms.ValidationError('El monto debe ser al menos 100 pesos chilenos.')
        return monto
    
class TicketForm(forms.ModelForm):
    class Meta:
        model = Ticket
        fields = ['asunto']
        widgets = {
            'asunto': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
        }

    def clean_asunto(self):
        comentario = self.cleaned_data.get('asunto')
        if not comentario:
            raise forms.ValidationError('Este campo es obligatorio.')
        return comentario

class TicketForm(forms.ModelForm):
    class Meta:
        model = Ticket  
        fields = ['asunto']

class ContactoForm(forms.ModelForm):
    class Meta:
        model = Contacto
        fields = '__all__'

    def clean_nombre(self):
        nombre = self.cleaned_data.get('nombre')
        if not nombre:
            raise forms.ValidationError("Este campo es obligatorio.")
        return nombre

    def clean_correo(self):
        correo = self.cleaned_data.get('correo')
        if not correo:
            raise forms.ValidationError("Este campo es obligatorio.")
        try:
            validate_email(correo)
        except ValidationError:
            raise forms.ValidationError("Ingrese una dirección de correo válida.")
        
        api_key = '9aaf4399a47279f19ea95563bae1116ea6ba0f36'  
        response = requests.get(
            'https://api.hunter.io/v2/email-verifier',
            params={'email': correo, 'api_key': api_key}
        )
        result = response.json()
        
        if result.get('data', {}).get('result') != 'deliverable':
            raise forms.ValidationError("La dirección de correo no parece ser válida.")
        
        return correo

    def clean_telefono(self):
        telefono = self.cleaned_data.get('telefono')
        if not re.match(r'^\+569\d{8}$', telefono):
            raise forms.ValidationError("El número de teléfono debe tener el formato +569 seguido de 8 dígitos.")
        return telefono

    def clean_asunto(self):
        asunto = self.cleaned_data.get('asunto')
        if not asunto:
            raise forms.ValidationError("Este campo es obligatorio.")
        return asunto

