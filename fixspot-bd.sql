-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: fixspot-bd
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_usuariocustom'),(22,'Can change user',6,'change_usuariocustom'),(23,'Can delete user',6,'delete_usuariocustom'),(24,'Can view user',6,'view_usuariocustom'),(25,'Can add agenda',7,'add_agenda'),(26,'Can change agenda',7,'change_agenda'),(27,'Can delete agenda',7,'delete_agenda'),(28,'Can view agenda',7,'view_agenda'),(29,'Can add comuna',8,'add_comuna'),(30,'Can change comuna',8,'change_comuna'),(31,'Can delete comuna',8,'delete_comuna'),(32,'Can view comuna',8,'view_comuna'),(33,'Can add estado agenda',9,'add_estadoagenda'),(34,'Can change estado agenda',9,'change_estadoagenda'),(35,'Can delete estado agenda',9,'delete_estadoagenda'),(36,'Can view estado agenda',9,'view_estadoagenda'),(37,'Can add marca',10,'add_marca'),(38,'Can change marca',10,'change_marca'),(39,'Can delete marca',10,'delete_marca'),(40,'Can view marca',10,'view_marca'),(41,'Can add region',11,'add_region'),(42,'Can change region',11,'change_region'),(43,'Can delete region',11,'delete_region'),(44,'Can view region',11,'view_region'),(45,'Can add rol usuario',12,'add_rolusuario'),(46,'Can change rol usuario',12,'change_rolusuario'),(47,'Can delete rol usuario',12,'delete_rolusuario'),(48,'Can view rol usuario',12,'view_rolusuario'),(49,'Permiso para Cliente',12,'cliente_permiso'),(50,'Permiso para Encargado de Taller',12,'encargado_taller_permiso'),(51,'Permiso para Administrador',12,'administrador_permiso'),(52,'Can add tipo vehiculo',13,'add_tipovehiculo'),(53,'Can change tipo vehiculo',13,'change_tipovehiculo'),(54,'Can delete tipo vehiculo',13,'delete_tipovehiculo'),(55,'Can view tipo vehiculo',13,'view_tipovehiculo'),(56,'Can add vehiculo',14,'add_vehiculo'),(57,'Can change vehiculo',14,'change_vehiculo'),(58,'Can delete vehiculo',14,'delete_vehiculo'),(59,'Can view vehiculo',14,'view_vehiculo'),(60,'Can add taller',15,'add_taller'),(61,'Can change taller',15,'change_taller'),(62,'Can delete taller',15,'delete_taller'),(63,'Can view taller',15,'view_taller'),(64,'Can add reporte pago',16,'add_reportepago'),(65,'Can change reporte pago',16,'change_reportepago'),(66,'Can delete reporte pago',16,'delete_reportepago'),(67,'Can view reporte pago',16,'view_reportepago'),(68,'Can add estado ticket',17,'add_estadoticket'),(69,'Can change estado ticket',17,'change_estadoticket'),(70,'Can delete estado ticket',17,'delete_estadoticket'),(71,'Can view estado ticket',17,'view_estadoticket'),(72,'Can add ticket',18,'add_ticket'),(73,'Can change ticket',18,'change_ticket'),(74,'Can delete ticket',18,'delete_ticket'),(75,'Can view ticket',18,'view_ticket'),(76,'Can add contacto',19,'add_contacto'),(77,'Can change contacto',19,'change_contacto'),(78,'Can delete contacto',19,'delete_contacto'),(79,'Can view contacto',19,'view_contacto'),(80,'Can add servicio',20,'add_servicio'),(81,'Can change servicio',20,'change_servicio'),(82,'Can delete servicio',20,'delete_servicio'),(83,'Can view servicio',20,'view_servicio'),(84,'Can add taller servicio',21,'add_tallerservicio'),(85,'Can change taller servicio',21,'change_tallerservicio'),(86,'Can delete taller servicio',21,'delete_tallerservicio'),(87,'Can view taller servicio',21,'view_tallerservicio'),(88,'Can add forma pago',22,'add_formapago'),(89,'Can change forma pago',22,'change_formapago'),(90,'Can delete forma pago',22,'delete_formapago'),(91,'Can view forma pago',22,'view_formapago'),(92,'Can add Token',23,'add_token'),(93,'Can change Token',23,'change_token'),(94,'Can delete Token',23,'delete_token'),(95,'Can view Token',23,'view_token'),(96,'Can add Token',24,'add_tokenproxy'),(97,'Can change Token',24,'change_tokenproxy'),(98,'Can delete Token',24,'delete_tokenproxy'),(99,'Can view Token',24,'view_tokenproxy'),(100,'Can add calificacion taller',25,'add_calificaciontaller'),(101,'Can change calificacion taller',25,'change_calificaciontaller'),(102,'Can delete calificacion taller',25,'delete_calificaciontaller'),(103,'Can view calificacion taller',25,'view_calificaciontaller'),(104,'Can add favorito taller',26,'add_favoritotaller'),(105,'Can change favorito taller',26,'change_favoritotaller'),(106,'Can delete favorito taller',26,'delete_favoritotaller'),(107,'Can view favorito taller',26,'view_favoritotaller'),(108,'Can add preferencias usuario',27,'add_preferenciasusuario'),(109,'Can change preferencias usuario',27,'change_preferenciasusuario'),(110,'Can delete preferencias usuario',27,'delete_preferenciasusuario'),(111,'Can view preferencias usuario',27,'view_preferenciasusuario');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk` FOREIGN KEY (`user_id`) REFERENCES `core_usuariocustom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_agenda`
--

