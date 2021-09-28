CREATE DATABASE  IF NOT EXISTS `analyse` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `analyse`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: analyse
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `bezeroa`
--

DROP TABLE IF EXISTS `bezeroa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bezeroa` (
  `Erabiltzailea` varchar(255) NOT NULL,
  `Izena` varchar(255) DEFAULT NULL,
  `Abizena` varchar(255) DEFAULT NULL,
  `Nan` varchar(255) DEFAULT NULL,
  `Helbidea` varchar(255) DEFAULT NULL,
  `Telefono` int DEFAULT NULL,
  `Pasahitza` varchar(255) DEFAULT NULL,
  `Emaila` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Erabiltzailea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bezeroa`
--

LOCK TABLES `bezeroa` WRITE;
/*!40000 ALTER TABLE `bezeroa` DISABLE KEYS */;
INSERT INTO `bezeroa` VALUES ('AlvaroCazador','Alvaro','Viguera','79456730G','Legaño Kalea 8 2D,48240 Berriz',146702452,'Admin123','viguera.alvaro@uni.eus'),('Manolo1215','Manolo','Agirreloco','45672890S','mi casa de palo',546792345,'123456789','manolo@gmail.com'),('sebastianmarq','Sebastian','Zevallos','91835766X','Zuhaitza kalea 3, Eibar',658548353,'A1234','jszm@pm.me');
/*!40000 ALTER TABLE `bezeroa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eskaera`
--

DROP TABLE IF EXISTS `eskaera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eskaera` (
  `Erabiltazilea` varchar(255) DEFAULT NULL,
  `ProduktuKodea` varchar(255) DEFAULT NULL,
  `SaskiKodea` varchar(255) DEFAULT NULL,
  `Kantitatea` int DEFAULT NULL,
  KEY `Erabiltazilea` (`Erabiltazilea`),
  KEY `ProduktuKodea` (`ProduktuKodea`),
  KEY `SaskiKodea` (`SaskiKodea`),
  CONSTRAINT `eskaera_ibfk_1` FOREIGN KEY (`Erabiltazilea`) REFERENCES `bezeroa` (`Erabiltzailea`) ON UPDATE CASCADE,
  CONSTRAINT `eskaera_ibfk_2` FOREIGN KEY (`ProduktuKodea`) REFERENCES `produktua` (`ProduktuKodea`) ON UPDATE CASCADE,
  CONSTRAINT `eskaera_ibfk_3` FOREIGN KEY (`SaskiKodea`) REFERENCES `saskia` (`SaskiKodea`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eskaera`
--

LOCK TABLES `eskaera` WRITE;
/*!40000 ALTER TABLE `eskaera` DISABLE KEYS */;
/*!40000 ALTER TABLE `eskaera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produktua`
--

DROP TABLE IF EXISTS `produktua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produktua` (
  `ProduktuKodea` varchar(255) NOT NULL,
  `Izena` varchar(255) DEFAULT NULL,
  `Prezioa` decimal(10,2) DEFAULT NULL,
  `Irudia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProduktuKodea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktua`
--

LOCK TABLES `produktua` WRITE;
/*!40000 ALTER TABLE `produktua` DISABLE KEYS */;
INSERT INTO `produktua` VALUES ('GA01','Gailetak',3.20,'gailetak.png');
/*!40000 ALTER TABLE `produktua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saskia`
--

DROP TABLE IF EXISTS `saskia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saskia` (
  `SaskiKodea` varchar(255) NOT NULL,
  `EskaeraData` date DEFAULT NULL,
  `EntregaData` date DEFAULT NULL,
  PRIMARY KEY (`SaskiKodea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saskia`
--

LOCK TABLES `saskia` WRITE;
/*!40000 ALTER TABLE `saskia` DISABLE KEYS */;
INSERT INTO `saskia` VALUES ('0000','2021-09-21','2021-09-30'),('0001','2021-09-21','2021-09-30'),('0002','2021-09-22','2021-10-01');
/*!40000 ALTER TABLE `saskia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-27 13:12:05
