-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2025 a las 00:40:40
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
-- Base de datos: `fixspot-bd`
--
CREATE DATABASE IF NOT EXISTS `fixspot-bd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fixspot-bd`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
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
  `id` bigint(20) NOT NULL,
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
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_usuariocustom'),
(22, 'Can change user', 6, 'change_usuariocustom'),
(23, 'Can delete user', 6, 'delete_usuariocustom'),
(24, 'Can view user', 6, 'view_usuariocustom'),
(25, 'Can add agenda', 7, 'add_agenda'),
(26, 'Can change agenda', 7, 'change_agenda'),
(27, 'Can delete agenda', 7, 'delete_agenda'),
(28, 'Can view agenda', 7, 'view_agenda'),
(29, 'Can add comuna', 8, 'add_comuna'),
(30, 'Can change comuna', 8, 'change_comuna'),
(31, 'Can delete comuna', 8, 'delete_comuna'),
(32, 'Can view comuna', 8, 'view_comuna'),
(33, 'Can add estado agenda', 9, 'add_estadoagenda'),
(34, 'Can change estado agenda', 9, 'change_estadoagenda'),
(35, 'Can delete estado agenda', 9, 'delete_estadoagenda'),
(36, 'Can view estado agenda', 9, 'view_estadoagenda'),
(37, 'Can add marca', 10, 'add_marca'),
(38, 'Can change marca', 10, 'change_marca'),
(39, 'Can delete marca', 10, 'delete_marca'),
(40, 'Can view marca', 10, 'view_marca'),
(41, 'Can add region', 11, 'add_region'),
(42, 'Can change region', 11, 'change_region'),
(43, 'Can delete region', 11, 'delete_region'),
(44, 'Can view region', 11, 'view_region'),
(45, 'Can add rol usuario', 12, 'add_rolusuario'),
(46, 'Can change rol usuario', 12, 'change_rolusuario'),
(47, 'Can delete rol usuario', 12, 'delete_rolusuario'),
(48, 'Can view rol usuario', 12, 'view_rolusuario'),
(49, 'Permiso para Cliente', 12, 'cliente_permiso'),
(50, 'Permiso para Encargado de Taller', 12, 'encargado_taller_permiso'),
(51, 'Permiso para Administrador', 12, 'administrador_permiso'),
(52, 'Can add tipo vehiculo', 13, 'add_tipovehiculo'),
(53, 'Can change tipo vehiculo', 13, 'change_tipovehiculo'),
(54, 'Can delete tipo vehiculo', 13, 'delete_tipovehiculo'),
(55, 'Can view tipo vehiculo', 13, 'view_tipovehiculo'),
(56, 'Can add vehiculo', 14, 'add_vehiculo'),
(57, 'Can change vehiculo', 14, 'change_vehiculo'),
(58, 'Can delete vehiculo', 14, 'delete_vehiculo'),
(59, 'Can view vehiculo', 14, 'view_vehiculo'),
(60, 'Can add taller', 15, 'add_taller'),
(61, 'Can change taller', 15, 'change_taller'),
(62, 'Can delete taller', 15, 'delete_taller'),
(63, 'Can view taller', 15, 'view_taller'),
(64, 'Can add reporte pago', 16, 'add_reportepago'),
(65, 'Can change reporte pago', 16, 'change_reportepago'),
(66, 'Can delete reporte pago', 16, 'delete_reportepago'),
(67, 'Can view reporte pago', 16, 'view_reportepago'),
(68, 'Can add estado ticket', 17, 'add_estadoticket'),
(69, 'Can change estado ticket', 17, 'change_estadoticket'),
(70, 'Can delete estado ticket', 17, 'delete_estadoticket'),
(71, 'Can view estado ticket', 17, 'view_estadoticket'),
(72, 'Can add ticket', 18, 'add_ticket'),
(73, 'Can change ticket', 18, 'change_ticket'),
(74, 'Can delete ticket', 18, 'delete_ticket'),
(75, 'Can view ticket', 18, 'view_ticket'),
(76, 'Can add contacto', 19, 'add_contacto'),
(77, 'Can change contacto', 19, 'change_contacto'),
(78, 'Can delete contacto', 19, 'delete_contacto'),
(79, 'Can view contacto', 19, 'view_contacto'),
(80, 'Can add servicio', 20, 'add_servicio'),
(81, 'Can change servicio', 20, 'change_servicio'),
(82, 'Can delete servicio', 20, 'delete_servicio'),
(83, 'Can view servicio', 20, 'view_servicio'),
(84, 'Can add taller servicio', 21, 'add_tallerservicio'),
(85, 'Can change taller servicio', 21, 'change_tallerservicio'),
(86, 'Can delete taller servicio', 21, 'delete_tallerservicio'),
(87, 'Can view taller servicio', 21, 'view_tallerservicio'),
(88, 'Can add forma pago', 22, 'add_formapago'),
(89, 'Can change forma pago', 22, 'change_formapago'),
(90, 'Can delete forma pago', 22, 'delete_formapago'),
(91, 'Can view forma pago', 22, 'view_formapago'),
(92, 'Can add Token', 23, 'add_token'),
(93, 'Can change Token', 23, 'change_token'),
(94, 'Can delete Token', 23, 'delete_token'),
(95, 'Can view Token', 23, 'view_token'),
(96, 'Can add Token', 24, 'add_tokenproxy'),
(97, 'Can change Token', 24, 'change_tokenproxy'),
(98, 'Can delete Token', 24, 'delete_tokenproxy'),
(99, 'Can view Token', 24, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_agenda`
--

DROP TABLE IF EXISTS `core_agenda`;
CREATE TABLE `core_agenda` (
  `idAgenda` int(11) NOT NULL,
  `fechaAtencion` date NOT NULL,
  `horaAtencion` time(6) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `idTaller_id` int(11) NOT NULL,
  `idVehiculo_id` int(11) NOT NULL,
  `idServicio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Colina', 1),
(2, 'Lampa', 1),
(3, 'Tiltil', 1),
(4, 'Puente Alto', 1),
(5, 'Pirque', 1),
(6, 'San José de Maipo', 1),
(7, 'San Bernardo', 1),
(8, 'Calera de Tango', 1),
(9, 'Buin', 1),
(10, 'Paine', 1),
(11, 'Melipilla', 1),
(12, 'Alhué', 1),
(13, 'Curacaví', 1),
(14, 'María Pinto', 1),
(15, 'San Pedro', 1),
(16, 'Cerrillos', 1),
(17, 'Conchalí', 1),
(18, 'Estación Central', 1),
(19, 'La Florida', 1),
(20, 'Maipú', 1),
(21, 'Ñuñoa', 1),
(22, 'Providencia', 1),
(23, 'Renca', 1),
(24, 'Santiago', 1),
(25, 'Vitacura', 1),
(26, 'La Reina', 1),
(27, 'Macul', 1),
(28, 'Peñalolén', 1),
(29, 'Pudahuel', 1),
(30, 'San Miguel', 1),
(31, 'Huechuraba', 1),
(32, 'Independencia', 1),
(33, 'Recoleta', 1),
(34, 'El Bosque', 1),
(35, 'La Pintana', 1),
(36, 'San Joaquín', 1),
(37, 'Villa Alemana', 1),
(38, 'Talagante', 1),
(39, 'El Monte', 1),
(40, 'Isla de Maipo', 1),
(41, 'Padre Hurtado', 1),
(42, 'Peñaflor', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_contacto`
--

DROP TABLE IF EXISTS `core_contacto`;
CREATE TABLE `core_contacto` (
  `idContacto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `asunto` longtext NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_estadoagenda`
--

DROP TABLE IF EXISTS `core_estadoagenda`;
CREATE TABLE `core_estadoagenda` (
  `idEstado` int(11) NOT NULL,
  `nombreEstado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_estadoticket`
--

DROP TABLE IF EXISTS `core_estadoticket`;
CREATE TABLE `core_estadoticket` (
  `idEstado` int(11) NOT NULL,
  `NombreEstado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_formapago`
--

DROP TABLE IF EXISTS `core_formapago`;
CREATE TABLE `core_formapago` (
  `idFormaPago` int(11) NOT NULL,
  `nombreFormaPago` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_formapago`
--

INSERT INTO `core_formapago` (`idFormaPago`, `nombreFormaPago`) VALUES
(1, 'Paypal'),
(2, 'Efectivo');

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
(1, 'Toyota'),
(2, 'Chevrolet'),
(3, 'Ford'),
(4, 'Nissan'),
(5, 'Hyundai'),
(6, 'Kia'),
(7, 'Honda'),
(8, 'Mazda'),
(9, 'Renault'),
(10, 'Peugeot'),
(11, 'Fiat'),
(12, 'Chrysler'),
(13, 'Subaru'),
(14, 'Mitsubishi'),
(15, 'Volkswagen'),
(16, 'Dodge'),
(17, 'Suzuki'),
(18, 'Citroën'),
(19, 'Opel'),
(20, 'BMW'),
(21, 'Jeep'),
(22, 'Seat'),
(23, 'Land Rover');

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
  `reserva_id` int(11) NOT NULL,
  `idFormaPago_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(2, 'Encargado de Taller'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_servicio`
--

DROP TABLE IF EXISTS `core_servicio`;
CREATE TABLE `core_servicio` (
  `idServicio` int(11) NOT NULL,
  `nombreServicio` varchar(100) NOT NULL,
  `descripcion` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_servicio`
--

INSERT INTO `core_servicio` (`idServicio`, `nombreServicio`, `descripcion`) VALUES
(1, 'Cambio de aceite', 'Servicio de cambio de aceite del motor con revisión de filtros y líquidos.'),
(2, 'Revisión de frenos', 'Revisión de frenos, pastillas, discos y sistema de frenado.'),
(3, 'Alineación y balanceo', 'Alineación de dirección y balanceo de ruedas para mejorar la estabilidad.'),
(4, 'Cambio de llantas', 'Reemplazo de llantas y revisión de la presión y desgaste de las mismas.'),
(5, 'Revisión de suspensión', 'Revisión y reparación de suspensión, amortiguadores y resortes.'),
(6, 'Reemplazo de baterías', 'Cambio de batería del vehículo con revisión de sistema eléctrico.'),
(7, 'Frenos y pastillas', 'Reemplazo de pastillas de freno y revisión del sistema de frenado.'),
(8, 'Reparación de embrague', 'Diagnóstico y reparación del sistema de embrague del vehículo.'),
(9, 'Cambio de bujías', 'Reemplazo de bujías y revisión del sistema de encendido.'),
(10, 'Revisión de dirección', 'Chequeo del sistema de dirección, sin problemas de alineación.'),
(11, 'Reemplazo de correas', 'Cambio de correas de distribución y accesorios del motor.'),
(12, 'Servicio de aire acondicionado', 'Revisión y reparación del sistema de aire acondicionado del vehículo.'),
(13, 'Reparación de radiadores', 'Reemplazo y reparación de radiadores del sistema de refrigeración.'),
(14, 'Reemplazo de filtros de aire', 'Cambio de filtros de aire para mejorar el rendimiento del motor.'),
(15, 'Chequeo de sistema de escape', 'Inspección del sistema de escape para verificar fugas o daños.'),
(16, 'Servicio de iluminación', 'Revisión y cambio de luces del vehículo, incluyendo faros y bombillas.'),
(17, 'Inspección de sistema de carga', 'Chequeo del alternador y sistema de carga del vehículo.'),
(18, 'Reparación de suspensión trasera', 'Reparación de la suspensión trasera y elementos relacionados.'),
(19, 'Cambio de filtros de aceite', 'Reemplazo de los filtros de aceite del motor.'),
(20, 'Reemplazo de bombas de agua', 'Reemplazo de bombas de agua y sistema de enfriamiento del motor.'),
(21, 'Revisión de sistema eléctrico', 'Inspección y reparación de sistema eléctrico del vehículo.'),
(22, 'Reemplazo de pastillas de freno', 'Cambio de pastillas de freno trasero y delantero.'),
(23, 'Reparación de parabrisas', 'Reparación de grietas y rayones en el parabrisas del vehículo.'),
(24, 'Limpieza de inyectores', 'Limpieza y mantenimiento del sistema de inyectores de combustible.'),
(25, 'Ajuste de carburador', 'Ajuste y mantenimiento del carburador del vehículo para optimizar el consumo.'),
(26, 'Revisión de sistema de frenos antibloqueo (ABS)', 'Chequeo del sistema de frenos antibloqueo para seguridad del vehículo.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_taller`
--

DROP TABLE IF EXISTS `core_taller`;
CREATE TABLE `core_taller` (
  `idTaller` int(11) NOT NULL,
  `nombreTaller` varchar(46) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `direccion` varchar(500) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `idComuna_id` int(11) DEFAULT NULL,
  `idUsuario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_taller`
--

INSERT INTO `core_taller` (`idTaller`, `nombreTaller`, `descripcion`, `direccion`, `telefono`, `imagen`, `latitud`, `longitud`, `idComuna_id`, `idUsuario_id`) VALUES
(1, 'EL ZAPATO', 'Taller especializado en alineación, balanceo, cambios de aceite de motor, asegurando gran calidad y buena atención.', '342, Avenida Sargento Menadier, Población Nueva Esperanza, Puente Alto, Provincia de Cordillera, Región Metropolitana de Santiago, 9480000, Chile', '+56933333333', 'taller_imagenes/9031943c6d5353510bc611c6be779b2c-zapatos-rojos-zapatillas-ropa.webp', -33.615714, -70.5710851, 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tallerservicio`
--

DROP TABLE IF EXISTS `core_tallerservicio`;
CREATE TABLE `core_tallerservicio` (
  `id` bigint(20) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `idServicio_id` int(11) NOT NULL,
  `idTaller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_tallerservicio`
--

INSERT INTO `core_tallerservicio` (`id`, `precio`, `idServicio_id`, `idTaller_id`) VALUES
(1, NULL, 3, 1),
(2, NULL, 1, 1),
(3, NULL, 19, 1),
(4, NULL, 18, 1),
(5, NULL, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_ticket`
--

DROP TABLE IF EXISTS `core_ticket`;
CREATE TABLE `core_ticket` (
  `idTicket` int(11) NOT NULL,
  `asunto` longtext NOT NULL,
  `EstadoTicket_id` int(11) NOT NULL,
  `solicitante_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Sedán'),
(2, 'SUV'),
(3, 'Camioneta'),
(4, 'Hatchback'),
(5, 'Coupe'),
(6, 'Crossover'),
(7, 'Pick-up'),
(8, 'Deportivo'),
(9, 'Minivan'),
(10, 'Furgón'),
(11, 'Camión'),
(12, 'Motocicleta'),
(13, 'Monovolumen'),
(14, 'Roadster'),
(15, 'Convertible'),
(16, 'Todoterreno'),
(17, 'Berlina'),
(18, 'Furgoneta'),
(19, 'Compacto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_usuariocustom`
--

DROP TABLE IF EXISTS `core_usuariocustom`;
CREATE TABLE `core_usuariocustom` (
  `id` bigint(20) NOT NULL,
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
(1, 'pbkdf2_sha256$390000$PdQExr2ABGh54HK9RUW3OS$wrhSkRDEDiLcrLClOja9e6GPXkinW+pD5LrkFHnCJ88=', '2025-10-21 22:30:07.423596', 1, 'admin', '', '', '', 1, 1, '2025-10-21 22:29:55.930381', '11111111-1', 'admin@fixspot.cl', '', 'Admin', 'Istrador', 'Duoc UC Sede Puente Alto', 4, 3),
(2, 'pbkdf2_sha256$390000$X2RzmvgLpeRpHPifeApeey$J1gVzyXJh6PBdFVWT43YRAeZ9kPXqFIK8ODJ5+AHijs=', NULL, 0, 'Jeffrey', '', '', '', 0, 1, '2025-10-21 22:33:47.743645', '21576345-3', 'jef.ramirez@duocuc.cl', '', 'Jeffrey', 'Ramírez', 'San Francisco 123', 4, 2),
(3, 'pbkdf2_sha256$390000$JqjGGUsWhWm4eYUzczMKZE$Swe9yK4sASAXFyy+uXNw1IX6ywD/Bm1lEGeUD8VYynk=', NULL, 0, 'Exequiel', '', '', '', 0, 1, '2025-10-21 22:34:24.210888', '21456345-4', 'ex.albornoz@duocuc.cl', '', 'Exequiel', 'Albornoz', 'San Carlos 123', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_usuariocustom_groups`
--

DROP TABLE IF EXISTS `core_usuariocustom_groups`;
CREATE TABLE `core_usuariocustom_groups` (
  `id` bigint(20) NOT NULL,
  `usuariocustom_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_usuariocustom_user_permissions`
--

DROP TABLE IF EXISTS `core_usuariocustom_user_permissions`;
CREATE TABLE `core_usuariocustom_user_permissions` (
  `id` bigint(20) NOT NULL,
  `usuariocustom_id` bigint(20) NOT NULL,
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
  `idUsuario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_vehiculo`
--

INSERT INTO `core_vehiculo` (`idVehiculo`, `patente`, `modelo`, `subModelo`, `anno`, `idMarca_id`, `idTipoVehiculo_id`, `idUsuario_id`) VALUES
(2, 'PRKG97', 'Gol', 'Comfortline', 2021, 15, 4, 1);

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
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(23, 'authtoken', 'token'),
(24, 'authtoken', 'tokenproxy'),
(4, 'contenttypes', 'contenttype'),
(7, 'core', 'agenda'),
(8, 'core', 'comuna'),
(19, 'core', 'contacto'),
(9, 'core', 'estadoagenda'),
(17, 'core', 'estadoticket'),
(22, 'core', 'formapago'),
(10, 'core', 'marca'),
(11, 'core', 'region'),
(16, 'core', 'reportepago'),
(12, 'core', 'rolusuario'),
(20, 'core', 'servicio'),
(15, 'core', 'taller'),
(21, 'core', 'tallerservicio'),
(18, 'core', 'ticket'),
(13, 'core', 'tipovehiculo'),
(6, 'core', 'usuariocustom'),
(14, 'core', 'vehiculo'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-10-21 22:13:34.355122'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-10-21 22:13:34.385898'),
(3, 'auth', '0001_initial', '2025-10-21 22:13:34.496999'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-10-21 22:13:34.524544'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-10-21 22:13:34.528928'),
(6, 'auth', '0004_alter_user_username_opts', '2025-10-21 22:13:34.532546'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-10-21 22:13:34.536187'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-10-21 22:13:34.537895'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-10-21 22:13:34.541668'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-10-21 22:13:34.545496'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-10-21 22:13:34.549715'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-10-21 22:13:34.555354'),
(13, 'auth', '0011_update_proxy_permissions', '2025-10-21 22:13:34.559043'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-10-21 22:13:34.562701'),
(15, 'core', '0001_initial', '2025-10-21 22:13:35.145190'),
(16, 'admin', '0001_initial', '2025-10-21 22:13:35.224530'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-10-21 22:13:35.235638'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-10-21 22:13:35.245750'),
(19, 'authtoken', '0001_initial', '2025-10-21 22:13:35.295493'),
(20, 'authtoken', '0002_auto_20160226_1747', '2025-10-21 22:13:35.326207'),
(21, 'authtoken', '0003_tokenproxy', '2025-10-21 22:13:35.331300'),
(22, 'authtoken', '0004_alter_tokenproxy_options', '2025-10-21 22:13:35.338229'),
(23, 'core', '0002_auto_20240617_1849', '2025-10-21 22:13:35.587535'),
(24, 'core', '0003_auto_20240617_2204', '2025-10-21 22:13:35.618433'),
(25, 'core', '0004_auto_20240618_1030', '2025-10-21 22:13:35.622786'),
(26, 'core', '0005_estadoticket_ticket', '2025-10-21 22:13:35.685506'),
(27, 'core', '0006_alter_usuariocustom_id', '2025-10-21 22:13:36.523608'),
(28, 'core', '0007_ticket_respuestaticket', '2025-10-21 22:13:36.535789'),
(29, 'core', '0008_remove_ticket_respuestaticket', '2025-10-21 22:13:36.551187'),
(30, 'core', '0009_contacto', '2025-10-21 22:13:36.558783'),
(31, 'core', '0010_contacto_telefono', '2025-10-21 22:13:36.567117'),
(32, 'core', '0011_servicio_tallerservicio', '2025-10-21 22:13:36.639600'),
(33, 'core', '0012_alter_taller_direccion', '2025-10-21 22:13:36.652491'),
(34, 'core', '0013_remove_agenda_idtipoagenda_agenda_idservicio_and_more', '2025-10-21 22:13:36.768963'),
(35, 'core', '0014_formapago_reportepago_idformapago', '2025-10-21 22:13:36.804500'),
(36, 'core', '0015_remove_formapago_descripcion', '2025-10-21 22:13:36.810544'),
(37, 'sessions', '0001_initial', '2025-10-21 22:13:36.836807');

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
('p7j7xozdkngaf8l5euae5phtb0vtbqv0', '.eJxVjEEOwiAQRe_C2hAGClSX7nsGAjODVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnERIE6_W4r44LoDusd6axJbXZc5yV2RB-1yasTP6-H-HZTYy7fOWiVvNQyObCYmIjwTGptYgeeYnEPFxrDXAyIkHI3LEZTP4EfQPov3Bwa5OIQ:1vBKrn:rV7C89LmtgkhuMP9aVrw_rsp9W-PRfuo1gnjW3IQcQ0', '2025-11-04 22:30:07.424973');

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
  ADD KEY `core_agenda_idVehiculo_id_9f7a5c22_fk_core_vehiculo_idVehiculo` (`idVehiculo_id`),
  ADD KEY `core_agenda_estado_id_9b9c4513_fk_core_estadoagenda_idEstado` (`estado_id`),
  ADD KEY `core_agenda_cliente_id_0890f683_fk` (`cliente_id`),
  ADD KEY `core_agenda_idServicio_id_d6625a2d_fk_core_servicio_idServicio` (`idServicio_id`);

--
-- Indices de la tabla `core_comuna`
--
ALTER TABLE `core_comuna`
  ADD PRIMARY KEY (`idComuna`),
  ADD KEY `core_comuna_idRegion_id_8eb1d498_fk_core_region_idRegion` (`idRegion_id`);

--
-- Indices de la tabla `core_contacto`
--
ALTER TABLE `core_contacto`
  ADD PRIMARY KEY (`idContacto`);

--
-- Indices de la tabla `core_estadoagenda`
--
ALTER TABLE `core_estadoagenda`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `core_estadoticket`
--
ALTER TABLE `core_estadoticket`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `core_formapago`
--
ALTER TABLE `core_formapago`
  ADD PRIMARY KEY (`idFormaPago`);

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
  ADD UNIQUE KEY `reserva_id` (`reserva_id`),
  ADD KEY `core_reportepago_idFormaPago_id_baba0b93_fk_core_form` (`idFormaPago_id`);

--
-- Indices de la tabla `core_rolusuario`
--
ALTER TABLE `core_rolusuario`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `core_servicio`
--
ALTER TABLE `core_servicio`
  ADD PRIMARY KEY (`idServicio`);

--
-- Indices de la tabla `core_taller`
--
ALTER TABLE `core_taller`
  ADD PRIMARY KEY (`idTaller`),
  ADD KEY `core_taller_idComuna_id_4af1bf31_fk_core_comuna_idComuna` (`idComuna_id`),
  ADD KEY `core_taller_idUsuario_id_d1356fab_fk` (`idUsuario_id`);

--
-- Indices de la tabla `core_tallerservicio`
--
ALTER TABLE `core_tallerservicio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_tallerservicio_idTaller_id_idServicio_id_bfebd2ec_uniq` (`idTaller_id`,`idServicio_id`),
  ADD KEY `core_tallerservicio_idServicio_id_9497ce81_fk_core_serv` (`idServicio_id`);

--
-- Indices de la tabla `core_ticket`
--
ALTER TABLE `core_ticket`
  ADD PRIMARY KEY (`idTicket`),
  ADD KEY `core_ticket_EstadoTicket_id_3d9bd6f1_fk_core_esta` (`EstadoTicket_id`),
  ADD KEY `core_ticket_solicitante_id_e52f4ee7_fk` (`solicitante_id`);

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
  ADD KEY `core_vehiculo_idUsuario_id_f26e460a_fk` (`idUsuario_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `core_agenda`
--
ALTER TABLE `core_agenda`
  MODIFY `idAgenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_comuna`
--
ALTER TABLE `core_comuna`
  MODIFY `idComuna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `core_contacto`
--
ALTER TABLE `core_contacto`
  MODIFY `idContacto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_estadoagenda`
--
ALTER TABLE `core_estadoagenda`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_estadoticket`
--
ALTER TABLE `core_estadoticket`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_formapago`
--
ALTER TABLE `core_formapago`
  MODIFY `idFormaPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `core_marca`
--
ALTER TABLE `core_marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `core_region`
--
ALTER TABLE `core_region`
  MODIFY `idRegion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `core_reportepago`
--
ALTER TABLE `core_reportepago`
  MODIFY `idReporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_rolusuario`
--
ALTER TABLE `core_rolusuario`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `core_servicio`
--
ALTER TABLE `core_servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `core_taller`
--
ALTER TABLE `core_taller`
  MODIFY `idTaller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `core_tallerservicio`
--
ALTER TABLE `core_tallerservicio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `core_ticket`
--
ALTER TABLE `core_ticket`
  MODIFY `idTicket` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_tipovehiculo`
--
ALTER TABLE `core_tipovehiculo`
  MODIFY `idTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `core_usuariocustom`
--
ALTER TABLE `core_usuariocustom`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `core_usuariocustom_groups`
--
ALTER TABLE `core_usuariocustom_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_usuariocustom_user_permissions`
--
ALTER TABLE `core_usuariocustom_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_vehiculo`
--
ALTER TABLE `core_vehiculo`
  MODIFY `idVehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk` FOREIGN KEY (`user_id`) REFERENCES `core_usuariocustom` (`id`);

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
  ADD CONSTRAINT `core_agenda_cliente_id_0890f683_fk` FOREIGN KEY (`cliente_id`) REFERENCES `core_usuariocustom` (`id`),
  ADD CONSTRAINT `core_agenda_estado_id_9b9c4513_fk_core_estadoagenda_idEstado` FOREIGN KEY (`estado_id`) REFERENCES `core_estadoagenda` (`idEstado`),
  ADD CONSTRAINT `core_agenda_idServicio_id_d6625a2d_fk_core_servicio_idServicio` FOREIGN KEY (`idServicio_id`) REFERENCES `core_servicio` (`idServicio`),
  ADD CONSTRAINT `core_agenda_idTaller_id_2025b2c7_fk_core_taller_idTaller` FOREIGN KEY (`idTaller_id`) REFERENCES `core_taller` (`idTaller`),
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
  ADD CONSTRAINT `core_reportepago_idFormaPago_id_baba0b93_fk_core_form` FOREIGN KEY (`idFormaPago_id`) REFERENCES `core_formapago` (`idFormaPago`),
  ADD CONSTRAINT `core_reportepago_reserva_id_e177e290_fk_core_agenda_idAgenda` FOREIGN KEY (`reserva_id`) REFERENCES `core_agenda` (`idAgenda`);

--
-- Filtros para la tabla `core_taller`
--
ALTER TABLE `core_taller`
  ADD CONSTRAINT `core_taller_idComuna_id_4af1bf31_fk_core_comuna_idComuna` FOREIGN KEY (`idComuna_id`) REFERENCES `core_comuna` (`idComuna`),
  ADD CONSTRAINT `core_taller_idUsuario_id_d1356fab_fk` FOREIGN KEY (`idUsuario_id`) REFERENCES `core_usuariocustom` (`id`);

--
-- Filtros para la tabla `core_tallerservicio`
--
ALTER TABLE `core_tallerservicio`
  ADD CONSTRAINT `core_tallerservicio_idServicio_id_9497ce81_fk_core_serv` FOREIGN KEY (`idServicio_id`) REFERENCES `core_servicio` (`idServicio`),
  ADD CONSTRAINT `core_tallerservicio_idTaller_id_d88e724c_fk_core_taller_idTaller` FOREIGN KEY (`idTaller_id`) REFERENCES `core_taller` (`idTaller`);

--
-- Filtros para la tabla `core_ticket`
--
ALTER TABLE `core_ticket`
  ADD CONSTRAINT `core_ticket_EstadoTicket_id_3d9bd6f1_fk_core_esta` FOREIGN KEY (`EstadoTicket_id`) REFERENCES `core_estadoticket` (`idEstado`),
  ADD CONSTRAINT `core_ticket_solicitante_id_e52f4ee7_fk` FOREIGN KEY (`solicitante_id`) REFERENCES `core_usuariocustom` (`id`);

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
  ADD CONSTRAINT `core_usuariocustom_groups_group_id_8dcd6d1a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `core_usuariocustom_groups_usuariocustom_id_5965550d_fk` FOREIGN KEY (`usuariocustom_id`) REFERENCES `core_usuariocustom` (`id`);

--
-- Filtros para la tabla `core_usuariocustom_user_permissions`
--
ALTER TABLE `core_usuariocustom_user_permissions`
  ADD CONSTRAINT `core_usuariocustom_u_permission_id_37c6eea2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `core_usuariocustom_user_permissions_usuariocustom_id_a30f26bf_fk` FOREIGN KEY (`usuariocustom_id`) REFERENCES `core_usuariocustom` (`id`);

--
-- Filtros para la tabla `core_vehiculo`
--
ALTER TABLE `core_vehiculo`
  ADD CONSTRAINT `core_vehiculo_idMarca_id_c736a35f_fk_core_marca_idMarca` FOREIGN KEY (`idMarca_id`) REFERENCES `core_marca` (`idMarca`),
  ADD CONSTRAINT `core_vehiculo_idTipoVehiculo_id_69f4a65b_fk_core_tipo` FOREIGN KEY (`idTipoVehiculo_id`) REFERENCES `core_tipovehiculo` (`idTipo`),
  ADD CONSTRAINT `core_vehiculo_idUsuario_id_f26e460a_fk` FOREIGN KEY (`idUsuario_id`) REFERENCES `core_usuariocustom` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `core_usuariocustom` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
