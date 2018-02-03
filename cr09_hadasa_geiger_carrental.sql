-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cr09_hadasa_geiger_carrental
-- ------------------------------------------------------
-- Server version	5.5.59-0ubuntu0.14.04.1

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `pk_Car_id` int(11) NOT NULL,
  `fk_Car_Location` int(11) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Year_production` int(11) DEFAULT NULL,
  `mileage` int(11) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk_Car_id`),
  KEY `fk_Car_Location` (`fk_Car_Location`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_Car_Location`) REFERENCES `location` (`pk_Location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,1,'VW','Golf',1999,30000,'Rostfarben'),(2,2,'Daihatsu','Charade',2015,10000,'Blau');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `pk_Customer_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `birthdate` date NOT NULL,
  `License_No` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk_Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Inge Lutz','1968-11-11','5020xxxx'),(2,'Josef Lutz','1965-10-11','5020yyyy');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance` (
  `pk_Insurance_id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Policy` varchar(500) NOT NULL,
  PRIMARY KEY (`pk_Insurance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,'Autoversicherungen GmbH','Spezieller Tarif XYZ'),(2,'Superversicherungen GmbH','Super-Spezieller Tarif XYZ');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_Management_id` int(11) NOT NULL,
  `car_rent_cents` int(11) NOT NULL,
  `insurancecost_total_cents` int(11) NOT NULL,
  `service_tax` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `payable_total_cents` int(11) NOT NULL,
  `discount_cents` int(11) NOT NULL,
  `net_total_cents` int(11) NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `fk_Management_id` (`fk_Management_id`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_Management_id`) REFERENCES `management` (`pk_Management_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,1,10000,100,0,20,12120,0,0),(2,2,10000,100,0,20,12120,0,0);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `pk_Location_id` int(11) NOT NULL,
  `street_name` varchar(500) NOT NULL,
  `City` varchar(100) NOT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Zip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`pk_Location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Anichstrasse 1','Innsbruck','Tirol','Austria','5020'),(2,'Geibelgasse 1','Wien','Tirol','Austria','1150');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `management` (
  `pk_Management_id` int(11) NOT NULL,
  `fk_Customer_id` int(11) NOT NULL,
  `fk_car_id` int(11) NOT NULL,
  `fk_pickup_location_id` int(11) NOT NULL,
  `fk_dropoff_location_id` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`pk_Management_id`),
  KEY `fk_Customer_id` (`fk_Customer_id`),
  KEY `fk_car_id` (`fk_car_id`),
  KEY `fk_pickup_location_id` (`fk_pickup_location_id`),
  KEY `fk_dropoff_location_id` (`fk_dropoff_location_id`),
  CONSTRAINT `management_ibfk_1` FOREIGN KEY (`fk_Customer_id`) REFERENCES `customer` (`pk_Customer_id`),
  CONSTRAINT `management_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`pk_Car_id`),
  CONSTRAINT `management_ibfk_3` FOREIGN KEY (`fk_pickup_location_id`) REFERENCES `location` (`pk_Location_id`),
  CONSTRAINT `management_ibfk_4` FOREIGN KEY (`fk_dropoff_location_id`) REFERENCES `location` (`pk_Location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
INSERT INTO `management` VALUES (1,1,1,2,1,'2018-01-01',NULL),(2,2,2,2,1,'2018-01-01',NULL);
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental_insurance`
--

DROP TABLE IF EXISTS `rental_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rental_insurance` (
  `pk_Rental_Insurance_id` int(11) NOT NULL,
  `fk_Rental_Insurance_id` int(11) NOT NULL,
  `fk_Insurance_id` int(11) NOT NULL,
  PRIMARY KEY (`pk_Rental_Insurance_id`),
  KEY `fk_Rental_Insurance_id` (`fk_Rental_Insurance_id`),
  KEY `fk_Insurance_id` (`fk_Insurance_id`),
  CONSTRAINT `rental_insurance_ibfk_1` FOREIGN KEY (`fk_Rental_Insurance_id`) REFERENCES `management` (`pk_Management_id`),
  CONSTRAINT `rental_insurance_ibfk_2` FOREIGN KEY (`fk_Insurance_id`) REFERENCES `insurance` (`pk_Insurance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental_insurance`
--

LOCK TABLES `rental_insurance` WRITE;
/*!40000 ALTER TABLE `rental_insurance` DISABLE KEYS */;
INSERT INTO `rental_insurance` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `rental_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `pk_Reservation_id` int(11) NOT NULL,
  `fk_Customer_id` int(11) NOT NULL,
  `fk_Pickup_location_id` int(11) NOT NULL,
  `fk_Dropoff_location_id` int(11) NOT NULL,
  PRIMARY KEY (`pk_Reservation_id`),
  KEY `fk_Customer_id` (`fk_Customer_id`),
  KEY `fk_Pickup_location_id` (`fk_Pickup_location_id`),
  KEY `fk_Dropoff_location_id` (`fk_Dropoff_location_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_Customer_id`) REFERENCES `customer` (`pk_Customer_id`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_Pickup_location_id`) REFERENCES `location` (`pk_Location_id`),
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_Dropoff_location_id`) REFERENCES `location` (`pk_Location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-03 11:33:20
