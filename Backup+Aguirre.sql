CREATE DATABASE  IF NOT EXISTS `libreria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `libreria`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: libreria
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `ID_AUTOR` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(200) DEFAULT NULL,
  `APELLIDO` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_AUTOR`),
  UNIQUE KEY `ID_AUTOR` (`ID_AUTOR`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Antonio ','Garcia'),(2,'Manuel','Gonzalez'),(3,'Francisco','Lopez'),(4,'Aitor','Sanchez'),(5,'María','Jimenez'),(6,'Pilar','Santos'),(7,'Martin','Castillo'),(8,'Carmen','Medina'),(9,'Ana','Nuñez'),(10,'Lucia','Marin'),(11,'Francisco','Sanchez'),(12,'Aitor','Lopez'),(13,'Antonio','Gonzalez'),(14,'Manuel','Garcia'),(15,'Martin','Medina'),(16,'Carmen','Castillo'),(17,'María','Santos'),(18,'Pilar','Jimenez');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `autorescantidad`
--

DROP TABLE IF EXISTS `autorescantidad`;
/*!50001 DROP VIEW IF EXISTS `autorescantidad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `autorescantidad` AS SELECT 
 1 AS `AUTOR`,
 1 AS `CantidadLibrosEscritos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `ID_CIUDAD` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(200) NOT NULL,
  `ID_PROVINCIA` int DEFAULT NULL,
  PRIMARY KEY (`ID_CIUDAD`),
  UNIQUE KEY `ID_CIUDAD` (`ID_CIUDAD`),
  KEY `ID_PROVINCIA` (`ID_PROVINCIA`),
  CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`ID_PROVINCIA`) REFERENCES `provincia` (`ID_PROVINCIA`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'La Plata',1),(2,'Villa Carlos Paz',2),(3,'San Salvador de Jujuy',3),(4,'Oran',4),(5,'Aguilares',5),(6,'Olivia',6),(7,'Parana',7),(8,'Paso de los Libres',8),(9,'Guaymallen',9),(10,'Aconquija',10);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_CLIENTE` int NOT NULL AUTO_INCREMENT,
  `DNI` int DEFAULT NULL,
  `TELEFONO` int DEFAULT NULL,
  `ID_CIUDAD` int DEFAULT NULL,
  `NOMBRE` varchar(200) DEFAULT NULL,
  `APELLIDO` varchar(200) DEFAULT NULL,
  `DOMICILIO` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  UNIQUE KEY `ID_CLIENTE` (`ID_CLIENTE`),
  KEY `ID_CIUDAD` (`ID_CIUDAD`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID_CIUDAD`) REFERENCES `ciudad` (`ID_CIUDAD`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (2,40364632,157765445,2,'JUAN CARLOS','RODRIGUEZ','27 de Febrero 8762'),(3,40605632,159075945,3,'Felipe','Rodriguez','Acacias 2999'),(4,40694642,155809965,4,'Belen','Gomez','Acassuso 2995'),(5,89494632,1509299645,5,'Maria','Fernandez','Acevedo 28979'),(6,34584632,158765645,6,'Juan','Lopez','Achala 8799'),(7,46786632,156709645,7,'Ignacio','Martinez','Daract 6799'),(8,49694632,157878954,8,'Lucas','Diaz','Cachimayo 6784'),(9,30694632,154359965,9,'Matias','Sanchez','Cervantes 9675'),(10,40694632,157846945,1,'Jose Luis','Perez','9 de Julio 8979'),(11,20694632,156789345,10,'Lucia','Romero','Vergara 2999');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `BI_VALIDA_CEL_cliente` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
    DECLARE MSG_ERR VARCHAR(255);
    IF(NEW.TELEFONO NOT LIKE '15%') THEN 
        SET MSG_ERR = 'EL CELULAR DEBE CONTENER EL PREFIJO 15';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = MSG_ERR;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `BU_CLIENTE` BEFORE UPDATE ON `cliente` FOR EACH ROW BEGIN
    INSERT INTO log_cliente VALUES(NULL, 'BEFORE UPDATE', OLD.ID_CLIENTE, CONCAT(new.NOMBRE,' ',new.APELLIDO), CONCAT(old.NOMBRE,' ',old.APELLIDO), user(), current_date(), curtime());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AD_CLIENTE` AFTER DELETE ON `cliente` FOR EACH ROW BEGIN
    INSERT INTO log_cliente VALUES(NULL, 'AFTER DELETE', OLD.ID_CLIENTE, NULL,CONCAT(old.NOMBRE,' ',old.APELLIDO), user(), current_date(), curtime());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `descuento`
--

DROP TABLE IF EXISTS `descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descuento` (
  `ID_DESCUENTO` int NOT NULL AUTO_INCREMENT,
  `PORCENTAJE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_DESCUENTO`),
  UNIQUE KEY `ID_DESCUENTO` (`ID_DESCUENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuento`
--

LOCK TABLES `descuento` WRITE;
/*!40000 ALTER TABLE `descuento` DISABLE KEYS */;
INSERT INTO `descuento` VALUES (1,'Sin descuento'),(2,'10%'),(3,'30%'),(4,'50%');
/*!40000 ALTER TABLE `descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `ID_EDITORIAL` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_EDITORIAL`),
  UNIQUE KEY `ID_EDITORIAL` (`ID_EDITORIAL`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (1,'Tirant Lo Blanch'),(2,'Alianza'),(3,'Aranzadi'),(4,'Catedra'),(5,'Ariel'),(6,'Tecnos'),(7,'Akal'),(8,'Comares'),(9,'Civitas'),(10,'Arco Libros');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_pedido`
--

DROP TABLE IF EXISTS `estado_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_pedido` (
  `ID_ESTADO` int NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_ESTADO`),
  UNIQUE KEY `ID_ESTADO` (`ID_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_pedido`
--

LOCK TABLES `estado_pedido` WRITE;
/*!40000 ALTER TABLE `estado_pedido` DISABLE KEYS */;
INSERT INTO `estado_pedido` VALUES (1,'Sin informacion'),(2,'En deposito'),(3,'Empaquetado'),(4,'En camino');
/*!40000 ALTER TABLE `estado_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `ID_GENERO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_GENERO`),
  UNIQUE KEY `ID_GENERO` (`ID_GENERO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Terror'),(2,'Policial'),(3,'Romance'),(4,'Ciencia'),(5,'Horror'),(6,'Biografia'),(7,'Epico'),(8,'Fantasia'),(9,'Comedia'),(10,'Poesia');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idioma` (
  `ID_IDIOMA` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_IDIOMA`),
  UNIQUE KEY `ID_IDIOMA` (`ID_IDIOMA`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'Español'),(2,'Ingles'),(3,'Portuges'),(4,'Frances'),(5,'Aleman'),(6,'Italiano'),(7,'Holandes'),(8,'Chino'),(9,'Japones'),(10,'Ruso');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_pedido`
--

DROP TABLE IF EXISTS `items_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_pedido` (
  `ID_ITEM_PED` int NOT NULL AUTO_INCREMENT,
  `CANTIDAD` int NOT NULL,
  `ID_PEDIDO` int NOT NULL,
  `ID_LIBRO` int NOT NULL,
  PRIMARY KEY (`ID_ITEM_PED`),
  UNIQUE KEY `ID_ITEM_PED` (`ID_ITEM_PED`),
  KEY `ID_PEDIDO` (`ID_PEDIDO`),
  KEY `ID_LIBRO` (`ID_LIBRO`),
  CONSTRAINT `items_pedido_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedido` (`ID_PEDIDO`) ON DELETE CASCADE,
  CONSTRAINT `items_pedido_ibfk_2` FOREIGN KEY (`ID_LIBRO`) REFERENCES `libro` (`ID_LIBRO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_pedido`
--

LOCK TABLES `items_pedido` WRITE;
/*!40000 ALTER TABLE `items_pedido` DISABLE KEYS */;
INSERT INTO `items_pedido` VALUES (2,2,9,9),(3,3,8,8),(4,4,7,7),(5,3,6,6),(6,2,5,5),(7,1,4,4),(8,2,3,3),(9,3,2,2),(11,99,1,3);
/*!40000 ALTER TABLE `items_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `ID_LIBRO` int NOT NULL AUTO_INCREMENT,
  `TITULO` varchar(200) NOT NULL,
  `PRECIO` decimal(15,2) NOT NULL,
  `ISBN` int DEFAULT NULL,
  `ID_EDITORIAL` int DEFAULT NULL,
  `ID_IDIOMA` int DEFAULT NULL,
  `ID_AUTOR` int DEFAULT NULL,
  `ID_GENERO` int DEFAULT NULL,
  `ID_DESCUENTO` int DEFAULT NULL,
  `ID_VALORACION` int DEFAULT NULL,
  `ID_TAPA` int DEFAULT NULL,
  PRIMARY KEY (`ID_LIBRO`),
  UNIQUE KEY `ID_LIBRO` (`ID_LIBRO`),
  KEY `ID_EDITORIAL` (`ID_EDITORIAL`),
  KEY `ID_IDIOMA` (`ID_IDIOMA`),
  KEY `ID_AUTOR` (`ID_AUTOR`),
  KEY `ID_GENERO` (`ID_GENERO`),
  KEY `ID_DESCUENTO` (`ID_DESCUENTO`),
  KEY `ID_VALORACION` (`ID_VALORACION`),
  KEY `ID_TAPA` (`ID_TAPA`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`ID_EDITORIAL`) REFERENCES `editorial` (`ID_EDITORIAL`) ON DELETE CASCADE,
  CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`ID_IDIOMA`) REFERENCES `idioma` (`ID_IDIOMA`) ON DELETE CASCADE,
  CONSTRAINT `libro_ibfk_3` FOREIGN KEY (`ID_AUTOR`) REFERENCES `autor` (`ID_AUTOR`) ON DELETE CASCADE,
  CONSTRAINT `libro_ibfk_4` FOREIGN KEY (`ID_GENERO`) REFERENCES `genero` (`ID_GENERO`) ON DELETE CASCADE,
  CONSTRAINT `libro_ibfk_5` FOREIGN KEY (`ID_DESCUENTO`) REFERENCES `descuento` (`ID_DESCUENTO`) ON DELETE CASCADE,
  CONSTRAINT `libro_ibfk_6` FOREIGN KEY (`ID_VALORACION`) REFERENCES `valoracion` (`ID_VALORACION`) ON DELETE CASCADE,
  CONSTRAINT `libro_ibfk_7` FOREIGN KEY (`ID_TAPA`) REFERENCES `tapa` (`ID_TAPA`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (2,'EL ABUELO COSIMA',10.00,42347,9,9,9,9,3,4,1),(3,'LOS SIETE MARIDOS DE EVELYN',3499.50,42837,8,8,8,8,3,3,2),(4,'AL FINAL MUEREN LOS DOS',3199.70,62837,7,7,7,7,2,5,1),(5,'HARRY POTTER Y LA PIEDRA FILOSOFAL',7990.10,72837,6,6,6,6,1,2,2),(6,'UNA FAMILIA ANORMAL. Y EL CRUCE DE LOS UNIVERSOS',999.99,42837,5,5,5,5,4,1,1),(7,'LA VIDA INVISIBLE DE ADDIE LARUE',1990.90,54837,4,4,4,4,3,5,2),(8,'LA SALUD DE LOS PAPAS',7499.80,35837,3,3,3,3,2,4,1),(9,'EL DUELO',4999.80,34837,2,2,2,2,1,3,2),(10,'EN EL LIMBO',6570.50,93937,1,1,1,1,4,2,1);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `BU_LIBRO` BEFORE UPDATE ON `libro` FOR EACH ROW BEGIN
    INSERT INTO log_libro VALUES(NULL, 'BEFORE UPDATE', OLD.ID_LIBRO, NEW.TITULO, OLD.TITULO, NEW.PRECIO, OLD.PRECIO, user(), current_date(), curtime());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AD_LIBRO` AFTER DELETE ON `libro` FOR EACH ROW BEGIN
    INSERT INTO log_libro VALUES(NULL, 'AFTER DELETE', OLD.ID_LIBRO, NULL, OLD.TITULO, NULL, OLD.PRECIO, user(), current_date(), curtime());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log_cliente`
--

DROP TABLE IF EXISTS `log_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_cliente` (
  `id_log_cliente` int NOT NULL AUTO_INCREMENT,
  `action` varchar(30) DEFAULT NULL,
  `OLD_ID_CLIENTE` int DEFAULT NULL,
  `NEW_NOMBRE_COMPLETO` varchar(200) DEFAULT NULL,
  `OLD_NOMBRE_COMPLETO` varchar(200) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `log_fecha` timestamp NULL DEFAULT NULL,
  `log_hora` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_log_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_cliente`
--

LOCK TABLES `log_cliente` WRITE;
/*!40000 ALTER TABLE `log_cliente` DISABLE KEYS */;
INSERT INTO `log_cliente` VALUES (1,'AFTER DELETE',1,NULL,'Roberto Perez','root@localhost','2022-06-01 03:00:00','2022-06-01 15:00:20'),(2,'BEFORE UPDATE',2,'JUAN CARLOS RODRIGUEZ','Jose Gonzalez','root@localhost','2022-06-01 03:00:00','2022-06-01 15:00:21');
/*!40000 ALTER TABLE `log_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_libro`
--

DROP TABLE IF EXISTS `log_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_libro` (
  `id_log_libro` int NOT NULL AUTO_INCREMENT,
  `action` varchar(30) DEFAULT NULL,
  `OLD_ID_LIBRO` int DEFAULT NULL,
  `NEW_TITULO` varchar(100) DEFAULT NULL,
  `OLD_TITULO` varchar(100) DEFAULT NULL,
  `NEW_PRECIO` decimal(15,2) DEFAULT NULL,
  `OLD_PRECIO` decimal(15,2) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `log_fecha` timestamp NULL DEFAULT NULL,
  `log_hora` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_log_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_libro`
--

LOCK TABLES `log_libro` WRITE;
/*!40000 ALTER TABLE `log_libro` DISABLE KEYS */;
INSERT INTO `log_libro` VALUES (1,'AFTER DELETE',1,NULL,'LA BRUJA BLANCA - ASESINO DE BRUJAS',NULL,5990.80,'root@localhost','2022-06-01 03:00:00','2022-06-01 15:00:20'),(2,'BEFORE UPDATE',2,'EL ABUELO COSIMA','LA TÍA COSIMA',10.00,9990.60,'root@localhost','2022-06-01 03:00:00','2022-06-01 15:00:20');
/*!40000 ALTER TABLE `log_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `ID_PEDIDO` int NOT NULL AUTO_INCREMENT,
  `FECHA` date NOT NULL,
  `ID_ESTADO` int NOT NULL,
  `ID_CLIENTE` int NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  UNIQUE KEY `ID_PEDIDO` (`ID_PEDIDO`),
  KEY `ID_ESTADO` (`ID_ESTADO`),
  KEY `ID_CLIENTE` (`ID_CLIENTE`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estado_pedido` (`ID_ESTADO`) ON DELETE CASCADE,
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2022-10-21',4,10),(2,'2022-08-15',3,9),(3,'2022-06-17',2,8),(4,'2021-04-19',1,7),(5,'2021-02-02',4,6),(6,'2021-01-30',3,5),(7,'2021-11-09',2,4),(8,'2020-09-11',1,3),(9,'2020-03-25',4,2),(12,'2022-08-15',2,2),(13,'2022-06-17',3,3),(14,'2021-04-19',4,4),(15,'2021-02-02',1,5),(16,'2021-01-30',2,6),(17,'2021-11-09',3,7),(18,'2020-09-11',4,8),(19,'2020-03-25',1,9),(20,'2020-07-18',2,10);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `prepararpedidos`
--

DROP TABLE IF EXISTS `prepararpedidos`;
/*!50001 DROP VIEW IF EXISTS `prepararpedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prepararpedidos` AS SELECT 
 1 AS `id_pedido`,
 1 AS `CLIENTE`,
 1 AS `CANTIDAD`,
 1 AS `LIBRO`,
 1 AS `ESTADO`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `ID_PROVINCIA` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_PROVINCIA`),
  UNIQUE KEY `ID_PROVINCIA` (`ID_PROVINCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Buenos Aires'),(2,'Cordoba'),(3,'Jujuy'),(4,'Salta'),(5,'Tucuman'),(6,'Santa Cruz'),(7,'Entre Rios'),(8,'Corrientes'),(9,'Mendoza'),(10,'Catamarca');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `provinciasclientes`
--

DROP TABLE IF EXISTS `provinciasclientes`;
/*!50001 DROP VIEW IF EXISTS `provinciasclientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `provinciasclientes` AS SELECT 
 1 AS `PROVINCIA`,
 1 AS `CANTIDAD_CLIENTES`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `ID_LIBRO` int NOT NULL,
  `FECHA_MODIFICACION` date NOT NULL,
  `CANTIDAD` int NOT NULL,
  PRIMARY KEY (`ID_LIBRO`),
  UNIQUE KEY `ID_LIBRO` (`ID_LIBRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'2022-10-21',5),(2,'2022-10-21',3),(3,'2022-10-21',1),(4,'2022-10-21',0),(5,'2022-10-21',0),(6,'2022-10-21',5),(7,'2022-10-21',4),(8,'2022-10-21',3),(9,'2022-10-21',2),(10,'2022-10-21',1);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tapa`
--

DROP TABLE IF EXISTS `tapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tapa` (
  `ID_TAPA` int NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_TAPA`),
  UNIQUE KEY `ID_TAPA` (`ID_TAPA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tapa`
--

LOCK TABLES `tapa` WRITE;
/*!40000 ALTER TABLE `tapa` DISABLE KEYS */;
INSERT INTO `tapa` VALUES (1,'Dura'),(2,'Blanda');
/*!40000 ALTER TABLE `tapa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `urgenciastock`
--

DROP TABLE IF EXISTS `urgenciastock`;
/*!50001 DROP VIEW IF EXISTS `urgenciastock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `urgenciastock` AS SELECT 
 1 AS `LIBRO`,
 1 AS `Stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `valoracion`
--

DROP TABLE IF EXISTS `valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoracion` (
  `ID_VALORACION` int NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_VALORACION`),
  UNIQUE KEY `ID_VALORACION` (`ID_VALORACION`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoracion`
--

LOCK TABLES `valoracion` WRITE;
/*!40000 ALTER TABLE `valoracion` DISABLE KEYS */;
INSERT INTO `valoracion` VALUES (1,'Pesimo'),(2,'Malo'),(3,'Regular'),(4,'Bueno'),(5,'Excelente');
/*!40000 ALTER TABLE `valoracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `valoracionlibros`
--

DROP TABLE IF EXISTS `valoracionlibros`;
/*!50001 DROP VIEW IF EXISTS `valoracionlibros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `valoracionlibros` AS SELECT 
 1 AS `LIBRO`,
 1 AS `VALORACION`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'libreria'
--
/*!50003 DROP FUNCTION IF EXISTS `InfoPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `InfoPedido`(idPedido int) RETURNS varchar(100) CHARSET utf8mb4
    READS SQL DATA
BEGIN  
	  declare resultado varchar(100);
	  select ep.DESCRIPCION ESTADO_PEDIDO into resultado from pedido p
	  join estado_pedido ep
	  on p.ID_ESTADO = ep.ID_ESTADO
	  where p.ID_PEDIDO = idPedido;
	  RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PrecioLibro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `PrecioLibro`(libroInteres varchar(200)) RETURNS float
    READS SQL DATA
begin
    declare resultado float;
    
    select PRECIO into resultado from libreria.libro where titulo = libroInteres;
    
    return resultado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `StockTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `StockTotal`() RETURNS int
    READS SQL DATA
begin
    declare resultado int;
    
    select sum(cantidad) into resultado from libreria.stock;
    
    return resultado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GeneraItemsPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GeneraItemsPedido`(CANTIDAD int, ID_PEDIDO int, ID_LIBRO int)
BEGIN  
	declare ID int;
    declare ultimoID int;
    set ultimoID = (select max(ID_ITEM_PED) from libreria.items_pedido);
    set ID = ultimoID + 1;
    
    insert into libreria.ITEMS_PEDIDO values (ID, CANTIDAD,ID_PEDIDO,ID_LIBRO);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrdenadorPrecioLibros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrdenadorPrecioLibros`(orden int)
BEGIN  
        declare query_base varchar(250);
        declare tipo_orden varchar(10);
        declare query_final varchar(250);
        
        set query_base = 'select titulo, precio from libreria.libro ';
        
        if orden = 1 then 
            set tipo_orden = ' asc;';
        else 
            set tipo_orden = ' desc;';
        end if;
		select concat(query_base, ' order by precio ', tipo_orden) into query_final;
		
		SET @smtmt = query_final;
		
		PREPARE EJECUTAR FROM @smtmt;
		EXECUTE EJECUTAR;
		deallocate prepare EJECUTAR;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `autorescantidad`
--

/*!50001 DROP VIEW IF EXISTS `autorescantidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `autorescantidad` AS select concat(`a`.`NOMBRE`,' ',`a`.`APELLIDO`) AS `AUTOR`,count(0) AS `CantidadLibrosEscritos` from (`autor` `a` join `libro` `l` on((`a`.`ID_AUTOR` = `l`.`ID_AUTOR`))) group by `AUTOR` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prepararpedidos`
--

/*!50001 DROP VIEW IF EXISTS `prepararpedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prepararpedidos` AS select `p`.`ID_PEDIDO` AS `id_pedido`,`p`.`ID_CLIENTE` AS `CLIENTE`,`ip`.`CANTIDAD` AS `CANTIDAD`,`l`.`TITULO` AS `LIBRO`,`ep`.`DESCRIPCION` AS `ESTADO` from (((`pedido` `p` join `items_pedido` `ip` on((`p`.`ID_PEDIDO` = `ip`.`ID_PEDIDO`))) join `libro` `l` on((`ip`.`ID_LIBRO` = `l`.`ID_LIBRO`))) join `estado_pedido` `ep` on((`p`.`ID_ESTADO` = `ep`.`ID_ESTADO`))) where (`p`.`ID_ESTADO` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `provinciasclientes`
--

/*!50001 DROP VIEW IF EXISTS `provinciasclientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `provinciasclientes` AS select `p`.`NOMBRE` AS `PROVINCIA`,count(0) AS `CANTIDAD_CLIENTES` from ((`provincia` `p` join `ciudad` `c` on((`p`.`ID_PROVINCIA` = `c`.`ID_PROVINCIA`))) join `cliente` `cli` on((`c`.`ID_CIUDAD` = `cli`.`ID_CIUDAD`))) group by `p`.`ID_PROVINCIA` order by `CANTIDAD_CLIENTES` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `urgenciastock`
--

/*!50001 DROP VIEW IF EXISTS `urgenciastock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `urgenciastock` AS select `l`.`TITULO` AS `LIBRO`,`s`.`CANTIDAD` AS `Stock` from (`libro` `l` join `stock` `s` on((`l`.`ID_LIBRO` = `s`.`ID_LIBRO`))) order by `s`.`CANTIDAD` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `valoracionlibros`
--

/*!50001 DROP VIEW IF EXISTS `valoracionlibros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `valoracionlibros` AS select `l`.`TITULO` AS `LIBRO`,`v`.`DESCRIPCION` AS `VALORACION` from (`libro` `l` join `valoracion` `v` on((`l`.`ID_VALORACION` = `v`.`ID_VALORACION`))) order by `l`.`TITULO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-17 16:47:44