DROP TABLE IF EXISTS `core_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_agenda` (
  `idAgenda` int NOT NULL AUTO_INCREMENT,
  `fechaAtencion` date NOT NULL,
  `horaAtencion` time(6) NOT NULL,
  `cliente_id` bigint NOT NULL,
  `estado_id` int DEFAULT NULL,
  `idTaller_id` int NOT NULL,
  `idVehiculo_id` int NOT NULL,
  `idServicio_id` int NOT NULL,
  PRIMARY KEY (`idAgenda`),
  KEY `core_agenda_idTaller_id_2025b2c7_fk_core_taller_idTaller` (`idTaller_id`),
  KEY `core_agenda_idVehiculo_id_9f7a5c22_fk_core_vehiculo_idVehiculo` (`idVehiculo_id`),
  KEY `core_agenda_estado_id_9b9c4513_fk_core_estadoagenda_idEstado` (`estado_id`),
  KEY `core_agenda_cliente_id_0890f683_fk` (`cliente_id`),
  KEY `core_agenda_idServicio_id_d6625a2d_fk_core_servicio_idServicio` (`idServicio_id`),
  CONSTRAINT `core_agenda_cliente_id_0890f683_fk` FOREIGN KEY (`cliente_id`) REFERENCES `core_usuariocustom` (`id`),
  CONSTRAINT `core_agenda_estado_id_9b9c4513_fk_core_estadoagenda_idEstado` FOREIGN KEY (`estado_id`) REFERENCES `core_estadoagenda` (`idEstado`),
  CONSTRAINT `core_agenda_idServicio_id_d6625a2d_fk_core_servicio_idServicio` FOREIGN KEY (`idServicio_id`) REFERENCES `core_servicio` (`idServicio`),
  CONSTRAINT `core_agenda_idTaller_id_2025b2c7_fk_core_taller_idTaller` FOREIGN KEY (`idTaller_id`) REFERENCES `core_taller` (`idTaller`),
  CONSTRAINT `core_agenda_idVehiculo_id_9f7a5c22_fk_core_vehiculo_idVehiculo` FOREIGN KEY (`idVehiculo_id`) REFERENCES `core_vehiculo` (`idVehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_agenda`
--

LOCK TABLES `core_agenda` WRITE;
/*!40000 ALTER TABLE `core_agenda` DISABLE KEYS */;
INSERT INTO `core_agenda` VALUES (1,'2025-10-23','09:00:00.000000',3,3,1,3,3),(2,'2025-10-24','13:00:00.000000',4,3,1,4,1),(3,'2025-10-27','15:00:00.000000',3,3,2,3,4),(4,'2025-10-27','09:00:00.000000',1,3,2,2,4),(5,'2025-10-28','12:00:00.000000',1,3,1,2,18),(6,'2025-10-30','16:00:00.000000',3,3,3,3,6),(7,'2025-10-28','10:00:00.000000',4,3,3,4,8),(8,'2025-10-31','13:00:00.000000',3,3,2,3,4),(9,'2025-11-04','17:00:00.000000',4,2,1,4,3);
/*!40000 ALTER TABLE `core_agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_calificaciontaller`
--

DROP TABLE IF EXISTS `core_calificaciontaller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_calificaciontaller` (
  `idCalificacion` int NOT NULL AUTO_INCREMENT,
  `calificacion` int NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `idTaller_id` int NOT NULL,
  `idUsuario_id` bigint NOT NULL,
  PRIMARY KEY (`idCalificacion`),
  KEY `core_calificaciontal_idTaller_id_92a15206_fk_core_tall` (`idTaller_id`),
  KEY `core_calificaciontal_idUsuario_id_671bd574_fk_core_usua` (`idUsuario_id`),
  CONSTRAINT `core_calificaciontal_idTaller_id_92a15206_fk_core_tall` FOREIGN KEY (`idTaller_id`) REFERENCES `core_taller` (`idTaller`),
  CONSTRAINT `core_calificaciontal_idUsuario_id_671bd574_fk_core_usua` FOREIGN KEY (`idUsuario_id`) REFERENCES `core_usuariocustom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_calificaciontaller`
--

LOCK TABLES `core_calificaciontaller` WRITE;
/*!40000 ALTER TABLE `core_calificaciontaller` DISABLE KEYS */;
INSERT INTO `core_calificaciontaller` VALUES (1,1,'2025-10-22 01:53:33.031959',2,3),(2,3,'2025-10-22 14:26:59.182261',2,1),(3,2,'2025-10-22 14:29:36.633532',1,1),(5,4,'2025-10-22 15:15:30.050098',3,3),(6,5,'2025-10-22 16:02:27.093131',3,4),(7,4,'2025-10-22 18:42:39.824320',2,3);
/*!40000 ALTER TABLE `core_calificaciontaller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_comuna`
--

DROP TABLE IF EXISTS `core_comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_comuna` (
  `idComuna` int NOT NULL AUTO_INCREMENT,
  `nombreComuna` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `idRegion_id` int NOT NULL,
  PRIMARY KEY (`idComuna`),
  KEY `core_comuna_idRegion_id_8eb1d498_fk_core_region_idRegion` (`idRegion_id`),
  CONSTRAINT `core_comuna_idRegion_id_8eb1d498_fk_core_region_idRegion` FOREIGN KEY (`idRegion_id`) REFERENCES `core_region` (`idRegion`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_comuna`
--

LOCK TABLES `core_comuna` WRITE;
/*!40000 ALTER TABLE `core_comuna` DISABLE KEYS */;
INSERT INTO `core_comuna` VALUES (1,'Colina',1),(2,'Lampa',1),(3,'Tiltil',1),(4,'Puente Alto',1),(5,'Pirque',1),(6,'San José de Maipo',1),(7,'San Bernardo',1),(8,'Calera de Tango',1),(9,'Buin',1),(10,'Paine',1),(11,'Melipilla',1),(12,'Alhué',1),(13,'Curacaví',1),(14,'María Pinto',1),(15,'San Pedro',1),(16,'Cerrillos',1),(17,'Conchalí',1),(18,'Estación Central',1),(19,'La Florida',1),(20,'Maipú',1),(21,'Ñuñoa',1),(22,'Providencia',1),(23,'Renca',1),(24,'Santiago',1),(25,'Vitacura',1),(26,'La Reina',1),(27,'Macul',1),(28,'Peñalolén',1),(29,'Pudahuel',1),(30,'San Miguel',1),(31,'Huechuraba',1),(32,'Independencia',1),(33,'Recoleta',1),(34,'El Bosque',1),(35,'La Pintana',1),(36,'San Joaquín',1),(37,'Villa Alemana',1),(38,'Talagante',1),(39,'El Monte',1),(40,'Isla de Maipo',1),(41,'Padre Hurtado',1),(42,'Peñaflor',1);
/*!40000 ALTER TABLE `core_comuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_contacto`
--

DROP TABLE IF EXISTS `core_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_contacto` (
  `idContacto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `asunto` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idContacto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_contacto`
--

LOCK TABLES `core_contacto` WRITE;
/*!40000 ALTER TABLE `core_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_estadoagenda`
--

DROP TABLE IF EXISTS `core_estadoagenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_estadoagenda` (
  `idEstado` int NOT NULL AUTO_INCREMENT,
  `nombreEstado` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_estadoagenda`
--

LOCK TABLES `core_estadoagenda` WRITE;
/*!40000 ALTER TABLE `core_estadoagenda` DISABLE KEYS */;
INSERT INTO `core_estadoagenda` VALUES (1,'En proceso'),(2,'Por pagar'),(3,'Pagado');
/*!40000 ALTER TABLE `core_estadoagenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_estadoticket`
--

DROP TABLE IF EXISTS `core_estadoticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_estadoticket` (
  `idEstado` int NOT NULL AUTO_INCREMENT,
  `NombreEstado` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_estadoticket`
--

LOCK TABLES `core_estadoticket` WRITE;
/*!40000 ALTER TABLE `core_estadoticket` DISABLE KEYS */;
INSERT INTO `core_estadoticket` VALUES (1,'Pendiente'),(2,'Aceptado'),(3,'Rechazado');
/*!40000 ALTER TABLE `core_estadoticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_favoritotaller`
--

DROP TABLE IF EXISTS `core_favoritotaller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_favoritotaller` (
  `idFav` int NOT NULL AUTO_INCREMENT,
  `taller_id` int NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`idFav`),
  UNIQUE KEY `core_favoritotaller_usuario_id_taller_id_3b22ad4a_uniq` (`usuario_id`,`taller_id`),
  KEY `core_favoritotaller_taller_id_0fe60bc2_fk_core_taller_idTaller` (`taller_id`),
  CONSTRAINT `core_favoritotaller_taller_id_0fe60bc2_fk_core_taller_idTaller` FOREIGN KEY (`taller_id`) REFERENCES `core_taller` (`idTaller`),
  CONSTRAINT `core_favoritotaller_usuario_id_ec38caed_fk_core_usuariocustom_id` FOREIGN KEY (`usuario_id`) REFERENCES `core_usuariocustom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_favoritotaller`
--

LOCK TABLES `core_favoritotaller` WRITE;
/*!40000 ALTER TABLE `core_favoritotaller` DISABLE KEYS */;
INSERT INTO `core_favoritotaller` VALUES (2,3,3);
/*!40000 ALTER TABLE `core_favoritotaller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_formapago`
--

DROP TABLE IF EXISTS `core_formapago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_formapago` (
  `idFormaPago` int NOT NULL AUTO_INCREMENT,
  `nombreFormaPago` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idFormaPago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_formapago`
--

LOCK TABLES `core_formapago` WRITE;
/*!40000 ALTER TABLE `core_formapago` DISABLE KEYS */;
INSERT INTO `core_formapago` VALUES (1,'Paypal'),(2,'Efectivo');
/*!40000 ALTER TABLE `core_formapago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_marca`
--

DROP TABLE IF EXISTS `core_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_marca` (
  `idMarca` int NOT NULL AUTO_INCREMENT,
  `nombreMarca` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_marca`
--

LOCK TABLES `core_marca` WRITE;
/*!40000 ALTER TABLE `core_marca` DISABLE KEYS */;
INSERT INTO `core_marca` VALUES (1,'Toyota'),(2,'Chevrolet'),(3,'Ford'),(4,'Nissan'),(5,'Hyundai'),(6,'Kia'),(7,'Honda'),(8,'Mazda'),(9,'Renault'),(10,'Peugeot'),(11,'Fiat'),(12,'Chrysler'),(13,'Subaru'),(14,'Mitsubishi'),(15,'Volkswagen'),(16,'Dodge'),(17,'Suzuki'),(18,'Citroën'),(19,'Opel'),(20,'BMW'),(21,'Jeep'),(22,'Seat'),(23,'Land Rover');
/*!40000 ALTER TABLE `core_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_preferenciasusuario`
--

DROP TABLE IF EXISTS `core_preferenciasusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_preferenciasusuario` (
  `usuario_id` bigint NOT NULL,
  `acepta_promociones` tinyint(1) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `core_preferenciasusu_usuario_id_e01ac886_fk_core_usua` FOREIGN KEY (`usuario_id`) REFERENCES `core_usuariocustom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_preferenciasusuario`
--

LOCK TABLES `core_preferenciasusuario` WRITE;
/*!40000 ALTER TABLE `core_preferenciasusuario` DISABLE KEYS */;
INSERT INTO `core_preferenciasusuario` VALUES (1,1),(3,1),(9,0);
/*!40000 ALTER TABLE `core_preferenciasusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_region`
--

DROP TABLE IF EXISTS `core_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_region` (
  `idRegion` int NOT NULL AUTO_INCREMENT,
  `nombreRegion` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idRegion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_region`
--

LOCK TABLES `core_region` WRITE;
/*!40000 ALTER TABLE `core_region` DISABLE KEYS */;
INSERT INTO `core_region` VALUES (1,'Región Metropolitana');
/*!40000 ALTER TABLE `core_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_reportepago`
--

DROP TABLE IF EXISTS `core_reportepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_reportepago` (
  `idReporte` int NOT NULL AUTO_INCREMENT,
  `comentario` longtext COLLATE utf8mb4_general_ci,
  `monto` decimal(10,2) NOT NULL,
  `reserva_id` int NOT NULL,
  `idFormaPago_id` int DEFAULT NULL,
  PRIMARY KEY (`idReporte`),
  UNIQUE KEY `reserva_id` (`reserva_id`),
  KEY `core_reportepago_idFormaPago_id_baba0b93_fk_core_form` (`idFormaPago_id`),
  CONSTRAINT `core_reportepago_idFormaPago_id_baba0b93_fk_core_form` FOREIGN KEY (`idFormaPago_id`) REFERENCES `core_formapago` (`idFormaPago`),
  CONSTRAINT `core_reportepago_reserva_id_e177e290_fk_core_agenda_idAgenda` FOREIGN KEY (`reserva_id`) REFERENCES `core_agenda` (`idAgenda`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_reportepago`
--

LOCK TABLES `core_reportepago` WRITE;
/*!40000 ALTER TABLE `core_reportepago` DISABLE KEYS */;
INSERT INTO `core_reportepago` VALUES (1,'Se realizo alineación a las ruedas delanteras del vehículo, posterior se realizo un balanceo general.',15000.00,1,NULL),(2,'Se realiza cambio de aceite al vehículo, con un aceite de máxima calidad.',14000.00,2,NULL),(3,'Cambio de neumáticos a dos ruedas.',12000.00,3,NULL),(4,'Cambio de llantas trasera, por unas provisionales.',5000.00,4,NULL),(5,'Se realiza todo',3000.00,5,NULL),(6,'N/A',2000.00,6,NULL),(7,'n/a',1000.00,7,NULL),(8,'N/A',2000.00,8,NULL),(9,'aaaaaaaaaaaaaaa',200.00,9,NULL);
/*!40000 ALTER TABLE `core_reportepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_rolusuario`
--

DROP TABLE IF EXISTS `core_rolusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_rolusuario` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombreRol` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_rolusuario`
--

LOCK TABLES `core_rolusuario` WRITE;
/*!40000 ALTER TABLE `core_rolusuario` DISABLE KEYS */;
INSERT INTO `core_rolusuario` VALUES (1,'Cliente'),(2,'Encargado taller'),(3,'Administrador');
/*!40000 ALTER TABLE `core_rolusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_servicio`
--

DROP TABLE IF EXISTS `core_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_servicio` (
  `idServicio` int NOT NULL AUTO_INCREMENT,
  `nombreServicio` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_servicio`
--

LOCK TABLES `core_servicio` WRITE;
/*!40000 ALTER TABLE `core_servicio` DISABLE KEYS */;
INSERT INTO `core_servicio` VALUES (1,'Cambio de aceite','Servicio de cambio de aceite del motor con revisión de filtros y líquidos.'),(2,'Revisión de frenos','Revisión de frenos, pastillas, discos y sistema de frenado.'),(3,'Alineación y balanceo','Alineación de dirección y balanceo de ruedas para mejorar la estabilidad.'),(4,'Cambio de llantas','Reemplazo de llantas y revisión de la presión y desgaste de las mismas.'),(5,'Revisión de suspensión','Revisión y reparación de suspensión, amortiguadores y resortes.'),(6,'Reemplazo de baterías','Cambio de batería del vehículo con revisión de sistema eléctrico.'),(7,'Frenos y pastillas','Reemplazo de pastillas de freno y revisión del sistema de frenado.'),(8,'Reparación de embrague','Diagnóstico y reparación del sistema de embrague del vehículo.'),(9,'Cambio de bujías','Reemplazo de bujías y revisión del sistema de encendido.'),(10,'Revisión de dirección','Chequeo del sistema de dirección, sin problemas de alineación.'),(11,'Reemplazo de correas','Cambio de correas de distribución y accesorios del motor.'),(12,'Servicio de aire acondicionado','Revisión y reparación del sistema de aire acondicionado del vehículo.'),(13,'Reparación de radiadores','Reemplazo y reparación de radiadores del sistema de refrigeración.'),(14,'Reemplazo de filtros de aire','Cambio de filtros de aire para mejorar el rendimiento del motor.'),(15,'Chequeo de sistema de escape','Inspección del sistema de escape para verificar fugas o daños.'),(16,'Servicio de iluminación','Revisión y cambio de luces del vehículo, incluyendo faros y bombillas.'),(17,'Inspección de sistema de carga','Chequeo del alternador y sistema de carga del vehículo.'),(18,'Reparación de suspensión trasera','Reparación de la suspensión trasera y elementos relacionados.'),(19,'Cambio de filtros de aceite','Reemplazo de los filtros de aceite del motor.'),(20,'Reemplazo de bombas de agua','Reemplazo de bombas de agua y sistema de enfriamiento del motor.'),(21,'Revisión de sistema eléctrico','Inspección y reparación de sistema eléctrico del vehículo.'),(22,'Reemplazo de pastillas de freno','Cambio de pastillas de freno trasero y delantero.'),(23,'Reparación de parabrisas','Reparación de grietas y rayones en el parabrisas del vehículo.'),(24,'Limpieza de inyectores','Limpieza y mantenimiento del sistema de inyectores de combustible.'),(25,'Ajuste de carburador','Ajuste y mantenimiento del carburador del vehículo para optimizar el consumo.'),(26,'Revisión de sistema de frenos antibloqueo (ABS)','Chequeo del sistema de frenos antibloqueo para seguridad del vehículo.');
/*!40000 ALTER TABLE `core_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_taller`
--

DROP TABLE IF EXISTS `core_taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_taller` (
  `idTaller` int NOT NULL AUTO_INCREMENT,
  `nombreTaller` varchar(46) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci,
  `direccion` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `idComuna_id` int DEFAULT NULL,
  `idUsuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`idTaller`),
  KEY `core_taller_idComuna_id_4af1bf31_fk_core_comuna_idComuna` (`idComuna_id`),
  KEY `core_taller_idUsuario_id_d1356fab_fk` (`idUsuario_id`),
  CONSTRAINT `core_taller_idComuna_id_4af1bf31_fk_core_comuna_idComuna` FOREIGN KEY (`idComuna_id`) REFERENCES `core_comuna` (`idComuna`),
  CONSTRAINT `core_taller_idUsuario_id_d1356fab_fk` FOREIGN KEY (`idUsuario_id`) REFERENCES `core_usuariocustom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_taller`
--

LOCK TABLES `core_taller` WRITE;
/*!40000 ALTER TABLE `core_taller` DISABLE KEYS */;
INSERT INTO `core_taller` VALUES (1,'EL ZAPATO','Taller especializado en alineación, balanceo, cambios de aceite de motor, asegurando gran calidad y buena atención.','342, Avenida Sargento Menadier, Población Nueva Esperanza, Puente Alto, Provincia de Cordillera, Región Metropolitana de Santiago, 9480000, Chile','+56933333333','taller_imagenes/9031943c6d5353510bc611c6be779b2c-zapatos-rojos-zapatillas-ropa.webp',-33.615714,-70.5710851,4,2),(2,'JM Vulcanización','Somos una Vulcanización de calidad, garantizamos un servicio premium y materiales de excelente marca.','1806, Avenida El Peñón, Camilo Henríquez, Puente Alto, Provincia de Cordillera, Región Metropolitana de Santiago, 8207897, Chile','+56966445566','taller_imagenes/diseno-icono-logotipo-neumaticos_775854-1753_S7sGoLi.jpg',-33.5797333,-70.5551449,4,5),(3,'TALLER ISADACAR','Somos un servicio técnico automotriz que surge para cubrir la necesidad de una mecánica transparente, honesta y amigable con la comunidad y el medio ambiente.','2972, Nonato Coo, Portal Andino, Puente Alto, Provincia de Cordillera, Región Metropolitana de Santiago, 8207897, Chile','+56927597470','taller_imagenes/logo4_i8OWFu4.png',-33.5826637,-70.5686826,4,6);
/*!40000 ALTER TABLE `core_taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_tallerservicio`
--

DROP TABLE IF EXISTS `core_tallerservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_tallerservicio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `precio` decimal(10,2) DEFAULT NULL,
  `idServicio_id` int NOT NULL,
  `idTaller_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_tallerservicio_idTaller_id_idServicio_id_bfebd2ec_uniq` (`idTaller_id`,`idServicio_id`),
  KEY `core_tallerservicio_idServicio_id_9497ce81_fk_core_serv` (`idServicio_id`),
  CONSTRAINT `core_tallerservicio_idServicio_id_9497ce81_fk_core_serv` FOREIGN KEY (`idServicio_id`) REFERENCES `core_servicio` (`idServicio`),
  CONSTRAINT `core_tallerservicio_idTaller_id_d88e724c_fk_core_taller_idTaller` FOREIGN KEY (`idTaller_id`) REFERENCES `core_taller` (`idTaller`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_tallerservicio`
--

LOCK TABLES `core_tallerservicio` WRITE;
/*!40000 ALTER TABLE `core_tallerservicio` DISABLE KEYS */;
INSERT INTO `core_tallerservicio` VALUES (1,NULL,3,1),(2,NULL,1,1),(3,NULL,19,1),(4,NULL,18,1),(5,NULL,5,1),(6,NULL,4,2),(7,NULL,3,3),(8,NULL,1,3),(9,NULL,9,3),(10,NULL,6,3),(11,NULL,20,3),(12,NULL,11,3),(13,NULL,8,3),(14,NULL,18,3);
/*!40000 ALTER TABLE `core_tallerservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_ticket`
--

DROP TABLE IF EXISTS `core_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_ticket` (
  `idTicket` int NOT NULL AUTO_INCREMENT,
  `asunto` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `EstadoTicket_id` int NOT NULL,
  `solicitante_id` bigint NOT NULL,
  PRIMARY KEY (`idTicket`),
  KEY `core_ticket_EstadoTicket_id_3d9bd6f1_fk_core_esta` (`EstadoTicket_id`),
  KEY `core_ticket_solicitante_id_e52f4ee7_fk` (`solicitante_id`),
  CONSTRAINT `core_ticket_EstadoTicket_id_3d9bd6f1_fk_core_esta` FOREIGN KEY (`EstadoTicket_id`) REFERENCES `core_estadoticket` (`idEstado`),
  CONSTRAINT `core_ticket_solicitante_id_e52f4ee7_fk` FOREIGN KEY (`solicitante_id`) REFERENCES `core_usuariocustom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_ticket`
--

LOCK TABLES `core_ticket` WRITE;
/*!40000 ALTER TABLE `core_ticket` DISABLE KEYS */;
INSERT INTO `core_ticket` VALUES (1,'sfsfsf',2,5);
/*!40000 ALTER TABLE `core_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_tipovehiculo`
--

DROP TABLE IF EXISTS `core_tipovehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_tipovehiculo` (
  `idTipo` int NOT NULL AUTO_INCREMENT,
  `nombreTipo` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_tipovehiculo`
--

LOCK TABLES `core_tipovehiculo` WRITE;
/*!40000 ALTER TABLE `core_tipovehiculo` DISABLE KEYS */;
INSERT INTO `core_tipovehiculo` VALUES (1,'Sedán'),(2,'SUV'),(3,'Camioneta'),(4,'Hatchback'),(5,'Coupe'),(6,'Crossover'),(7,'Pick-up'),(8,'Deportivo'),(9,'Minivan'),(10,'Furgón'),(11,'Camión'),(12,'Motocicleta'),(13,'Monovolumen'),(14,'Roadster'),(15,'Convertible'),(16,'Todoterreno'),(17,'Berlina'),(18,'Furgoneta'),(19,'Compacto');
/*!40000 ALTER TABLE `core_tipovehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_usuariocustom`
--

DROP TABLE IF EXISTS `core_usuariocustom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_usuariocustom` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `run` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pnombre` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `ap_paterno` varchar(24) COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `idComuna_id` int DEFAULT NULL,
  `idRol_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `core_usuariocustom_idComuna_id_79fd03a4_fk_core_comuna_idComuna` (`idComuna_id`),
  KEY `core_usuariocustom_idRol_id_a682a0ba_fk_core_rolusuario_idRol` (`idRol_id`),
  CONSTRAINT `core_usuariocustom_idComuna_id_79fd03a4_fk_core_comuna_idComuna` FOREIGN KEY (`idComuna_id`) REFERENCES `core_comuna` (`idComuna`),
  CONSTRAINT `core_usuariocustom_idRol_id_a682a0ba_fk_core_rolusuario_idRol` FOREIGN KEY (`idRol_id`) REFERENCES `core_rolusuario` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_usuariocustom`
--

LOCK TABLES `core_usuariocustom` WRITE;
/*!40000 ALTER TABLE `core_usuariocustom` DISABLE KEYS */;
INSERT INTO `core_usuariocustom` VALUES (1,'pbkdf2_sha256$390000$PdQExr2ABGh54HK9RUW3OS$wrhSkRDEDiLcrLClOja9e6GPXkinW+pD5LrkFHnCJ88=','2025-11-13 18:11:51.250977',1,'admin','','','',1,1,'2025-10-21 22:29:55.930381','11111111-1','admin@fixspot.cl','','Admin','Istrador','Duoc UC Sede Puente Alto',4,3),(2,'pbkdf2_sha256$390000$X2RzmvgLpeRpHPifeApeey$J1gVzyXJh6PBdFVWT43YRAeZ9kPXqFIK8ODJ5+AHijs=','2025-10-28 02:14:29.011838',0,'Jeffrey','','','',0,1,'2025-10-21 22:33:47.743645','21576345-3','jef.ramirez@duocuc.cl','','Jeffrey','Ramírez','San Francisco 123',4,2),(3,'pbkdf2_sha256$390000$JqjGGUsWhWm4eYUzczMKZE$Swe9yK4sASAXFyy+uXNw1IX6ywD/Bm1lEGeUD8VYynk=','2025-10-28 01:32:29.807138',0,'Exequiel','','','',0,1,'2025-10-21 22:34:24.210888','21456345-4','ex.albornoz@duocuc.cl','','Exequiel','Albornoz','San Carlos 123',4,1),(4,'pbkdf2_sha256$390000$dtyz1wTzDSDSTRbV5aVnfB$Hp6jr7A2rx/rVPwhJuyzs3kah926JE92w4OadjEU3Vg=','2025-10-28 02:14:06.494686',0,'Julio','','','',0,1,'2025-10-22 00:43:15.700874','11435376-4','jul.tapia@duocuc.cl','','Julio','Tapia','Duoc UC Sede Puente Alto',4,1),(5,'pbkdf2_sha256$390000$TW9Pq4XStwmQUejmYSyg1I$iMqBvOWpm4rPSlQL6hbE4sxAyQb3pKoy6NCmgPbg/Mw=','2025-10-28 02:44:20.128090',0,'Renato','','','',0,1,'2025-10-22 01:15:28.217426','19352873-4','ren.ato@duocuc.cl','','Renato','Cisterna','Duoc UC Sede Puente Alto',4,2),(6,'pbkdf2_sha256$390000$8LdbsBbaKnl7E2WYpmeE8w$FWToRcmILxw8rL3xYYVHlAxn+nec+Kjm+JDziNNdT20=','2025-10-22 16:00:35.633039',0,'Rodrigo','','','',0,1,'2025-10-22 15:06:57.739130','11568334-K','rodr.gonzalez@duocuc.cl','','Rodrigo','Ramírez','Ernesto alvear puente alto',4,2),(9,'pbkdf2_sha256$390000$m6K0Oe7Lid4cmG0dQjedfB$VG+yvFcyCPbTiJDk8nfd6cFebS+ct3iinVxo9m4+7a4=',NULL,0,'admina','','','',0,1,'2025-11-20 18:28:08.333455','22222222-2','admina@fixspot.cl',NULL,'admin','istradora','duoc uc',4,3);
/*!40000 ALTER TABLE `core_usuariocustom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_usuariocustom_groups`
--

DROP TABLE IF EXISTS `core_usuariocustom_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_usuariocustom_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuariocustom_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_usuariocustom_group_usuariocustom_id_group_i_29a9a079_uniq` (`usuariocustom_id`,`group_id`),
  KEY `core_usuariocustom_groups_group_id_8dcd6d1a_fk_auth_group_id` (`group_id`),
  CONSTRAINT `core_usuariocustom_groups_group_id_8dcd6d1a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `core_usuariocustom_groups_usuariocustom_id_5965550d_fk` FOREIGN KEY (`usuariocustom_id`) REFERENCES `core_usuariocustom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_usuariocustom_groups`
--

LOCK TABLES `core_usuariocustom_groups` WRITE;
/*!40000 ALTER TABLE `core_usuariocustom_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_usuariocustom_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_usuariocustom_user_permissions`
--

DROP TABLE IF EXISTS `core_usuariocustom_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_usuariocustom_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuariocustom_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_usuariocustom_user__usuariocustom_id_permiss_50e60970_uniq` (`usuariocustom_id`,`permission_id`),
  KEY `core_usuariocustom_u_permission_id_37c6eea2_fk_auth_perm` (`permission_id`),
  CONSTRAINT `core_usuariocustom_u_permission_id_37c6eea2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `core_usuariocustom_user_permissions_usuariocustom_id_a30f26bf_fk` FOREIGN KEY (`usuariocustom_id`) REFERENCES `core_usuariocustom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_usuariocustom_user_permissions`
--

LOCK TABLES `core_usuariocustom_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_usuariocustom_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_usuariocustom_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_vehiculo`
--

DROP TABLE IF EXISTS `core_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_vehiculo` (
  `idVehiculo` int NOT NULL AUTO_INCREMENT,
  `patente` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `modelo` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `subModelo` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `anno` int NOT NULL,
  `idMarca_id` int NOT NULL,
  `idTipoVehiculo_id` int NOT NULL,
  `idUsuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`idVehiculo`),
  KEY `core_vehiculo_idMarca_id_c736a35f_fk_core_marca_idMarca` (`idMarca_id`),
  KEY `core_vehiculo_idTipoVehiculo_id_69f4a65b_fk_core_tipo` (`idTipoVehiculo_id`),
  KEY `core_vehiculo_idUsuario_id_f26e460a_fk` (`idUsuario_id`),
  CONSTRAINT `core_vehiculo_idMarca_id_c736a35f_fk_core_marca_idMarca` FOREIGN KEY (`idMarca_id`) REFERENCES `core_marca` (`idMarca`),
  CONSTRAINT `core_vehiculo_idTipoVehiculo_id_69f4a65b_fk_core_tipo` FOREIGN KEY (`idTipoVehiculo_id`) REFERENCES `core_tipovehiculo` (`idTipo`),
  CONSTRAINT `core_vehiculo_idUsuario_id_f26e460a_fk` FOREIGN KEY (`idUsuario_id`) REFERENCES `core_usuariocustom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_vehiculo`
--

LOCK TABLES `core_vehiculo` WRITE;
/*!40000 ALTER TABLE `core_vehiculo` DISABLE KEYS */;
INSERT INTO `core_vehiculo` VALUES (2,'PRKG97','Gol','Comfortline',2021,15,4,1),(3,'HYRG54','Fiesta','RS',2021,3,4,3),(4,'JUVT54','Corolla','XEI',2022,1,1,4);
/*!40000 ALTER TABLE `core_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `core_usuariocustom` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(23,'authtoken','token'),(24,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(7,'core','agenda'),(25,'core','calificaciontaller'),(8,'core','comuna'),(19,'core','contacto'),(9,'core','estadoagenda'),(17,'core','estadoticket'),(26,'core','favoritotaller'),(22,'core','formapago'),(10,'core','marca'),(27,'core','preferenciasusuario'),(11,'core','region'),(16,'core','reportepago'),(12,'core','rolusuario'),(20,'core','servicio'),(15,'core','taller'),(21,'core','tallerservicio'),(18,'core','ticket'),(13,'core','tipovehiculo'),(6,'core','usuariocustom'),(14,'core','vehiculo'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-10-21 22:13:34.355122'),(2,'contenttypes','0002_remove_content_type_name','2025-10-21 22:13:34.385898'),(3,'auth','0001_initial','2025-10-21 22:13:34.496999'),(4,'auth','0002_alter_permission_name_max_length','2025-10-21 22:13:34.524544'),(5,'auth','0003_alter_user_email_max_length','2025-10-21 22:13:34.528928'),(6,'auth','0004_alter_user_username_opts','2025-10-21 22:13:34.532546'),(7,'auth','0005_alter_user_last_login_null','2025-10-21 22:13:34.536187'),(8,'auth','0006_require_contenttypes_0002','2025-10-21 22:13:34.537895'),(9,'auth','0007_alter_validators_add_error_messages','2025-10-21 22:13:34.541668'),(10,'auth','0008_alter_user_username_max_length','2025-10-21 22:13:34.545496'),(11,'auth','0009_alter_user_last_name_max_length','2025-10-21 22:13:34.549715'),(12,'auth','0010_alter_group_name_max_length','2025-10-21 22:13:34.555354'),(13,'auth','0011_update_proxy_permissions','2025-10-21 22:13:34.559043'),(14,'auth','0012_alter_user_first_name_max_length','2025-10-21 22:13:34.562701'),(15,'core','0001_initial','2025-10-21 22:13:35.145190'),(16,'admin','0001_initial','2025-10-21 22:13:35.224530'),(17,'admin','0002_logentry_remove_auto_add','2025-10-21 22:13:35.235638'),(18,'admin','0003_logentry_add_action_flag_choices','2025-10-21 22:13:35.245750'),(19,'authtoken','0001_initial','2025-10-21 22:13:35.295493'),(20,'authtoken','0002_auto_20160226_1747','2025-10-21 22:13:35.326207'),(21,'authtoken','0003_tokenproxy','2025-10-21 22:13:35.331300'),(22,'authtoken','0004_alter_tokenproxy_options','2025-10-21 22:13:35.338229'),(23,'core','0002_auto_20240617_1849','2025-10-21 22:13:35.587535'),(24,'core','0003_auto_20240617_2204','2025-10-21 22:13:35.618433'),(25,'core','0004_auto_20240618_1030','2025-10-21 22:13:35.622786'),(26,'core','0005_estadoticket_ticket','2025-10-21 22:13:35.685506'),(27,'core','0006_alter_usuariocustom_id','2025-10-21 22:13:36.523608'),(28,'core','0007_ticket_respuestaticket','2025-10-21 22:13:36.535789'),(29,'core','0008_remove_ticket_respuestaticket','2025-10-21 22:13:36.551187'),(30,'core','0009_contacto','2025-10-21 22:13:36.558783'),(31,'core','0010_contacto_telefono','2025-10-21 22:13:36.567117'),(32,'core','0011_servicio_tallerservicio','2025-10-21 22:13:36.639600'),(33,'core','0012_alter_taller_direccion','2025-10-21 22:13:36.652491'),(34,'core','0013_remove_agenda_idtipoagenda_agenda_idservicio_and_more','2025-10-21 22:13:36.768963'),(35,'core','0014_formapago_reportepago_idformapago','2025-10-21 22:13:36.804500'),(36,'core','0015_remove_formapago_descripcion','2025-10-21 22:13:36.810544'),(37,'sessions','0001_initial','2025-10-21 22:13:36.836807'),(38,'core','0016_calificaciontaller','2025-10-22 00:09:55.650351'),(39,'core','0017_favoritotaller','2025-10-27 17:42:39.111824'),(40,'core','0018_preferenciasusuario','2025-10-27 17:45:45.717175'),(41,'core','0019_alter_usuariocustom_telefono','2025-11-13 17:32:08.515716');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('jtinbcdf901uihhvtoin85kxs68vxbuo','.eJxVjMsOwiAQAP9lz4aw0ELt0Xu_gcDuIlUDSR8n47-bJj3odWYybwhx30rYV1nCzDACwuWXpUhPqYfgR6z3pqjVbZmTOhJ12lVNjeV1O9u_QYlrgRGy0cn3BjvHfWZhZroy2T6JRi8xOUdarBVvOiJMNFiXI2qf0Q9ofIbPFwa5OIQ:1vJbnT:lRm8Dgwghx5Bsvd2UbYCQ9SBsV6_dJ3IFT6yBnDoWDQ','2025-11-27 18:11:51.253238'),('vg0vy81x4gky4376bem6ayp8b5k7acld','.eJxVjMsOwiAQAP9lz4aw0ELt0Xu_gcDuIlUDSR8n47-bJj3odWYybwhx30rYV1nCzDACwuWXpUhPqYfgR6z3pqjVbZmTOhJ12lVNjeV1O9u_QYlrgRGy0cn3BjvHfWZhZroy2T6JRi8xOUdarBVvOiJMNFiXI2qf0Q9ofIbPFwa5OIQ:1vDZme:k6-kV8DtlwZCmtbPWfhapjf5DAi8xFOJJqFSXkTCCgw','2025-11-11 02:50:04.286308'),('xz5dm6tpvajglacb9uykyxbq7w29998a','.eJxVjEEOwiAQRe_C2pDCtHXGpXvPQGAGpGogKe3KeHfbpAvd_vfefyvn1yW7tcXZTaIuCtTpdwuen7HsQB6-3KvmWpZ5CnpX9EGbvlWJr-vh_h1k3_JWd9iZONAZZBjBRO7RegiJ0wgoRCTWAgIL98GgEcbNxyQWKA1MntTnC8zpN4w:1vBMZF:GA4dZ9P2CSooITACM68j-3rnX3uTUXHFi5_O7Jtt2Ag','2025-11-05 00:19:05.386284');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-20 18:58:21
