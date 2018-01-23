-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: ixpmanager
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `apiKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime DEFAULT NULL,
  `allowedIPs` mediumtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `lastseenAt` datetime DEFAULT NULL,
  `lastseenFrom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9579321F800A1141` (`apiKey`),
  KEY `IDX_9579321FA76ED395` (`user_id`),
  CONSTRAINT `FK_9579321FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
INSERT INTO `api_keys` VALUES (2,4,'daEpzL0faxeFHDPGP3JmXDutMQTMZxOlzk7LErYnIGUBK2Zt',NULL,'','2018-01-19 12:03:30','2018-01-20 15:56:08','fd99::30');
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bgpsessiondata`
--

DROP TABLE IF EXISTS `bgpsessiondata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bgpsessiondata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `srcipaddressid` int(11) DEFAULT NULL,
  `dstipaddressid` int(11) DEFAULT NULL,
  `protocol` int(11) DEFAULT NULL,
  `vlan` int(11) DEFAULT NULL,
  `packetcount` int(11) DEFAULT '0',
  `timestamp` datetime DEFAULT NULL,
  `source` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bgpsessiondata`
--

LOCK TABLES `bgpsessiondata` WRITE;
/*!40000 ALTER TABLE `bgpsessiondata` DISABLE KEYS */;
/*!40000 ALTER TABLE `bgpsessiondata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabinet`
--

DROP TABLE IF EXISTS `cabinet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cabinet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locationid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cololocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  `u_counts_from` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4CED05B05E237E06` (`name`),
  KEY `IDX_4CED05B03530CCF` (`locationid`),
  CONSTRAINT `FK_4CED05B03530CCF` FOREIGN KEY (`locationid`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabinet`
--

