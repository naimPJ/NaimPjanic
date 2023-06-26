-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: midterm-2023
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.20-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cap_table`
--

DROP TABLE IF EXISTS `cap_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cap_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_class_id` int(10) unsigned NOT NULL,
  `share_class_category_id` int(10) unsigned NOT NULL,
  `investor_id` int(10) unsigned NOT NULL,
  `diluted_shares` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_share_class_id` (`share_class_id`),
  KEY `fk_share_class_category_id` (`share_class_category_id`),
  KEY `fk_investor_id` (`investor_id`),
  CONSTRAINT `fk_investor_id` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`),
  CONSTRAINT `fk_share_class_category_id` FOREIGN KEY (`share_class_category_id`) REFERENCES `share_class_categories` (`id`),
  CONSTRAINT `fk_share_class_id` FOREIGN KEY (`share_class_id`) REFERENCES `share_classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cap_table`
--

LOCK TABLES `cap_table` WRITE;
/*!40000 ALTER TABLE `cap_table` DISABLE KEYS */;
INSERT INTO `cap_table` VALUES (1,1,1,1,50.00),(2,1,2,1,10.00),(3,2,3,1,89.00),(4,2,4,2,12.00),(5,1,2,2,13.00),(6,2,3,3,15.00),(7,1,1,7,11.00),(8,2,4,2,18.00),(10,1,1,1,103.00),(11,1,1,1,123.00);
/*!40000 ALTER TABLE `cap_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investors`
--

DROP TABLE IF EXISTS `investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investors`
--

LOCK TABLES `investors` WRITE;
/*!40000 ALTER TABLE `investors` DISABLE KEYS */;
INSERT INTO `investors` VALUES (1,'FIRST ','INVESTOR','first.investor@gmail.com','ONE','2023-04-06 07:25:16'),(2,'SECOND','INVESTOR','second.investor@gmail.com','TWO','2023-04-12 07:25:16'),(3,'THIRD','INVESTOR','third.investor@gmail.com','THREE','2023-04-18 07:25:16'),(7,'FOURTH','INVESTOR','fourth.investor@gmail.com','FOUR','2023-04-18 07:25:16');
/*!40000 ALTER TABLE `investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_class_categories`
--

DROP TABLE IF EXISTS `share_class_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_class_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_class_id` int(10) unsigned NOT NULL,
  `description` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_share_class` (`share_class_id`),
  CONSTRAINT `fk_share_class` FOREIGN KEY (`share_class_id`) REFERENCES `share_classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_class_categories`
--

LOCK TABLES `share_class_categories` WRITE;
/*!40000 ALTER TABLE `share_class_categories` DISABLE KEYS */;
INSERT INTO `share_class_categories` VALUES (1,1,'CATEGORY_1'),(2,1,'CATEGORY_2'),(3,2,'CATEGORY_3'),(4,2,'CATEGORY_4');
/*!40000 ALTER TABLE `share_class_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_classes`
--

DROP TABLE IF EXISTS `share_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equity_main_currency` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,6) DEFAULT NULL,
  `authorized_assets` decimal(20,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_classes`
--

LOCK TABLES `share_classes` WRITE;
/*!40000 ALTER TABLE `share_classes` DISABLE KEYS */;
INSERT INTO `share_classes` VALUES (1,'FIRST_CLASS','USD',12.000000,500000000000.000),(2,'SECOND_CLASS','USD',29.000000,100000000000.000);
/*!40000 ALTER TABLE `share_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'demo','user','demo.user@gmail.com','123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'midterm-2023'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-25 23:05:09
