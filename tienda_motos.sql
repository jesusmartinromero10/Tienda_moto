CREATE DATABASE  IF NOT EXISTS `bd_motos` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8_spanish2_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_motos`;
-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_motos
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Harley Davidson'),(2,'Honda'),(3,'Yamaha'),(4,'Kawasaki'),(5,'Suzuki');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motos`
--

DROP TABLE IF EXISTS `motos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `matricula` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8_spanish2_ci NOT NULL,
  `modelo` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_spanish2_ci NOT NULL,
  `precio` double unsigned NOT NULL,
  `descripcion` text CHARACTER SET utf8mb3 COLLATE utf8_spanish2_ci NOT NULL,
  `cilindrada` int unsigned NOT NULL,
  `fk_marca` int NOT NULL,
  `foto` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `constr_motos_fk_marca_idx` (`fk_marca`),
  FULLTEXT KEY `idx_fulltext` (`modelo`,`descripcion`),
  CONSTRAINT `constr_motos_fk_marca` FOREIGN KEY (`fk_marca`) REFERENCES `marcas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motos`
--

LOCK TABLES `motos` WRITE;
/*!40000 ALTER TABLE `motos` DISABLE KEYS */;
INSERT INTO `motos` VALUES (1,'123ABC','Harley Davidson Sportster',8000,'Una motocicleta Harley Davidson Sportster en excelente estado.',1200,1,'sportster-s.jpeg'),(2,'456DEF','Honda CBR600RR',9500,'Una Honda CBR600RR con muy poco kilometraje.',600,2,'fb.jpg'),(3,'789GHI','Yamaha YZF-R6',8500,'Yamaha YZF-R6 en perfectas condiciones.',600,3,'yamaha-yzf-r6.jpeg'),(4,'101JKL','Kawasaki Ninja ZX-6R',9200,'Kawasaki Ninja ZX-6R con mejoras en el escape.',636,4,'01-kawasaki-ninja-zx-6r-2024-estudio-verde-01.jpg'),(5,'202MNO','Suzuki GSX-R750',8700,'Suzuki GSX-R750 con carenado personalizado.',750,5,'2021-gsx-r750-1.jpg'),(6,'303PQR','Harley Davidson Softail',10500,'Harley Davidson Softail con detalles cromados.',1584,1,'2023-softail-standard-010-motorcycle-08.jpeg'),(7,'404STU','Honda CRF250L',4800,'Honda CRF250L de doble propósito en perfecto estado.',250,2,'02-honda-crf250l-2017.jpg'),(8,'505VWX','Yamaha MT-07',7000,'Yamaha MT-07 con escape Akrapovič.',689,3,'Yamaha-MT07-EU-Cyan_Storm (1).jpeg'),(9,'606YZA','Kawasaki Z900',9200,'Kawasaki Z900 con sistema de frenos ABS.',948,4,'22MY_Z900_GN1_STU (1).001.jpeg'),(10,'707BCD','Suzuki V-Strom 650',7900,'Suzuki V-Strom 650 con maletas laterales.',645,5,'01-suzuki-v-strom-650-2022-estudio-blanco-01-739-a.jpg'),(11,'808EFG','Harley Davidson Road King',11500,'Harley Davidson Road King en estado impecable.',1746,1,'001-harley-davidson-road-king-2022-estudio-gris.jpg'),(12,'909HIJ','Honda Grom',3500,'Honda Grom con kit de escape Yoshimura.',125,2,'fbq.jpeg'),(13,'101KLM','Yamaha FZ-09',8200,'Yamaha FZ-09 con control de tracción.',847,3,'L_d26ce5d491c753c71994d96330.jpg'),(14,'111MNO','Kawasaki Vulcan S',7500,'Kawasaki Vulcan S con asiento personalizado.',649,4,'22MY_Vulcan S_ BK1_STU (1).001 (1).jpeg'),(15,'121PQR','Suzuki Boulevard M109R',9500,'Suzuki Boulevard M109R con sistema de sonido.',1783,5,'L_08.jpeg'),(16,'131STU','Harley Davidson Iron 883',8500,'Harley Davidson Iron 883 con estilo bobber.',883,1,'harley-davidson-iron-883.jpg'),(17,'141VWX','Honda Africa Twin',10500,'Honda Africa Twin con sistema de navegación.',1084,2,'fb11.jpeg'),(18,'151YZA','Yamaha YZF-R1',11200,'Yamaha YZF-R1 con carenado aerodinámico.',998,3,'01-yamaha-yzf-r1-2022-estudio-azul.jpg'),(19,'161BCD','Kawasaki Versys 650',8200,'Kawasaki Versys 650 con pantalla ajustable.',649,4,'KLE650HNFAN-GN1_Grand_Tourer_RF.001 (1).jpeg'),(20,'171EFG','Suzuki SV650',6900,'Suzuki SV650 con faros LED.',645,5,'01.jpg');
/*!40000 ALTER TABLE `motos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_motos`
--

DROP TABLE IF EXISTS `v_motos`;
/*!50001 DROP VIEW IF EXISTS `v_motos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_motos` AS SELECT 
 1 AS `id`,
 1 AS `matricula`,
 1 AS `modelo`,
 1 AS `precio`,
 1 AS `descripcion`,
 1 AS `cilindrada`,
 1 AS `fk_marca`,
 1 AS `marca`,
 1 AS `foto`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'bd_motos'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_borrar_moto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_borrar_moto`(in idM int)
