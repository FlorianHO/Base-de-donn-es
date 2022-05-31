-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: empty_database
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id_address` int NOT NULL AUTO_INCREMENT,
  `street_number` varchar(10) NOT NULL,
  `street_name` char(40) NOT NULL,
  `residence_name` char(40) NOT NULL,
  `building_name` varchar(40) NOT NULL,
  `floor` int NOT NULL,
  `address_type_1` char(40) NOT NULL,
  `city` char(40) NOT NULL,
  `id_customer` int NOT NULL,
  PRIMARY KEY (`id_address`),
  KEY `Address_Postal_code_FK` (`city`),
  KEY `Address_Customer0_FK` (`id_customer`),
  CONSTRAINT `Address_Customer0_FK` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`),
  CONSTRAINT `Address_Postal_code_FK` FOREIGN KEY (`city`) REFERENCES `postal_code` (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue`
--

DROP TABLE IF EXISTS `catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue` (
  `id_city` int NOT NULL AUTO_INCREMENT,
  `city_available` char(40) NOT NULL,
  `country` char(40) NOT NULL,
  PRIMARY KEY (`id_city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue`
--

LOCK TABLES `catalogue` WRITE;
/*!40000 ALTER TABLE `catalogue` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `customer_lastname` char(40) NOT NULL,
  `customer_firstname` char(40) NOT NULL,
  `customer_gender` char(10) NOT NULL,
  `customer_birthdate` date NOT NULL,
  `customer_phone_number` varchar(15) NOT NULL,
  `customer_email_address` varchar(40) NOT NULL,
  `id_sales_consultant` int NOT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `Customer_Sales_consultant_FK` (`id_sales_consultant`),
  CONSTRAINT `Customer_Sales_consultant_FK` FOREIGN KEY (`id_sales_consultant`) REFERENCES `sales_consultant` (`id_sales_consultant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_steps`
--

DROP TABLE IF EXISTS `payment_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_steps` (
  `id_payment` int NOT NULL AUTO_INCREMENT,
  `payment_amount` int NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` char(40) NOT NULL,
  `travel_number` int NOT NULL,
  PRIMARY KEY (`id_payment`),
  KEY `payment_steps_Travel_FK` (`travel_number`),
  CONSTRAINT `payment_steps_Travel_FK` FOREIGN KEY (`travel_number`) REFERENCES `travel` (`travel_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_steps`
--

LOCK TABLES `payment_steps` WRITE;
/*!40000 ALTER TABLE `payment_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postal_code`
--

DROP TABLE IF EXISTS `postal_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postal_code` (
  `city` char(40) NOT NULL,
  `zip_code` char(40) NOT NULL,
  `country` char(40) NOT NULL,
  PRIMARY KEY (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postal_code`
--

LOCK TABLES `postal_code` WRITE;
/*!40000 ALTER TABLE `postal_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `postal_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_consultant`
--

DROP TABLE IF EXISTS `sales_consultant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_consultant` (
  `id_sales_consultant` int NOT NULL AUTO_INCREMENT,
  `sales_consultant_lastname` char(40) NOT NULL,
  `sales_consultant_firstname` char(40) NOT NULL,
  PRIMARY KEY (`id_sales_consultant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_consultant`
--

LOCK TABLES `sales_consultant` WRITE;
/*!40000 ALTER TABLE `sales_consultant` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_consultant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id_staff` int NOT NULL AUTO_INCREMENT,
  `staff_lastname` char(40) NOT NULL,
  `staff_firstname` char(40) NOT NULL,
  `staff_phone_number` varchar(15) NOT NULL,
  `staff_email_address` varchar(40) NOT NULL,
  `staff_hire_date` date NOT NULL,
  `address_type_2` char(40) NOT NULL,
  `id_address` int NOT NULL,
  PRIMARY KEY (`id_staff`),
  KEY `Staff_Address_FK` (`id_address`),
  CONSTRAINT `Staff_Address_FK` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step`
--

DROP TABLE IF EXISTS `step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `step` (
  `id_step` int NOT NULL AUTO_INCREMENT,
  `means_transport` char(40) NOT NULL,
  `step_mileage` int NOT NULL,
  `ticket_type` varchar(40) NOT NULL,
  `ticket_fare` int NOT NULL,
  `departure_city` char(40) NOT NULL,
  `arrival_city` char(40) NOT NULL,
  `departure_date` timestamp NOT NULL,
  `arrival_date` timestamp NOT NULL,
  `travel_number` int NOT NULL,
  PRIMARY KEY (`id_step`),
  KEY `Step_Travel_FK` (`travel_number`),
  CONSTRAINT `Step_Travel_FK` FOREIGN KEY (`travel_number`) REFERENCES `travel` (`travel_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step`
--

LOCK TABLES `step` WRITE;
/*!40000 ALTER TABLE `step` DISABLE KEYS */;
/*!40000 ALTER TABLE `step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `to_be`
--

DROP TABLE IF EXISTS `to_be`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `to_be` (
  `id_sales_consultant` int NOT NULL,
  `id_staff` int NOT NULL,
  PRIMARY KEY (`id_sales_consultant`,`id_staff`),
  KEY `To_be_Staff0_FK` (`id_staff`),
  CONSTRAINT `To_be_Sales_consultant_FK` FOREIGN KEY (`id_sales_consultant`) REFERENCES `sales_consultant` (`id_sales_consultant`),
  CONSTRAINT `To_be_Staff0_FK` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `to_be`
--

LOCK TABLES `to_be` WRITE;
/*!40000 ALTER TABLE `to_be` DISABLE KEYS */;
/*!40000 ALTER TABLE `to_be` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel` (
  `travel_number` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `number_cities` int NOT NULL,
  `id_customer` int NOT NULL,
  `id_staff` int NOT NULL,
  `id_city` int NOT NULL,
  PRIMARY KEY (`travel_number`),
  KEY `Travel_Customer_FK` (`id_customer`),
  KEY `Travel_Staff0_FK` (`id_staff`),
  KEY `Travel_Catalogue1_FK` (`id_city`),
  CONSTRAINT `Travel_Catalogue1_FK` FOREIGN KEY (`id_city`) REFERENCES `catalogue` (`id_city`),
  CONSTRAINT `Travel_Customer_FK` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`),
  CONSTRAINT `Travel_Staff0_FK` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-24 16:41:07
