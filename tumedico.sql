-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tumedico
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `administradores_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,1);
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) DEFAULT NULL,
  `medico_id` int(11) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paciente_id` (`paciente_id`),
  KEY `medico_id` (`medico_id`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cita_id` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `cita_id` (`cita_id`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`cita_id`) REFERENCES `citas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos` (
  `medicamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`medicamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` VALUES (1,'Ibuprofeno','Analgésico y antiinflamatorio',100,3.50),(2,'Paracetamol','Analgésico y antipirético',150,2.75),(3,'Amoxicilina','Antibiótico de amplio espectro',75,5.00),(4,'Loratadina','Antihistamínico',120,1.80),(5,'Metformina','Antidiabético',200,0.50),(6,'Aspirina','Analgésico y antipirético',130,1.20),(7,'Omeprazol','Inhibidor de la bomba de protones',90,4.25),(8,'Clorfenamina','Antihistamínico',80,1.50),(9,'Azitromicina','Antibiótico de amplio espectro',60,8.00),(10,'Enalapril','Antihipertensivo',110,2.10),(11,'Lisinopril','Antihipertensivo',70,1.90),(12,'Simvastatina','Hipolipemiante',160,3.75),(13,'Atorvastatina','Hipolipemiante',140,4.00),(14,'Losartan','Antihipertensivo',180,2.50),(15,'Salbutamol','Broncodilatador',95,5.50),(16,'Carbamazepina','Anticonvulsivante',50,6.00),(17,'Dexametasona','Corticosteroide',65,3.25),(18,'Furosemida','Diurético',175,1.60),(19,'Hidroxicloroquina','Antimalárico',30,7.00),(20,'Levofloxacina','Antibiótico',55,9.50),(21,'Prednisona','Corticosteroide',85,2.70),(22,'Atenolol','Antihipertensivo',145,2.30),(23,'Bisoprolol','Antihipertensivo',115,2.45),(24,'Clopidogrel','Antiagregante plaquetario',105,6.75),(25,'Warfarina','Anticoagulante',45,7.50),(26,'Digoxina','Glicosido cardiaco',125,3.40),(27,'Metronidazol','Antibiótico y antiprotozoario',135,4.60),(28,'Diclofenaco','Analgésico y antiinflamatorio',155,2.95),(29,'Tramadol','Analgésico opioide',90,5.10),(30,'Gabapentina','Anticonvulsivante y analgésico',100,4.50),(31,'Cetirizina','Antihistamínico',150,2.25),(32,'Fexofenadina','Antihistamínico',125,2.80),(33,'Ranitidina','Antagonista H2',175,3.00),(34,'Famotidina','Antagonista H2',85,3.20),(35,'Esomeprazol','Inhibidor de la bomba de protones',90,4.75),(36,'Pantoprazol','Inhibidor de la bomba de protones',130,4.90),(37,'Lactulosa','Laxante',110,1.50),(38,'Doxiciclina','Antibiótico',60,5.40),(39,'Ciprofloxacino','Antibiótico',105,4.95),(40,'Nitrofurantoína','Antibiótico',80,3.85),(41,'Betametasona','Corticosteroide',140,2.60),(42,'Mometasona','Corticosteroide',75,3.30),(43,'Triamcinolona','Corticosteroide',50,2.75),(44,'Hydrocortisona','Corticosteroide',125,3.85),(45,'Isotretinoina','Tratamiento del acné',45,10.00),(46,'Aciclovir','Antiviral',110,5.20),(47,'Valaciclovir','Antiviral',65,6.80),(48,'Ribavirina','Antiviral',55,7.90),(49,'Lamivudina','Antirretroviral',70,8.25),(50,'Zidovudina','Antirretroviral',90,9.00),(51,'Insulina Glargina','Insulina de acción prolongada',50,25.00),(52,'Insulina Aspart','Insulina de acción rápida',60,30.00),(53,'Diazepam','Ansiolítico y relajante muscular',100,2.50),(54,'Alprazolam','Ansiolítico',120,3.00),(55,'Lorazepam','Ansiolítico',90,2.75),(56,'Clonazepam','Ansiolítico',110,3.50),(57,'Midazolam','Ansiolítico y sedante',70,4.20),(58,'Oxazepam','Ansiolítico',80,2.90),(59,'Temazepam','Ansiolítico e hipnótico',65,3.10),(60,'Chlordiazepoxide','Ansiolítico',85,3.20),(61,'Flurazepam','Ansiolítico e hipnótico',55,4.00),(62,'Phenobarbital','Antiepiléptico y sedante',95,2.40),(63,'Amitriptilina','Antidepresivo tricíclico',130,2.50),(64,'Nortriptilina','Antidepresivo tricíclico',140,2.75),(65,'Imipramina','Antidepresivo tricíclico',120,3.00),(66,'Desipramina','Antidepresivo tricíclico',110,3.20),(67,'Doxepina','Antidepresivo tricíclico',90,3.50),(68,'Fluoxetina','Antidepresivo SSRI',200,1.50),(69,'Sertralina','Antidepresivo SSRI',180,2.00),(70,'Paroxetina','Antidepresivo SSRI',150,2.10),(71,'Citalopram','Antidepresivo SSRI',160,1.90),(72,'Escitalopram','Antidepresivo SSRI',170,2.30),(73,'Venlafaxina','Antidepresivo SNRI',100,3.40),(74,'Duloxetina','Antidepresivo SNRI',130,3.60),(75,'Bupropion','Antidepresivo NDRI',75,4.10),(76,'Mirtazapina','Antidepresivo NaSSA',85,3.80),(77,'Trazodona','Antidepresivo SARI',95,3.25),(78,'Tramadol','Analgésico opioide',150,5.50),(79,'Morfina','Analgésico opioide',70,8.00),(80,'Fentanilo','Analgésico opioide',50,10.00),(81,'Codeína','Analgésico opioide',110,6.00),(82,'Oximorfona','Analgésico opioide',40,12.00),(83,'Hidromorfona','Analgésico opioide',60,9.00),(84,'Buprenorfina','Analgésico opioide',55,11.00),(85,'Metadona','Analgésico opioide',90,7.50),(86,'Ketamina','Anestésico disociativo',65,15.00),(87,'Propofol','Anestésico general',85,25.00),(88,'Etomidato','Anestésico general',50,20.00),(89,'Lidocaína','Anestésico local',140,5.00),(90,'Bupivacaína','Anestésico local',130,6.50),(91,'Ropivacaína','Anestésico local',75,7.00),(92,'Mepivacaína','Anestésico local',90,5.50),(93,'Prilocaína','Anestésico local',80,6.00),(94,'Procaína','Anestésico local',120,4.50),(95,'Articaína','Anestésico local',110,5.75),(96,'Sevoflurano','Anestésico inhalado',45,35.00),(97,'Isoflurano','Anestésico inhalado',40,30.00),(98,'Desflurano','Anestésico inhalado',35,28.00),(99,'Halotano','Anestésico inhalado',50,25.00),(100,'Enflurano','Anestésico inhalado',60,20.00),(101,'Óxido nitroso','Anestésico inhalado',70,18.00);
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `numero_licencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_licencia` (`numero_licencia`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `idReceta` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) DEFAULT NULL,
  `cita_id` int(11) DEFAULT NULL,
  `medicamento_id` int(11) DEFAULT NULL,
  `dosis` varchar(255) DEFAULT NULL,
  `instrucciones` text DEFAULT NULL,
  PRIMARY KEY (`idReceta`),
  KEY `paciente_id` (`paciente_id`),
  KEY `medicamento_id` (`medicamento_id`),
  CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  CONSTRAINT `recetas_ibfk_2` FOREIGN KEY (`medicamento_id`) REFERENCES `medicamentos` (`medicamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Paciente'),(2,'Medico'),(3,'Administrador');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `identificacion` varchar(50) NOT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `rol` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `identificacion` (`identificacion`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Admin','admin@tumedico.com','12345','123456789',3,NULL),(12,'Emmanuel','anabolicoscr234@gmail.com','$2y$10$cFr4Cn1nF57H3E.jyem3PuxyBjyC5Oe.CpkQcS1HalYJIdNHhn1e2','666',1,NULL),(13,'Emmanuel','emmaga02120333@gmail.com','$2y$10$ujseVhy6ClnSROBfj6q3R.3E7Yw7t7iqGbpPsyEdnrXkydJpYVTtq','888',1,NULL),(16,'Emmanuel','emmaga021203@gmail.com','$2y$10$qXtIZYhY17DyoDoB0/2q7umebnkl.2WSzEijNqW7M6yNhdwa4awHS','6666',2,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tumedico'
--

--
-- Dumping routines for database 'tumedico'
--
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarContrasennaTemporal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarContrasennaTemporal`(IN `pId` INT, IN `pPassword` VARCHAR(255))
BEGIN
    UPDATE `usuarios`
    SET `password` = pPassword, `ContrasennaTemporal` = 1
    WHERE `id` = pId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarMedicamentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarMedicamentos`()
BEGIN
    SELECT 
		medicamento_id,
        nombre,
        descripcion,
        stock,
        precio
    FROM 
        medicamentos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarUsuarioXEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarUsuarioXEmail`(IN `pEmail` VARCHAR(100))
BEGIN
    SELECT `id`, `Nombre`, `email`
    FROM `tumedico`.`usuarios`
    WHERE `email` = pEmail AND `Estado` = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procesarLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procesarLogin`(`pEmail` varchar(100),`pPassword` varchar(100))
BEGIN

	SELECT 	`id`,`nombre`,`email`,`password`,`identificacion`,`rol_id`,`rol`
    
	FROM 	`tumedico`.`usuarios`
	WHERE 	Email = `pEmail`
		AND	password = `pPassword`;
        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procesarRegistro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procesarRegistro`(`pId` varchar(11),`pNombre` varchar(100),`pEmail` varchar(100),`pPassword` varchar(255))
BEGIN

	INSERT INTO `tumedico`.`usuarios`(`id`,`nombre`,`email`,`password`,`identificacion`,`rol_id`,`rol`)
	VALUES(`pId`,`pNombre`,`pEmail`,`pPassword`,1,1,0);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-21  0:26:19
