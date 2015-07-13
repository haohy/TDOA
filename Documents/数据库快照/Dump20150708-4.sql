-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: tdoa_tdoa
-- ------------------------------------------------------
-- Server version 5.6.24-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_id` int(3) NOT NULL,
  `account_name` varchar(10) NOT NULL,
  `account_phone` varchar(12) DEFAULT NULL,
  `account_username` text NOT NULL,
  `account_sex` text,
  `account_position` text NOT NULL,
  `account_email` varchar(50) NOT NULL,
  `account_address` text NOT NULL,
  `account_password` varchar(100) NOT NULL,
  `account_work` int(4) DEFAULT NULL,
  `account_power1` tinyint(1) DEFAULT NULL,
  `account_power2` tinyint(1) DEFAULT NULL,
  `account_power3` tinyint(1) DEFAULT NULL,
  `account_power4` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'user','15380929106','hhy','男','处长','hao-hy@hotmail.com','NJUPT','098f6bcd4621d373cade4e832627b4f6',1,1,1,1,1),(2,'user','123412423123','lh','男','副教授','2998336811@qq.com','njupt','098f6bcd4621d373cade4e832627b4f6',1,3,2,3,1),(3,'user','13434534534','hh','女','科长','2342343@163.com','njupt','098f6bcd4621d373cade4e832627b4f6',3,4,0,2,2),(4,'admin','23123423423','admin','admin','admin','3523453@qq.com','njupt','098f6bcd4621d373cade4e832627b4f6',0,0,0,0,0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `file_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `file_name` text NOT NULL,
  `file_address` varchar(255) DEFAULT NULL,
  `file_uploader` text,
  `file_time` date DEFAULT NULL,
  `file_type` text,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_mission`
--

DROP TABLE IF EXISTS `history_mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_mission` (
  `mission_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `mission_name` text NOT NULL,
  `mission_content` longtext,
  `mission_start` date NOT NULL,
  `mission_plan_end` date NOT NULL,
  `mission_end` date NOT NULL,
  `mission_publisher` text NOT NULL,
  `mission_doer` text NOT NULL,
  `mission_status` tinytext NOT NULL,
  `mission_pubtime` datetime DEFAULT NULL,
  `mission_year` tinyint(2) NOT NULL,
  `mission_appendix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_mission`
--

LOCK TABLES `history_mission` WRITE;
/*!40000 ALTER TABLE `history_mission` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission`
--

DROP TABLE IF EXISTS `mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mission` (
  `mission_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `mission_name` text NOT NULL,
  `mission_content` longtext,
  `mission_start` date NOT NULL,
  `mission_plan_end` date NOT NULL,
  `mission_publisher` text NOT NULL,
  `mission_doer` text NOT NULL,
  `mission_status` tinytext NOT NULL,
  `mission_pubtime` datetime DEFAULT NULL,
  `mission_year` tinyint(2) NOT NULL,
  `mission_appendix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission`
--

LOCK TABLES `mission` WRITE;
/*!40000 ALTER TABLE `mission` DISABLE KEYS */;
INSERT INTO `mission` VALUES (1,'helloworld','show the truth','2013-12-03','2014-05-06','hhy','lh','审核中','2014-12-23 00:00:00',12,'是'),(2,'hello','show the truth','2014-05-06','2015-06-06','lh','hhy','进行中','2014-05-06 13:05:06',13,'否');
/*!40000 ALTER TABLE `mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tdoa_tdoa'
--

--
-- Dumping routines for database 'tdoa_tdoa'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-08 15:56:59
