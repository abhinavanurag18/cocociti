-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cocociti3
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add sub_ category',8,'add_sub_category'),(23,'Can change sub_ category',8,'change_sub_category'),(24,'Can delete sub_ category',8,'delete_sub_category'),(25,'Can add scart',9,'add_scart'),(26,'Can change scart',9,'change_scart'),(27,'Can delete scart',9,'delete_scart'),(28,'Can add rcart',10,'add_rcart'),(29,'Can change rcart',10,'change_rcart'),(30,'Can delete rcart',10,'delete_rcart'),(31,'Can add checkuout',11,'add_checkuout'),(32,'Can change checkuout',11,'change_checkuout'),(33,'Can delete checkuout',11,'delete_checkuout'),(34,'Can add gen product',12,'add_genproduct'),(35,'Can change gen product',12,'change_genproduct'),(36,'Can delete gen product',12,'delete_genproduct'),(37,'Can add fbuser',13,'add_fbuser'),(38,'Can change fbuser',13,'change_fbuser'),(39,'Can delete fbuser',13,'delete_fbuser'),(40,'Can add justuser',14,'add_justuser'),(41,'Can change justuser',14,'change_justuser'),(42,'Can delete justuser',14,'delete_justuser'),(43,'Can add subscribe',15,'add_subscribe'),(44,'Can change subscribe',15,'change_subscribe'),(45,'Can delete subscribe',15,'delete_subscribe');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$nplfRqpRdbC2$NtzDD/U4i/3eqGkd8tXHbCZqrCNuy7NBEFyYPlN0hJw=','2014-12-26 22:06:51',1,'abhinav','','','abhinavanurag18@gmail.com',1,1,'2014-12-21 14:39:20');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_checkuout`
--

DROP TABLE IF EXISTS `checkout_checkuout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_checkuout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkout_numr` int(11) NOT NULL,
  `checkout_nums` int(11) NOT NULL,
  `delivery_name` varchar(200) NOT NULL,
  `delivery_add_1` varchar(200) NOT NULL,
  `delivery_add_2` varchar(200) NOT NULL,
  `delivery_city` varchar(100) NOT NULL,
  `delivery_state` varchar(100) NOT NULL,
  `delivery_country` varchar(100) NOT NULL,
  `delivery_pincode` varchar(8) NOT NULL,
  `delivery_phone` varchar(11) NOT NULL,
  `delivery_email` varchar(75) NOT NULL,
  `created` datetime NOT NULL,
  `checkout_customer_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_checkuout_7815777e` (`checkout_customer_id`),
  CONSTRAINT `che_checkout_customer_id_664b349c7e78fd74_fk_login_fbuser_userid` FOREIGN KEY (`checkout_customer_id`) REFERENCES `login_fbuser` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_checkuout`
--

