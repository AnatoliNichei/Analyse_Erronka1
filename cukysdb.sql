-- MySQL dump 10.19  Distrib 10.3.31-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.73.82    Database: cukysdb
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add user',3,'add_user'),(10,'Can change user',3,'change_user'),(11,'Can delete user',3,'delete_user'),(12,'Can view user',3,'view_user'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add mota',5,'add_mota'),(18,'Can change mota',5,'change_mota'),(19,'Can delete mota',5,'delete_mota'),(20,'Can view mota',5,'view_mota'),(21,'Can add saskia',6,'add_saskia'),(22,'Can change saskia',6,'change_saskia'),(23,'Can delete saskia',6,'delete_saskia'),(24,'Can view saskia',6,'view_saskia'),(25,'Can add produktua',7,'add_produktua'),(26,'Can change produktua',7,'change_produktua'),(27,'Can delete produktua',7,'delete_produktua'),(28,'Can view produktua',7,'view_produktua'),(29,'Can add eskaera',8,'add_eskaera'),(30,'Can change eskaera',8,'change_eskaera'),(31,'Can delete eskaera',8,'delete_eskaera'),(32,'Can view eskaera',8,'view_eskaera'),(33,'Can add bezeroa',9,'add_bezeroa'),(34,'Can change bezeroa',9,'change_bezeroa'),(35,'Can delete bezeroa',9,'delete_bezeroa'),(36,'Can view bezeroa',9,'view_bezeroa'),(37,'Can add bezeroa',10,'add_bezeroa'),(38,'Can change bezeroa',10,'change_bezeroa'),(39,'Can delete bezeroa',10,'delete_bezeroa'),(40,'Can view bezeroa',10,'view_bezeroa'),(41,'Can add saskia',11,'add_saskia'),(42,'Can change saskia',11,'change_saskia'),(43,'Can delete saskia',11,'delete_saskia'),(44,'Can view saskia',11,'view_saskia'),(45,'Can add mota',12,'add_mota'),(46,'Can change mota',12,'change_mota'),(47,'Can delete mota',12,'delete_mota'),(48,'Can view mota',12,'view_mota'),(49,'Can add produktua',13,'add_produktua'),(50,'Can change produktua',13,'change_produktua'),(51,'Can delete produktua',13,'delete_produktua'),(52,'Can view produktua',13,'view_produktua'),(53,'Can add eskaera',14,'add_eskaera'),(54,'Can change eskaera',14,'change_eskaera'),(55,'Can delete eskaera',14,'delete_eskaera'),(56,'Can view eskaera',14,'view_eskaera'),(57,'Can add log entry',15,'add_logentry'),(58,'Can change log entry',15,'change_logentry'),(59,'Can delete log entry',15,'delete_logentry'),(60,'Can view log entry',15,'view_logentry'),(61,'Can add session',16,'add_session'),(62,'Can change session',16,'change_session'),(63,'Can delete session',16,'delete_session'),(64,'Can view session',16,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$hIJHNpwesVDZTCKlUpdEN4$UBJ8y8AZbhcsHS5yEZJb5IdkqB9x7B/T5lj+N+It2uY=','2021-11-04 11:07:08.331641',1,'alvaro','','','viguera.alvaro@uni.eus',1,1,'2021-10-27 07:56:18.065642'),(2,'pbkdf2_sha256$260000$9cOY8C2tmUDudMclUshFHo$LkSxH6cePekgiNynmYrin/dBlkjwJa0+gbHyRFPxSIM=',NULL,0,'klk','','','as@as.com',0,1,'2021-10-27 08:07:05.752099');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cukysapp_bezeroa`
--

DROP TABLE IF EXISTS `cukysapp_bezeroa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cukysapp_bezeroa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `izena` varchar(255) NOT NULL,
  `abizena` varchar(255) NOT NULL,
  `helbidea` varchar(255) NOT NULL,
  `telefonoa` int NOT NULL,
  `nan` varchar(9) NOT NULL,
  `erabiltzailea_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `erabiltzailea_id` (`erabiltzailea_id`),
  CONSTRAINT `cukysapp_bezeroa_erabiltzailea_id_3f7a8636_fk_auth_user_id` FOREIGN KEY (`erabiltzailea_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cukysapp_bezeroa`
--

LOCK TABLES `cukysapp_bezeroa` WRITE;
/*!40000 ALTER TABLE `cukysapp_bezeroa` DISABLE KEYS */;
/*!40000 ALTER TABLE `cukysapp_bezeroa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cukysapp_eskaera`
--

DROP TABLE IF EXISTS `cukysapp_eskaera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cukysapp_eskaera` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `produktu_kodea_id` bigint NOT NULL,
  `saski_kodea_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cukysapp_eskaera_produktu_kodea_id_7553a891_fk_cukysapp_` (`produktu_kodea_id`),
  KEY `cukysapp_eskaera_saski_kodea_id_f5c3de0a_fk_cukysapp_saskia_id` (`saski_kodea_id`),
  CONSTRAINT `cukysapp_eskaera_produktu_kodea_id_7553a891_fk_cukysapp_` FOREIGN KEY (`produktu_kodea_id`) REFERENCES `cukysapp_produktua` (`id`),
  CONSTRAINT `cukysapp_eskaera_saski_kodea_id_f5c3de0a_fk_cukysapp_saskia_id` FOREIGN KEY (`saski_kodea_id`) REFERENCES `cukysapp_saskia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cukysapp_eskaera`
--

LOCK TABLES `cukysapp_eskaera` WRITE;
/*!40000 ALTER TABLE `cukysapp_eskaera` DISABLE KEYS */;
/*!40000 ALTER TABLE `cukysapp_eskaera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cukysapp_mota`
--

DROP TABLE IF EXISTS `cukysapp_mota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cukysapp_mota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mota_kodea` int NOT NULL,
  `izena` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cukysapp_mota`
--

LOCK TABLES `cukysapp_mota` WRITE;
/*!40000 ALTER TABLE `cukysapp_mota` DISABLE KEYS */;
INSERT INTO `cukysapp_mota` VALUES (1,1,'Fruta'),(2,2,'Simple'),(3,3,'Chocolate');
/*!40000 ALTER TABLE `cukysapp_mota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cukysapp_produktua`
--

DROP TABLE IF EXISTS `cukysapp_produktua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cukysapp_produktua` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `produktu_kodea` varchar(255) NOT NULL,
  `izena` varchar(255) NOT NULL,
  `prezioa` double NOT NULL,
  `irudia` varchar(255) NOT NULL,
  `iruzkina` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cukysapp_produktua`
--

LOCK TABLES `cukysapp_produktua` WRITE;
/*!40000 ALTER TABLE `cukysapp_produktua` DISABLE KEYS */;
INSERT INTO `cukysapp_produktua` VALUES (1,'GA01','Apple Cookie',0.75,'../../static/images/Cookie/appleCookie.png','Sagarraz eginezko gaileta gozoak.'),(2,'GA02','Banana Cookie',7.5,'../../static/images/Cookie/bananaCookie.png','Canarias-eko platanoekin eginezko gaileta gozoak. La Palman labetuta.'),(3,'GA03','Cashew Cookie',1.49,'../../static/images/Cookie/cashewCookie.png','Anakardoz eginezko gaileta gozoak.'),(4,'GA04','Eclipse Cookie',0.39,'../../static/images/Cookie/eclipseCookie.png','Gaileta hauek erdi sinpleak eta erdi txokolatezkoak dira.'),(5,'GA05','Gingerbread Cookie',5.39,'../../static/images/Cookie/gingerbreadCookie.png','Gabonetara arte itxaron nahi ez baduzu, erosi orain jengibre-gailetak.'),(6,'GA06','Ladyfinger Cookie',0.2,'../../static/images/Cookie/ladyfingerCookie.png','Txokolatean bustitzeko gaileta ederra.'),(7,'GA07','Madaleines',3.9,'../../static/images/Cookie/madaleinesCookie.png','Eclipse bezalako gailetak, baina politagoak eta gareztiagoak.'),(8,'GA08','Pear Cookie',1.15,'../../static/images/Cookie/pearCookie.png','Madariz eginezko gaileta gozoak.'),(9,'GA09','Pinwheel Cookie',0.8,'../../static/images/Cookie/pinwheelCookie.png','Kiribil itxura duten gaileta gozoak.'),(10,'GA10','Raspberry Cookie',2.95,'../../static/images/Cookie/raspberryCookie.png','Mugurdiz eginezko gaileta gozoak.'),(11,'GA11','Walnut Cookie',1,'../../static/images/Cookie/walnutCookie.png','Intxaurrez eginezko gaileta gozoak.'),(12,'GA12','White Chocolate Cookie',0.59,'../../static/images/Cookie/whiteChocoCookie.png','Lidl-etik lapurtutako gaileta zakarrak.');
/*!40000 ALTER TABLE `cukysapp_produktua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cukysapp_produktua_mota`
--

DROP TABLE IF EXISTS `cukysapp_produktua_mota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cukysapp_produktua_mota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `produktua_id` bigint NOT NULL,
  `mota_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cukysapp_produktua_mota_produktua_id_mota_id_447788a9_uniq` (`produktua_id`,`mota_id`),
  KEY `cukysapp_produktua_mota_mota_id_b20f3a2d_fk_cukysapp_mota_id` (`mota_id`),
  CONSTRAINT `cukysapp_produktua_m_produktua_id_88340bba_fk_cukysapp_` FOREIGN KEY (`produktua_id`) REFERENCES `cukysapp_produktua` (`id`),
  CONSTRAINT `cukysapp_produktua_mota_mota_id_b20f3a2d_fk_cukysapp_mota_id` FOREIGN KEY (`mota_id`) REFERENCES `cukysapp_mota` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cukysapp_produktua_mota`
--

LOCK TABLES `cukysapp_produktua_mota` WRITE;
/*!40000 ALTER TABLE `cukysapp_produktua_mota` DISABLE KEYS */;
INSERT INTO `cukysapp_produktua_mota` VALUES (4,1,1),(1,2,1),(5,3,2),(6,4,3),(7,5,2),(8,6,2),(9,7,3),(3,8,1),(10,9,3),(11,10,1),(12,11,2),(2,12,3);
/*!40000 ALTER TABLE `cukysapp_produktua_mota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cukysapp_saskia`
--

DROP TABLE IF EXISTS `cukysapp_saskia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cukysapp_saskia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `saski_kodea` varchar(255) NOT NULL,
  `eskaera_data` datetime(6) NOT NULL,
  `entrega_data` datetime(6) NOT NULL,
  `erabiltzailea_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cukysapp_saskia_erabiltzailea_id_ca43588e_fk_auth_user_id` (`erabiltzailea_id`),
  CONSTRAINT `cukysapp_saskia_erabiltzailea_id_ca43588e_fk_auth_user_id` FOREIGN KEY (`erabiltzailea_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cukysapp_saskia`
--

LOCK TABLES `cukysapp_saskia` WRITE;
/*!40000 ALTER TABLE `cukysapp_saskia` DISABLE KEYS */;
/*!40000 ALTER TABLE `cukysapp_saskia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-11-02 07:21:20.238973','1','Fruta',3,'',9,1),(2,'2021-11-02 07:24:45.535284','12','White Chocolate Cookie',1,'new through import_export',7,1),(3,'2021-11-02 07:24:45.583856','11','Walnut Cookie',1,'new through import_export',7,1),(4,'2021-11-02 07:24:45.650090','10','Raspberry Cookie',1,'new through import_export',7,1),(5,'2021-11-02 07:24:45.683427','9','Pinwheel Cookie',1,'new through import_export',7,1),(6,'2021-11-02 07:24:45.761037','8','Pear Cookie',1,'new through import_export',7,1),(7,'2021-11-02 07:24:45.835919','7','Madaleines',1,'new through import_export',7,1),(8,'2021-11-02 07:24:45.902837','6','Ladyfinger Cookie',1,'new through import_export',7,1),(9,'2021-11-02 07:24:45.933459','5','Gingerbread Cookie',1,'new through import_export',7,1),(10,'2021-11-02 07:24:45.977862','4','Eclipse Cookie',1,'new through import_export',7,1),(11,'2021-11-02 07:24:46.052953','3','Cashew Cookie',1,'new through import_export',7,1),(12,'2021-11-02 07:24:46.125244','2','Banana Cookie',1,'new through import_export',7,1),(13,'2021-11-02 07:24:46.202731','1','Apple Cookie',1,'new through import_export',7,1),(14,'2021-11-02 07:25:03.883501','3','Chocolate',1,'new through import_export',5,1),(15,'2021-11-02 07:25:03.924481','2','Simple',1,'new through import_export',5,1),(16,'2021-11-02 07:25:03.955180','1','Fruta',1,'new through import_export',5,1),(17,'2021-11-02 07:58:30.441646','2','Banana Cookie',2,'[{\"changed\": {\"fields\": [\"Mota\"]}}]',7,1),(18,'2021-11-02 07:59:11.525603','12','White Chocolate Cookie',2,'[{\"changed\": {\"fields\": [\"Mota\"]}}]',7,1),(19,'2021-11-02 07:59:15.721223','8','Pear Cookie',2,'[{\"changed\": {\"fields\": [\"Mota\"]}}]',7,1),(20,'2021-11-02 08:00:24.421489','1','Apple Cookie',2,'[{\"changed\": {\"fields\": [\"Mota\"]}}]',7,1),(21,'2021-11-02 08:00:37.754097','3','Cashew Cookie',2,'[{\"changed\": {\"fields\": [\"Mota\"]}}]',7,1),(22,'2021-11-02 08:00:49.768143','4','Eclipse Cookie',2,'[{\"changed\": {\"fields\": [\"Mota\"]}}]',7,1),(23,'2021-11-02 08:01:02.081779','5','Gingerbread Cookie',2,'[{\"changed\": {\"fields\": [\"Mota\"]}}]',7,1),(24,'2021-11-02 08:01:10.881836','6','Ladyfinger Cookie',2,'[{\"changed\": {\"fields\": [\"Mota\"]}}]',7,1),(25,'2021-11-02 08:01:26.297117','7','Madaleines',2,'[{\"changed\": {\"fields\": [\"Mota\"]}}]',7,1),(26,'2021-11-02 08:01:46.095547','9','Pinwheel Cookie',2,'[{\"changed\": {\"fields\": [\"Mota\"]}}]',7,1),(27,'2021-11-02 08:02:03.253718','10','Raspberry Cookie',2,'[{\"changed\": {\"fields\": [\"Mota\"]}}]',7,1),(28,'2021-11-02 08:02:08.832912','11','Walnut Cookie',2,'[{\"changed\": {\"fields\": [\"Mota\"]}}]',7,1),(29,'2021-11-02 08:02:16.343695','12','White Chocolate Cookie',2,'[]',7,1),(30,'2021-11-02 08:02:18.739919','11','Walnut Cookie',2,'[]',7,1),(31,'2021-11-02 08:02:20.609758','10','Raspberry Cookie',2,'[]',7,1),(32,'2021-11-02 08:02:22.881898','9','Pinwheel Cookie',2,'[]',7,1),(33,'2021-11-02 08:02:24.863723','8','Pear Cookie',2,'[]',7,1),(34,'2021-11-02 08:02:27.043287','7','Madaleines',2,'[]',7,1),(35,'2021-11-02 08:02:29.279846','6','Ladyfinger Cookie',2,'[]',7,1),(36,'2021-11-02 08:02:31.242522','5','Gingerbread Cookie',2,'[]',7,1),(37,'2021-11-02 08:02:33.589887','4','Eclipse Cookie',2,'[]',7,1),(38,'2021-11-02 08:02:35.367906','3','Cashew Cookie',2,'[]',7,1),(39,'2021-11-02 08:02:37.501767','2','Banana Cookie',2,'[]',7,1),(40,'2021-11-02 08:02:41.648976','1','Apple Cookie',2,'[]',7,1),(41,'2021-11-02 08:10:08.646511','12','White Chocolate Cookie',2,'[{\"changed\": {\"fields\": [\"Irudia\"]}}]',7,1),(42,'2021-11-02 08:11:01.332965','2','Banana Cookie',2,'[{\"changed\": {\"fields\": [\"Irudia\"]}}]',7,1),(43,'2021-11-02 08:12:18.324599','11','Walnut Cookie',2,'[{\"changed\": {\"fields\": [\"Irudia\"]}}]',7,1),(44,'2021-11-02 08:12:24.198137','11','Walnut Cookie',2,'[]',7,1),(45,'2021-11-02 08:12:28.927869','10','Raspberry Cookie',2,'[{\"changed\": {\"fields\": [\"Irudia\"]}}]',7,1),(46,'2021-11-02 08:12:34.892070','9','Pinwheel Cookie',2,'[{\"changed\": {\"fields\": [\"Irudia\"]}}]',7,1),(47,'2021-11-02 08:12:39.583472','9','Pinwheel Cookie',2,'[]',7,1),(48,'2021-11-02 08:12:44.430505','9','Pinwheel Cookie',2,'[]',7,1),(49,'2021-11-02 08:12:50.506686','8','Pear Cookie',2,'[{\"changed\": {\"fields\": [\"Irudia\"]}}]',7,1),(50,'2021-11-02 08:12:55.490003','7','Madaleines',2,'[{\"changed\": {\"fields\": [\"Irudia\"]}}]',7,1),(51,'2021-11-02 08:13:00.674147','6','Ladyfinger Cookie',2,'[{\"changed\": {\"fields\": [\"Irudia\"]}}]',7,1),(52,'2021-11-02 08:13:07.279117','6','Ladyfinger Cookie',2,'[]',7,1),(53,'2021-11-02 08:13:11.217931','5','Gingerbread Cookie',2,'[{\"changed\": {\"fields\": [\"Irudia\"]}}]',7,1),(54,'2021-11-02 08:13:14.795478','4','Eclipse Cookie',2,'[{\"changed\": {\"fields\": [\"Irudia\"]}}]',7,1),(55,'2021-11-02 08:13:19.399020','3','Cashew Cookie',2,'[{\"changed\": {\"fields\": [\"Irudia\"]}}]',7,1),(56,'2021-11-02 08:13:22.575782','3','Cashew Cookie',2,'[]',7,1),(57,'2021-11-02 08:13:25.677162','2','Banana Cookie',2,'[]',7,1),(58,'2021-11-02 08:13:28.577827','1','Apple Cookie',2,'[{\"changed\": {\"fields\": [\"Irudia\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (15,'admin','logentry'),(10,'apiapp','bezeroa'),(14,'apiapp','eskaera'),(12,'apiapp','mota'),(13,'apiapp','produktua'),(11,'apiapp','saskia'),(2,'auth','group'),(1,'auth','permission'),(3,'auth','user'),(4,'contenttypes','contenttype'),(9,'cukysapp','bezeroa'),(8,'cukysapp','eskaera'),(5,'cukysapp','mota'),(7,'cukysapp','produktua'),(6,'cukysapp','saskia'),(16,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-10-27 07:53:30.134740'),(2,'auth','0001_initial','2021-10-27 07:53:46.474569'),(3,'cukysapp','0001_initial','2021-10-27 07:54:01.877114'),(4,'admin','0001_initial','2021-10-27 07:54:51.747326'),(5,'admin','0002_logentry_remove_auto_add','2021-10-27 07:54:51.825428'),(6,'admin','0003_logentry_add_action_flag_choices','2021-10-27 07:54:51.903538'),(7,'contenttypes','0002_remove_content_type_name','2021-10-27 07:54:54.168619'),(8,'auth','0002_alter_permission_name_max_length','2021-10-27 07:54:55.918196'),(9,'auth','0003_alter_user_email_max_length','2021-10-27 07:54:58.667513'),(10,'auth','0004_alter_user_username_opts','2021-10-27 07:54:58.761239'),(11,'auth','0005_alter_user_last_login_null','2021-10-27 07:55:01.026371'),(12,'auth','0006_require_contenttypes_0002','2021-10-27 07:55:01.073227'),(13,'auth','0007_alter_validators_add_error_messages','2021-10-27 07:55:01.182570'),(14,'auth','0008_alter_user_username_max_length','2021-10-27 07:55:02.791562'),(15,'auth','0009_alter_user_last_name_max_length','2021-10-27 07:55:04.072498'),(16,'auth','0010_alter_group_name_max_length','2021-10-27 07:55:04.291208'),(17,'auth','0011_update_proxy_permissions','2021-10-27 07:55:04.369306'),(18,'auth','0012_alter_user_first_name_max_length','2021-10-27 07:55:06.025179'),(19,'sessions','0001_initial','2021-10-27 07:55:07.009264');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('lv5spz6u6sbay3sr4jf0z87wf0dn4sh9','.eJxVjMsOwiAQRf-FtSHQoTxcuvcbyDCMUjWQlHZl_HdD0oVu7znnvkXEfStx77zGJYuz0OL0uyWkJ9cB8gPrvUlqdVuXJIciD9rltWV-XQ7376BgL6NWWQVtARB0sMwaMDi6gZ8NsiaGlIxyFihk8nlm48GwAWeSogDTJD5f15s3bQ:1miaaK:6yMaQKZ9ZFuucaxl37yTZcvx5UPssdDQz-DBDpVW4SU','2021-11-18 11:07:08.620921');
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

-- Dump completed on 2021-11-05 11:48:39
