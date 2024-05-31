-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2024 a las 01:16:18
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
-- Base de datos: `fixspotbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

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
(25, 'Can add boleta', 7, 'add_boleta'),
(26, 'Can change boleta', 7, 'change_boleta'),
(27, 'Can delete boleta', 7, 'delete_boleta'),
(28, 'Can view boleta', 7, 'view_boleta'),
(29, 'Can add comuna', 8, 'add_comuna'),
(30, 'Can change comuna', 8, 'change_comuna'),
(31, 'Can delete comuna', 8, 'delete_comuna'),
(32, 'Can view comuna', 8, 'view_comuna'),
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
(61, 'Can add agenda', 16, 'add_agenda'),
(62, 'Can change agenda', 16, 'change_agenda'),
(63, 'Can delete agenda', 16, 'delete_agenda'),
(64, 'Can view agenda', 16, 'view_agenda'),
(65, 'Can add detalle boleta', 17, 'add_detalleboleta'),
(66, 'Can change detalle boleta', 17, 'change_detalleboleta'),
(67, 'Can delete detalle boleta', 17, 'delete_detalleboleta'),
(68, 'Can view detalle boleta', 17, 'view_detalleboleta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_agenda`
--

CREATE TABLE `core_agenda` (
  `idAgenda` int(11) NOT NULL,
  `fechaAgenda` date NOT NULL,
  `fechaAtencion` date NOT NULL,
  `horaAtencion` time(6) NOT NULL,
  `idTaller_id` int(11) NOT NULL,
  `idTipoAgenda_id` int(11) NOT NULL,
  `idVehiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_boleta`
--

CREATE TABLE `core_boleta` (
  `nFolio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `montoNeto` int(11) NOT NULL,
  `iva` int(11) NOT NULL,
  `montoTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_comuna`
--

CREATE TABLE `core_comuna` (
  `idComuna` int(11) NOT NULL,
  `nombreComuna` varchar(80) NOT NULL,
  `idRegion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_comuna`
--

INSERT INTO `core_comuna` (`idComuna`, `nombreComuna`, `idRegion_id`) VALUES
(1, 'Cerrillos', 1),
(2, 'Cerro Navia', 1),
(3, 'Conchalí', 1),
(4, 'El Bosque', 1),
(5, 'Estación Central', 1),
(6, 'Huechuraba', 1),
(7, 'Independencia', 1),
(8, 'La Cisterna', 1),
(9, 'La Florida', 1),
(10, 'La Granja', 1),
(11, 'La Pintana', 1),
(12, 'La Reina', 1),
(13, 'Las Condes', 1),
(14, 'Lo Barnechea', 1),
(15, 'Lo Espejo', 1),
(16, 'Lo Prado', 1),
(17, 'Macul', 1),
(18, 'Maipú', 1),
(19, 'Ñuñoa', 1),
(20, 'Pedro Aguirre Cerda', 1),
(21, 'Peñalolén', 1),
(22, 'Providencia', 1),
(23, 'Pudahuel', 1),
(24, 'Quilicura', 1),
(25, 'Quinta Normal', 1),
(26, 'Recoleta', 1),
(27, 'Renca', 1),
(28, 'San Joaquín', 1),
(29, 'San Miguel', 1),
(30, 'San Ramón', 1),
(31, 'Santiago', 1),
(32, 'Vitacura', 1),
(33, 'Puente Alto', 1),
(34, 'Pirque', 1),
(35, 'San José de Maipo', 1),
(36, 'Colina', 1),
(37, 'Lampa', 1),
(38, 'Tiltil', 1),
(39, 'San Bernardo', 1),
(40, 'Buin', 1),
(41, 'Calera de Tango', 1),
(42, 'Paine', 1),
(43, 'Melipilla', 1),
(44, 'Alhué', 1),
(45, 'Curacaví', 1),
(46, 'María Pinto', 1),
(47, 'San Pedro', 1),
(48, 'Talagante', 1),
(49, 'El Monte', 1),
(50, 'Isla de Maipo', 1),
(51, 'Padre Hurtado', 1),
(52, 'Peñaflor', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_detalleboleta`
--

CREATE TABLE `core_detalleboleta` (
  `idDetalle` int(11) NOT NULL,
  `nombreDetalle` varchar(100) NOT NULL,
  `montoDetalle` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `idAgenda_id` int(11) NOT NULL,
  `nFolio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_marca`
--

CREATE TABLE `core_marca` (
  `idMarca` int(11) NOT NULL,
  `nombreMarca` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_region`
--

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
-- Estructura de tabla para la tabla `core_rolusuario`
--

CREATE TABLE `core_rolusuario` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_rolusuario`
--

INSERT INTO `core_rolusuario` (`idRol`, `nombreRol`) VALUES
(1, 'Cliente'),
(2, 'Encargado Taller'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_taller`
--

CREATE TABLE `core_taller` (
  `idTaller` int(11) NOT NULL,
  `nombreTaller` varchar(46) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `idComuna_id` int(11) DEFAULT NULL,
  `idUsuario_id` bigint(20) DEFAULT NULL,
  `descripcion` longtext DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_taller`
--

INSERT INTO `core_taller` (`idTaller`, `nombreTaller`, `direccion`, `telefono`, `idComuna_id`, `idUsuario_id`, `descripcion`, `imagen`) VALUES
(3, 'El Zapato', 'Sargento Menadier, 123', '+569 5319 2023', 33, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tipoagenda`
--

CREATE TABLE `core_tipoagenda` (
  `idTipo` int(11) NOT NULL,
  `nombreTipo` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tipovehiculo`
--

CREATE TABLE `core_tipovehiculo` (
  `idTipo` int(11) NOT NULL,
  `nombreTipo` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_usuariocustom`
--

CREATE TABLE `core_usuariocustom` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `run` varchar(12) NOT NULL,
  `email` varchar(254) NOT NULL,
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

INSERT INTO `core_usuariocustom` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `run`, `email`, `telefono`, `pnombre`, `ap_paterno`, `direccion`, `idComuna_id`, `idRol_id`) VALUES
(2, 'pbkdf2_sha256$720000$WntgIfcEPVWRiAbkIH76aS$Nrek+eAD5TSa6CtifZLfcID/lRYAwmWaLAJ4vjYv21E=', '2024-05-30 21:31:46.487744', 1, 'admin', '', '', 1, 1, '2024-05-28 00:32:17.739689', '', 'admin@ferremas.cl', '', 'Administrador', '.', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_usuariocustom_groups`
--

CREATE TABLE `core_usuariocustom_groups` (
  `id` int(11) NOT NULL,
  `usuariocustom_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_usuariocustom_user_permissions`
--

CREATE TABLE `core_usuariocustom_user_permissions` (
  `id` int(11) NOT NULL,
  `usuariocustom_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_vehiculo`
--

CREATE TABLE `core_vehiculo` (
  `idVehiculo` int(11) NOT NULL,
  `patente` varchar(6) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `subModelo` varchar(20) NOT NULL,
  `anno` int(11) NOT NULL,
  `idMarca_id` int(11) NOT NULL,
  `idTipoVehiculo_id` int(11) NOT NULL,
  `idUsuario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

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
(4, 'contenttypes', 'contenttype'),
(16, 'core', 'agenda'),
(7, 'core', 'boleta'),
(8, 'core', 'comuna'),
(17, 'core', 'detalleboleta'),
(9, 'core', 'marca'),
(10, 'core', 'region'),
(11, 'core', 'rolusuario'),
(15, 'core', 'taller'),
(12, 'core', 'tipoagenda'),
(13, 'core', 'tipovehiculo'),
(6, 'core', 'usuariocustom'),
(14, 'core', 'vehiculo'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

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
(1, 'contenttypes', '0001_initial', '2024-05-28 00:02:07.647013'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-05-28 00:02:07.682652'),
(3, 'auth', '0001_initial', '2024-05-28 00:02:07.722688'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-05-28 00:02:07.844251'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-05-28 00:02:07.848839'),
(6, 'auth', '0004_alter_user_username_opts', '2024-05-28 00:02:07.853435'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-05-28 00:02:07.859930'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-05-28 00:02:07.862496'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-05-28 00:02:07.867883'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-05-28 00:02:07.873435'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-05-28 00:02:07.879134'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-05-28 00:02:07.886874'),
(13, 'auth', '0011_update_proxy_permissions', '2024-05-28 00:02:07.893688'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-05-28 00:02:07.900522'),
(15, 'core', '0001_initial', '2024-05-28 00:02:08.129807'),
(16, 'admin', '0001_initial', '2024-05-28 00:02:08.447030'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-05-28 00:02:08.511307'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-28 00:02:08.522301'),
(19, 'sessions', '0001_initial', '2024-05-28 00:02:08.534188'),
(20, 'core', '0002_detalleboleta', '2024-05-30 21:32:27.334149'),
(21, 'core', '0003_delete_detalleboleta', '2024-05-30 21:32:27.340753'),
(22, 'core', '0004_detalleboleta', '2024-05-30 21:32:27.407725'),
(23, 'core', '0005_alter_usuariocustom_id', '2024-05-30 21:32:28.208800'),
(24, 'core', '0006_taller_descripcion_taller_imagen', '2024-05-31 22:56:53.184188');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('rei8lpt1i9trh9xnwse6hynrficepl4t', '.eJxVjEEOwiAQRe_C2pAOU6Dj0r1nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIslDj9bsHHR6o74LuvtyZjq-syB7kr8qBdXhun5-Vw_w6K7-VbY2TwWRFBhJhREwONg54sKUoUMqI2ozaIyGyTGrInTiHYSQMgKCPeH9IvNyE:1sCnNC:LHb9X1HQ5PEiQX9AVDi9_Vx5rtAcH7cjw9gAL-twkKQ', '2024-06-13 21:31:46.489247');

--
-- Índices para tablas volcadas
--

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
  ADD KEY `core_agenda_idVehiculo_id_9f7a5c22_fk_core_vehiculo_idVehiculo` (`idVehiculo_id`);

--
-- Indices de la tabla `core_boleta`
--
ALTER TABLE `core_boleta`
  ADD PRIMARY KEY (`nFolio`);

--
-- Indices de la tabla `core_comuna`
--
ALTER TABLE `core_comuna`
  ADD PRIMARY KEY (`idComuna`),
  ADD KEY `core_comuna_idRegion_id_8eb1d498_fk_core_region_idRegion` (`idRegion_id`);

--
-- Indices de la tabla `core_detalleboleta`
--
ALTER TABLE `core_detalleboleta`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `core_detalleboleta_idAgenda_id_60e5f8b7_fk_core_agenda_idAgenda` (`idAgenda_id`),
  ADD KEY `core_detalleboleta_nFolio_id_0442b1b5_fk_core_boleta_nFolio` (`nFolio_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `core_agenda`
--
ALTER TABLE `core_agenda`
  MODIFY `idAgenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_boleta`
--
ALTER TABLE `core_boleta`
  MODIFY `nFolio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_comuna`
--
ALTER TABLE `core_comuna`
  MODIFY `idComuna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `core_detalleboleta`
--
ALTER TABLE `core_detalleboleta`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_marca`
--
ALTER TABLE `core_marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_region`
--
ALTER TABLE `core_region`
  MODIFY `idRegion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `core_rolusuario`
--
ALTER TABLE `core_rolusuario`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `core_taller`
--
ALTER TABLE `core_taller`
  MODIFY `idTaller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `core_tipoagenda`
--
ALTER TABLE `core_tipoagenda`
  MODIFY `idTipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_tipovehiculo`
--
ALTER TABLE `core_tipovehiculo`
  MODIFY `idTipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_usuariocustom`
--
ALTER TABLE `core_usuariocustom`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `idVehiculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

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
  ADD CONSTRAINT `core_agenda_idTaller_id_2025b2c7_fk_core_taller_idTaller` FOREIGN KEY (`idTaller_id`) REFERENCES `core_taller` (`idTaller`),
  ADD CONSTRAINT `core_agenda_idTipoAgenda_id_dfcbc29a_fk_core_tipoagenda_idTipo` FOREIGN KEY (`idTipoAgenda_id`) REFERENCES `core_tipoagenda` (`idTipo`),
  ADD CONSTRAINT `core_agenda_idVehiculo_id_9f7a5c22_fk_core_vehiculo_idVehiculo` FOREIGN KEY (`idVehiculo_id`) REFERENCES `core_vehiculo` (`idVehiculo`);

--
-- Filtros para la tabla `core_comuna`
--
ALTER TABLE `core_comuna`
  ADD CONSTRAINT `core_comuna_idRegion_id_8eb1d498_fk_core_region_idRegion` FOREIGN KEY (`idRegion_id`) REFERENCES `core_region` (`idRegion`);

--
-- Filtros para la tabla `core_detalleboleta`
--
ALTER TABLE `core_detalleboleta`
  ADD CONSTRAINT `core_detalleboleta_idAgenda_id_60e5f8b7_fk_core_agenda_idAgenda` FOREIGN KEY (`idAgenda_id`) REFERENCES `core_agenda` (`idAgenda`),
  ADD CONSTRAINT `core_detalleboleta_nFolio_id_0442b1b5_fk_core_boleta_nFolio` FOREIGN KEY (`nFolio_id`) REFERENCES `core_boleta` (`nFolio`);

--
-- Filtros para la tabla `core_taller`
--
ALTER TABLE `core_taller`
  ADD CONSTRAINT `core_taller_idComuna_id_4af1bf31_fk_core_comuna_idComuna` FOREIGN KEY (`idComuna_id`) REFERENCES `core_comuna` (`idComuna`),
  ADD CONSTRAINT `core_taller_idUsuario_id_d1356fab_fk` FOREIGN KEY (`idUsuario_id`) REFERENCES `core_usuariocustom` (`id`);

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
