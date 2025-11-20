from rest_framework import serializers
from .models import *
from django.contrib.auth.hashers import make_password

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

    def create(self, validated_data):
        password = validated_data.pop("password", None)

        # Hashear password si viene en el POST
        if password:
            validated_data["password"] = make_password(password)

        return super().create(validated_data)

    def update(self, instance, validated_data):
        # Si el usuario envía password, la hasheamos
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