BEGIN
DELETE FROM motos
WHERE id=idM;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_BORRAR_TODO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BORRAR_TODO`()
BEGIN
delete from motos;
delete from marcas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_buscar_motos_permisivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_motos_permisivo`(
	in texto text,
    in matriculaM Varchar(12),
    in cilindradaM int
    )
BEGIN
select * from v_motos
where match(modelo, descripcion) against(texto)
	union
select * from v_motos
where matricula=matriculaM
	union
select * from v_motos
where cilindrada=cilindradaM;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_buscar_motos_restrictivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_motos_restrictivo`(
	in texto text,
    in matriculaM Varchar(12),
    in cilindradaM int)
BEGIN
if texto!="" and matriculaM!=0 and cilindradaM!=0 then
	select * from v_motos
    where match(modelo, descripcion) against(texto)
    and matricula=matriculaM and cilindrada=cilindradaM;
elseif texto!="" and matriculaM=0 and cilindradaM!=0 then
	select * from v_motos
    where match(modelo, descripcion) against(texto)
    and cilindrada=cilindradaM;
elseif texto!="" and matriculaM!=0 and cilindradaM=0 then
	select * from v_motos
    where match(modelo, descripcion) against(texto)
    and matricula=matriculaM;
elseif texto!="" and matriculaM=0 and cilindradaM=0 then
	select * from v_motos
    where match(modelo, descripcion) against(texto);
elseif texto="" and matriculaM!=0 and cilindradaM!=0 then    
	select * from v_motos
    where matricula=matriculaM and cilindrada=cilindradaM;
elseif texto="" and matriculaM=0 and cilindradaM!=0 then 
	select * from v_motos
    where cilindrada=cilindradaM;
elseif texto="" and matriculaM!=0 and cilindradaM=0 then 
	select * from v_motos
    where matricula=matriculaM;
elseif texto="" and matriculaM=0 and cilindradaM=0 then
	select * from v_motos;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_marca_RESTAURACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_marca_RESTAURACION`(in idM int,marcaM varchar(45))
BEGIN
INSERT INTO `marcas`
(id,
marca)
VALUES
(idM,
marcaM);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_moto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_moto`(
	in matriculaM VARCHAR(12),
	in modeloM VARCHAR(45),
	in precioM double,
	in descripcionM text,
	in cilindradaM int,
	in fk_marcaM int,
    in fotoM varchar(255))
BEGIN
INSERT INTO motos
(matricula,modelo,precio,descripcion,cilindrada,fk_marca,foto)
VALUES
(matriculaM,modeloM,precioM,descripcionM,cilindradaM,fk_marcaM,fotoM);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_moto_RESTAURACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_moto_RESTAURACION`(
	in idM int,
	in matriculaM VARCHAR(12),
	in modeloM VARCHAR(45),
	in precioM double,
	in descripcionM text,
	in cilindradaM int,
	in fk_marcaM int,
    in fotoM varchar(255))
BEGIN
INSERT INTO motos
(id,matricula,modelo,precio,descripcion,cilindrada,fk_marca, foto)
VALUES
(idM,matriculaM,modeloM,precioM,descripcionM,cilindradaM,fk_marcaM,fotoM);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_modificar_moto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificar_moto`(
	in idM int,
	in matriculaM VARCHAR(12),
	in modeloM VARCHAR(45),
	in precioM double,
	in descripcionM text,
	in cilindradaM int,
	in fk_marcaM int,
    in fotoM varchar(255))
BEGIN
UPDATE motos
SET
matricula = matriculaM,
modelo = modeloM,
precio = precioM,
descripcion = descripcionM,
cilindrada =cilindradaM,
fk_marca = fk_marcaM,
foto=fotoM
WHERE id = idM;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_moto_por_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_moto_por_id`(in idM int)
BEGIN
select * from v_motos where id=idM;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_todas_marcas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_todas_marcas`()
BEGIN
select * from marcas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_todas_motos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_todas_motos`()
BEGIN
select * from v_motos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_motos`
--

/*!50001 DROP VIEW IF EXISTS `v_motos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_motos` AS select `mo`.`id` AS `id`,`mo`.`matricula` AS `matricula`,`mo`.`modelo` AS `modelo`,`mo`.`precio` AS `precio`,`mo`.`descripcion` AS `descripcion`,`mo`.`cilindrada` AS `cilindrada`,`mo`.`fk_marca` AS `fk_marca`,`ma`.`marca` AS `marca`,`mo`.`foto` AS `foto` from (`motos` `mo` join `marcas` `ma` on((`mo`.`fk_marca` = `ma`.`id`))) */;
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

-- Dump completed on 2023-11-12 12:20:57
