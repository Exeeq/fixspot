from rest_framework import serializers
from .models import *
from django.contrib.auth.hashers import make_password

# Validar rut del usuario
def validar_rut_chileno(rut: str) -> bool:
    if not rut:
        return False

    rut = rut.replace(".", "").replace(" ", "").upper()
    if "-" not in rut:
        return False

    cuerpo, dv = rut.split("-", 1)
    if not cuerpo.isdigit():
        return False

    # Algoritmo de verificación
    reversed_digits = map(int, reversed(cuerpo))
    factores = [2, 3, 4, 5, 6, 7]

    suma = 0
    i = 0
    for d in reversed_digits:
        suma += d * factores[i]
        i = (i + 1) % len(factores)

    resto = suma % 11
    dv_calc = 11 - resto
    if dv_calc == 11:
        dv_esperado = "0"
    elif dv_calc == 10:
        dv_esperado = "K"
    else:
        dv_esperado = str(dv_calc)

    return dv == dv_esperado

# Serializadores para modelos relacionados al usuario
class RolUsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = rolUsuario
        fields = '__all__'

class RegionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Region
        fields = '__all__'

class ComunaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comuna
        fields = '__all__'

class UsuarioCustomSerializer(serializers.ModelSerializer):

    class Meta:
        model = UsuarioCustom
        fields = '__all__'
        extra_kwargs = {
            "password": {"write_only": True}
        }

    def validate(self, data):
        username = data.get("username") or (self.instance.username if self.instance else None)
        correo   = data.get("correo")   or (self.instance.correo   if self.instance else None)
        run      = data.get("run")      or (self.instance.run      if self.instance else None)

        user_id = self.instance.id if self.instance else None

        if not validar_rut_chileno(run):
            raise serializers.ValidationError({
                "run": "El RUN ingresado no es válido. Debe ser como 12345678-9."
            })

        if run and UsuarioCustom.objects.filter(run=run)\
                                        .exclude(id=user_id).exists():
            raise serializers.ValidationError({
                "run": "Este RUN ya está registrado en otro usuario."
            })

        if username and UsuarioCustom.objects.filter(username=username)\
                                             .exclude(id=user_id).exists():
            raise serializers.ValidationError({
                "username": "Este nombre de usuario ya está registrado."
            })

        if correo and UsuarioCustom.objects.filter(correo=correo)\
                                           .exclude(id=user_id).exists():
            raise serializers.ValidationError({
                "correo": "Este correo ya está registrado."
            })

        if run and UsuarioCustom.objects.filter(run=run)\
                                        .exclude(id=user_id).exists():
            raise serializers.ValidationError({
                "run": "Este RUN ya está registrado en otro usuario."
            })

        return data

    def create(self, validated_data):
        password = validated_data.pop("password", None)
        if password:
            validated_data["password"] = make_password(password)
        return super().create(validated_data)

    def update(self, instance, validated_data):
        password = validated_data.pop("password", None)
        if password:
            instance.password = make_password(password)
        return super().update(instance, validated_data)

class PreferenciasUsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = PreferenciasUsuario
        fields = '__all__'

# Serializadores para modelos relacionados al taller
class TallerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Taller
        fields = '__all__'

# Serializadores para modelos relacionados a los servicios
class ServicioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Servicio
        fields = '__all__'

class TallerServicioSerializer(serializers.ModelSerializer):
    class Meta:
        model = TallerServicio
        fields = '__all__'

class FavoritoTallerSerializer(serializers.ModelSerializer):
    class Meta:
        model = FavoritoTaller
        fields = '__all__'

# Serializadores para modelos relacionados al vehículo
class MarcaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Marca
        fields = '__all__'

class TipoVehiculoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoVehiculo
        fields = '__all__'

class VehiculoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vehiculo
        fields = '__all__'

# Serializadores para modelos relacionados a la agenda
class EstadoAgendaSerializer(serializers.ModelSerializer):
    class Meta:
        model = EstadoAgenda
        fields = '__all__'

class AgendaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Agenda
        fields = '__all__'

# Serializadores para modelos relacionados a los pagos
class FormaPagoSerializer(serializers.ModelSerializer):
    class Meta:
        model = FormaPago
        fields = '__all__'

class ReportePagoSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReportePago
        fields = '__all__'

# Serializadores para modelos relacionados a los tickets
class EstadoTicketSerializer(serializers.ModelSerializer):
    class Meta:
        model = EstadoTicket
        fields = '__all__'

class TicketSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ticket
        fields = '__all__'

# Serializadores para el modelo de contacto
class ContactoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Contacto
        fields = '__all__'
