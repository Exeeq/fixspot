-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2024 a las 04:19:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_fixspot`
--
CREATE DATABASE IF NOT EXISTS `db_fixspot` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_fixspot`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add content type', 3, 'add_contenttype'),
(10, 'Can change content type', 3, 'change_contenttype'),
(11, 'Can delete content type', 3, 'delete_contenttype'),
(12, 'Can view content type', 3, 'view_contenttype'),
(13, 'Can add user', 4, 'add_usuariocustom'),
(14, 'Can change user', 4, 'change_usuariocustom'),
(15, 'Can delete user', 4, 'delete_usuariocustom'),
(16, 'Can view user', 4, 'view_usuariocustom'),
(17, 'Can add agenda', 5, 'add_agenda'),
(18, 'Can change agenda', 5, 'change_agenda'),
(19, 'Can delete agenda', 5, 'delete_agenda'),
(20, 'Can view agenda', 5, 'view_agenda'),
(21, 'Can add boleta', 6, 'add_boleta'),
(22, 'Can change boleta', 6, 'change_boleta'),
(23, 'Can delete boleta', 6, 'delete_boleta'),
(24, 'Can view boleta', 6, 'view_boleta'),
(25, 'Can add comuna', 7, 'add_comuna'),
(26, 'Can change comuna', 7, 'change_comuna'),
(27, 'Can delete comuna', 7, 'delete_comuna'),
(28, 'Can view comuna', 7, 'view_comuna'),
(29, 'Can add estado agenda', 8, 'add_estadoagenda'),
(30, 'Can change estado agenda', 8, 'change_estadoagenda'),
(31, 'Can delete estado agenda', 8, 'delete_estadoagenda'),
(32, 'Can view estado agenda', 8, 'view_estadoagenda'),
(33, 'Can add marca', 9, 'add_marca'),
(34, 'Can change marca', 9, 'change_marca'),
(35, 'Can delete marca', 9, 'delete_marca'),
(36, 'Can view marca', 9, 'view_marca'),
(37, 'Can add region', 10, 'add_region'),
(38, 'Can change region', 10, 'change_region'),
(39, 'Can delete region', 10, 'delete_region'),
(40, 'Can view region', 10, 'view_region'),
(41, 'Can add rol usuario', 11, 'add_rolusuario'),
(42, 'Can change rol usuario', 11, 'change_rolusuario'),
(43, 'Can delete rol usuario', 11, 'delete_rolusuario'),
(44, 'Can view rol usuario', 11, 'view_rolusuario'),
(45, 'Can add tipo agenda', 12, 'add_tipoagenda'),
(46, 'Can change tipo agenda', 12, 'change_tipoagenda'),
(47, 'Can delete tipo agenda', 12, 'delete_tipoagenda'),
(48, 'Can view tipo agenda', 12, 'view_tipoagenda'),
(49, 'Can add tipo vehiculo', 13, 'add_tipovehiculo'),
(50, 'Can change tipo vehiculo', 13, 'change_tipovehiculo'),
(51, 'Can delete tipo vehiculo', 13, 'delete_tipovehiculo'),
(52, 'Can view tipo vehiculo', 13, 'view_tipovehiculo'),
(53, 'Can add vehiculo', 14, 'add_vehiculo'),
(54, 'Can change vehiculo', 14, 'change_vehiculo'),
(55, 'Can delete vehiculo', 14, 'delete_vehiculo'),
(56, 'Can view vehiculo', 14, 'view_vehiculo'),
(57, 'Can add taller', 15, 'add_taller'),
(58, 'Can change taller', 15, 'change_taller'),
(59, 'Can delete taller', 15, 'delete_taller'),
(60, 'Can view taller', 15, 'view_taller'),
(61, 'Can add reporte pago', 16, 'add_reportepago'),
(62, 'Can change reporte pago', 16, 'change_reportepago'),
(63, 'Can delete reporte pago', 16, 'delete_reportepago'),
(64, 'Can view reporte pago', 16, 'view_reportepago'),
(65, 'Can add detalle boleta', 17, 'add_detalleboleta'),
(66, 'Can change detalle boleta', 17, 'change_detalleboleta'),
(67, 'Can delete detalle boleta', 17, 'delete_detalleboleta'),
(68, 'Can view detalle boleta', 17, 'view_detalleboleta'),
(69, 'Can add log entry', 18, 'add_logentry'),
(70, 'Can change log entry', 18, 'change_logentry'),
(71, 'Can delete log entry', 18, 'delete_logentry'),
(72, 'Can view log entry', 18, 'view_logentry'),
(73, 'Can add session', 19, 'add_session'),
(74, 'Can change session', 19, 'change_session'),
(75, 'Can delete session', 19, 'delete_session'),
(76, 'Can view session', 19, 'view_session'),
(77, 'Can add Token', 20, 'add_token'),
(78, 'Can change Token', 20, 'change_token'),
(79, 'Can delete Token', 20, 'delete_token'),
(80, 'Can view Token', 20, 'view_token'),
(81, 'Can add Token', 21, 'add_tokenproxy'),
(82, 'Can change Token', 21, 'change_tokenproxy'),
(83, 'Can delete Token', 21, 'delete_tokenproxy'),
(84, 'Can view Token', 21, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_agenda`
--

DROP TABLE IF EXISTS `core_agenda`;
CREATE TABLE `core_agenda` (
  `idAgenda` int(11) NOT NULL,
  `fechaAtencion` date NOT NULL,
  `horaAtencion` time(6) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `idTaller_id` int(11) NOT NULL,
  `idTipoAgenda_id` int(11) NOT NULL,
  `idVehiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_agenda`
--

INSERT INTO `core_agenda` (`idAgenda`, `fechaAtencion`, `horaAtencion`, `cliente_id`, `estado_id`, `idTaller_id`, `idTipoAgenda_id`, `idVehiculo_id`) VALUES
(1, '2024-06-19', '12:00:00.000000', 4, 3, 1, 6, 1),
(3, '2024-06-21', '15:00:00.000000', 6, 3, 1, 5, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_comuna`
--

DROP TABLE IF EXISTS `core_comuna`;
CREATE TABLE `core_comuna` (
  `idComuna` int(11) NOT NULL,
  `nombreComuna` varchar(80) NOT NULL,
  `idRegion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_comuna`
--

INSERT INTO `core_comuna` (`idComuna`, `nombreComuna`, `idRegion_id`) VALUES
(1, 'Santiago', 1),
(2, 'Providencia', 1),
(3, 'Las Condes', 1),
(4, 'La Reina', 1),
(5, 'Ñuñoa', 1),
(6, 'Maipú', 1),
(7, 'Puente Alto', 1),
(8, 'La Florida', 1),
(9, 'Peñalolén', 1),
(10, 'Quilicura', 1),
(11, 'Colina', 1),
(12, 'Pudahuel', 1),
(13, 'Lo Barnechea', 1),
(14, 'Vitacura', 1),
(15, 'Lo Prado', 1),
(16, 'San Bernardo', 1),
(17, 'San Joaquín', 1),
(18, 'Macul', 1),
(19, 'Independencia', 1),
(20, 'Renca', 1),
(21, 'Cerro Navia', 1),
(22, 'Conchalí', 1),
(23, 'La Cisterna', 1),
(24, 'San Miguel', 1),
(25, 'San Ramón', 1),
(26, 'Estación Central', 1),
(27, 'Padre Hurtado', 1),
(28, 'El Bosque', 1),
(29, 'La Granja', 1),
(30, 'La Pintana', 1),
(31, 'Quinta Normal', 1),
(32, 'Peñaflor', 1),
(33, 'Lo Espejo', 1),
(34, 'La Florida', 1),
(35, 'Huechuraba', 1),
(36, 'Pedro Aguirre Cerda', 1),
(37, 'Providencia', 1),
(38, 'Renca', 1),
(39, 'Recoleta', 1),
(40, 'San Bernardo', 1),
(41, 'San Joaquín', 1),
(42, 'San Miguel', 1),
(43, 'San Ramón', 1),
(44, 'Santiago', 1),
(45, 'Vitacura', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_estadoagenda`
--

DROP TABLE IF EXISTS `core_estadoagenda`;
CREATE TABLE `core_estadoagenda` (
  `idEstado` int(11) NOT NULL,
  `nombreEstado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_estadoagenda`
--

INSERT INTO `core_estadoagenda` (`idEstado`, `nombreEstado`) VALUES
(1, 'En proceso'),
(2, 'Por pagar'),
(3, 'Pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_marca`
--

DROP TABLE IF EXISTS `core_marca`;
CREATE TABLE `core_marca` (
  `idMarca` int(11) NOT NULL,
  `nombreMarca` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_marca`
--

INSERT INTO `core_marca` (`idMarca`, `nombreMarca`) VALUES
(1, 'Audi'),
(2, 'BMW'),
(3, 'Chevrolet'),
(4, 'Citroën'),
(5, 'Fiat'),
(6, 'Ford'),
(7, 'Honda'),
(8, 'Hyundai'),
(9, 'Kia'),
(10, 'Mazda'),
(11, 'Mercedes-Benz'),
(12, 'Mitsubishi'),
(13, 'Nissan'),
(14, 'Peugeot'),
(15, 'Renault'),
(16, 'Subaru'),
(17, 'Suzuki'),
(18, 'Toyota'),
(19, 'Volkswagen'),
(20, 'Volvo'),
(21, 'Jeep'),
(22, 'Land Rover'),
(23, 'Jaguar'),
(24, 'MINI'),
(25, 'Porsche'),
(26, 'Tesla'),
(27, 'Genesis'),
(28, 'Acura'),
(29, 'Lexus'),
(30, 'Infiniti'),
(31, 'Lincoln'),
(32, 'Cadillac'),
(33, 'Buick'),
(34, 'Chrysler'),
(35, 'Dodge'),
(36, 'Ram'),
(37, 'GMC'),
(38, 'Alfa Romeo'),
(39, 'Maserati'),
(40, 'Ferrari'),
(41, 'Lamborghini'),
(42, 'McLaren'),
(43, 'Bugatti'),
(44, 'Pagani'),
(45, 'Koenigsegg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_region`
--

DROP TABLE IF EXISTS `core_region`;
CREATE TABLE `core_region` (
  `idRegion` int(11) NOT NULL,
  `nombreRegion` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_region`
--

INSERT INTO `core_region` (`idRegion`, `nombreRegion`) VALUES
(1, 'Región Metropolitana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_reportepago`
--

DROP TABLE IF EXISTS `core_reportepago`;
CREATE TABLE `core_reportepago` (
  `idReporte` int(11) NOT NULL,
  `comentario` longtext DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `reserva_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_reportepago`
--

INSERT INTO `core_reportepago` (`idReporte`, `comentario`, `monto`, `reserva_id`) VALUES
(4, 'Se realizó alineación y balanceo de las 4 ruedas del vehículo.', 750.00, 1),
(5, 'Se realizo el cambio de aceite, con uno de mejor calidad para el auto.', 1000.00, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_rolusuario`
--

DROP TABLE IF EXISTS `core_rolusuario`;
CREATE TABLE `core_rolusuario` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_rolusuario`
--

INSERT INTO `core_rolusuario` (`idRol`, `nombreRol`) VALUES
(1, 'Cliente'),
(2, 'Encargado taller'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_taller`
--

DROP TABLE IF EXISTS `core_taller`;
CREATE TABLE `core_taller` (
  `idTaller` int(11) NOT NULL,
  `nombreTaller` varchar(46) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `idComuna_id` int(11) DEFAULT NULL,
  `idUsuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_taller`
--

INSERT INTO `core_taller` (`idTaller`, `nombreTaller`, `descripcion`, `direccion`, `telefono`, `imagen`, `latitud`, `longitud`, `idComuna_id`, `idUsuario_id`) VALUES
(1, 'El zapallo', 'Taller dedicado a los zapallos', 'Ernesto alvear', '+569 1234 5678', 'taller_imagenes/134198213.jpg', -33.6083006, -70.5841941, 7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tipoagenda`
--

DROP TABLE IF EXISTS `core_tipoagenda`;
CREATE TABLE `core_tipoagenda` (
  `idTipo` int(11) NOT NULL,
  `nombreTipo` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_tipoagenda`
--

INSERT INTO `core_tipoagenda` (`idTipo`, `nombreTipo`) VALUES
(1, 'Mantenimiento programado'),
(2, 'Reparación urgente'),
(3, 'Inspección técnica'),
(4, 'Revisión de frenos'),
(5, 'Cambio de aceite'),
(6, 'Alineación y balanceo'),
(7, 'Cambio de neumáticos'),
(8, 'Revisión de suspensión'),
(9, 'Diagnóstico de motor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tipovehiculo`
--

DROP TABLE IF EXISTS `core_tipovehiculo`;
CREATE TABLE `core_tipovehiculo` (
  `idTipo` int(11) NOT NULL,
  `nombreTipo` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_tipovehiculo`
--

INSERT INTO `core_tipovehiculo` (`idTipo`, `nombreTipo`) VALUES
(1, 'Automóvil'),
(2, 'Camioneta'),
(3, 'SUV'),
(4, 'Furgoneta'),
(5, 'Pick-up'),
(6, 'Coupé'),
(7, 'Sedán'),
(8, 'Hatchback'),
(9, 'Convertible'),
(10, 'Station Wagon'),
(11, 'Camión'),
(12, 'Motocicleta'),
(13, 'Bicicleta'),
(14, 'Tractocamión'),
(15, 'Autobús'),
(16, 'Van'),
(17, 'Remolque'),
(18, 'Caravana'),
(19, 'Motoneta'),
(20, 'Cuatrimoto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_usuariocustom`
--

DROP TABLE IF EXISTS `core_usuariocustom`;
CREATE TABLE `core_usuariocustom` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `run` varchar(12) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `pnombre` varchar(20) NOT NULL,
  `ap_paterno` varchar(24) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `idComuna_id` int(11) DEFAULT NULL,
  `idRol_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_usuariocustom`
--

INSERT INTO `core_usuariocustom` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `run`, `correo`, `telefono`, `pnombre`, `ap_paterno`, `direccion`, `idComuna_id`, `idRol_id`) VALUES
(1, 'pbkdf2_sha256$216000$TLAvQnJumt9m$ZibgjzxAKYPiihfJgeMiw3D2goqiopWOUAu9Hn9BxPg=', '2024-06-18 02:00:19.934981', 1, 'admin', '', '', '', 1, 1, '2024-06-17 00:30:02.176083', '00.00.000-0', 'admin@duocuc.cl', '', 'Admin', 'General', 'Admin 111', NULL, 3),
(2, 'pbkdf2_sha256$216000$coIo7evpv5C8$DQjlv/yUDsGmureJDijlleNP+dDxYSKG2wkEyWuFGZg=', '2024-06-18 02:12:47.269804', 0, 'Exequiel', '', '', '', 0, 1, '2024-06-17 00:36:44.818514', '21.002.289-9', 'ex.albornoz@duocuc.cl', '', 'Exequiel', 'Albornoz', 'Millantu 123', 7, 2),
(3, 'pbkdf2_sha256$216000$266gQNler743$+j+nAveFC+mDOiLzyMOcAO+dYD1tVYagc6LQ70/aRjI=', '2024-06-18 02:13:01.702869', 0, 'Jeffrey', '', '', '', 0, 1, '2024-06-17 00:40:32.818240', '21.207.762-3', 'jeff.ramirez@duocuc.cl', '', 'Jeffrey', 'Ramirez', 'San Francisco 9484', 7, 2),
(4, 'pbkdf2_sha256$216000$9Xul931xv0Q0$8WJQA9sC+FFejOHpMD2YlLgl9xzi16Z3X9S9yqR7XhA=', '2024-06-18 00:58:09.311944', 0, 'Juan', '', '', '', 0, 1, '2024-06-17 00:41:24.612111', '11.111.111-1', 'juan.callabo@gmail.com', '', 'Juan', 'Callabo', 'Juan 123', 7, 1),
(6, 'pbkdf2_sha256$216000$1BC4f97UTWJx$lD2357J8qAoTTcT+3DuzBWx6qipGPn0Bxwehkcy8Y0g=', '2024-06-18 01:43:17.153433', 0, 'Javier', '', '', '', 0, 1, '2024-06-18 01:39:37.808368', '17.225.361-4', 'jav.er@gmail.com', '', 'Javier', 'Velásquez', 'hola 123', 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_usuariocustom_groups`
--

DROP TABLE IF EXISTS `core_usuariocustom_groups`;
CREATE TABLE `core_usuariocustom_groups` (
  `id` int(11) NOT NULL,
  `usuariocustom_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_usuariocustom_user_permissions`
--

DROP TABLE IF EXISTS `core_usuariocustom_user_permissions`;
CREATE TABLE `core_usuariocustom_user_permissions` (
  `id` int(11) NOT NULL,
  `usuariocustom_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_vehiculo`
--

DROP TABLE IF EXISTS `core_vehiculo`;
CREATE TABLE `core_vehiculo` (
  `idVehiculo` int(11) NOT NULL,
  `patente` varchar(6) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `subModelo` varchar(20) DEFAULT NULL,
  `anno` int(11) NOT NULL,
  `idMarca_id` int(11) NOT NULL,
  `idTipoVehiculo_id` int(11) NOT NULL,
  `idUsuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_vehiculo`
--

INSERT INTO `core_vehiculo` (`idVehiculo`, `patente`, `modelo`, `subModelo`, `anno`, `idMarca_id`, `idTipoVehiculo_id`, `idUsuario_id`) VALUES
(1, 'PRKG97', 'Gol', 'Confortline', 2021, 19, 8, 4),
(3, 'TYTA54', 'Corolla', NULL, 2021, 18, 7, 1),
(4, 'HSRV45', 'V16', NULL, 2012, 13, 7, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-06-17 00:32:10.497169', '1', 'Cliente', 1, '[{\"added\": {}}]', 11, 1),
(2, '2024-06-17 00:32:18.405758', '2', 'Encargado taller', 1, '[{\"added\": {}}]', 11, 1),
(3, '2024-06-17 00:32:24.871240', '3', 'Administrador', 1, '[{\"added\": {}}]', 11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(18, 'admin', 'logentry'),
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(20, 'authtoken', 'token'),
(21, 'authtoken', 'tokenproxy'),
(3, 'contenttypes', 'contenttype'),
(5, 'core', 'agenda'),
(6, 'core', 'boleta'),
(7, 'core', 'comuna'),
(17, 'core', 'detalleboleta'),
(8, 'core', 'estadoagenda'),
(9, 'core', 'marca'),
(10, 'core', 'region'),
(16, 'core', 'reportepago'),
(11, 'core', 'rolusuario'),
(15, 'core', 'taller'),
(12, 'core', 'tipoagenda'),
(13, 'core', 'tipovehiculo'),
(4, 'core', 'usuariocustom'),
(14, 'core', 'vehiculo'),
(19, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-17 00:29:13.575140'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-06-17 00:29:13.604115'),
(3, 'auth', '0001_initial', '2024-06-17 00:29:13.634793'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-06-17 00:29:13.726059'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-06-17 00:29:13.731062'),
(6, 'auth', '0004_alter_user_username_opts', '2024-06-17 00:29:13.735067'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-06-17 00:29:13.739077'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-06-17 00:29:13.740087'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-06-17 00:29:13.745092'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-06-17 00:29:13.748638'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-06-17 00:29:13.752643'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-06-17 00:29:13.758178'),
(13, 'auth', '0011_update_proxy_permissions', '2024-06-17 00:29:13.764184'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-06-17 00:29:13.768243'),
(15, 'core', '0001_initial', '2024-06-17 00:29:14.123546'),
(16, 'admin', '0001_initial', '2024-06-17 00:29:33.740431'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-06-17 00:29:33.790999'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-17 00:29:33.797514'),
(19, 'authtoken', '0001_initial', '2024-06-17 00:29:33.825064'),
(20, 'authtoken', '0002_auto_20160226_1747', '2024-06-17 00:29:33.911164'),
(21, 'authtoken', '0003_tokenproxy', '2024-06-17 00:29:33.914168'),
(22, 'authtoken', '0004_alter_tokenproxy_options', '2024-06-17 00:29:33.918244'),
(23, 'sessions', '0001_initial', '2024-06-17 00:29:33.926766'),
(24, 'core', '0002_auto_20240617_1849', '2024-06-17 22:49:22.693715'),
(25, 'core', '0003_auto_20240617_2204', '2024-06-18 02:04:44.683199');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7pwjplvanb6mk7ajoh3gdtjhjzl1f5nu', '.eJxVjEEOwiAQRe_C2hBoOzDj0r1nIMMAUjVtUtqV8e7apAvd_vfef6nA21rD1vISxqTOalCn3y2yPPK0g3Tn6TZrmad1GaPeFX3Qpq9zys_L4f4dVG71WxdvU9dHsgUBuyFzX6hItOLEoWHvwbAg-gKeDWVAIgAGNi5ZQhL1_gDkAjea:1sJ0ya:zOfi8YAx_mIXm7Vqn7N2l8vIM6ROE3b6kD524kcFA7U', '2024-07-01 01:16:04.261526');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `core_agenda`
--
ALTER TABLE `core_agenda`
  ADD PRIMARY KEY (`idAgenda`),
  ADD KEY `core_agenda_idTaller_id_2025b2c7_fk_core_taller_idTaller` (`idTaller_id`),
  ADD KEY `core_agenda_idTipoAgenda_id_dfcbc29a_fk_core_tipoagenda_idTipo` (`idTipoAgenda_id`),
  ADD KEY `core_agenda_idVehiculo_id_9f7a5c22_fk_core_vehiculo_idVehiculo` (`idVehiculo_id`),
  ADD KEY `core_agenda_cliente_id_0890f683_fk_core_usuariocustom_id` (`cliente_id`),
  ADD KEY `core_agenda_estado_id_9b9c4513_fk_core_estadoagenda_idEstado` (`estado_id`);

--
-- Indices de la tabla `core_comuna`
--
ALTER TABLE `core_comuna`
  ADD PRIMARY KEY (`idComuna`),
  ADD KEY `core_comuna_idRegion_id_8eb1d498_fk_core_region_idRegion` (`idRegion_id`);

--
-- Indices de la tabla `core_estadoagenda`
--
ALTER TABLE `core_estadoagenda`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `core_marca`
--
ALTER TABLE `core_marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `core_region`
--
ALTER TABLE `core_region`
  ADD PRIMARY KEY (`idRegion`);

--
-- Indices de la tabla `core_reportepago`
--
ALTER TABLE `core_reportepago`
  ADD PRIMARY KEY (`idReporte`),
  ADD UNIQUE KEY `reserva_id` (`reserva_id`);

--
-- Indices de la tabla `core_rolusuario`
--
ALTER TABLE `core_rolusuario`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `core_taller`
--
ALTER TABLE `core_taller`
  ADD PRIMARY KEY (`idTaller`),
  ADD KEY `core_taller_idComuna_id_4af1bf31_fk_core_comuna_idComuna` (`idComuna_id`),
  ADD KEY `core_taller_idUsuario_id_d1356fab_fk_core_usuariocustom_id` (`idUsuario_id`);

--
-- Indices de la tabla `core_tipoagenda`
--
ALTER TABLE `core_tipoagenda`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `core_tipovehiculo`
--
ALTER TABLE `core_tipovehiculo`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `core_usuariocustom`
--
ALTER TABLE `core_usuariocustom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `core_usuariocustom_idComuna_id_79fd03a4_fk_core_comuna_idComuna` (`idComuna_id`),
  ADD KEY `core_usuariocustom_idRol_id_a682a0ba_fk_core_rolusuario_idRol` (`idRol_id`);

--
-- Indices de la tabla `core_usuariocustom_groups`
--
ALTER TABLE `core_usuariocustom_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_usuariocustom_group_usuariocustom_id_group_i_29a9a079_uniq` (`usuariocustom_id`,`group_id`),
  ADD KEY `core_usuariocustom_groups_group_id_8dcd6d1a_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `core_usuariocustom_user_permissions`
--
ALTER TABLE `core_usuariocustom_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_usuariocustom_user__usuariocustom_id_permiss_50e60970_uniq` (`usuariocustom_id`,`permission_id`),
  ADD KEY `core_usuariocustom_u_permission_id_37c6eea2_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `core_vehiculo`
--
ALTER TABLE `core_vehiculo`
  ADD PRIMARY KEY (`idVehiculo`),
  ADD KEY `core_vehiculo_idMarca_id_c736a35f_fk_core_marca_idMarca` (`idMarca_id`),
  ADD KEY `core_vehiculo_idTipoVehiculo_id_69f4a65b_fk_core_tipo` (`idTipoVehiculo_id`),
  ADD KEY `core_vehiculo_idUsuario_id_f26e460a_fk_core_usuariocustom_id` (`idUsuario_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_core_usuariocustom_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `core_agenda`
--
ALTER TABLE `core_agenda`
  MODIFY `idAgenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `core_comuna`
--
ALTER TABLE `core_comuna`
  MODIFY `idComuna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `core_estadoagenda`
--
ALTER TABLE `core_estadoagenda`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `core_marca`
--
ALTER TABLE `core_marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `core_region`
--
ALTER TABLE `core_region`
  MODIFY `idRegion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `core_reportepago`
--
ALTER TABLE `core_reportepago`
  MODIFY `idReporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `core_rolusuario`
--
ALTER TABLE `core_rolusuario`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `core_taller`
--
ALTER TABLE `core_taller`
  MODIFY `idTaller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `core_tipoagenda`
--
ALTER TABLE `core_tipoagenda`
  MODIFY `idTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `core_tipovehiculo`
--
ALTER TABLE `core_tipovehiculo`
  MODIFY `idTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `core_usuariocustom`
--
ALTER TABLE `core_usuariocustom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `core_usuariocustom_groups`
--
ALTER TABLE `core_usuariocustom_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_usuariocustom_user_permissions`
--
ALTER TABLE `core_usuariocustom_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_vehiculo`
--
ALTER TABLE `core_vehiculo`
  MODIFY `idVehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_core_usuariocustom_id` FOREIGN KEY (`user_id`) REFERENCES `core_usuariocustom` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `core_agenda`
--
ALTER TABLE `core_agenda`
  ADD CONSTRAINT `core_agenda_cliente_id_0890f683_fk_core_usuariocustom_id` FOREIGN KEY (`cliente_id`) REFERENCES `core_usuariocustom` (`id`),
  ADD CONSTRAINT `core_agenda_estado_id_9b9c4513_fk_core_estadoagenda_idEstado` FOREIGN KEY (`estado_id`) REFERENCES `core_estadoagenda` (`idEstado`),
  ADD CONSTRAINT `core_agenda_idTaller_id_2025b2c7_fk_core_taller_idTaller` FOREIGN KEY (`idTaller_id`) REFERENCES `core_taller` (`idTaller`),
  ADD CONSTRAINT `core_agenda_idTipoAgenda_id_dfcbc29a_fk_core_tipoagenda_idTipo` FOREIGN KEY (`idTipoAgenda_id`) REFERENCES `core_tipoagenda` (`idTipo`),
  ADD CONSTRAINT `core_agenda_idVehiculo_id_9f7a5c22_fk_core_vehiculo_idVehiculo` FOREIGN KEY (`idVehiculo_id`) REFERENCES `core_vehiculo` (`idVehiculo`);

--
-- Filtros para la tabla `core_comuna`
--
ALTER TABLE `core_comuna`
  ADD CONSTRAINT `core_comuna_idRegion_id_8eb1d498_fk_core_region_idRegion` FOREIGN KEY (`idRegion_id`) REFERENCES `core_region` (`idRegion`);

--
-- Filtros para la tabla `core_reportepago`
--
ALTER TABLE `core_reportepago`
  ADD CONSTRAINT `core_reportepago_reserva_id_e177e290_fk_core_agenda_idAgenda` FOREIGN KEY (`reserva_id`) REFERENCES `core_agenda` (`idAgenda`);

--
-- Filtros para la tabla `core_taller`
--
ALTER TABLE `core_taller`
  ADD CONSTRAINT `core_taller_idComuna_id_4af1bf31_fk_core_comuna_idComuna` FOREIGN KEY (`idComuna_id`) REFERENCES `core_comuna` (`idComuna`),
  ADD CONSTRAINT `core_taller_idUsuario_id_d1356fab_fk_core_usuariocustom_id` FOREIGN KEY (`idUsuario_id`) REFERENCES `core_usuariocustom` (`id`);

--
-- Filtros para la tabla `core_usuariocustom`
--
ALTER TABLE `core_usuariocustom`
  ADD CONSTRAINT `core_usuariocustom_idComuna_id_79fd03a4_fk_core_comuna_idComuna` FOREIGN KEY (`idComuna_id`) REFERENCES `core_comuna` (`idComuna`),
  ADD CONSTRAINT `core_usuariocustom_idRol_id_a682a0ba_fk_core_rolusuario_idRol` FOREIGN KEY (`idRol_id`) REFERENCES `core_rolusuario` (`idRol`);

--
-- Filtros para la tabla `core_usuariocustom_groups`
--
ALTER TABLE `core_usuariocustom_groups`
  ADD CONSTRAINT `core_usuariocustom_g_usuariocustom_id_5965550d_fk_core_usua` FOREIGN KEY (`usuariocustom_id`) REFERENCES `core_usuariocustom` (`id`),
  ADD CONSTRAINT `core_usuariocustom_groups_group_id_8dcd6d1a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `core_usuariocustom_user_permissions`
--
ALTER TABLE `core_usuariocustom_user_permissions`
  ADD CONSTRAINT `core_usuariocustom_u_permission_id_37c6eea2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `core_usuariocustom_u_usuariocustom_id_a30f26bf_fk_core_usua` FOREIGN KEY (`usuariocustom_id`) REFERENCES `core_usuariocustom` (`id`);

--
-- Filtros para la tabla `core_vehiculo`
--
ALTER TABLE `core_vehiculo`
  ADD CONSTRAINT `core_vehiculo_idMarca_id_c736a35f_fk_core_marca_idMarca` FOREIGN KEY (`idMarca_id`) REFERENCES `core_marca` (`idMarca`),
  ADD CONSTRAINT `core_vehiculo_idTipoVehiculo_id_69f4a65b_fk_core_tipo` FOREIGN KEY (`idTipoVehiculo_id`) REFERENCES `core_tipovehiculo` (`idTipo`),
  ADD CONSTRAINT `core_vehiculo_idUsuario_id_f26e460a_fk_core_usuariocustom_id` FOREIGN KEY (`idUsuario_id`) REFERENCES `core_usuariocustom` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_usuariocustom_id` FOREIGN KEY (`user_id`) REFERENCES `core_usuariocustom` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;