LOCK TABLES `checkout_checkuout` WRITE;
/*!40000 ALTER TABLE `checkout_checkuout` DISABLE KEYS */;
INSERT INTO `checkout_checkuout` VALUES (1,2,6,'abhinav','BITS Pilani','jkjggkj','Pilani','Rajasthan','India','333031','7737485448','hello@cocociti.com','2014-12-24 23:28:49','941197832573286'),(2,2,6,'abhinav','BITS Pilani','jkjggkj','Pilani','Rajasthan','India','333031','7737485448','hello@cocociti.com','2014-12-24 23:30:27','941197832573286'),(3,1,0,'Boots and Jackets','khlkkjhk','khlkkjhk','jkjggkj','kjhk','India','877878','7737485448','hello@cocociti.com','2014-12-25 15:34:57','941197832573286'),(4,1,1,'abhinav','BITS Pilani','jkjggkj','Pilani','Rajasthan','India','333031','7737485448','hello@cocociti.com','2014-12-26 16:46:23','941197832573286'),(5,1,1,'abhinav','BITS Pilani','jkjggkj','Pilani','Rajasthan','India','333031','7737485448','hello@cocociti.com','2014-12-26 16:47:37','941197832573286');
/*!40000 ALTER TABLE `checkout_checkuout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_checkuout_checkout_item_rcart`
--

DROP TABLE IF EXISTS `checkout_checkuout_checkout_item_rcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_checkuout_checkout_item_rcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkuout_id` int(11) NOT NULL,
  `rcart_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `checkuout_id` (`checkuout_id`,`rcart_id`),
  KEY `checkout_checkuout_checkout_item_rcart_8e0e460c` (`checkuout_id`),
  KEY `checkout_checkuout_checkout_item_rcart_79573705` (`rcart_id`),
  CONSTRAINT `checkout_checkuou_rcart_id_72cc77a1f7b234eb_fk_checkout_rcart_id` FOREIGN KEY (`rcart_id`) REFERENCES `checkout_rcart` (`id`),
  CONSTRAINT `checkout__checkuout_id_3696c38ee8519aae_fk_checkout_checkuout_id` FOREIGN KEY (`checkuout_id`) REFERENCES `checkout_checkuout` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_checkuout_checkout_item_rcart`
--

LOCK TABLES `checkout_checkuout_checkout_item_rcart` WRITE;
/*!40000 ALTER TABLE `checkout_checkuout_checkout_item_rcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_checkuout_checkout_item_rcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_checkuout_checkout_item_scart`
--

DROP TABLE IF EXISTS `checkout_checkuout_checkout_item_scart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_checkuout_checkout_item_scart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkuout_id` int(11) NOT NULL,
  `scart_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `checkuout_id` (`checkuout_id`,`scart_id`),
  KEY `checkout_checkuout_checkout_item_scart_8e0e460c` (`checkuout_id`),
  KEY `checkout_checkuout_checkout_item_scart_35dac915` (`scart_id`),
  CONSTRAINT `checkout_checkuou_scart_id_2c6bbf2bade380c7_fk_checkout_scart_id` FOREIGN KEY (`scart_id`) REFERENCES `checkout_scart` (`id`),
  CONSTRAINT `checkout__checkuout_id_2d929651c38c29e7_fk_checkout_checkuout_id` FOREIGN KEY (`checkuout_id`) REFERENCES `checkout_checkuout` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_checkuout_checkout_item_scart`
--

LOCK TABLES `checkout_checkuout_checkout_item_scart` WRITE;
/*!40000 ALTER TABLE `checkout_checkuout_checkout_item_scart` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_checkuout_checkout_item_scart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_rcart`
--

DROP TABLE IF EXISTS `checkout_rcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_rcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_item_quantity` int(11) NOT NULL,
  `rent_start` date NOT NULL,
  `rent_end` date NOT NULL,
  `rent_days` int(11) NOT NULL,
  `cart_customer_id_id` varchar(100) NOT NULL,
  `cart_item_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_rcart_05c4906f` (`cart_customer_id_id`),
  KEY `checkout_rcart_ac09329e` (`cart_item_id_id`),
  CONSTRAINT `chec_cart_customer_id_id_32ce087427d29be6_fk_login_fbuser_userid` FOREIGN KEY (`cart_customer_id_id`) REFERENCES `login_fbuser` (`userid`),
  CONSTRAINT `ch_cart_item_id_id_37775aba3ec71177_fk_listingform_genproduct_id` FOREIGN KEY (`cart_item_id_id`) REFERENCES `listingform_genproduct` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_rcart`
--

LOCK TABLES `checkout_rcart` WRITE;
/*!40000 ALTER TABLE `checkout_rcart` DISABLE KEYS */;
INSERT INTO `checkout_rcart` VALUES (2,1,'2014-12-29','2014-12-31',2,'941197832573286',2),(3,1,'2015-01-14','2015-02-13',30,'941197832573286',5);
/*!40000 ALTER TABLE `checkout_rcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_scart`
--

DROP TABLE IF EXISTS `checkout_scart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_scart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_item_quantity` int(11) NOT NULL,
  `cart_customer_id_id` varchar(100) NOT NULL,
  `cart_item_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_scart_05c4906f` (`cart_customer_id_id`),
  KEY `checkout_scart_ac09329e` (`cart_item_id_id`),
  CONSTRAINT `chec_cart_customer_id_id_41b892cbd657f361_fk_login_fbuser_userid` FOREIGN KEY (`cart_customer_id_id`) REFERENCES `login_fbuser` (`userid`),
  CONSTRAINT `ch_cart_item_id_id_7eaaa906fab78604_fk_listingform_genproduct_id` FOREIGN KEY (`cart_item_id_id`) REFERENCES `listingform_genproduct` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_scart`
--

LOCK TABLES `checkout_scart` WRITE;
/*!40000 ALTER TABLE `checkout_scart` DISABLE KEYS */;
INSERT INTO `checkout_scart` VALUES (2,1,'941197832573286',2),(3,1,'941197832573286',4),(4,1,'941197832573286',5),(5,1,'941197832573286',7);
/*!40000 ALTER TABLE `checkout_scart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-12-21 14:51:44','1','Adventure Gear',1,'',7,1),(2,'2014-12-21 14:52:14','2','Books and CDs',1,'',7,1),(3,'2014-12-21 14:52:40','3','Electronics',1,'',7,1),(4,'2014-12-21 14:53:33','4','Home | Furniture',1,'',7,1),(5,'2014-12-21 14:53:53','5','Miscellaneous and Toys',1,'',7,1),(6,'2014-12-21 14:54:20','6','Party Stuff | Birthdays | Events',1,'',7,1),(7,'2014-12-21 14:55:09','7','Rent-a-dress | Fashion | Party | Dance | Wedding | Functions',1,'',7,1),(8,'2014-12-21 14:55:30','8','Tools and Machines',1,'',7,1),(9,'2014-12-21 14:55:59','9','Vehicles | Bikes | Cars | Cycles',1,'',7,1),(10,'2014-12-21 14:56:55','10','Vacation homes | Home stays | Houseboats | Tree house',1,'',7,1),(11,'2014-12-21 15:02:59','1','Backpacks and Bags',1,'',8,1),(12,'2014-12-21 15:03:35','2','Tents and Shelters',1,'',8,1),(13,'2014-12-21 15:03:56','3','Sleeping Bags and Mats',1,'',8,1),(14,'2014-12-21 15:04:19','4','Boots and Jackets',1,'',8,1),(15,'2014-12-21 15:08:10','5','Travel Accesories and Packaging Solutions',1,'',8,1),(16,'2014-12-21 15:08:23','6','Fiction and Non Fiction',1,'',8,1),(17,'2014-12-21 15:08:47','7','Educational',1,'',8,1),(18,'2014-12-21 15:09:02','8','Movies|CD/DVDs',1,'',8,1),(19,'2014-12-21 15:09:15','9','Music',1,'',8,1),(20,'2014-12-21 15:09:32','10','3D Printers',1,'',8,1),(21,'2014-12-21 15:09:48','11','Cameras and Accessories',1,'',8,1),(22,'2014-12-21 15:10:00','12','Computers and Laptops',1,'',8,1),(23,'2014-12-21 15:10:14','13','Projectors|Televisions|LED Displays',1,'',8,1),(24,'2014-12-21 15:10:59','14','UPS,Inverters and Generators',1,'',8,1),(25,'2014-12-21 15:11:28','15','Cutlery|China and Dinnerware',1,'',8,1),(26,'2014-12-21 15:11:48','16','Chairs,Tables,Linens and Tableskirts',1,'',8,1),(27,'2014-12-21 15:12:10','17','Liquor pourers|Glassware|Food and coffee Servers',1,'',8,1),(28,'2014-12-21 15:12:25','18','Cooking Equipments|Barbeque grills|Microwave Ovens',1,'',8,1),(29,'2014-12-21 15:12:42','19','Wedding items|Coat racks',1,'',8,1),(30,'2014-12-21 15:12:54','20','Other special event items',1,'',8,1),(31,'2014-12-21 15:13:10','21','Drills and Screw Drivers',1,'',8,1),(32,'2014-12-21 15:13:31','22','Vacuum Cleaner',1,'',8,1),(33,'2014-12-21 15:13:44','23','Ladders',1,'',8,1),(34,'2014-12-21 15:14:05','24','Carpenter tools',1,'',8,1),(35,'2014-12-21 15:14:31','25','Bikes | Two Wheelers',1,'',8,1),(36,'2014-12-21 15:14:54','26','Cars | Four Wheelers',1,'',8,1),(37,'2014-12-21 15:15:10','27','Cycling',1,'',8,1),(38,'2014-12-21 15:15:29','28','Racing Cars & Bikes',1,'',8,1),(39,'2014-12-21 15:16:12','29','Off Road',1,'',8,1),(40,'2014-12-21 15:18:18','30','Accessories',1,'',8,1),(41,'2014-12-21 15:18:56','31','Sarees | Wedding wears',1,'',8,1),(42,'2014-12-21 15:19:09','32','Party Wear | Formals | Office wears | Suits',1,'',8,1),(43,'2014-12-21 15:19:21','33','Costumes for: Dance | competitions | Convocations',1,'',8,1),(44,'2014-12-21 15:19:38','34','Traditional wears | Regional fashion | Ethnic fashion',1,'',8,1),(45,'2014-12-21 15:19:58','35','Kids | Costumes | Santa Claus',1,'',8,1),(46,'2014-12-21 15:20:15','36','All other things',1,'',8,1),(47,'2014-12-21 15:21:57','37','Art | Antiques | Handicrafts',1,'',8,1),(48,'2014-12-21 15:22:09','38','Home & Kitchen Appliances',1,'',8,1),(49,'2014-12-21 15:22:24','39','Decor & Furnishings',1,'',8,1),(50,'2014-12-21 15:22:39','40','Bed | Mattresses | Pillows | Coats | Bean Bags',1,'',8,1),(51,'2014-12-21 15:23:02','41','All other stuffs',1,'',8,1),(52,'2014-12-21 15:23:17','42','Fridge - AC - Washing Machine',1,'',8,1),(53,'2014-12-22 09:17:24','5','Miscellaneous and Toys',3,'',7,1),(54,'2014-12-23 21:01:15','1','qwerty - 1',3,'',12,1),(55,'2014-12-26 11:23:44','2','hjhkj - 1',2,'Changed warranty.',12,1),(56,'2014-12-26 13:30:05','2','hjhkj - 1',2,'Changed logistics.',12,1),(57,'2014-12-26 13:44:47','3','qwerty - 1',2,'Changed subcat_id.',12,1),(58,'2014-12-26 14:25:41','4','fds - 1',2,'Changed rent.',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'category','landingpage','category'),(8,'sub_ category','landingpage','sub_category'),(9,'scart','checkout','scart'),(10,'rcart','checkout','rcart'),(11,'checkuout','checkout','checkuout'),(12,'gen product','listingform','genproduct'),(13,'fbuser','login','fbuser'),(14,'justuser','login','justuser'),(15,'subscribe','landingpage','subscribe');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2014-12-21 14:36:41'),(2,'auth','0001_initial','2014-12-21 14:36:46'),(3,'admin','0001_initial','2014-12-21 14:36:47'),(4,'login','0001_initial','2014-12-21 14:36:48'),(5,'listingform','0001_initial','2014-12-21 14:36:48'),(6,'checkout','0001_initial','2014-12-21 14:36:55'),(7,'landingpage','0001_initial','2014-12-21 14:36:56'),(8,'landingpage','0002_auto_20141221_1434','2014-12-21 14:36:56'),(9,'sessions','0001_initial','2014-12-21 14:36:57'),(10,'listingform','0002_auto_20141226_1741','2014-12-26 17:41:38'),(11,'listingform','0003_auto_20141226_2016','2014-12-26 20:16:59'),(12,'landingpage','0003_subscribe','2014-12-26 22:00:48'),(13,'landingpage','0004_auto_20141227_0008','2014-12-27 00:08:24'),(14,'listingform','0004_auto_20141227_0455','2014-12-27 04:55:16');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('05uxzicskzfy5quto85hor26n8a7i1mv','YTNkODE2YmQ0YTdhMTUxMzlkNTJhNmM5ZDgzZGM4Y2YyYjZlODAzODp7fQ==','2015-01-07 22:40:30'),('1o1mv75ai1k5g2ryi570sb4d5zmqpg6u','ZjMyYTFjMDEyNDIyNmZjMTM0N2VlZGZiNzUwODgzYTg5M2EyMGNhMTp7InVzZXJuYW1lIjoiQWJoaW5hdiBBbnVyYWciLCJ1c2VyaWQiOiI5NDExOTc4MzI1NzMyODYiLCJjYXJ0bGVuZ3RoIjowfQ==','2015-01-08 01:17:54'),('1ppmnte72kl89wmqjbhh72ajyonquvsk','MDk5MTc0ZDlkNDZkNWE1ZjI1MTUyYmU2ODgxYmU4MDZmYTA4OTI1OTp7InVzZXJuYW1lIjoiQWJoaW5hdiBBbnVyYWciLCJ1c2VyaWQiOiI5NDExOTc4MzI1NzMyODYifQ==','2015-01-06 17:43:53'),('2p07m327zk85j3zdys9i9o3y6nxu2pk2','YTNkODE2YmQ0YTdhMTUxMzlkNTJhNmM5ZDgzZGM4Y2YyYjZlODAzODp7fQ==','2015-01-06 18:45:52'),('2sjntl6owhyzcmfbeh26njxuejt98ddd','Y2RkOWY4NmFlNTU3ZDgyMDMzODkyZGY1OTU5NzY1MDRlNjQxYjU0Njp7InVzZXJuYW1lIjoiQWJoaW5hdiBBbnVyYWciLCJfYXV0aF91c2VyX2lkIjoxLCJ1c2VyaWQiOiI5NDExOTc4MzI1NzMyODYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImNhcnRsZW5ndGgiOjEsIl9hdXRoX3VzZXJfaGFzaCI6ImI0YjI0OGUwOTMwYjYyYWU0YzEzNmZhMjkwYzFiMjdlMDA1MGQ1ZmYifQ==','2015-01-08 00:53:31'),('40isl5syl1ve2nbzu8maw98qhqyoawxh','OGEyYThhODZhMTc3ODEzNjFkMGMyMmQ3YWRjYjA4ZmRjNmM4MDcyMTp7ImNhcnRsZW5ndGgiOjB9','2015-01-07 20:31:43'),('444dyow3intu9v0sldhmfo4fu5fw4fi7','OWVkMGVmODBjMGQ0NWFmODllNWJjMjIzZjBiOGJjOTlkYWQ3NzA2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI0YjI0OGUwOTMwYjYyYWU0YzEzNmZhMjkwYzFiMjdlMDA1MGQ1ZmYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-01-07 07:03:49'),('602waqsv9cgwsls67ozwy91tnt76b5us','MmQ0OWNiODM0Y2UzOGU4YzEzNjNkMzBjZDUzOThkZDE0OWViNTA4Yjp7InVzZXJuYW1lIjoiIiwidXNlcmlkIjoiIn0=','2015-01-06 18:51:44'),('94fusx0qtq5dhwnuyxw2kzyi72p8bkvt','MmQ0OWNiODM0Y2UzOGU4YzEzNjNkMzBjZDUzOThkZDE0OWViNTA4Yjp7InVzZXJuYW1lIjoiIiwidXNlcmlkIjoiIn0=','2015-01-06 18:58:56'),('ag5rbwqm49xcrqyfup14vqrvvqhqo51d','YWE2OTc1NGViY2I1ZDE2ZTFjMWE4ZGY5MmE0YzVlM2I5OTc4YzUxZDp7InVzZXJuYW1lIjoiQWJoaW5hdiBBbnVyYWciLCJfYXV0aF91c2VyX2lkIjoxLCJ1c2VyaWQiOiI5NDExOTc4MzI1NzMyODYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImNhcnRsZW5ndGgiOjYsIl9hdXRoX3VzZXJfaGFzaCI6ImI0YjI0OGUwOTMwYjYyYWU0YzEzNmZhMjkwYzFiMjdlMDA1MGQ1ZmYifQ==','2015-01-07 20:27:09'),('eeyw1rlpqgtkyjdha7ukqh13sabnq2ec','YWE2OTc1NGViY2I1ZDE2ZTFjMWE4ZGY5MmE0YzVlM2I5OTc4YzUxZDp7InVzZXJuYW1lIjoiQWJoaW5hdiBBbnVyYWciLCJfYXV0aF91c2VyX2lkIjoxLCJ1c2VyaWQiOiI5NDExOTc4MzI1NzMyODYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImNhcnRsZW5ndGgiOjYsIl9hdXRoX3VzZXJfaGFzaCI6ImI0YjI0OGUwOTMwYjYyYWU0YzEzNmZhMjkwYzFiMjdlMDA1MGQ1ZmYifQ==','2015-01-09 21:30:10'),('f7hg4e9mc7qkc14fjvum5v2wryucb2fd','YWE2OTc1NGViY2I1ZDE2ZTFjMWE4ZGY5MmE0YzVlM2I5OTc4YzUxZDp7InVzZXJuYW1lIjoiQWJoaW5hdiBBbnVyYWciLCJfYXV0aF91c2VyX2lkIjoxLCJ1c2VyaWQiOiI5NDExOTc4MzI1NzMyODYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImNhcnRsZW5ndGgiOjYsIl9hdXRoX3VzZXJfaGFzaCI6ImI0YjI0OGUwOTMwYjYyYWU0YzEzNmZhMjkwYzFiMjdlMDA1MGQ1ZmYifQ==','2015-01-09 22:27:00'),('gkbkwk9vl3r2w35xr39rhhh3wi7yb7d9','OGEyYThhODZhMTc3ODEzNjFkMGMyMmQ3YWRjYjA4ZmRjNmM4MDcyMTp7ImNhcnRsZW5ndGgiOjB9','2015-01-07 23:33:56'),('gyff0ggkuo8kmyidtnrtd8scgocmyx4z','YTNkODE2YmQ0YTdhMTUxMzlkNTJhNmM5ZDgzZGM4Y2YyYjZlODAzODp7fQ==','2015-01-07 16:33:40'),('hy1l3z2npbxwj182ca3groiij7rfolo5','YTNkODE2YmQ0YTdhMTUxMzlkNTJhNmM5ZDgzZGM4Y2YyYjZlODAzODp7fQ==','2015-01-06 18:46:17'),('i2gkj9vxt7b4p47se5w7tpkfcft5xgbd','YTNkODE2YmQ0YTdhMTUxMzlkNTJhNmM5ZDgzZGM4Y2YyYjZlODAzODp7fQ==','2015-01-06 18:44:54'),('isns1us4p0q9upmtiuzc59uyoaomub9d','MzAyZjljMWUzOGNjMGE2Y2QwMDcxYzUzMmZmODM3ZTA3OWY2YjM0Njp7InVzZXJuYW1lIjoiQWJoaW5hdiBBbnVyYWciLCJfYXV0aF91c2VyX2lkIjoxLCJ1c2VyaWQiOiI5NDExOTc4MzI1NzMyODYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImNhcnRsZW5ndGgiOjAsIl9hdXRoX3VzZXJfaGFzaCI6ImI0YjI0OGUwOTMwYjYyYWU0YzEzNmZhMjkwYzFiMjdlMDA1MGQ1ZmYifQ==','2015-01-09 11:23:06'),('lnkibv8xithbdsgkvcrea6ob4g4ylhlh','ZGM1MzJmYjZkZTFmYTk4N2E3Njk5ZDZkMTk1YzdkY2IxNzBmNTFmZTp7InVzZXJuYW1lIjoiQWJoaW5hdiBBbnVyYWciLCJfYXV0aF91c2VyX2hhc2giOiJiNGIyNDhlMDkzMGI2MmFlNGMxMzZmYTI5MGMxYjI3ZTAwNTBkNWZmIiwidXNlcmlkIjoiOTQxMTk3ODMyNTczMjg2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2015-01-06 20:42:44'),('ls0i6w97ggchzu3flow1pc2fu0pywvus','OWVkMGVmODBjMGQ0NWFmODllNWJjMjIzZjBiOGJjOTlkYWQ3NzA2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI0YjI0OGUwOTMwYjYyYWU0YzEzNmZhMjkwYzFiMjdlMDA1MGQ1ZmYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-01-04 14:39:54'),('lvuayu81028ax91atmzdk5w2zvnefdsg','YTNkODE2YmQ0YTdhMTUxMzlkNTJhNmM5ZDgzZGM4Y2YyYjZlODAzODp7fQ==','2015-01-06 18:46:27'),('n1zhi98jvwh62mpcy4boshh57l2rr0d0','YTNkODE2YmQ0YTdhMTUxMzlkNTJhNmM5ZDgzZGM4Y2YyYjZlODAzODp7fQ==','2015-01-06 18:44:27'),('sa9lmo8gdlv6breuiie02aco4urpukxx','MDk5MTc0ZDlkNDZkNWE1ZjI1MTUyYmU2ODgxYmU4MDZmYTA4OTI1OTp7InVzZXJuYW1lIjoiQWJoaW5hdiBBbnVyYWciLCJ1c2VyaWQiOiI5NDExOTc4MzI1NzMyODYifQ==','2015-01-06 19:10:33'),('tzmn17bbg3xw2skn0kby0z4z4qtcs6wc','ODBmODgxYWJlYzMxNDQ0Y2Y3YjdjZmFhZjZjNDY4NjA3MzBmOGY0NTp7InVzZXJuYW1lIjoiQWJoaW5hdiBBbnVyYWciLCJ1c2VyaWQiOiI5NDExOTc4MzI1NzMyODYiLCJjYXJ0bGVuZ3RoIjoxfQ==','2015-01-08 15:51:57'),('ufsif8afa8mx4v482zawde1oe2vstsmp','YTNkODE2YmQ0YTdhMTUxMzlkNTJhNmM5ZDgzZGM4Y2YyYjZlODAzODp7fQ==','2015-01-09 16:59:50'),('y648nbxqkhs9qhamlfcpwhxr9gnu11lt','MzAyZjljMWUzOGNjMGE2Y2QwMDcxYzUzMmZmODM3ZTA3OWY2YjM0Njp7InVzZXJuYW1lIjoiQWJoaW5hdiBBbnVyYWciLCJfYXV0aF91c2VyX2lkIjoxLCJ1c2VyaWQiOiI5NDExOTc4MzI1NzMyODYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImNhcnRsZW5ndGgiOjAsIl9hdXRoX3VzZXJfaGFzaCI6ImI0YjI0OGUwOTMwYjYyYWU0YzEzNmZhMjkwYzFiMjdlMDA1MGQ1ZmYifQ==','2015-01-07 21:26:01'),('ygsbe1nrnfke5izrix0d5tvmk7xtciyc','OGEyYThhODZhMTc3ODEzNjFkMGMyMmQ3YWRjYjA4ZmRjNmM4MDcyMTp7ImNhcnRsZW5ndGgiOjB9','2015-01-09 18:53:38');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landingpage_category`
--

DROP TABLE IF EXISTS `landingpage_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landingpage_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landingpage_category`
--

LOCK TABLES `landingpage_category` WRITE;
/*!40000 ALTER TABLE `landingpage_category` DISABLE KEYS */;
INSERT INTO `landingpage_category` VALUES (1,'Adventure Gear','Share and get quality adventure gear from other travel ninjas online. Why spend Rs.7-15K on backbacks or tents for your Himalayan trip if you don\'t have plan to travel 365 days a year?'),(2,'Books and CDs','Share and get books and CDs from other fellow bibliophiles & movie buffs online. Why spend Rs.100-3000 when you can get a bundle of books/CDs 1/7th of the cost or less? Go Coco!'),(3,'Electronics','Need a Mac book for a presentation or power backup systems for an event? Go Coco.'),(4,'Home | Furniture','Everything you need for home on short term rentals. Go Coco!'),(6,'Party Stuff | Birthdays | Events','Unless you are the Great Gatsby or live in a Dartmouth fraternity, you probably aren\'t throwing parties all that frequently. So an alternative to spending hundreds of dollars on large numbers of place settings, extra tables and chairs, silverware and other items is to rent for special occasions. Remember, having less stuff may also mean you need less living and storage space and that\'s responsible for a huge part of your environmental footprint. Save everyone & go Coco!'),(7,'Rent-a-dress | Fashion | Party | Dance | Wedding | Functions','Oh! Thinking of what to wear for your special function and too bored to go out & spend money on new clothes for a single use ocassion? Why worry when you have cocociti at at a click away. Share and rent from personal wardrobes across the country. Go Coco!'),(8,'Tools and Machines','It doesn\'t make sense to pay a lot of money for a tool you may only use once or twice a year or for one specific project, leaving it to sit in your garage the remainder of the time. Sometimes you\'re better off renting. You get a high-quality tool that\'ll help you ace a project and maybe even save you time. Go Coco!'),(9,'Vehicles | Bikes | Cars | Cycles','Rent car,bike and other vehicles.'),(10,'Vacation homes | Home stays | Houseboats | Tree house','Why pay 5K per day for hotel when you have a second home wherever you go?');
/*!40000 ALTER TABLE `landingpage_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landingpage_sub_category`
--

DROP TABLE IF EXISTS `landingpage_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landingpage_sub_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `cat_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `landingpage_sub_category_67e8c3b2` (`cat_id_id`),
  CONSTRAINT `landingpag_cat_id_id_5ddbffb21f0e6e66_fk_landingpage_category_id` FOREIGN KEY (`cat_id_id`) REFERENCES `landingpage_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landingpage_sub_category`
--

LOCK TABLES `landingpage_sub_category` WRITE;
/*!40000 ALTER TABLE `landingpage_sub_category` DISABLE KEYS */;
INSERT INTO `landingpage_sub_category` VALUES (1,'Backpacks and Bags',1),(2,'Tents and Shelters',1),(3,'Sleeping Bags and Mats',1),(4,'Boots and Jackets',1),(5,'Travel Accesories and Packaging Solutions',1),(6,'Fiction and Non Fiction',2),(7,'Educational',2),(8,'Movies|CD/DVDs',2),(9,'Music',2),(10,'3D Printers',3),(11,'Cameras and Accessories',3),(12,'Computers and Laptops',3),(13,'Projectors|Televisions|LED Displays',3),(14,'UPS,Inverters and Generators',3),(15,'Cutlery|China and Dinnerware',6),(16,'Chairs,Tables,Linens and Tableskirts',6),(17,'Liquor pourers|Glassware|Food and coffee Servers',6),(18,'Cooking Equipments|Barbeque grills|Microwave Ovens',6),(19,'Wedding items|Coat racks',6),(20,'Other special event items',6),(21,'Drills and Screw Drivers',8),(22,'Vacuum Cleaner',8),(23,'Ladders',8),(24,'Carpenter tools',8),(25,'Bikes | Two Wheelers',9),(26,'Cars | Four Wheelers',9),(27,'Cycling',9),(28,'Racing Cars & Bikes',9),(29,'Off Road',9),(30,'Accessories',7),(31,'Sarees | Wedding wears',7),(32,'Party Wear | Formals | Office wears | Suits',7),(33,'Costumes for: Dance | competitions | Convocations',7),(34,'Traditional wears | Regional fashion | Ethnic fashion',7),(35,'Kids | Costumes | Santa Claus',7),(36,'All other things',7),(37,'Art | Antiques | Handicrafts',4),(38,'Home & Kitchen Appliances',4),(39,'Decor & Furnishings',4),(40,'Bed | Mattresses | Pillows | Coats | Bean Bags',4),(41,'All other stuffs',4),(42,'Fridge - AC - Washing Machine',4);
/*!40000 ALTER TABLE `landingpage_sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landingpage_subscribe`
--

DROP TABLE IF EXISTS `landingpage_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landingpage_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landingpage_subscribe`
--

LOCK TABLES `landingpage_subscribe` WRITE;
/*!40000 ALTER TABLE `landingpage_subscribe` DISABLE KEYS */;
INSERT INTO `landingpage_subscribe` VALUES (1,'abhinavanurag18@gmail.com');
/*!40000 ALTER TABLE `landingpage_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listingform_genproduct`
--

DROP TABLE IF EXISTS `listingform_genproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listingform_genproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` varchar(128) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `subcat_id` int(11) NOT NULL,
  `product_title` varchar(128) NOT NULL,
  `product_details` longtext,
  `buyingprice` int(11) DEFAULT NULL,
  `price` varchar(128) NOT NULL,
  `sellprice` varchar(128) NOT NULL,
  `pickup` longtext NOT NULL,
  `pickup_lat` varchar(128) NOT NULL,
  `pickup_long` varchar(128) NOT NULL,
  `pickup_city` varchar(128) NOT NULL,
  `pickup_state` varchar(128) NOT NULL,
  `pickup_country` varchar(128) NOT NULL,
  `pincode` int(11) NOT NULL,
  `warranty` varchar(12) NOT NULL,
  `explicit_terms_conditions` longtext,
  `availability` varchar(12) NOT NULL,
  `logistics` varchar(12) NOT NULL,
  `rent` varchar(12) NOT NULL,
  `sell` varchar(12) NOT NULL,
  `security_deposits` varchar(128) NOT NULL,
  `product_pic` varchar(1000) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `listingform_genproduct_2dbcba41` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listingform_genproduct`
--

LOCK TABLES `listingform_genproduct` WRITE;
/*!40000 ALTER TABLE `listingform_genproduct` DISABLE KEYS */;
INSERT INTO `listingform_genproduct` VALUES (2,'941197832573286',1,1,'hjhkj','hjh',545,'43','56','goa','15.3004543','74.0855134','0','0','0',800010,'0','nbjh','1','0','1','1','0','media/2014/12/23/21/00/30/team.jpg','hjhkj'),(3,'941197832573286',1,1,'qwerty','ddfsfd',231,'2342','3543','pilani','28.3622661','75.6042342','0','0','0',333031,'1','sds','1','0','0','0','34','media/2014/12/26/13/42/01/CoCoCiti_logo_COR_10-3cm_RGB.png','qwerty'),(4,'941197832573286',1,1,'fds','dfdg',125,'43','56','patna','25.609575','85.1238191','0','0','0',333031,'1','sds','0','1','0','1','212','media/2014/12/26/13/46/13/Screenshot_from_2014-11-30_230731.png','fds'),(5,'941197832573286',1,1,'erf','sdfs',434,'43','6757','oman','21.0000287','57.0036901','0','0','0',767676,'1','dfgfg','1','1','1','1','21','media/2014/12/26/13/47/10/team.jpg','erf'),(6,'941197832573286',1,1,'qws','sdfs',23,'32','','delhi','28.6572914','77.2272603','0','0','0',800010,'1','sdsdas','1','1','1','0','2323','media/2014/12/26/17/32/00/team.jpg','qws'),(7,'941197832573286',1,1,'qasx','asdasa',2234,'23','2324','pilani','28.3622661','75.6042342','0','0','0',800010,'1','','1','1','0','1','','media/2014/12/26/17/44/25/CoCoCiti_logo_COR_10-3cm_RGB.png','qasx');
/*!40000 ALTER TABLE `listingform_genproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_fbuser`
--

DROP TABLE IF EXISTS `login_fbuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_fbuser` (
  `userid` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `aliasname` varchar(100) NOT NULL,
  `email` varchar(75) NOT NULL,
  `phoneno1` varchar(13) NOT NULL,
  `phoneno2` varchar(13) NOT NULL,
  `address` longtext NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_fbuser`
--

LOCK TABLES `login_fbuser` WRITE;
/*!40000 ALTER TABLE `login_fbuser` DISABLE KEYS */;
INSERT INTO `login_fbuser` VALUES ('941197832573286','Abhinav Anurag','Abhinav Anurag','hello@cocociti.com','917737485448','917737485448','hbjhbj');
/*!40000 ALTER TABLE `login_fbuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_justuser`
--

DROP TABLE IF EXISTS `login_justuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_justuser` (
  `userid` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_justuser`
--

LOCK TABLES `login_justuser` WRITE;
/*!40000 ALTER TABLE `login_justuser` DISABLE KEYS */;
INSERT INTO `login_justuser` VALUES ('941197832573286','Abhinav Anurag');
/*!40000 ALTER TABLE `login_justuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-27 10:26:16
