from django.db import models
from django.contrib.auth.models import AbstractUser

#MODELOS RELACIONADOS AL USUARIO:
class rolUsuario(models.Model):
    idRol = models.AutoField(primary_key=True)
    nombreRol = models.CharField(max_length=20, blank=False, null=False)

    def __str__(self):
        return self.nombreRol

class Region(models.Model):
    idRegion = models.AutoField(primary_key=True)
    nombreRegion = models.CharField(max_length=80, blank=False, null=False)

    def __str__(self):
        return self.nombreRegion

class Comuna(models.Model):
    idComuna = models.AutoField(primary_key=True)
    nombreComuna = models.CharField(max_length=80, blank=False, null=False)
    idRegion = models.ForeignKey(Region, on_delete=models.CASCADE)

    def __str__(self):
        return self.nombreComuna

class UsuarioCustom(AbstractUser):
    run = models.CharField(max_length=12, blank=False, null=False)
    email = models.EmailField(blank=False, null=False)
    telefono = models.CharField(max_length=15, blank=False, null=False)
    pnombre = models.CharField(max_length=20, blank=False, null=False)
    ap_paterno = models.CharField(max_length=24, blank=False, null=False)
    direccion = models.CharField(blank=False, null=False, max_length=100)
    idRol = models.ForeignKey(rolUsuario, on_delete=models.CASCADE, blank=True, null=True)
    idComuna = models.ForeignKey(Comuna, on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return self.username
    
class Taller(models.Model):
    idTaller = models.AutoField(primary_key=True)
    nombreTaller = models.CharField(max_length=46, blank=False, null=False)
    direccion = models.CharField(blank=False, null=False, max_length=100)
    telefono = models.CharField(max_length=15, blank=False, null=False)
    idUsuario = models.ForeignKey(UsuarioCustom, on_delete=models.CASCADE, blank=True, null=True)
    idComuna = models.ForeignKey(Comuna, on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return self.nombreTaller

#MODELOS RELACIONADOS AL VEHÍCULO:
class Marca(models.Model):
    idMarca = models.AutoField(primary_key=True)
    nombreMarca = models.CharField(max_length=32, blank=False, null=False)

    def __str__(self):
        return self.nombreMarca

class TipoVehiculo(models.Model):
    idTipo= models.AutoField(primary_key=True)
    nombreTipo = models.CharField(max_length=32, blank=False, null=False)

    def __str__(self):
        return self.nombreTipo

class Vehiculo(models.Model):
    idVehiculo = models.AutoField(primary_key=True)
    patente = models.CharField(blank=False, null=False, max_length=6)
    modelo = models.CharField(blank=False, null=False, max_length=20)
    subModelo = models.CharField(blank=False, null=False, max_length=20)
    anno = models.IntegerField(blank=False, null=False)
    idUsuario = models.ForeignKey(UsuarioCustom, on_delete=models.CASCADE, blank=True, null=True)
    idMarca = models.ForeignKey(Marca, on_delete=models.CASCADE, blank=False, null=False)
    idTipoVehiculo = models.ForeignKey(TipoVehiculo, on_delete=models.CASCADE, blank=False, null=False)

    def __str__(self):
        return self.patente

#MODELOS RELACIONADOS A LA AGENDA:
class TipoAgenda(models.Model):
    idTipo= models.AutoField(primary_key=True)
    nombreTipo = models.CharField(max_length=32, blank=False, null=False)

    def __str__(self):
        return self.nombreTipo

class Agenda(models.Model):
    idAgenda = models.AutoField(primary_key=True)
    fechaAgenda = models.DateField(null=False, blank=False)
    fechaAtencion = models.DateField(null=False, blank=False)
    horaAtencion = models.TimeField(blank=False, null=False)
    idTipoAgenda = models.ForeignKey(TipoAgenda, on_delete=models.CASCADE, blank=False, null=False)
    idTaller = models.ForeignKey(Taller, on_delete=models.CASCADE, blank=False, null=False) 
    idVehiculo = models.ForeignKey(Vehiculo, on_delete=models.CASCADE, blank=False, null=False) 

    def __str__(self):
        return self.idAgenda

#MODELOS RELACIONADOS A LA BOLETA:
class Boleta(models.Model):
    nFolio = models.AutoField(primary_key=True)
    fecha = models.DateField(null=False, blank=False)
    montoNeto = models.IntegerField(blank=False, null=False)
    iva = models.IntegerField(blank=False, null=False)
    montoTotal = models.IntegerField(blank=False, null=False)

    def __str__(self):
        return self.nFolio

class DetalleBoleta(models.Model):
    idDetalle = models.AutoField(primary_key=True)
    nombreDetalle = models.CharField(max_length=100, blank=False, null=False)
    montoDetalle = models.IntegerField(blank=False, null=False)
    cantidad = models.IntegerField(blank=False, null=False)
    comentario = models.CharField(max_length=100, blank=False, null=False)
    idAgenda = models.ForeignKey(Agenda, on_delete=models.CASCADE, blank=False, null=False) 
    nFolio = models.ForeignKey(Boleta, on_delete=models.CASCADE, blank=False, null=False) 

    def __str__(self):
        return self.nombreDetalle

