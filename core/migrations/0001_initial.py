# Generated by Django 3.1.2 on 2024-06-17 00:29

from django.conf import settings
import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='UsuarioCustom',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=150, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('run', models.CharField(max_length=12)),
                ('correo', models.EmailField(max_length=254)),
                ('telefono', models.CharField(max_length=15)),
                ('pnombre', models.CharField(max_length=20)),
                ('ap_paterno', models.CharField(max_length=24)),
                ('direccion', models.CharField(max_length=100)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
                'abstract': False,
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Agenda',
            fields=[
                ('idAgenda', models.AutoField(primary_key=True, serialize=False)),
                ('fechaAtencion', models.DateField()),
                ('horaAtencion', models.TimeField()),
                ('cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Boleta',
            fields=[
                ('nFolio', models.AutoField(primary_key=True, serialize=False)),
                ('fecha', models.DateField()),
                ('montoNeto', models.IntegerField()),
                ('iva', models.IntegerField()),
                ('montoTotal', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Comuna',
            fields=[
                ('idComuna', models.AutoField(primary_key=True, serialize=False)),
                ('nombreComuna', models.CharField(max_length=80)),
            ],
        ),
        migrations.CreateModel(
            name='EstadoAgenda',
            fields=[
                ('idEstado', models.AutoField(primary_key=True, serialize=False)),
                ('nombreEstado', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Marca',
            fields=[
                ('idMarca', models.AutoField(primary_key=True, serialize=False)),
                ('nombreMarca', models.CharField(max_length=32)),
            ],
        ),
        migrations.CreateModel(
            name='Region',
            fields=[
                ('idRegion', models.AutoField(primary_key=True, serialize=False)),
                ('nombreRegion', models.CharField(max_length=80)),
            ],
        ),
        migrations.CreateModel(
            name='rolUsuario',
            fields=[
                ('idRol', models.AutoField(primary_key=True, serialize=False)),
                ('nombreRol', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='TipoAgenda',
            fields=[
                ('idTipo', models.AutoField(primary_key=True, serialize=False)),
                ('nombreTipo', models.CharField(max_length=32)),
            ],
        ),
        migrations.CreateModel(
            name='TipoVehiculo',
            fields=[
                ('idTipo', models.AutoField(primary_key=True, serialize=False)),
                ('nombreTipo', models.CharField(max_length=32)),
            ],
        ),
        migrations.CreateModel(
            name='Vehiculo',
            fields=[
                ('idVehiculo', models.AutoField(primary_key=True, serialize=False)),
                ('patente', models.CharField(max_length=6)),
                ('modelo', models.CharField(max_length=20)),
                ('subModelo', models.CharField(blank=True, max_length=20, null=True)),
                ('anno', models.IntegerField()),
                ('idMarca', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.marca')),
                ('idTipoVehiculo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.tipovehiculo')),
                ('idUsuario', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Taller',
            fields=[
                ('idTaller', models.AutoField(primary_key=True, serialize=False)),
                ('nombreTaller', models.CharField(max_length=46)),
                ('descripcion', models.TextField(blank=True, null=True)),
                ('direccion', models.CharField(max_length=100)),
                ('telefono', models.CharField(max_length=15)),
                ('imagen', models.ImageField(blank=True, null=True, upload_to='taller_imagenes/')),
                ('latitud', models.FloatField(blank=True, null=True)),
                ('longitud', models.FloatField(blank=True, null=True)),
                ('idComuna', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.comuna')),
                ('idUsuario', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='ReportePago',
            fields=[
                ('idReporte', models.AutoField(primary_key=True, serialize=False)),
                ('comentario', models.TextField(blank=True, null=True)),
                ('monto', models.DecimalField(decimal_places=2, max_digits=10)),
                ('reserva', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='core.agenda')),
            ],
        ),
        migrations.CreateModel(
            name='DetalleBoleta',
            fields=[
                ('idDetalle', models.AutoField(primary_key=True, serialize=False)),
                ('nombreDetalle', models.CharField(max_length=100)),
                ('montoDetalle', models.IntegerField()),
                ('cantidad', models.IntegerField()),
                ('comentario', models.CharField(max_length=100)),
                ('idAgenda', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.agenda')),
                ('nFolio', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.boleta')),
            ],
        ),
        migrations.AddField(
            model_name='comuna',
            name='idRegion',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.region'),
        ),
        migrations.AddField(
            model_name='agenda',
            name='estado',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.estadoagenda'),
        ),
        migrations.AddField(
            model_name='agenda',
            name='idTaller',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.taller'),
        ),
        migrations.AddField(
            model_name='agenda',
            name='idTipoAgenda',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.tipoagenda'),
        ),
        migrations.AddField(
            model_name='agenda',
            name='idVehiculo',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.vehiculo'),
        ),
        migrations.AddField(
            model_name='usuariocustom',
            name='idComuna',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.comuna'),
        ),
        migrations.AddField(
            model_name='usuariocustom',
            name='idRol',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.rolusuario'),
        ),
        migrations.AddField(
            model_name='usuariocustom',
            name='user_permissions',
            field=models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions'),
        ),
    ]