LOCK TABLES `cabinet` WRITE;
/*!40000 ALTER TABLE `cabinet` DISABLE KEYS */;
INSERT INTO `cabinet` VALUES (1,1,'Cabinet 1','c1',0,'','',NULL);
/*!40000 ALTER TABLE `cabinet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_billing_detail`
--

DROP TABLE IF EXISTS `company_billing_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_billing_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billingContactName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingAddress1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingAddress2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingAddress3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingTownCity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingPostcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingCountry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingTelephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vatNumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vatRate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchaseOrderRequired` tinyint(1) NOT NULL DEFAULT '0',
  `invoiceMethod` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoiceEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingFrequency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_billing_detail`
--

LOCK TABLES `company_billing_detail` WRITE;
/*!40000 ALTER TABLE `company_billing_detail` DISABLE KEYS */;
INSERT INTO `company_billing_detail` VALUES (1,NULL,'c/o The Bill Payers','Money House, Moneybags Street',NULL,'Dublin','D4','IE',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(2,'','','','','','','','','','','',0,'','',''),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(4,'','','','','','','','','','','',0,'','',''),(5,'','','','','','','','','','','',0,'','','');
/*!40000 ALTER TABLE `company_billing_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_registration_detail`
--

DROP TABLE IF EXISTS `company_registration_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_registration_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registeredName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyNumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jurisdiction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `townCity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_registration_detail`
--

LOCK TABLES `company_registration_detail` WRITE;
/*!40000 ALTER TABLE `company_registration_detail` DISABLE KEYS */;
INSERT INTO `company_registration_detail` VALUES (1,'INEX','123456','Ireland','5 Somewhere',NULL,NULL,'Dublin','D4','IE'),(2,'','','','','','','','',''),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'','','','','','','','',''),(5,'','','','','','','','','');
/*!40000 ALTER TABLE `company_registration_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consoleserverconnection`
--

DROP TABLE IF EXISTS `consoleserverconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consoleserverconnection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custid` int(11) DEFAULT NULL,
  `switchid` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `parity` int(11) DEFAULT NULL,
  `stopbits` int(11) DEFAULT NULL,
  `flowcontrol` int(11) DEFAULT NULL,
  `autobaud` tinyint(1) DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_530316DCDA0209B9` (`custid`),
  KEY `IDX_530316DCDC2C08F8` (`switchid`),
  CONSTRAINT `FK_530316DCDA0209B9` FOREIGN KEY (`custid`) REFERENCES `cust` (`id`),
  CONSTRAINT `FK_530316DCDC2C08F8` FOREIGN KEY (`switchid`) REFERENCES `switch` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consoleserverconnection`
--

LOCK TABLES `consoleserverconnection` WRITE;
/*!40000 ALTER TABLE `consoleserverconnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `consoleserverconnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `custid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facilityaccess` tinyint(1) NOT NULL DEFAULT '0',
  `mayauthorize` tinyint(1) NOT NULL DEFAULT '0',
  `notes` longtext COLLATE utf8_unicode_ci,
  `lastupdated` datetime DEFAULT NULL,
  `lastupdatedby` int(11) DEFAULT NULL,
  `creator` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4C62E638A76ED395` (`user_id`),
  KEY `IDX_4C62E638DA0209B9` (`custid`),
  CONSTRAINT `FK_4C62E638A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_4C62E638DA0209B9` FOREIGN KEY (`custid`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (4,4,1,'Docker Superuser','','joe@example.com','','',1,1,'','2018-01-18 21:27:41',1,'vagrant','2018-01-18 21:27:41'),(5,5,4,'AS112 CustAdmin','','joe@exmaple.com','','',0,0,'','2018-01-18 21:29:48',4,'docker','2018-01-18 21:29:48'),(6,6,4,'as112user','','joe@example.com','','',0,0,'','2018-01-18 21:30:16',4,'docker','2018-01-18 21:30:16');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_group`
--

DROP TABLE IF EXISTS `contact_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `limited_to` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_40EA54CA5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_group`
--

LOCK TABLES `contact_group` WRITE;
/*!40000 ALTER TABLE `contact_group` DISABLE KEYS */;
INSERT INTO `contact_group` VALUES (1,'Billing','Contact role for billing matters','ROLE',1,0,'2014-01-06 13:54:22'),(2,'Technical','Contact role for technical matters','ROLE',1,0,'2014-01-06 13:54:22'),(3,'Admin','Contact role for admin matters','ROLE',1,0,'2014-01-06 13:54:22'),(4,'Marketing','Contact role for marketing matters','ROLE',1,0,'2014-01-06 13:54:22');
/*!40000 ALTER TABLE `contact_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_to_group`
--

DROP TABLE IF EXISTS `contact_to_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_to_group` (
  `contact_id` int(11) NOT NULL,
  `contact_group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`contact_id`,`contact_group_id`),
  KEY `IDX_FCD9E962E7A1254A` (`contact_id`),
  KEY `IDX_FCD9E962647145D0` (`contact_group_id`),
  CONSTRAINT `FK_FCD9E962647145D0` FOREIGN KEY (`contact_group_id`) REFERENCES `contact_group` (`id`),
  CONSTRAINT `FK_FCD9E962E7A1254A` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_to_group`
--

LOCK TABLES `contact_to_group` WRITE;
/*!40000 ALTER TABLE `contact_to_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_to_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corebundles`
--

DROP TABLE IF EXISTS `corebundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corebundles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `graph_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bfd` tinyint(1) NOT NULL DEFAULT '0',
  `ipv4_subnet` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipv6_subnet` varchar(43) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stp` tinyint(1) NOT NULL DEFAULT '0',
  `cost` int(10) unsigned DEFAULT NULL,
  `preference` int(10) unsigned DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corebundles`
--

LOCK TABLES `corebundles` WRITE;
/*!40000 ALTER TABLE `corebundles` DISABLE KEYS */;
/*!40000 ALTER TABLE `corebundles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coreinterfaces`
--

DROP TABLE IF EXISTS `coreinterfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coreinterfaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `physical_interface_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E1A404B7FF664B20` (`physical_interface_id`),
  CONSTRAINT `FK_E1A404B7FF664B20` FOREIGN KEY (`physical_interface_id`) REFERENCES `physicalinterface` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coreinterfaces`
--

LOCK TABLES `coreinterfaces` WRITE;
/*!40000 ALTER TABLE `coreinterfaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `coreinterfaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corelinks`
--

DROP TABLE IF EXISTS `corelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corelinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `core_interface_sidea_id` int(11) NOT NULL,
  `core_interface_sideb_id` int(11) NOT NULL,
  `core_bundle_id` int(11) NOT NULL,
  `bfd` tinyint(1) NOT NULL DEFAULT '0',
  `ipv4_subnet` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipv6_subnet` varchar(43) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_BE421236BEBB85C6` (`core_interface_sidea_id`),
  UNIQUE KEY `UNIQ_BE421236AC0E2A28` (`core_interface_sideb_id`),
  KEY `IDX_BE421236BE9AE9F7` (`core_bundle_id`),
  CONSTRAINT `FK_BE421236AC0E2A28` FOREIGN KEY (`core_interface_sideb_id`) REFERENCES `coreinterfaces` (`id`),
  CONSTRAINT `FK_BE421236BE9AE9F7` FOREIGN KEY (`core_bundle_id`) REFERENCES `corebundles` (`id`),
  CONSTRAINT `FK_BE421236BEBB85C6` FOREIGN KEY (`core_interface_sidea_id`) REFERENCES `coreinterfaces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corelinks`
--

LOCK TABLES `corelinks` WRITE;
/*!40000 ALTER TABLE `corelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `corelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust`
--

DROP TABLE IF EXISTS `cust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `irrdb` int(11) DEFAULT NULL,
  `company_registered_detail_id` int(11) DEFAULT NULL,
  `company_billing_details_id` int(11) DEFAULT NULL,
  `reseller` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbreviatedName` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autsys` int(11) DEFAULT NULL,
  `maxprefixes` int(11) DEFAULT NULL,
  `peeringemail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nocphone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noc24hphone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nocfax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nocemail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nochours` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nocwww` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `peeringmacro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `peeringmacrov6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `peeringpolicy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corpwww` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datejoin` date DEFAULT NULL,
  `dateleave` date DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `activepeeringmatrix` tinyint(1) DEFAULT NULL,
  `peeringDb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastupdated` date DEFAULT NULL,
  `lastupdatedby` int(11) DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` date DEFAULT NULL,
  `MD5Support` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'UNKNOWN',
  `isReseller` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_997B25A64082763` (`shortname`),
  KEY `IDX_997B25A666E98DF` (`irrdb`),
  KEY `IDX_997B25A98386213` (`company_registered_detail_id`),
  KEY `IDX_997B25A84478F0C` (`company_billing_details_id`),
  KEY `IDX_997B25A18015899` (`reseller`),
  CONSTRAINT `FK_997B25A18015899` FOREIGN KEY (`reseller`) REFERENCES `cust` (`id`),
  CONSTRAINT `FK_997B25A666E98DF` FOREIGN KEY (`irrdb`) REFERENCES `irrdbconfig` (`id`),
  CONSTRAINT `FK_997B25A84478F0C` FOREIGN KEY (`company_billing_details_id`) REFERENCES `company_billing_detail` (`id`),
  CONSTRAINT `FK_997B25A98386213` FOREIGN KEY (`company_registered_detail_id`) REFERENCES `company_registration_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust`
--

LOCK TABLES `cust` WRITE;
/*!40000 ALTER TABLE `cust` DISABLE KEYS */;
INSERT INTO `cust` VALUES (1,NULL,1,1,NULL,'VAGRANT IXP',3,'vagrant','VAGRANT IXP',2128,1000,'peering@example.com','+353 1 123 4567','+353 1 123 4567','+353 1 123 4568','noc@siep.com','24x7','http://www.example.com/noc/','AS-INEX','AS-INEX','mandatory','http://www.example.com/','2014-01-06',NULL,1,1,NULL,'2015-08-20',1,'travis','2014-01-06','YES',0),(2,1,2,2,NULL,'HEAnet',1,'heanet','HEAnet',1213,1000,'peering@example.com','','','','','0','','AS-HEANET',NULL,'open','http://www.example.com/','2014-01-06',NULL,1,1,NULL,NULL,NULL,'travis','2014-01-06','UNKNOWN',0),(3,13,3,3,NULL,'PCH DNS',1,'pchdns','PCH DNS',42,2000,'peering@example.com','','','','','0','','AS-PCH',NULL,'open','http://www.example.com/','2014-01-06',NULL,1,1,NULL,'2014-01-06',1,'travis','2014-01-06','YES',0),(4,2,4,4,NULL,'AS112',4,'as112','AS112',112,20,'peering@example.com','','','','','0','','',NULL,'open','http://www.example.com/','2014-01-06',NULL,1,1,NULL,NULL,NULL,'travis','2014-01-06','NO',0),(5,1,5,5,NULL,'Imagine',1,'imagine','Imagine',25441,1000,'peering@example.com','','','','','0','','AS-IBIS',NULL,'open','http://www.example.com/','2014-01-06',NULL,1,1,NULL,NULL,NULL,'travis','2014-01-06','YES',0);
/*!40000 ALTER TABLE `cust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_notes`
--

DROP TABLE IF EXISTS `cust_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6377D8679395C3F3` (`customer_id`),
  CONSTRAINT `FK_6377D8679395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_notes`
--

LOCK TABLES `cust_notes` WRITE;
/*!40000 ALTER TABLE `cust_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cust_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custkit`
--

DROP TABLE IF EXISTS `custkit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custkit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custid` int(11) DEFAULT NULL,
  `cabinetid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8127F9AADA0209B9` (`custid`),
  KEY `IDX_8127F9AA2B96718A` (`cabinetid`),
  CONSTRAINT `FK_8127F9AA2B96718A` FOREIGN KEY (`cabinetid`) REFERENCES `cabinet` (`id`),
  CONSTRAINT `FK_8127F9AADA0209B9` FOREIGN KEY (`custid`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custkit`
--

LOCK TABLES `custkit` WRITE;
/*!40000 ALTER TABLE `custkit` DISABLE KEYS */;
/*!40000 ALTER TABLE `custkit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_to_ixp`
--

DROP TABLE IF EXISTS `customer_to_ixp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_to_ixp` (
  `customer_id` int(11) NOT NULL,
  `ixp_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`,`ixp_id`),
  KEY `IDX_E85DBF209395C3F3` (`customer_id`),
  KEY `IDX_E85DBF20A5A4E881` (`ixp_id`),
  CONSTRAINT `FK_E85DBF209395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `cust` (`id`),
  CONSTRAINT `FK_E85DBF20A5A4E881` FOREIGN KEY (`ixp_id`) REFERENCES `ixp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_to_ixp`
--

LOCK TABLES `customer_to_ixp` WRITE;
/*!40000 ALTER TABLE `customer_to_ixp` DISABLE KEYS */;
INSERT INTO `customer_to_ixp` VALUES (1,1),(2,1),(3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `customer_to_ixp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infrastructure`
--

DROP TABLE IF EXISTS `infrastructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infrastructure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ixp_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPrimary` tinyint(1) NOT NULL DEFAULT '0',
  `peeringdb_ix_id` bigint(20) DEFAULT NULL,
  `ixf_ix_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IXPSN` (`shortname`,`ixp_id`),
  KEY `IDX_D129B190A5A4E881` (`ixp_id`),
  CONSTRAINT `FK_D129B190A5A4E881` FOREIGN KEY (`ixp_id`) REFERENCES `ixp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infrastructure`
--

LOCK TABLES `infrastructure` WRITE;
/*!40000 ALTER TABLE `infrastructure` DISABLE KEYS */;
INSERT INTO `infrastructure` VALUES (1,1,'Infrastructure #1','#1',1,NULL,NULL);
/*!40000 ALTER TABLE `infrastructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipv4address`
--

DROP TABLE IF EXISTS `ipv4address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipv4address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vlanid` int(11) DEFAULT NULL,
  `address` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vlan_address` (`vlanid`,`address`),
  KEY `IDX_A44BCBEEF48D6D0` (`vlanid`),
  CONSTRAINT `FK_A44BCBEEF48D6D0` FOREIGN KEY (`vlanid`) REFERENCES `vlan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipv4address`
--

LOCK TABLES `ipv4address` WRITE;
/*!40000 ALTER TABLE `ipv4address` DISABLE KEYS */;
INSERT INTO `ipv4address` VALUES (253,1,'172.30.201.106'),(254,1,'172.30.201.110'),(255,1,'172.30.201.136');
/*!40000 ALTER TABLE `ipv4address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipv6address`
--

DROP TABLE IF EXISTS `ipv6address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipv6address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vlanid` int(11) DEFAULT NULL,
  `address` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vlan_address` (`vlanid`,`address`),
  KEY `IDX_E66ECC93F48D6D0` (`vlanid`),
  CONSTRAINT `FK_E66ECC93F48D6D0` FOREIGN KEY (`vlanid`) REFERENCES `vlan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=803 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipv6address`
--

LOCK TABLES `ipv6address` WRITE;
/*!40000 ALTER TABLE `ipv6address` DISABLE KEYS */;
INSERT INTO `ipv6address` VALUES (802,1,'fd99::108'),(801,1,'fd99::110');
/*!40000 ALTER TABLE `ipv6address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irrdb_asn`
--

DROP TABLE IF EXISTS `irrdb_asn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `irrdb_asn` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `asn` int(11) NOT NULL,
  `protocol` int(11) NOT NULL,
  `first_seen` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custasn` (`asn`,`protocol`,`customer_id`),
  KEY `IDX_87BFC5569395C3F3` (`customer_id`),
  CONSTRAINT `FK_87BFC5569395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irrdb_asn`
--

LOCK TABLES `irrdb_asn` WRITE;
/*!40000 ALTER TABLE `irrdb_asn` DISABLE KEYS */;
INSERT INTO `irrdb_asn` VALUES (1,4,112,4,'2014-01-06 14:42:49',NULL),(2,4,112,6,'2014-01-06 14:42:50',NULL),(3,2,112,4,'2014-01-06 14:42:50',NULL),(4,2,1213,4,'2014-01-06 14:42:50',NULL),(5,2,1921,4,'2014-01-06 14:42:50',NULL),(6,2,2128,4,'2014-01-06 14:42:50',NULL),(7,2,2850,4,'2014-01-06 14:42:50',NULL),(8,2,42310,4,'2014-01-06 14:42:50',NULL),(9,2,112,6,'2014-01-06 14:42:51',NULL),(10,2,1213,6,'2014-01-06 14:42:51',NULL),(11,2,1921,6,'2014-01-06 14:42:51',NULL),(12,2,2128,6,'2014-01-06 14:42:51',NULL),(13,2,2850,6,'2014-01-06 14:42:51',NULL),(14,2,42310,6,'2014-01-06 14:42:51',NULL),(15,5,11521,4,'2014-01-06 14:42:51',NULL),(16,5,25441,4,'2014-01-06 14:42:51',NULL),(17,5,34317,4,'2014-01-06 14:42:51',NULL),(18,5,35272,4,'2014-01-06 14:42:51',NULL),(19,5,39064,4,'2014-01-06 14:42:51',NULL),(20,5,43178,4,'2014-01-06 14:42:51',NULL),(21,5,43610,4,'2014-01-06 14:42:51',NULL),(22,5,47615,4,'2014-01-06 14:42:51',NULL),(23,5,48342,4,'2014-01-06 14:42:51',NULL),(24,5,49573,4,'2014-01-06 14:42:51',NULL),(25,5,197853,4,'2014-01-06 14:42:51',NULL),(26,5,197904,4,'2014-01-06 14:42:51',NULL),(27,5,11521,6,'2014-01-06 14:42:52',NULL),(28,5,25441,6,'2014-01-06 14:42:52',NULL),(29,5,34317,6,'2014-01-06 14:42:52',NULL),(30,5,35272,6,'2014-01-06 14:42:52',NULL),(31,5,39064,6,'2014-01-06 14:42:52',NULL),(32,5,43178,6,'2014-01-06 14:42:52',NULL),(33,5,43610,6,'2014-01-06 14:42:52',NULL),(34,5,47615,6,'2014-01-06 14:42:52',NULL),(35,5,48342,6,'2014-01-06 14:42:52',NULL),(36,5,49573,6,'2014-01-06 14:42:52',NULL),(37,5,197853,6,'2014-01-06 14:42:52',NULL),(38,5,197904,6,'2014-01-06 14:42:52',NULL),(39,3,27,4,'2014-01-06 14:42:52',NULL),(40,3,42,4,'2014-01-06 14:42:52',NULL),(41,3,187,4,'2014-01-06 14:42:52',NULL),(42,3,297,4,'2014-01-06 14:42:52',NULL),(43,3,715,4,'2014-01-06 14:42:52',NULL),(44,3,3856,4,'2014-01-06 14:42:52',NULL),(45,3,7251,4,'2014-01-06 14:42:52',NULL),(46,3,13202,4,'2014-01-06 14:42:52',NULL),(47,3,16327,4,'2014-01-06 14:42:52',NULL),(48,3,16668,4,'2014-01-06 14:42:52',NULL),(49,3,16686,4,'2014-01-06 14:42:52',NULL),(50,3,20144,4,'2014-01-06 14:42:52',NULL),(51,3,20539,4,'2014-01-06 14:42:52',NULL),(52,3,21312,4,'2014-01-06 14:42:52',NULL),(53,3,24999,4,'2014-01-06 14:42:52',NULL),(54,3,27678,4,'2014-01-06 14:42:52',NULL),(55,3,32978,4,'2014-01-06 14:42:52',NULL),(56,3,32979,4,'2014-01-06 14:42:52',NULL),(57,3,35160,4,'2014-01-06 14:42:52',NULL),(58,3,38052,4,'2014-01-06 14:42:52',NULL),(59,3,44876,4,'2014-01-06 14:42:52',NULL),(60,3,45170,4,'2014-01-06 14:42:52',NULL),(61,3,45494,4,'2014-01-06 14:42:52',NULL),(62,3,48582,4,'2014-01-06 14:42:52',NULL),(63,3,48892,4,'2014-01-06 14:42:52',NULL),(64,3,50843,4,'2014-01-06 14:42:52',NULL),(65,3,51874,4,'2014-01-06 14:42:52',NULL),(66,3,52234,4,'2014-01-06 14:42:52',NULL),(67,3,52306,4,'2014-01-06 14:42:52',NULL),(68,3,54145,4,'2014-01-06 14:42:52',NULL),(69,3,59464,4,'2014-01-06 14:42:52',NULL),(70,3,60313,4,'2014-01-06 14:42:52',NULL),(71,3,197058,4,'2014-01-06 14:42:52',NULL),(72,3,27,6,'2014-01-06 14:42:52',NULL),(73,3,42,6,'2014-01-06 14:42:52',NULL),(74,3,187,6,'2014-01-06 14:42:52',NULL),(75,3,297,6,'2014-01-06 14:42:52',NULL),(76,3,715,6,'2014-01-06 14:42:52',NULL),(77,3,3856,6,'2014-01-06 14:42:52',NULL),(78,3,7251,6,'2014-01-06 14:42:52',NULL),(79,3,13202,6,'2014-01-06 14:42:52',NULL),(80,3,16327,6,'2014-01-06 14:42:52',NULL),(81,3,16668,6,'2014-01-06 14:42:52',NULL),(82,3,16686,6,'2014-01-06 14:42:52',NULL),(83,3,20144,6,'2014-01-06 14:42:52',NULL),(84,3,20539,6,'2014-01-06 14:42:52',NULL),(85,3,21312,6,'2014-01-06 14:42:52',NULL),(86,3,24999,6,'2014-01-06 14:42:52',NULL),(87,3,27678,6,'2014-01-06 14:42:52',NULL),(88,3,32978,6,'2014-01-06 14:42:52',NULL),(89,3,32979,6,'2014-01-06 14:42:52',NULL),(90,3,35160,6,'2014-01-06 14:42:52',NULL),(91,3,38052,6,'2014-01-06 14:42:52',NULL),(92,3,44876,6,'2014-01-06 14:42:52',NULL),(93,3,45170,6,'2014-01-06 14:42:52',NULL),(94,3,45494,6,'2014-01-06 14:42:52',NULL),(95,3,48582,6,'2014-01-06 14:42:52',NULL),(96,3,48892,6,'2014-01-06 14:42:52',NULL),(97,3,50843,6,'2014-01-06 14:42:52',NULL),(98,3,51874,6,'2014-01-06 14:42:52',NULL),(99,3,52234,6,'2014-01-06 14:42:52',NULL),(100,3,52306,6,'2014-01-06 14:42:52',NULL),(101,3,54145,6,'2014-01-06 14:42:52',NULL),(102,3,59464,6,'2014-01-06 14:42:52',NULL),(103,3,60313,6,'2014-01-06 14:42:52',NULL),(104,3,197058,6,'2014-01-06 14:42:52',NULL);
/*!40000 ALTER TABLE `irrdb_asn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irrdb_prefix`
--

DROP TABLE IF EXISTS `irrdb_prefix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `irrdb_prefix` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `protocol` int(11) NOT NULL,
  `first_seen` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custprefix` (`prefix`,`protocol`,`customer_id`),
  KEY `IDX_FE73E77C9395C3F3` (`customer_id`),
  CONSTRAINT `FK_FE73E77C9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=649 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irrdb_prefix`
--

LOCK TABLES `irrdb_prefix` WRITE;
/*!40000 ALTER TABLE `irrdb_prefix` DISABLE KEYS */;
INSERT INTO `irrdb_prefix` VALUES (1,4,'192.175.48.0/24',4,'2014-01-06 14:42:30','2014-01-06 14:42:30'),(2,2,'4.53.84.128/26',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(3,2,'4.53.146.192/26',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(4,2,'77.72.72.0/21',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(5,2,'87.32.0.0/12',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(6,2,'91.123.224.0/20',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(7,2,'134.226.0.0/16',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(8,2,'136.201.0.0/16',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(9,2,'136.206.0.0/16',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(10,2,'137.43.0.0/16',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(11,2,'140.203.0.0/16',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(12,2,'143.239.0.0/16',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(13,2,'147.252.0.0/16',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(14,2,'149.153.0.0/16',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(15,2,'149.157.0.0/16',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(16,2,'157.190.0.0/16',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(17,2,'160.6.0.0/16',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(18,2,'176.97.158.0/24',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(19,2,'192.174.68.0/24',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(20,2,'192.175.48.0/24',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(21,2,'193.1.0.0/16',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(22,2,'193.242.111.0/24',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(23,2,'194.0.24.0/24',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(24,2,'194.0.25.0/24',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(25,2,'194.0.26.0/24',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(26,2,'194.88.240.0/23',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(27,2,'212.3.242.128/26',4,'2014-01-06 14:42:31','2014-01-06 14:42:31'),(28,2,'2001:678:20::/48',6,'2014-01-06 14:42:32','2014-01-06 14:42:32'),(29,2,'2001:678:24::/48',6,'2014-01-06 14:42:32','2014-01-06 14:42:32'),(30,2,'2001:67c:1bc::/48',6,'2014-01-06 14:42:32','2014-01-06 14:42:32'),(31,2,'2001:67c:10b8::/48',6,'2014-01-06 14:42:32','2014-01-06 14:42:32'),(32,2,'2001:67c:10e0::/48',6,'2014-01-06 14:42:32','2014-01-06 14:42:32'),(33,2,'2001:770::/32',6,'2014-01-06 14:42:32','2014-01-06 14:42:32'),(34,2,'2001:7f8:18::/48',6,'2014-01-06 14:42:32','2014-01-06 14:42:32'),(35,2,'2001:1900:2205::/48',6,'2014-01-06 14:42:32','2014-01-06 14:42:32'),(36,2,'2001:1900:2206::/48',6,'2014-01-06 14:42:32','2014-01-06 14:42:32'),(37,2,'2620:4f:8000::/48',6,'2014-01-06 14:42:32','2014-01-06 14:42:32'),(38,2,'2a01:4b0::/32',6,'2014-01-06 14:42:32','2014-01-06 14:42:32'),(39,5,'31.169.96.0/21',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(40,5,'62.231.32.0/19',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(41,5,'78.135.128.0/17',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(42,5,'83.141.64.0/18',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(43,5,'85.134.128.0/17',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(44,5,'87.192.0.0/16',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(45,5,'87.232.0.0/16',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(46,5,'89.28.176.0/21',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(47,5,'89.124.0.0/14',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(48,5,'89.124.0.0/15',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(49,5,'89.125.0.0/16',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(50,5,'89.126.0.0/16',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(51,5,'89.126.0.0/19',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(52,5,'89.126.0.0/20',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(53,5,'89.126.32.0/19',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(54,5,'89.126.64.0/19',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(55,5,'89.126.96.0/19',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(56,5,'91.194.126.0/23',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(57,5,'91.194.126.0/24',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(58,5,'91.194.127.0/24',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(59,5,'91.209.106.0/24',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(60,5,'91.209.106.0/25',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(61,5,'91.209.106.128/25',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(62,5,'91.213.49.0/24',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(63,5,'91.220.224.0/24',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(64,5,'141.105.112.0/21',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(65,5,'176.52.216.0/21',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(66,5,'195.5.172.0/24',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(67,5,'195.60.166.0/23',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(68,5,'216.245.44.0/24',4,'2014-01-06 14:42:33','2014-01-06 14:42:33'),(69,5,'2001:67c:20::/48',6,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(70,5,'2001:67c:338::/48',6,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(71,5,'2001:4d68::/32',6,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(72,5,'2a01:268::/32',6,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(73,5,'2a01:8f80::/32',6,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(74,3,'31.135.128.0/19',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(75,3,'31.135.128.0/21',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(76,3,'31.135.136.0/21',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(77,3,'31.135.144.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(78,3,'31.135.148.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(79,3,'31.135.152.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(80,3,'31.135.152.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(81,3,'31.135.154.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(82,3,'36.0.4.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(83,3,'63.246.32.0/20',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(84,3,'64.68.192.0/20',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(85,3,'64.68.192.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(86,3,'64.68.193.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(87,3,'64.68.194.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(88,3,'64.68.195.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(89,3,'64.68.196.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(90,3,'64.78.200.0/21',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(91,3,'64.185.240.0/20',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(92,3,'65.22.4.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(93,3,'65.22.5.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(94,3,'65.22.19.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(95,3,'65.22.23.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(96,3,'65.22.27.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(97,3,'65.22.31.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(98,3,'65.22.35.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(99,3,'65.22.39.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(100,3,'65.22.47.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(101,3,'65.22.51.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(102,3,'65.22.55.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(103,3,'65.22.59.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(104,3,'65.22.63.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(105,3,'65.22.67.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(106,3,'65.22.71.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(107,3,'65.22.79.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(108,3,'65.22.83.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(109,3,'65.22.87.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(110,3,'65.22.91.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(111,3,'65.22.95.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(112,3,'65.22.99.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(113,3,'65.22.103.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(114,3,'65.22.107.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(115,3,'65.22.111.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(116,3,'65.22.115.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(117,3,'65.22.119.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(118,3,'65.22.123.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(119,3,'65.22.127.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(120,3,'65.22.131.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(121,3,'65.22.135.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(122,3,'65.22.139.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(123,3,'65.22.143.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(124,3,'65.22.147.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(125,3,'65.22.151.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(126,3,'65.22.155.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(127,3,'65.22.159.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(128,3,'65.22.163.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(129,3,'65.22.171.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(130,3,'65.22.175.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(131,3,'65.22.179.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(132,3,'65.22.183.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(133,3,'65.22.187.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(134,3,'65.22.191.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(135,3,'65.22.195.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(136,3,'65.22.199.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(137,3,'65.22.203.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(138,3,'65.22.207.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(139,3,'65.22.211.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(140,3,'65.22.215.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(141,3,'65.22.219.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(142,3,'65.22.223.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(143,3,'65.22.227.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(144,3,'65.22.231.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(145,3,'65.22.235.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(146,3,'65.22.239.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(147,3,'65.22.243.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(148,3,'65.22.247.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(149,3,'66.96.112.0/20',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(150,3,'66.102.32.0/20',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(151,3,'66.175.104.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(152,3,'66.185.112.0/20',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(153,3,'66.225.199.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(154,3,'66.225.200.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(155,3,'66.225.201.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(156,3,'67.21.37.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(157,3,'67.22.112.0/21',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(158,3,'67.158.48.0/20',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(159,3,'68.65.112.0/21',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(160,3,'68.65.126.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(161,3,'68.65.126.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(162,3,'68.65.127.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(163,3,'69.166.10.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(164,3,'69.166.12.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(165,3,'70.40.0.0/21',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(166,3,'70.40.8.0/21',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(167,3,'72.0.48.0/20',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(168,3,'72.0.48.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(169,3,'72.0.49.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(170,3,'72.0.50.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(171,3,'72.0.51.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(172,3,'72.0.52.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(173,3,'72.0.53.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(174,3,'72.0.54.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(175,3,'72.0.55.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(176,3,'72.0.56.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(177,3,'72.0.57.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(178,3,'72.0.58.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(179,3,'72.0.59.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(180,3,'72.0.60.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(181,3,'72.0.61.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(182,3,'72.0.62.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(183,3,'72.0.63.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(184,3,'72.42.112.0/20',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(185,3,'72.42.112.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(186,3,'72.42.113.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(187,3,'72.42.114.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(188,3,'72.42.115.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(189,3,'72.42.116.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(190,3,'72.42.117.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(191,3,'72.42.118.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(192,3,'72.42.119.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(193,3,'72.42.120.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(194,3,'72.42.121.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(195,3,'72.42.122.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(196,3,'72.42.123.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(197,3,'72.42.124.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(198,3,'72.42.125.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(199,3,'72.42.126.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(200,3,'72.42.127.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(201,3,'74.63.16.0/20',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(202,3,'74.63.16.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(203,3,'74.63.17.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(204,3,'74.63.18.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(205,3,'74.63.19.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(206,3,'74.63.20.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(207,3,'74.63.21.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(208,3,'74.63.22.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(209,3,'74.63.23.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(210,3,'74.63.24.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(211,3,'74.63.25.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(212,3,'74.63.26.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(213,3,'74.63.27.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(214,3,'74.80.64.0/18',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(215,3,'74.80.64.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(216,3,'74.80.65.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(217,3,'74.80.66.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(218,3,'74.80.67.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(219,3,'74.80.68.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(220,3,'74.80.69.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(221,3,'74.80.70.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(222,3,'74.80.71.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(223,3,'74.80.72.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(224,3,'74.80.73.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(225,3,'74.80.74.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(226,3,'74.80.75.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(227,3,'74.80.76.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(228,3,'74.80.77.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(229,3,'74.80.78.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(230,3,'74.80.79.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(231,3,'74.80.80.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(232,3,'74.80.81.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(233,3,'74.80.82.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(234,3,'74.80.83.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(235,3,'74.80.84.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(236,3,'74.80.85.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(237,3,'74.80.86.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(238,3,'74.80.87.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(239,3,'74.80.88.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(240,3,'74.80.89.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(241,3,'74.80.90.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(242,3,'74.80.91.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(243,3,'74.80.92.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(244,3,'74.80.93.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(245,3,'74.80.94.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(246,3,'74.80.95.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(247,3,'74.80.96.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(248,3,'74.80.97.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(249,3,'74.80.98.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(250,3,'74.80.99.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(251,3,'74.80.100.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(252,3,'74.80.101.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(253,3,'74.80.102.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(254,3,'74.80.103.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(255,3,'74.80.104.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(256,3,'74.80.105.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(257,3,'74.80.106.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(258,3,'74.80.107.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(259,3,'74.80.108.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(260,3,'74.80.109.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(261,3,'74.80.110.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(262,3,'74.80.111.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(263,3,'74.80.112.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(264,3,'74.80.113.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(265,3,'74.80.114.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(266,3,'74.80.115.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(267,3,'74.80.116.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(268,3,'74.80.117.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(269,3,'74.80.118.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(270,3,'74.80.119.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(271,3,'74.80.120.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(272,3,'74.80.121.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(273,3,'74.80.122.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(274,3,'74.80.123.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(275,3,'74.80.124.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(276,3,'74.80.125.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(277,3,'74.80.126.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(278,3,'74.80.126.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(279,3,'74.80.127.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(280,3,'74.118.212.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(281,3,'74.118.213.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(282,3,'74.118.214.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(283,3,'75.127.16.0/20',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(284,3,'76.191.16.0/20',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(285,3,'89.19.120.0/21',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(286,3,'89.19.120.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(287,3,'89.19.124.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(288,3,'89.19.126.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(289,3,'91.201.224.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(290,3,'91.201.224.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(291,3,'91.201.224.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(292,3,'91.201.225.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(293,3,'91.201.226.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(294,3,'91.201.226.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(295,3,'91.201.227.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(296,3,'91.209.1.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(297,3,'91.209.193.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(298,3,'91.222.16.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(299,3,'91.222.40.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(300,3,'91.222.41.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(301,3,'91.222.42.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(302,3,'91.222.43.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(303,3,'91.241.93.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(304,3,'93.95.24.0/21',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(305,3,'93.95.24.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(306,3,'93.95.25.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(307,3,'93.95.26.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(308,3,'93.171.128.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(309,3,'95.47.163.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(310,3,'101.251.4.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(311,3,'114.69.222.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(312,3,'128.8.0.0/16',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(313,3,'128.161.0.0/16',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(314,3,'129.2.0.0/16',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(315,3,'130.135.0.0/16',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(316,3,'130.167.0.0/16',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(317,3,'131.161.128.0/18',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(318,3,'131.182.0.0/16',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(319,3,'139.229.0.0/16',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(320,3,'140.169.0.0/16',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(321,3,'146.5.0.0/16',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(322,3,'146.58.0.0/16',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(323,3,'150.144.0.0/16',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(324,3,'156.154.43.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(325,3,'156.154.50.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(326,3,'156.154.59.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(327,3,'156.154.96.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(328,3,'156.154.99.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(329,3,'158.154.0.0/16',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(330,3,'169.222.0.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(331,3,'183.91.132.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(332,3,'192.5.41.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(333,3,'192.12.123.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(334,3,'192.42.70.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(335,3,'192.58.36.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(336,3,'192.67.83.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(337,3,'192.67.107.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(338,3,'192.67.108.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(339,3,'192.68.52.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(340,3,'192.68.148.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(341,3,'192.68.162.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(342,3,'192.70.244.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(343,3,'192.70.249.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(344,3,'192.77.80.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(345,3,'192.84.8.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(346,3,'192.88.124.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(347,3,'192.92.65.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(348,3,'192.92.90.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(349,3,'192.100.9.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(350,3,'192.100.10.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(351,3,'192.100.15.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(352,3,'192.101.148.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(353,3,'192.102.15.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(354,3,'192.102.219.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(355,3,'192.102.233.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(356,3,'192.102.234.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(357,3,'192.112.18.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(358,3,'192.112.223.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(359,3,'192.112.224.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(360,3,'192.124.20.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(361,3,'192.138.101.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(362,3,'192.138.172.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(363,3,'192.149.89.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(364,3,'192.149.104.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(365,3,'192.149.107.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(366,3,'192.149.133.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(367,3,'192.150.32.0/21',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(368,3,'192.153.157.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(369,3,'192.188.4.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(370,3,'192.203.230.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(371,3,'192.225.64.0/19',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(372,3,'192.243.0.0/20',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(373,3,'192.243.16.0/21',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(374,3,'193.29.206.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(375,3,'193.110.16.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(376,3,'193.110.16.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(377,3,'193.110.18.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(378,3,'193.111.240.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(379,3,'193.178.228.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(380,3,'193.178.228.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(381,3,'193.178.229.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(382,3,'194.0.12.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(383,3,'194.0.13.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(384,3,'194.0.14.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(385,3,'194.0.17.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(386,3,'194.0.27.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(387,3,'194.0.36.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(388,3,'194.0.42.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(389,3,'194.0.47.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(390,3,'194.28.144.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(391,3,'194.117.58.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(392,3,'194.117.60.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(393,3,'194.117.61.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(394,3,'194.117.62.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(395,3,'194.117.63.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(396,3,'194.146.180.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(397,3,'194.146.180.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(398,3,'194.146.180.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(399,3,'194.146.181.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(400,3,'194.146.182.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(401,3,'194.146.182.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(402,3,'194.146.183.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(403,3,'194.146.228.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(404,3,'194.146.228.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(405,3,'194.146.228.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(406,3,'194.146.229.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(407,3,'194.146.230.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(408,3,'194.146.230.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(409,3,'194.146.231.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(410,3,'194.153.148.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(411,3,'195.64.162.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(412,3,'195.64.162.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(413,3,'195.64.163.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(414,3,'195.82.138.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(415,3,'198.9.0.0/16',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(416,3,'198.49.1.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(417,3,'198.116.0.0/14',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(418,3,'198.120.0.0/14',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(419,3,'198.182.28.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(420,3,'198.182.31.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(421,3,'198.182.167.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(422,3,'199.4.137.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(423,3,'199.7.64.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(424,3,'199.7.77.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(425,3,'199.7.83.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(426,3,'199.7.86.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(427,3,'199.7.91.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(428,3,'199.7.94.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(429,3,'199.7.95.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(430,3,'199.43.132.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(431,3,'199.115.156.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(432,3,'199.115.157.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(433,3,'199.120.141.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(434,3,'199.120.142.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(435,3,'199.120.144.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(436,3,'199.182.32.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(437,3,'199.182.40.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(438,3,'199.184.181.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(439,3,'199.184.182.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(440,3,'199.184.184.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(441,3,'199.249.112.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(442,3,'199.249.113.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(443,3,'199.249.114.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(444,3,'199.249.115.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(445,3,'199.249.116.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(446,3,'199.249.117.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(447,3,'199.249.118.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(448,3,'199.249.119.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(449,3,'199.249.120.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(450,3,'199.249.121.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(451,3,'199.249.122.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(452,3,'199.249.123.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(453,3,'199.249.124.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(454,3,'199.249.125.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(455,3,'199.249.126.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(456,3,'199.249.127.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(457,3,'199.254.171.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(458,3,'200.1.121.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(459,3,'200.1.131.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(460,3,'200.7.4.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(461,3,'200.16.98.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(462,3,'202.6.102.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(463,3,'202.7.4.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(464,3,'202.52.0.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(465,3,'202.53.186.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(466,3,'202.53.191.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(467,3,'203.119.88.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(468,3,'204.14.112.0/21',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(469,3,'204.19.119.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(470,3,'204.26.57.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(471,3,'204.61.208.0/21',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(472,3,'204.61.208.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(473,3,'204.61.208.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(474,3,'204.61.210.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(475,3,'204.61.210.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(476,3,'204.61.212.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(477,3,'204.61.216.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(478,3,'204.194.22.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(479,3,'204.194.22.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(480,3,'204.194.23.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(481,3,'205.132.46.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(482,3,'205.207.155.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(483,3,'206.51.254.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(484,3,'206.108.113.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(485,3,'206.196.160.0/19',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(486,3,'206.220.228.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(487,3,'206.220.228.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(488,3,'206.220.230.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(489,3,'206.223.122.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(490,3,'207.34.5.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(491,3,'207.34.6.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(492,3,'208.15.19.0/24',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(493,3,'208.49.115.64/27',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(494,3,'208.67.88.0/22',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(495,3,'216.21.2.0/23',4,'2014-01-06 14:42:34','2014-01-06 14:42:34'),(496,3,'2001:500:3::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(497,3,'2001:500:14::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(498,3,'2001:500:15::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(499,3,'2001:500:40::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(500,3,'2001:500:41::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(501,3,'2001:500:42::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(502,3,'2001:500:43::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(503,3,'2001:500:44::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(504,3,'2001:500:45::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(505,3,'2001:500:46::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(506,3,'2001:500:47::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(507,3,'2001:500:48::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(508,3,'2001:500:49::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(509,3,'2001:500:4a::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(510,3,'2001:500:4b::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(511,3,'2001:500:4c::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(512,3,'2001:500:4d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(513,3,'2001:500:4e::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(514,3,'2001:500:4f::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(515,3,'2001:500:50::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(516,3,'2001:500:51::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(517,3,'2001:500:52::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(518,3,'2001:500:53::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(519,3,'2001:500:54::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(520,3,'2001:500:55::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(521,3,'2001:500:56::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(522,3,'2001:500:7d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(523,3,'2001:500:83::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(524,3,'2001:500:8c::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(525,3,'2001:500:9c::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(526,3,'2001:500:9d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(527,3,'2001:500:a4::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(528,3,'2001:500:a5::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(529,3,'2001:500:e0::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(530,3,'2001:500:e1::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(531,3,'2001:678:3::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(532,3,'2001:678:28::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(533,3,'2001:678:4c::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(534,3,'2001:678:60::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(535,3,'2001:678:78::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(536,3,'2001:678:94::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(537,3,'2001:dd8:7::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(538,3,'2001:1398:121::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(539,3,'2404:2c00::/32',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(540,3,'2620:0:870::/45',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(541,3,'2620:0:876::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(542,3,'2620:49::/44',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(543,3,'2620:49::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(544,3,'2620:49:a::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(545,3,'2620:49:b::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(546,3,'2620:95:8000::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(547,3,'2620:171::/40',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(548,3,'2620:171:f0::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(549,3,'2620:171:f1::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(550,3,'2620:171:f2::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(551,3,'2620:171:f3::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(552,3,'2620:171:f4::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(553,3,'2620:171:f5::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(554,3,'2620:171:f6::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(555,3,'2620:171:f7::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(556,3,'2620:171:f8::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(557,3,'2620:171:f9::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(558,3,'2620:171:a00::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(559,3,'2620:171:a01::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(560,3,'2620:171:a02::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(561,3,'2620:171:a03::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(562,3,'2620:171:a04::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(563,3,'2620:171:a05::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(564,3,'2620:171:a06::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(565,3,'2620:171:a07::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(566,3,'2620:171:a08::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(567,3,'2620:171:a09::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(568,3,'2620:171:a0a::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(569,3,'2620:171:a0b::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(570,3,'2620:171:a0c::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(571,3,'2620:171:a0d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(572,3,'2620:171:a0e::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(573,3,'2620:171:a0f::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(574,3,'2620:171:ad0::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(575,3,'2620:171:d00::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(576,3,'2620:171:d01::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(577,3,'2620:171:d02::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(578,3,'2620:171:d03::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(579,3,'2620:171:d04::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(580,3,'2620:171:d05::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(581,3,'2620:171:d06::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(582,3,'2620:171:d07::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(583,3,'2620:171:d08::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(584,3,'2620:171:d09::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(585,3,'2620:171:d0a::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(586,3,'2620:171:d0b::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(587,3,'2620:171:d0c::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(588,3,'2620:171:d0d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(589,3,'2620:171:d0e::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(590,3,'2620:171:d0f::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(591,3,'2620:171:dd0::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(592,3,'2a01:8840:4::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(593,3,'2a01:8840:5::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(594,3,'2a01:8840:15::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(595,3,'2a01:8840:19::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(596,3,'2a01:8840:1d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(597,3,'2a01:8840:21::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(598,3,'2a01:8840:25::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(599,3,'2a01:8840:29::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(600,3,'2a01:8840:2d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(601,3,'2a01:8840:31::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(602,3,'2a01:8840:35::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(603,3,'2a01:8840:39::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(604,3,'2a01:8840:3d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(605,3,'2a01:8840:41::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(606,3,'2a01:8840:45::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(607,3,'2a01:8840:4d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(608,3,'2a01:8840:51::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(609,3,'2a01:8840:55::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(610,3,'2a01:8840:59::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(611,3,'2a01:8840:5d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(612,3,'2a01:8840:61::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(613,3,'2a01:8840:65::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(614,3,'2a01:8840:69::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(615,3,'2a01:8840:6d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(616,3,'2a01:8840:71::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(617,3,'2a01:8840:75::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(618,3,'2a01:8840:79::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(619,3,'2a01:8840:7d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(620,3,'2a01:8840:81::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(621,3,'2a01:8840:85::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(622,3,'2a01:8840:89::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(623,3,'2a01:8840:8d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(624,3,'2a01:8840:91::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(625,3,'2a01:8840:95::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(626,3,'2a01:8840:99::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(627,3,'2a01:8840:9d::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(628,3,'2a01:8840:a1::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(629,3,'2a01:8840:a5::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(630,3,'2a01:8840:a9::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(631,3,'2a01:8840:ad::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(632,3,'2a01:8840:b1::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(633,3,'2a01:8840:b5::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(634,3,'2a01:8840:b9::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(635,3,'2a01:8840:bd::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(636,3,'2a01:8840:c1::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(637,3,'2a01:8840:c5::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(638,3,'2a01:8840:c9::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(639,3,'2a01:8840:cd::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(640,3,'2a01:8840:d1::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(641,3,'2a01:8840:d5::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(642,3,'2a01:8840:d9::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(643,3,'2a01:8840:dd::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(644,3,'2a01:8840:e1::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(645,3,'2a01:8840:e5::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(646,3,'2a01:8840:e9::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(647,3,'2a01:8840:ed::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36'),(648,3,'2a01:8840:f1::/48',6,'2014-01-06 14:42:36','2014-01-06 14:42:36');
/*!40000 ALTER TABLE `irrdb_prefix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irrdbconfig`
--

DROP TABLE IF EXISTS `irrdbconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `irrdbconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `protocol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irrdbconfig`
--

LOCK TABLES `irrdbconfig` WRITE;
/*!40000 ALTER TABLE `irrdbconfig` DISABLE KEYS */;
INSERT INTO `irrdbconfig` VALUES (1,'whois.ripe.net','ripe','RIPE','RIPE Query from RIPE Database'),(2,'whois.radb.net','irrd','RADB','RADB Query from RADB Database'),(3,'whois.lacnic.net','ripe','LACNIC','LACNIC Query from LACNIC Database'),(4,'whois.afrinic.net','ripe','AFRINIC','AFRINIC Query from AFRINIC Database'),(5,'whois.apnic.net','ripe','APNIC','APNIC Query from APNIC Database'),(6,'rr.level3.net','ripe','LEVEL3','Level3 Query from Level3 Database'),(7,'whois.radb.net','irrd','ARIN','ARIN Query from RADB Database'),(8,'whois.radb.net','irrd','RADB,ARIN','RADB+ARIN Query from RADB Database'),(9,'whois.radb.net','irrd','ALTDB','ALTDB Query from RADB Database'),(10,'whois.radb.net','irrd','RADB,RIPE','RADB+RIPE Query from RADB Database'),(11,'whois.radb.net','irrd','RADB,APNIC,ARIN','RADB+APNIC+ARIN Query from RADB Database'),(12,'whois.radb.net','irrd','RIPE,ARIN','RIPE+ARIN Query from RADB Database'),(13,'whois.radb.net','irrd','RADB,RIPE,APNIC,ARIN','');
/*!40000 ALTER TABLE `irrdbconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ixp`
--

DROP TABLE IF EXISTS `ixp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ixp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FA4AB7F64082763` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ixp`
--

LOCK TABLES `ixp` WRITE;
/*!40000 ALTER TABLE `ixp` DISABLE KEYS */;
INSERT INTO `ixp` VALUES (1,'VAGRANT IXP','vagrant','5 Somewhere','Somebourogh','Dublin','D4','IE');
/*!40000 ALTER TABLE `ixp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l2address`
--

DROP TABLE IF EXISTS `l2address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l2address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vlan_interface_id` int(11) NOT NULL,
  `mac` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstseen` datetime DEFAULT NULL,
  `lastseen` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mac_vlanint` (`mac`,`vlan_interface_id`),
  KEY `IDX_B9482E1D6AB5F82` (`vlan_interface_id`),
  CONSTRAINT `FK_B9482E1D6AB5F82` FOREIGN KEY (`vlan_interface_id`) REFERENCES `vlaninterface` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l2address`
--

LOCK TABLES `l2address` WRITE;
/*!40000 ALTER TABLE `l2address` DISABLE KEYS */;
/*!40000 ALTER TABLE `l2address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nocphone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nocfax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nocemail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officefax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officeemail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdb_facility_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5E9E89CB64082763` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Location 1','l1',NULL,'','','','','','','','',NULL);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logos`
--

DROP TABLE IF EXISTS `logos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `original_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stored_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uploaded_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uploaded_at` datetime NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9F54004F9395C3F3` (`customer_id`),
  CONSTRAINT `FK_9F54004F9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logos`
--

LOCK TABLES `logos` WRITE;
/*!40000 ALTER TABLE `logos` DISABLE KEYS */;
/*!40000 ALTER TABLE `logos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macaddress`
--

DROP TABLE IF EXISTS `macaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `macaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `virtualinterfaceid` int(11) DEFAULT NULL,
  `firstseen` datetime DEFAULT NULL,
  `lastseen` datetime DEFAULT NULL,
  `mac` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_42CD65F6BFDF15D5` (`virtualinterfaceid`),
  CONSTRAINT `FK_42CD65F6BFDF15D5` FOREIGN KEY (`virtualinterfaceid`) REFERENCES `virtualinterface` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macaddress`
--

LOCK TABLES `macaddress` WRITE;
/*!40000 ALTER TABLE `macaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `macaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `netinfo`
--

DROP TABLE IF EXISTS `netinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `netinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vlan_id` int(11) NOT NULL,
  `protocol` int(11) NOT NULL,
  `property` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ix` int(11) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F843DE6B8B4937A1` (`vlan_id`),
  KEY `VlanProtoProp` (`protocol`,`property`,`vlan_id`),
  CONSTRAINT `FK_F843DE6B8B4937A1` FOREIGN KEY (`vlan_id`) REFERENCES `vlan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `netinfo`
--

LOCK TABLES `netinfo` WRITE;
/*!40000 ALTER TABLE `netinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `netinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkinfo`
--

DROP TABLE IF EXISTS `networkinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vlanid` int(11) DEFAULT NULL,
  `protocol` int(11) DEFAULT NULL,
  `network` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `masklen` int(11) DEFAULT NULL,
  `rs1address` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rs2address` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dnsfile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6A0AF167F48D6D0` (`vlanid`),
  CONSTRAINT `FK_6A0AF167F48D6D0` FOREIGN KEY (`vlanid`) REFERENCES `vlan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkinfo`
--

LOCK TABLES `networkinfo` WRITE;
/*!40000 ALTER TABLE `networkinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `networkinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oui`
--

DROP TABLE IF EXISTS `oui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oui` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `organisation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DAEC0140DAEC0140` (`oui`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oui`
--

LOCK TABLES `oui` WRITE;
/*!40000 ALTER TABLE `oui` DISABLE KEYS */;
/*!40000 ALTER TABLE `oui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patch_panel`
--

DROP TABLE IF EXISTS `patch_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patch_panel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cabinet_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `colo_reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cable_type` int(11) NOT NULL,
  `connector_type` int(11) NOT NULL,
  `installation_date` datetime DEFAULT NULL,
  `port_prefix` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `chargeable` int(11) NOT NULL DEFAULT '0',
  `location_notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `u_position` int(11) DEFAULT NULL,
  `mounted_at` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_79A52562D351EC` (`cabinet_id`),
  CONSTRAINT `FK_79A52562D351EC` FOREIGN KEY (`cabinet_id`) REFERENCES `cabinet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patch_panel`
--

LOCK TABLES `patch_panel` WRITE;
/*!40000 ALTER TABLE `patch_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `patch_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patch_panel_port`
--

DROP TABLE IF EXISTS `patch_panel_port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patch_panel_port` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `switch_port_id` int(11) DEFAULT NULL,
  `patch_panel_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `duplex_master_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` smallint(6) NOT NULL,
  `state` int(11) NOT NULL,
  `colo_circuit_ref` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ticket_ref` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  `private_notes` longtext COLLATE utf8_unicode_ci,
  `assigned_at` date DEFAULT NULL,
  `connected_at` date DEFAULT NULL,
  `cease_requested_at` date DEFAULT NULL,
  `ceased_at` date DEFAULT NULL,
  `last_state_change` date DEFAULT NULL,
  `internal_use` tinyint(1) NOT NULL DEFAULT '0',
  `chargeable` int(11) NOT NULL DEFAULT '0',
  `owned_by` int(11) NOT NULL DEFAULT '0',
  `loa_code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4BE40BC2C1DA6A2A` (`switch_port_id`),
  KEY `IDX_4BE40BC2635D5D87` (`patch_panel_id`),
  KEY `IDX_4BE40BC29395C3F3` (`customer_id`),
  KEY `IDX_4BE40BC23838446` (`duplex_master_id`),
  CONSTRAINT `FK_4BE40BC23838446` FOREIGN KEY (`duplex_master_id`) REFERENCES `patch_panel_port` (`id`),
  CONSTRAINT `FK_4BE40BC2635D5D87` FOREIGN KEY (`patch_panel_id`) REFERENCES `patch_panel` (`id`),
  CONSTRAINT `FK_4BE40BC29395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `cust` (`id`),
  CONSTRAINT `FK_4BE40BC2C1DA6A2A` FOREIGN KEY (`switch_port_id`) REFERENCES `switchport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patch_panel_port`
--

LOCK TABLES `patch_panel_port` WRITE;
/*!40000 ALTER TABLE `patch_panel_port` DISABLE KEYS */;
/*!40000 ALTER TABLE `patch_panel_port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patch_panel_port_file`
--

DROP TABLE IF EXISTS `patch_panel_port_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patch_panel_port_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patch_panel_port_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uploaded_at` datetime NOT NULL,
  `uploaded_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `storage_location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_28089403B0F978FF` (`patch_panel_port_id`),
  CONSTRAINT `FK_28089403B0F978FF` FOREIGN KEY (`patch_panel_port_id`) REFERENCES `patch_panel_port` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patch_panel_port_file`
--

LOCK TABLES `patch_panel_port_file` WRITE;
/*!40000 ALTER TABLE `patch_panel_port_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `patch_panel_port_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patch_panel_port_history`
--

DROP TABLE IF EXISTS `patch_panel_port_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patch_panel_port_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patch_panel_port_id` int(11) DEFAULT NULL,
  `duplex_master_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` smallint(6) NOT NULL,
  `state` int(11) NOT NULL,
  `colo_circuit_ref` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ticket_ref` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  `private_notes` longtext COLLATE utf8_unicode_ci,
  `assigned_at` date DEFAULT NULL,
  `connected_at` date DEFAULT NULL,
  `cease_requested_at` date DEFAULT NULL,
  `ceased_at` date DEFAULT NULL,
  `internal_use` tinyint(1) NOT NULL DEFAULT '0',
  `chargeable` int(11) NOT NULL DEFAULT '0',
  `owned_by` int(11) NOT NULL DEFAULT '0',
  `customer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `switchport` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CB80B54AB0F978FF` (`patch_panel_port_id`),
  KEY `IDX_CB80B54A3838446` (`duplex_master_id`),
  CONSTRAINT `FK_CB80B54A3838446` FOREIGN KEY (`duplex_master_id`) REFERENCES `patch_panel_port_history` (`id`),
  CONSTRAINT `FK_CB80B54AB0F978FF` FOREIGN KEY (`patch_panel_port_id`) REFERENCES `patch_panel_port` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patch_panel_port_history`
--

LOCK TABLES `patch_panel_port_history` WRITE;
/*!40000 ALTER TABLE `patch_panel_port_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `patch_panel_port_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patch_panel_port_history_file`
--

DROP TABLE IF EXISTS `patch_panel_port_history_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patch_panel_port_history_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patch_panel_port_history_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uploaded_at` datetime NOT NULL,
  `uploaded_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `storage_location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_206EAD4E6F461430` (`patch_panel_port_history_id`),
  CONSTRAINT `FK_206EAD4E6F461430` FOREIGN KEY (`patch_panel_port_history_id`) REFERENCES `patch_panel_port_history` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patch_panel_port_history_file`
--

LOCK TABLES `patch_panel_port_history_file` WRITE;
/*!40000 ALTER TABLE `patch_panel_port_history_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `patch_panel_port_history_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peering_manager`
--

DROP TABLE IF EXISTS `peering_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peering_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custid` int(11) DEFAULT NULL,
  `peerid` int(11) DEFAULT NULL,
  `email_last_sent` datetime DEFAULT NULL,
  `emails_sent` int(11) DEFAULT NULL,
  `peered` tinyint(1) DEFAULT NULL,
  `rejected` tinyint(1) DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_35A72597DA0209B9` (`custid`),
  KEY `IDX_35A725974E5F9AFF` (`peerid`),
  CONSTRAINT `FK_35A725974E5F9AFF` FOREIGN KEY (`peerid`) REFERENCES `cust` (`id`),
  CONSTRAINT `FK_35A72597DA0209B9` FOREIGN KEY (`custid`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peering_manager`
--

LOCK TABLES `peering_manager` WRITE;
/*!40000 ALTER TABLE `peering_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `peering_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peering_matrix`
--

DROP TABLE IF EXISTS `peering_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peering_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x_custid` int(11) DEFAULT NULL,
  `y_custid` int(11) DEFAULT NULL,
  `vlan` int(11) DEFAULT NULL,
  `x_as` int(11) DEFAULT NULL,
  `y_as` int(11) DEFAULT NULL,
  `peering_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C1A6F6F9A4CA6408` (`x_custid`),
  KEY `IDX_C1A6F6F968606496` (`y_custid`),
  CONSTRAINT `FK_C1A6F6F968606496` FOREIGN KEY (`y_custid`) REFERENCES `cust` (`id`),
  CONSTRAINT `FK_C1A6F6F9A4CA6408` FOREIGN KEY (`x_custid`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peering_matrix`
--

LOCK TABLES `peering_matrix` WRITE;
/*!40000 ALTER TABLE `peering_matrix` DISABLE KEYS */;
/*!40000 ALTER TABLE `peering_matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physicalinterface`
--

DROP TABLE IF EXISTS `physicalinterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physicalinterface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `switchportid` int(11) DEFAULT NULL,
  `fanout_physical_interface_id` int(11) DEFAULT NULL,
  `virtualinterfaceid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `duplex` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monitorindex` int(11) DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  `autoneg` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5FFF4D60E5F6FACB` (`switchportid`),
  UNIQUE KEY `UNIQ_5FFF4D602E68AB8C` (`fanout_physical_interface_id`),
  KEY `IDX_5FFF4D60BFDF15D5` (`virtualinterfaceid`),
  CONSTRAINT `FK_5FFF4D602E68AB8C` FOREIGN KEY (`fanout_physical_interface_id`) REFERENCES `physicalinterface` (`id`),
  CONSTRAINT `FK_5FFF4D60BFDF15D5` FOREIGN KEY (`virtualinterfaceid`) REFERENCES `virtualinterface` (`id`),
  CONSTRAINT `FK_5FFF4D60E5F6FACB` FOREIGN KEY (`switchportid`) REFERENCES `switchport` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicalinterface`
--

LOCK TABLES `physicalinterface` WRITE;
/*!40000 ALTER TABLE `physicalinterface` DISABLE KEYS */;
INSERT INTO `physicalinterface` VALUES (2,30,NULL,1,1,10000,'full',2,NULL,1),(4,37,NULL,3,1,1000,'full',1,NULL,1),(5,26,NULL,4,1,1000,'full',1,NULL,1),(7,32,NULL,6,1,1000,'full',1,NULL,1),(8,31,NULL,1,1,10000,'full',3,NULL,0);
/*!40000 ALTER TABLE `physicalinterface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routers`
--

DROP TABLE IF EXISTS `routers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vlan_id` int(11) NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `protocol` smallint(5) unsigned NOT NULL,
  `type` smallint(5) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `router_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `peering_ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `asn` int(10) unsigned NOT NULL,
  `software` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mgmt_host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `api` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_type` smallint(5) unsigned NOT NULL,
  `lg_access` smallint(5) unsigned DEFAULT NULL,
  `quarantine` tinyint(1) NOT NULL,
  `bgp_lc` tinyint(1) NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `skip_md5` tinyint(1) NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_504FC9BE918020D9` (`handle`),
  KEY `IDX_504FC9BE8B4937A1` (`vlan_id`),
  CONSTRAINT `FK_504FC9BE8B4937A1` FOREIGN KEY (`vlan_id`) REFERENCES `vlan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routers`
--

LOCK TABLES `routers` WRITE;
/*!40000 ALTER TABLE `routers` DISABLE KEYS */;
INSERT INTO `routers` VALUES (1,1,'rs1-ipv4',4,1,'Route Server #1 - LAN1 - IPv4','RS1 - LAN1 - IPv4','172.30.201.30','172.30.201.30',65500,'1','172.30.201.30','http://rs1-ipv4.ixpmanager/api',1,0,0,1,'api/v4/router/server/bird/standard',0,'2018-01-20 15:56:08'),(2,1,'rs1-ipv6',6,1,'Route Server #1 - LAN1 - IPv6','RS1 - LAN1 - IPv6','172.30.201.30','fd99::30',65500,'1','172.30.201.30','http://rs1-ipv6.ixpmanager/api',1,0,0,1,'api/v4/router/server/bird/standard',0,'2018-01-20 15:56:08');
/*!40000 ALTER TABLE `routers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rs_prefixes`
--

DROP TABLE IF EXISTS `rs_prefixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rs_prefixes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custid` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `prefix` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `protocol` int(11) DEFAULT NULL,
  `irrdb` int(11) DEFAULT NULL,
  `rs_origin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_29FA9871DA0209B9` (`custid`),
  CONSTRAINT `FK_29FA9871DA0209B9` FOREIGN KEY (`custid`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rs_prefixes`
--

LOCK TABLES `rs_prefixes` WRITE;
/*!40000 ALTER TABLE `rs_prefixes` DISABLE KEYS */;
/*!40000 ALTER TABLE `rs_prefixes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sflow_receiver`
--

DROP TABLE IF EXISTS `sflow_receiver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sflow_receiver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `virtual_interface_id` int(11) DEFAULT NULL,
  `dst_ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dst_port` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E633EA142C0D6F5F` (`virtual_interface_id`),
  CONSTRAINT `FK_E633EA142C0D6F5F` FOREIGN KEY (`virtual_interface_id`) REFERENCES `virtualinterface` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sflow_receiver`
--

LOCK TABLES `sflow_receiver` WRITE;
/*!40000 ALTER TABLE `sflow_receiver` DISABLE KEYS */;
/*!40000 ALTER TABLE `sflow_receiver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch`
--

DROP TABLE IF EXISTS `switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `switch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `infrastructure` int(11) DEFAULT NULL,
  `cabinetid` int(11) DEFAULT NULL,
  `vendorid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hostname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipv4addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipv6addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `snmppasswd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `switchtype` int(11) DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `os` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `osDate` datetime DEFAULT NULL,
  `osVersion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastPolled` datetime DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  `serialNumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mauSupported` tinyint(1) DEFAULT NULL,
  `asn` int(10) unsigned DEFAULT NULL,
  `loopback_ip` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loopback_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6FE94B185E237E06` (`name`),
  UNIQUE KEY `UNIQ_6FE94B1850C101F8` (`loopback_ip`),
  KEY `IDX_6FE94B18D129B190` (`infrastructure`),
  KEY `IDX_6FE94B182B96718A` (`cabinetid`),
  KEY `IDX_6FE94B18420FB55F` (`vendorid`),
  CONSTRAINT `FK_6FE94B182B96718A` FOREIGN KEY (`cabinetid`) REFERENCES `cabinet` (`id`),
  CONSTRAINT `FK_6FE94B18420FB55F` FOREIGN KEY (`vendorid`) REFERENCES `vendor` (`id`),
  CONSTRAINT `FK_6FE94B18D129B190` FOREIGN KEY (`infrastructure`) REFERENCES `infrastructure` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch`
--

LOCK TABLES `switch` WRITE;
/*!40000 ALTER TABLE `switch` DISABLE KEYS */;
INSERT INTO `switch` VALUES (2,1,1,14,'Switch 1','switch1','172.30.201.60','fd99::6','switch1',1,'DCS-7280SR-48C6',1,'EOS',NULL,'4.18.0F','2018-01-22 15:03:24','','(not implemented)',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switchport`
--

DROP TABLE IF EXISTS `switchport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `switchport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `switchid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `ifIndex` int(11) DEFAULT NULL,
  `ifName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ifAlias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ifHighSpeed` int(11) DEFAULT NULL,
  `ifMtu` int(11) DEFAULT NULL,
  `ifPhysAddress` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ifAdminStatus` int(11) DEFAULT NULL,
  `ifOperStatus` int(11) DEFAULT NULL,
  `ifLastChange` int(11) DEFAULT NULL,
  `lastSnmpPoll` datetime DEFAULT NULL,
  `lagIfIndex` int(11) DEFAULT NULL,
  `mauType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mauState` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mauAvailability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mauJacktype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mauAutoNegSupported` tinyint(1) DEFAULT NULL,
  `mauAutoNegAdminState` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F84274F1DC2C08F8` (`switchid`),
  CONSTRAINT `FK_F84274F1DC2C08F8` FOREIGN KEY (`switchid`) REFERENCES `switch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switchport`
--

LOCK TABLES `switchport` WRITE;
/*!40000 ALTER TABLE `switchport` DISABLE KEYS */;
INSERT INTO `switchport` VALUES (25,2,0,'Ethernet1',1,1,'Ethernet1','',10000,9214,'444CA8B9427E',1,6,1488071111,'2018-01-22 15:03:25',NULL,'(empty)','shutdown','available',NULL,0,0),(26,2,1,'Ethernet2',1,2,'Ethernet2','Cust: AS112',1000,9214,'444CA8B9427F',1,1,1488421452,'2018-01-22 15:03:25',NULL,'10GigBaseLR','operational','available',NULL,0,0),(27,2,0,'Ethernet3',1,3,'Ethernet3','',10000,9214,'444CA8B94280',1,6,1488071111,'2018-01-22 15:03:25',NULL,'(empty)','shutdown','available',NULL,0,0),(28,2,0,'Ethernet4',1,4,'Ethernet4','',10000,9214,'444CA8B94281',1,6,1488071111,'2018-01-22 15:03:25',NULL,'(empty)','shutdown','available',NULL,0,0),(29,2,0,'Ethernet5',1,5,'Ethernet5','',10000,9214,'444CA8B94282',1,6,1488071111,'2018-01-22 15:03:25',NULL,'(empty)','shutdown','available',NULL,0,0),(30,2,1,'Ethernet6',1,6,'Ethernet6','Cust: HEAnet',10000,9214,'444CA8B94283',1,1,1502459156,'2018-01-22 15:03:25',NULL,'10GigBaseLR','operational','available',NULL,0,0),(31,2,1,'Ethernet7',1,7,'Ethernet7','Cust: HEAnet',10000,9214,'444CA8B94284',1,1,1488422111,'2018-01-22 15:03:25',NULL,'10GigBaseLR','operational','available',NULL,0,0),(32,2,1,'Ethernet8',1,8,'Ethernet8','Cust: imagine',1000,9214,'444CA8B94285',1,1,1499304290,'2018-01-22 15:03:25',NULL,'10GigBaseLR','operational','available',NULL,0,0),(33,2,0,'Ethernet9',1,9,'Ethernet9','',10000,9214,'444CA8B94286',1,6,1488071111,'2018-01-22 15:03:25',NULL,'(empty)','shutdown','available',NULL,0,0),(34,2,0,'Ethernet10',1,10,'Ethernet10','',10000,9214,'444CA8B94287',1,6,1488071111,'2018-01-22 15:03:25',NULL,'(empty)','shutdown','available',NULL,0,0),(35,2,0,'Ethernet11',1,11,'Ethernet11','',10000,9214,'444CA8B94288',1,6,1488071111,'2018-01-22 15:03:25',NULL,'(empty)','shutdown','available',NULL,0,0),(36,2,0,'Ethernet12',1,12,'Ethernet12','',10000,9214,'444CA8B94289',1,6,1488071111,'2018-01-22 15:03:26',NULL,'(empty)','shutdown','available',NULL,0,0),(37,2,1,'Ethernet13',1,13,'Ethernet13','Cust: IP Telecom',1000,9214,'444CA8B9428A',1,1,1511400206,'2018-01-22 15:03:26',NULL,'1000BaseTFD','operational','available',NULL,1,1),(38,2,0,'Ethernet14',1,14,'Ethernet14','',1000,9214,'444CA8B9428B',1,1,1488419699,'2018-01-22 15:03:26',NULL,'1000BaseTFD','operational','available',NULL,1,1),(39,2,0,'Ethernet15',1,15,'Ethernet15','',0,9214,'444CA8B9428C',1,2,1497922618,'2018-01-22 15:03:26',NULL,'1000BaseTFD','shutdown','available',NULL,1,1),(40,2,0,'Ethernet16',1,16,'Ethernet16','',0,9214,'444CA8B9428D',1,2,1488418969,'2018-01-22 15:03:26',NULL,'1000BaseTFD','shutdown','available',NULL,1,1),(41,2,0,'Ethernet17',1,17,'Ethernet17','',1000,9214,'444CA8B9428E',1,1,1488419889,'2018-01-22 15:03:26',NULL,'1000BaseTFD','operational','available',NULL,1,1),(42,2,0,'Ethernet18',1,18,'Ethernet18','',1000,9214,'444CA8B9428F',1,1,1513263953,'2018-01-22 15:03:26',NULL,'1000BaseTFD','operational','available',NULL,1,1),(43,2,0,'Ethernet19',1,19,'Ethernet19','',1000,9214,'444CA8B94290',1,1,1488420298,'2018-01-22 15:03:26',NULL,'1000BaseTFD','operational','available',NULL,1,1),(44,2,0,'Ethernet20',1,20,'Ethernet20','',1000,9214,'444CA8B94291',1,1,1513251423,'2018-01-22 15:03:26',NULL,'1000BaseTFD','operational','available',NULL,1,1),(45,2,0,'Ethernet21',1,21,'Ethernet21','',1000,9214,'444CA8B94292',1,1,1492674830,'2018-01-22 15:03:26',NULL,'1000BaseTFD','operational','available',NULL,1,1),(46,2,0,'Ethernet22',1,22,'Ethernet22','',1000,9214,'444CA8B94293',1,1,1488420584,'2018-01-22 15:03:26',NULL,'1000BaseTFD','operational','available',NULL,1,1),(47,2,0,'Ethernet23',1,23,'Ethernet23','',0,9214,'444CA8B94294',1,2,1488418964,'2018-01-22 15:03:26',NULL,'1000BaseTFD','shutdown','available',NULL,1,1),(48,2,0,'Ethernet24',1,24,'Ethernet24','',0,9214,'444CA8B94295',1,2,1488419011,'2018-01-22 15:03:26',NULL,'1000BaseTFD','shutdown','available',NULL,1,1),(49,2,0,'Ethernet25',1,25,'Ethernet25','',10000,9214,'444CA8B94296',1,1,1512060946,'2018-01-22 15:03:26',NULL,'10GigBaseLR','operational','available',NULL,0,0),(50,2,0,'Ethernet26',1,26,'Ethernet26','',10000,9214,'444CA8B94297',1,2,1505320825,'2018-01-22 15:03:26',NULL,'10GigBaseLR','shutdown','available',NULL,0,0),(51,2,0,'Ethernet27',1,27,'Ethernet27','',10000,9214,'444CA8B94298',1,2,1505320800,'2018-01-22 15:03:26',NULL,'10GigBaseLR','shutdown','available',NULL,0,0),(52,2,0,'Ethernet28',1,28,'Ethernet28','',10000,9214,'444CA8B94299',1,2,1505320817,'2018-01-22 15:03:26',NULL,'10GigBaseLR','shutdown','available',NULL,0,0),(53,2,0,'Ethernet29',1,29,'Ethernet29','',10000,9214,'444CA8B9429A',1,2,1505320803,'2018-01-22 15:03:26',NULL,'10GigBaseLR','shutdown','available',NULL,0,0),(54,2,0,'Ethernet30',1,30,'Ethernet30','',10000,9214,'444CA8B9429B',1,2,1505320821,'2018-01-22 15:03:26',NULL,'10GigBaseLR','shutdown','available',NULL,0,0),(55,2,0,'Ethernet31',1,31,'Ethernet31','',10000,9214,'444CA8B9429C',1,2,1516365733,'2018-01-22 15:03:26',NULL,'10GigBaseLR','shutdown','available',NULL,0,0),(56,2,0,'Ethernet32',1,32,'Ethernet32','',1000,9214,'444CA8B9429D',1,1,1508357231,'2018-01-22 15:03:27',NULL,'1000BaseTFD','operational','available',NULL,1,1),(57,2,0,'Ethernet33',1,33,'Ethernet33','',10000,9214,'444CA8B9429E',1,6,1513341672,'2018-01-22 15:03:27',NULL,'(empty)','shutdown','available',NULL,0,0),(58,2,0,'Ethernet34',1,34,'Ethernet34','',10000,9214,'444CA8B9429F',1,6,1513341678,'2018-01-22 15:03:27',NULL,'(empty)','shutdown','available',NULL,0,0),(59,2,0,'Ethernet35',1,35,'Ethernet35','',10000,9214,'444CA8B942A0',1,6,1513341672,'2018-01-22 15:03:27',NULL,'(empty)','shutdown','available',NULL,0,0),(60,2,0,'Ethernet36',1,36,'Ethernet36','',10000,9214,'444CA8B942A1',1,6,1488071113,'2018-01-22 15:03:27',NULL,'(empty)','shutdown','available',NULL,0,0),(61,2,0,'Ethernet37',1,37,'Ethernet37','',10000,9214,'444CA8B942A2',1,6,1488071113,'2018-01-22 15:03:27',NULL,'(empty)','shutdown','available',NULL,0,0),(62,2,0,'Ethernet38',1,38,'Ethernet38','',10000,9214,'444CA8B942A3',1,6,1488071113,'2018-01-22 15:03:27',NULL,'(empty)','shutdown','available',NULL,0,0),(63,2,0,'Ethernet39',1,39,'Ethernet39','',10000,9214,'444CA8B942A4',1,6,1488071113,'2018-01-22 15:03:27',NULL,'(empty)','shutdown','available',NULL,0,0),(64,2,0,'Ethernet40',1,40,'Ethernet40','',10000,9214,'444CA8B942A5',1,6,1488071113,'2018-01-22 15:03:27',NULL,'(empty)','shutdown','available',NULL,0,0),(65,2,0,'Ethernet41',1,41,'Ethernet41','',0,9214,'444CA8B942A6',2,2,1513342464,'2018-01-22 15:03:27',NULL,'1000BaseTFD','shutdown','available',NULL,1,1),(66,2,0,'Ethernet42',1,42,'Ethernet42','',0,9214,'444CA8B942A7',2,2,1513342471,'2018-01-22 15:03:27',NULL,'1000BaseTFD','shutdown','available',NULL,1,1),(67,2,0,'Ethernet43',1,43,'Ethernet43','',0,9214,'444CA8B942A8',2,2,1513342477,'2018-01-22 15:03:27',NULL,'1000BaseTFD','shutdown','available',NULL,1,1),(68,2,0,'Ethernet44',1,44,'Ethernet44','',0,9214,'444CA8B942A9',2,2,1513342494,'2018-01-22 15:03:27',NULL,'1000BaseTFD','shutdown','available',NULL,1,1),(69,2,0,'Ethernet45',1,45,'Ethernet45','',1000,9214,'444CA8B942AA',1,1,1513343524,'2018-01-22 15:03:27',NULL,'1000BaseTFD','operational','available',NULL,1,1),(70,2,0,'Ethernet46',1,46,'Ethernet46','',1000,9214,'444CA8B942AB',1,1,1513343525,'2018-01-22 15:03:27',NULL,'1000BaseTFD','operational','available',NULL,1,1),(71,2,3,'Ethernet47',1,47,'Ethernet47','Core: switch2',10000,9214,'444CA8B942AC',1,1,1488422734,'2018-01-22 15:03:27',NULL,'10GigBaseLR','operational','available',NULL,0,0),(72,2,3,'Ethernet48',1,48,'Ethernet48','Core: switch2',10000,9214,'444CA8B942AD',1,1,1488422789,'2018-01-22 15:03:27',NULL,'10GigBaseLR','operational','available',NULL,0,0),(73,2,0,'Ethernet49/1',1,49001,'Ethernet49/1','',100000,9214,'444CA8B942AE',1,1,1512061628,'2018-01-22 15:03:27',NULL,'100GbaseLR4','operational','available',NULL,0,0),(74,2,0,'Ethernet50/1',1,50001,'Ethernet50/1','',100000,9214,'444CA8B942B2',1,1,1514333342,'2018-01-22 15:03:27',NULL,'100GbaseLR4','operational','available',NULL,0,0),(75,2,0,'Ethernet51/1',1,51001,'Ethernet51/1','',100000,9214,'444CA8B9427D',1,1,1507770359,'2018-01-22 15:03:27',NULL,'(empty)','operational','available',NULL,0,0),(76,2,0,'Ethernet52/1',1,52001,'Ethernet52/1','',100000,9214,'444CA8B942BA',1,1,1511987616,'2018-01-22 15:03:28',NULL,'100GbaseLR4','operational','available',NULL,0,0),(77,2,0,'Ethernet53/1',1,53001,'Ethernet53/1','',100000,9214,'444CA8B9427D',1,1,1507769311,'2018-01-22 15:03:28',NULL,'(empty)','operational','available',NULL,0,0),(78,2,0,'Ethernet54/1',1,54001,'Ethernet54/1','',100000,9214,'444CA8B942C2',1,6,1496224492,'2018-01-22 15:03:28',NULL,'(empty)','shutdown','available',NULL,0,0),(79,2,5,'Management1',1,999001,'Management1','',1000,1500,'444CA8B9427C',1,1,1488071012,'2018-01-22 15:03:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `switchport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traffic_95th`
--

DROP TABLE IF EXISTS `traffic_95th`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traffic_95th` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `average` bigint(20) DEFAULT NULL,
  `max` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_70BB409ABFF2A482` (`cust_id`),
  CONSTRAINT `FK_70BB409ABFF2A482` FOREIGN KEY (`cust_id`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traffic_95th`
--

LOCK TABLES `traffic_95th` WRITE;
/*!40000 ALTER TABLE `traffic_95th` DISABLE KEYS */;
/*!40000 ALTER TABLE `traffic_95th` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traffic_95th_monthly`
--

DROP TABLE IF EXISTS `traffic_95th_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traffic_95th_monthly` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) DEFAULT NULL,
  `month` date DEFAULT NULL,
  `max_95th` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ED79F9DCBFF2A482` (`cust_id`),
  CONSTRAINT `FK_ED79F9DCBFF2A482` FOREIGN KEY (`cust_id`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traffic_95th_monthly`
--

LOCK TABLES `traffic_95th_monthly` WRITE;
/*!40000 ALTER TABLE `traffic_95th_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `traffic_95th_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traffic_daily`
--

DROP TABLE IF EXISTS `traffic_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traffic_daily` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `ixp_id` int(11) NOT NULL,
  `day` date DEFAULT NULL,
  `category` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `day_avg_in` bigint(20) DEFAULT NULL,
  `day_avg_out` bigint(20) DEFAULT NULL,
  `day_max_in` bigint(20) DEFAULT NULL,
  `day_max_out` bigint(20) DEFAULT NULL,
  `day_tot_in` bigint(20) DEFAULT NULL,
  `day_tot_out` bigint(20) DEFAULT NULL,
  `week_avg_in` bigint(20) DEFAULT NULL,
  `week_avg_out` bigint(20) DEFAULT NULL,
  `week_max_in` bigint(20) DEFAULT NULL,
  `week_max_out` bigint(20) DEFAULT NULL,
  `week_tot_in` bigint(20) DEFAULT NULL,
  `week_tot_out` bigint(20) DEFAULT NULL,
  `month_avg_in` bigint(20) DEFAULT NULL,
  `month_avg_out` bigint(20) DEFAULT NULL,
  `month_max_in` bigint(20) DEFAULT NULL,
  `month_max_out` bigint(20) DEFAULT NULL,
  `month_tot_in` bigint(20) DEFAULT NULL,
  `month_tot_out` bigint(20) DEFAULT NULL,
  `year_avg_in` bigint(20) DEFAULT NULL,
  `year_avg_out` bigint(20) DEFAULT NULL,
  `year_max_in` bigint(20) DEFAULT NULL,
  `year_max_out` bigint(20) DEFAULT NULL,
  `year_tot_in` bigint(20) DEFAULT NULL,
  `year_tot_out` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1F0F81A7BFF2A482` (`cust_id`),
  KEY `IDX_1F0F81A7A5A4E881` (`ixp_id`),
  CONSTRAINT `FK_1F0F81A7A5A4E881` FOREIGN KEY (`ixp_id`) REFERENCES `ixp` (`id`),
  CONSTRAINT `FK_1F0F81A7BFF2A482` FOREIGN KEY (`cust_id`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traffic_daily`
--

LOCK TABLES `traffic_daily` WRITE;
/*!40000 ALTER TABLE `traffic_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `traffic_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custid` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorisedMobile` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `privs` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `lastupdated` datetime DEFAULT NULL,
  `lastupdatedby` int(11) DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),
  KEY `IDX_8D93D649DA0209B9` (`custid`),
  CONSTRAINT `FK_8D93D649DA0209B9` FOREIGN KEY (`custid`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,1,'docker','$2y$10$3wob28r7Oqlfwmqw0mFUq.k0/JHdXv4tONZ3wrjI87zDMCeENmg0y','joe@example.com',NULL,NULL,3,0,'2018-01-18 21:27:41',1,'vagrant','2018-01-18 21:27:41'),(5,4,'as112admin','$2y$10$pW.5k3BxS74UbSH5HCOlhOJXzHgUioMAUd8hoHicW.u.lZkFFXkWS','joe@exmaple.com',NULL,NULL,2,0,'2018-01-18 21:29:48',4,'docker','2018-01-18 21:29:48'),(6,4,'as112user','$2y$10$WjV0rRnERI/.IFQZXxzKle03xXueC6RayuYiT6CKtuU84uQhG2a.G','joe@example.com',NULL,NULL,1,0,'2018-01-18 21:30:16',4,'docker','2018-01-18 21:30:16');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logins`
--

DROP TABLE IF EXISTS `user_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_logins` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6341CC99A76ED395` (`user_id`),
  KEY `at_idx` (`at`,`user_id`),
  CONSTRAINT `FK_6341CC99A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logins`
--

LOCK TABLES `user_logins` WRITE;
/*!40000 ALTER TABLE `user_logins` DISABLE KEYS */;
INSERT INTO `user_logins` VALUES (6,4,'172.30.201.1','2018-01-18 21:27:49'),(7,4,'172.30.201.1','2018-01-19 11:57:53'),(8,4,'172.30.201.1','2018-01-22 13:43:03');
/*!40000 ALTER TABLE `user_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_pref`
--

DROP TABLE IF EXISTS `user_pref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_pref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ix` int(11) NOT NULL DEFAULT '0',
  `op` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `expire` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_UserPreference_1` (`user_id`,`attribute`,`op`,`ix`),
  KEY `IDX_DBD4D4F8A76ED395` (`user_id`),
  CONSTRAINT `FK_DBD4D4F8A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_pref`
--

LOCK TABLES `user_pref` WRITE;
/*!40000 ALTER TABLE `user_pref` DISABLE KEYS */;
INSERT INTO `user_pref` VALUES (5,4,'customer-notes.read_upto',0,'=','1516310861',0),(6,4,'auth.last_login_from',0,'=','172.30.201.1',0),(7,4,'auth.last_login_at',0,'=','1516628583',0),(8,4,'tokens.password_reset',0,'=','NJJAKH2jZG3WqPmDwvN7ExyTKnDoQaesh2fppBBP',1516629247);
/*!40000 ALTER TABLE `user_pref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nagios_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bundle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'Cisco Systems','Cisco','cisco',NULL),(2,'Foundry Networks','Brocade','brocade',NULL),(3,'Extreme Networks','Extreme','extreme',NULL),(4,'Force10 Networks','Force10','force10',NULL),(5,'Glimmerglass','Glimmerglass','glimmerglass',NULL),(6,'Allied Telesyn','AlliedTel','alliedtel',NULL),(7,'Enterasys','Enterasys','enterasys',NULL),(8,'Dell','Dell','dell',NULL),(9,'Hitachi Cable','Hitachi','hitachi',NULL),(10,'MRV','MRV','mrv',NULL),(11,'Transmode','Transmode','transmode',NULL),(12,'Brocade','Brocade','brocade',NULL),(13,'Juniper Networks','Juniper','juniper',NULL),(14,'Arista','Arista',NULL,'Port-Channel');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualinterface`
--

DROP TABLE IF EXISTS `virtualinterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualinterface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mtu` int(11) DEFAULT NULL,
  `trunk` tinyint(1) DEFAULT NULL,
  `channelgroup` int(11) DEFAULT NULL,
  `lag_framing` tinyint(1) NOT NULL DEFAULT '0',
  `fastlacp` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_11D9014FDA0209B9` (`custid`),
  CONSTRAINT `FK_11D9014FDA0209B9` FOREIGN KEY (`custid`) REFERENCES `cust` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualinterface`
--

LOCK TABLES `virtualinterface` WRITE;
/*!40000 ALTER TABLE `virtualinterface` DISABLE KEYS */;
INSERT INTO `virtualinterface` VALUES (1,2,'Port-Channel',NULL,NULL,0,1,1,1),(3,3,'','',0,0,0,0,0),(4,4,'','',0,0,0,0,0),(6,5,'','',0,0,0,0,0);
/*!40000 ALTER TABLE `virtualinterface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vlan`
--

DROP TABLE IF EXISTS `vlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vlan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `infrastructureid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `notes` longtext COLLATE utf8_unicode_ci,
  `peering_matrix` tinyint(1) NOT NULL DEFAULT '0',
  `peering_manager` tinyint(1) NOT NULL DEFAULT '0',
  `config_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `infra_config_name` (`infrastructureid`,`config_name`),
  KEY `IDX_F83104A1721EBF79` (`infrastructureid`),
  CONSTRAINT `FK_F83104A1721EBF79` FOREIGN KEY (`infrastructureid`) REFERENCES `infrastructure` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vlan`
--

LOCK TABLES `vlan` WRITE;
/*!40000 ALTER TABLE `vlan` DISABLE KEYS */;
INSERT INTO `vlan` VALUES (1,1,'Peering LAN 1',1,0,'',0,0,NULL);
/*!40000 ALTER TABLE `vlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vlaninterface`
--

DROP TABLE IF EXISTS `vlaninterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vlaninterface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipv4addressid` int(11) DEFAULT NULL,
  `ipv6addressid` int(11) DEFAULT NULL,
  `virtualinterfaceid` int(11) DEFAULT NULL,
  `vlanid` int(11) DEFAULT NULL,
  `ipv4enabled` tinyint(1) DEFAULT '0',
  `ipv4hostname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipv6enabled` tinyint(1) DEFAULT '0',
  `ipv6hostname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mcastenabled` tinyint(1) DEFAULT '0',
  `irrdbfilter` tinyint(1) DEFAULT '1',
  `bgpmd5secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipv4bgpmd5secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipv6bgpmd5secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maxbgpprefix` int(11) DEFAULT NULL,
  `rsclient` tinyint(1) DEFAULT NULL,
  `ipv4canping` tinyint(1) DEFAULT NULL,
  `ipv6canping` tinyint(1) DEFAULT NULL,
  `ipv4monitorrcbgp` tinyint(1) DEFAULT NULL,
  `ipv6monitorrcbgp` tinyint(1) DEFAULT NULL,
  `as112client` tinyint(1) DEFAULT NULL,
  `busyhost` tinyint(1) DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B4B4411A73720641` (`ipv4addressid`),
  UNIQUE KEY `UNIQ_B4B4411A7787D67C` (`ipv6addressid`),
  KEY `IDX_B4B4411ABFDF15D5` (`virtualinterfaceid`),
  KEY `IDX_B4B4411AF48D6D0` (`vlanid`),
  CONSTRAINT `FK_B4B4411A73720641` FOREIGN KEY (`ipv4addressid`) REFERENCES `ipv4address` (`id`),
  CONSTRAINT `FK_B4B4411A7787D67C` FOREIGN KEY (`ipv6addressid`) REFERENCES `ipv6address` (`id`),
  CONSTRAINT `FK_B4B4411ABFDF15D5` FOREIGN KEY (`virtualinterfaceid`) REFERENCES `virtualinterface` (`id`),
  CONSTRAINT `FK_B4B4411AF48D6D0` FOREIGN KEY (`vlanid`) REFERENCES `vlan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vlaninterface`
--

LOCK TABLES `vlaninterface` WRITE;
/*!40000 ALTER TABLE `vlaninterface` DISABLE KEYS */;
INSERT INTO `vlaninterface` VALUES (1,254,801,1,1,1,'a.heanet.ie',1,'a.heanet.ie',0,1,NULL,'N7rX2SdfbRsyBLTm','N7rX2SdfbRsyBLTm',1000,1,1,1,1,1,1,0,NULL),(3,255,NULL,3,1,1,'a.pch.ie',0,NULL,0,1,NULL,'mcWsqMdzGwTKt67g','mcWsqMdzGwTKt67g',2000,1,1,0,1,0,1,0,NULL),(4,253,NULL,4,1,1,'a.as112.net',0,NULL,0,1,NULL,'w83fmGpRDtaKomQo','w83fmGpRDtaKomQo',20,1,1,0,1,0,0,0,NULL),(6,NULL,802,6,1,0,NULL,1,'a.imagine.ie',0,1,NULL,'X8Ks9QnbER9cyzU3','X8Ks9QnbER9cyzU3',1000,1,0,1,0,1,0,0,NULL);
/*!40000 ALTER TABLE `vlaninterface` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-22 15:03:56
