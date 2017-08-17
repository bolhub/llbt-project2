-- MySQL dump 10.13  Distrib 5.7.10, for Win64 (x86_64)
--
-- Host: localhost    Database: sampledb
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `t_function`
--

DROP TABLE IF EXISTS `t_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_function` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_function`
--

LOCK TABLES `t_function` WRITE;
/*!40000 ALTER TABLE `t_function` DISABLE KEYS */;
INSERT INTO `t_function` VALUES (1,'Administrator'),(2,'GUEST');
/*!40000 ALTER TABLE `t_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_function_role`
--

DROP TABLE IF EXISTS `t_function_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_function_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `functionid` bigint(20) DEFAULT NULL,
  `roleid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `functionid2` (`functionid`,`roleid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `t_function_role_ibfk_1` FOREIGN KEY (`functionid`) REFERENCES `t_function` (`id`),
  CONSTRAINT `t_function_role_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_function_role`
--

LOCK TABLES `t_function_role` WRITE;
/*!40000 ALTER TABLE `t_function_role` DISABLE KEYS */;
INSERT INTO `t_function_role` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `t_function_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_function_user`
--

DROP TABLE IF EXISTS `t_function_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_function_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `function_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `function_id` (`function_id`),
  CONSTRAINT `t_function_user_ibfk_1` FOREIGN KEY (`function_id`) REFERENCES `t_function` (`id`),
  CONSTRAINT `t_function_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_function_user`
--

LOCK TABLES `t_function_user` WRITE;
/*!40000 ALTER TABLE `t_function_user` DISABLE KEYS */;
INSERT INTO `t_function_user` VALUES (1,1,1);
/*!40000 ALTER TABLE `t_function_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_generalresouce`
--

DROP TABLE IF EXISTS `t_generalresouce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_generalresouce` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(30) DEFAULT NULL,
  `fileUrl` varchar(100) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `upUid` int(11) DEFAULT NULL,
  `resource_level` int(1) DEFAULT '0',
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_generalresouce`
--

LOCK TABLES `t_generalresouce` WRITE;
/*!40000 ALTER TABLE `t_generalresouce` DISABLE KEYS */;
INSERT INTO `t_generalresouce` VALUES (1,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 07:53:29',1,0),(2,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 07:56:36',1,0),(3,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 08:04:26',1,0),(4,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 08:19:07',1,0),(5,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 08:25:35',1,0),(6,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 08:32:02',1,0),(7,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 08:34:57',1,0),(8,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 08:42:28',1,0),(9,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 08:56:09',1,0),(10,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 09:03:19',1,0),(11,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 09:09:03',1,0),(12,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 09:11:21',1,0),(13,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 09:16:47',1,0),(14,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 17:48:20',1,0),(15,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 17:51:00',1,0),(16,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 17:53:44',1,0),(17,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 17:55:58',1,0),(18,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 17:56:40',1,0),(19,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 17:57:15',1,0),(20,'账号.txt','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/账号.txt','2017-08-04 18:01:55',1,0),(21,'1_qq_26525215.jpg','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/1_qq_26525215.jpg','2017-08-10 10:59:14',1,0),(22,'1_qq_26525215.jpg','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/1_qq_26525215.jpg','2017-08-10 11:01:46',1,0),(23,'1_qq_26525215.jpg','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/1_qq_26525215.jpg','2017-08-10 11:06:45',1,0),(24,'1_qq_26525215.jpg','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/1_qq_26525215.jpg','2017-08-10 11:06:58',1,0),(25,'blog7.png','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/blog7.png','2017-08-10 11:08:06',1,0),(26,'chizhiyiheng.png','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/chizhiyiheng.png','2017-08-10 11:08:38',1,0),(27,'html.js','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/html.js','2017-08-10 11:09:30',1,0),(28,'z_stat.js','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/z_stat.js','2017-08-10 11:10:23',1,0),(29,'top.png','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/top.png','2017-08-10 11:39:18',1,0),(30,'top.png','F:\\Users\\LLBT\\IdeaProjects\\charpter2\\target\\chapter2-1.0-SNAPSHOT\\fileUpload\\temp/top.png','2017-08-10 11:40:28',1,0);
/*!40000 ALTER TABLE `t_generalresouce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_login_log`
--

DROP TABLE IF EXISTS `t_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_login_log` (
  `login_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(23) DEFAULT NULL,
  `login_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`login_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_login_log`
--

LOCK TABLES `t_login_log` WRITE;
/*!40000 ALTER TABLE `t_login_log` DISABLE KEYS */;
INSERT INTO `t_login_log` VALUES (1,1,'0:0:0:0:0:0:0:1','2017-08-03 02:05:11'),(2,1,'0:0:0:0:0:0:0:1','2017-08-03 02:38:00'),(3,1,'0:0:0:0:0:0:0:1','2017-08-03 07:10:46'),(4,1,'0:0:0:0:0:0:0:1','2017-08-03 07:11:35'),(5,1,'0:0:0:0:0:0:0:1','2017-08-03 07:20:09'),(6,1,'0:0:0:0:0:0:0:1','2017-08-03 07:21:36'),(7,1,'0:0:0:0:0:0:0:1','2017-08-03 07:24:47'),(8,1,'0:0:0:0:0:0:0:1','2017-08-03 07:25:14'),(9,1,'0:0:0:0:0:0:0:1','2017-08-03 07:30:59'),(10,1,'0:0:0:0:0:0:0:1','2017-08-03 08:16:41'),(11,1,'0:0:0:0:0:0:0:1','2017-08-03 08:20:54'),(12,1,'0:0:0:0:0:0:0:1','2017-08-03 08:33:30'),(13,1,'0:0:0:0:0:0:0:1','2017-08-04 01:12:01'),(14,1,'0:0:0:0:0:0:0:1','2017-08-04 02:21:45'),(15,1,'0:0:0:0:0:0:0:1','2017-08-04 07:27:36'),(16,1,'0:0:0:0:0:0:0:1','2017-08-04 07:33:01'),(17,1,'0:0:0:0:0:0:0:1','2017-08-04 07:39:11'),(18,1,'0:0:0:0:0:0:0:1','2017-08-04 07:43:21'),(19,1,'0:0:0:0:0:0:0:1','2017-08-04 07:53:03'),(20,1,'0:0:0:0:0:0:0:1','2017-08-04 07:55:49'),(21,1,'0:0:0:0:0:0:0:1','2017-08-04 08:03:54'),(22,1,'0:0:0:0:0:0:0:1','2017-08-04 08:18:24'),(23,1,'0:0:0:0:0:0:0:1','2017-08-04 08:24:45'),(24,1,'0:0:0:0:0:0:0:1','2017-08-04 08:31:26'),(25,1,'0:0:0:0:0:0:0:1','2017-08-04 08:34:28'),(26,1,'0:0:0:0:0:0:0:1','2017-08-04 08:41:58'),(27,1,'0:0:0:0:0:0:0:1','2017-08-04 08:51:19'),(28,1,'0:0:0:0:0:0:0:1','2017-08-04 08:54:38'),(29,1,'0:0:0:0:0:0:0:1','2017-08-04 08:55:39'),(30,1,'0:0:0:0:0:0:0:1','2017-08-04 09:02:47'),(31,1,'0:0:0:0:0:0:0:1','2017-08-04 09:08:30'),(32,1,'0:0:0:0:0:0:0:1','2017-08-04 09:10:26'),(33,1,'0:0:0:0:0:0:0:1','2017-08-04 09:16:10'),(34,1,'0:0:0:0:0:0:0:1','2017-08-04 17:47:40'),(35,1,'0:0:0:0:0:0:0:1','2017-08-07 10:10:11'),(36,1,'0:0:0:0:0:0:0:1','2017-08-07 10:52:56'),(37,1,'0:0:0:0:0:0:0:1','2017-08-07 10:54:59'),(38,1,'0:0:0:0:0:0:0:1','2017-08-07 10:59:44'),(39,1,'0:0:0:0:0:0:0:1','2017-08-07 11:01:52'),(40,1,'0:0:0:0:0:0:0:1','2017-08-07 11:04:12'),(41,1,'0:0:0:0:0:0:0:1','2017-08-07 11:07:27'),(42,1,'0:0:0:0:0:0:0:1','2017-08-07 11:10:47'),(43,1,'0:0:0:0:0:0:0:1','2017-08-07 11:13:21'),(44,1,'0:0:0:0:0:0:0:1','2017-08-07 11:15:20'),(45,1,'0:0:0:0:0:0:0:1','2017-08-07 11:21:39'),(46,1,'0:0:0:0:0:0:0:1','2017-08-07 11:28:17'),(47,1,'0:0:0:0:0:0:0:1','2017-08-07 11:55:44'),(48,1,'0:0:0:0:0:0:0:1','2017-08-07 14:18:04'),(49,1,'0:0:0:0:0:0:0:1','2017-08-07 14:33:21'),(50,1,'0:0:0:0:0:0:0:1','2017-08-07 14:45:04'),(51,1,'0:0:0:0:0:0:0:1','2017-08-07 14:50:27'),(52,1,'0:0:0:0:0:0:0:1','2017-08-07 15:02:11'),(53,1,'0:0:0:0:0:0:0:1','2017-08-07 15:16:50'),(54,1,'0:0:0:0:0:0:0:1','2017-08-07 15:33:09'),(55,1,'0:0:0:0:0:0:0:1','2017-08-07 15:37:21'),(56,1,'0:0:0:0:0:0:0:1','2017-08-07 15:39:49'),(57,1,'0:0:0:0:0:0:0:1','2017-08-07 15:42:32'),(58,1,'0:0:0:0:0:0:0:1','2017-08-07 15:49:41'),(59,1,'0:0:0:0:0:0:0:1','2017-08-07 15:51:42'),(60,1,'0:0:0:0:0:0:0:1','2017-08-07 17:50:24'),(61,1,'0:0:0:0:0:0:0:1','2017-08-07 17:53:47'),(62,1,'0:0:0:0:0:0:0:1','2017-08-07 17:57:37'),(63,1,'0:0:0:0:0:0:0:1','2017-08-07 18:03:08'),(64,1,'0:0:0:0:0:0:0:1','2017-08-07 18:03:08'),(65,1,'0:0:0:0:0:0:0:1','2017-08-07 18:10:52'),(66,1,'0:0:0:0:0:0:0:1','2017-08-07 18:15:44'),(67,1,'0:0:0:0:0:0:0:1','2017-08-07 18:31:07'),(68,1,'0:0:0:0:0:0:0:1','2017-08-08 09:31:32'),(69,1,'0:0:0:0:0:0:0:1','2017-08-08 09:38:11'),(70,1,'0:0:0:0:0:0:0:1','2017-08-08 09:40:56'),(71,1,'0:0:0:0:0:0:0:1','2017-08-08 09:47:19'),(72,1,'0:0:0:0:0:0:0:1','2017-08-08 09:57:29'),(73,1,'0:0:0:0:0:0:0:1','2017-08-08 10:00:03'),(74,1,'0:0:0:0:0:0:0:1','2017-08-08 10:17:24'),(75,1,'0:0:0:0:0:0:0:1','2017-08-08 11:35:10'),(76,1,'0:0:0:0:0:0:0:1','2017-08-08 11:38:31'),(77,1,'0:0:0:0:0:0:0:1','2017-08-08 11:49:04'),(78,1,'0:0:0:0:0:0:0:1','2017-08-08 14:34:10'),(79,1,'0:0:0:0:0:0:0:1','2017-08-08 14:39:17'),(80,1,'0:0:0:0:0:0:0:1','2017-08-08 14:58:50'),(81,1,'0:0:0:0:0:0:0:1','2017-08-08 15:03:04'),(82,1,'0:0:0:0:0:0:0:1','2017-08-08 15:07:45'),(83,1,'0:0:0:0:0:0:0:1','2017-08-08 15:11:52'),(84,1,'0:0:0:0:0:0:0:1','2017-08-08 15:14:35'),(85,1,'0:0:0:0:0:0:0:1','2017-08-08 15:16:58'),(86,1,'0:0:0:0:0:0:0:1','2017-08-08 15:19:21'),(87,1,'0:0:0:0:0:0:0:1','2017-08-08 15:31:35'),(88,1,'0:0:0:0:0:0:0:1','2017-08-08 15:38:50'),(89,1,'0:0:0:0:0:0:0:1','2017-08-08 15:43:45'),(90,1,'0:0:0:0:0:0:0:1','2017-08-08 16:00:23'),(91,1,'0:0:0:0:0:0:0:1','2017-08-08 16:22:03'),(92,1,'0:0:0:0:0:0:0:1','2017-08-08 16:27:10'),(93,1,'0:0:0:0:0:0:0:1','2017-08-08 16:31:03'),(94,1,'0:0:0:0:0:0:0:1','2017-08-08 16:35:19'),(95,1,'0:0:0:0:0:0:0:1','2017-08-08 16:38:03'),(96,1,'0:0:0:0:0:0:0:1','2017-08-08 17:31:07'),(97,1,'0:0:0:0:0:0:0:1','2017-08-08 17:44:51'),(98,1,'0:0:0:0:0:0:0:1','2017-08-09 09:37:47'),(99,1,'0:0:0:0:0:0:0:1','2017-08-09 10:19:17'),(100,1,'0:0:0:0:0:0:0:1','2017-08-09 11:49:44'),(101,1,'0:0:0:0:0:0:0:1','2017-08-09 14:56:13'),(102,1,'0:0:0:0:0:0:0:1','2017-08-09 15:16:43'),(103,1,'0:0:0:0:0:0:0:1','2017-08-10 10:27:07'),(104,1,'0:0:0:0:0:0:0:1','2017-08-10 10:57:59'),(105,1,'0:0:0:0:0:0:0:1','2017-08-10 11:10:01'),(106,1,'0:0:0:0:0:0:0:1','2017-08-10 11:37:14'),(107,1,'0:0:0:0:0:0:0:1','2017-08-10 14:12:32'),(108,1,'0:0:0:0:0:0:0:1','2017-08-10 14:23:06'),(109,1,'0:0:0:0:0:0:0:1','2017-08-10 14:27:07'),(110,1,'0:0:0:0:0:0:0:1','2017-08-10 14:45:38'),(111,1,'0:0:0:0:0:0:0:1','2017-08-10 14:56:16'),(112,1,'0:0:0:0:0:0:0:1','2017-08-10 15:01:03'),(113,1,'0:0:0:0:0:0:0:1','2017-08-10 15:21:45'),(114,1,'0:0:0:0:0:0:0:1','2017-08-10 15:27:19'),(115,1,'0:0:0:0:0:0:0:1','2017-08-10 15:59:26'),(116,1,'0:0:0:0:0:0:0:1','2017-08-10 16:33:30'),(117,1,'0:0:0:0:0:0:0:1','2017-08-10 16:50:01'),(118,1,'0:0:0:0:0:0:0:1','2017-08-10 16:50:01'),(119,1,'0:0:0:0:0:0:0:1','2017-08-11 11:43:07'),(120,1,'0:0:0:0:0:0:0:1','2017-08-14 10:06:16'),(121,1,'0:0:0:0:0:0:0:1','2017-08-14 10:06:23'),(122,1,'0:0:0:0:0:0:0:1','2017-08-14 10:06:49'),(123,1,'0:0:0:0:0:0:0:1','2017-08-14 10:06:52'),(124,1,'0:0:0:0:0:0:0:1','2017-08-14 10:12:20'),(125,1,'0:0:0:0:0:0:0:1','2017-08-14 10:12:25'),(126,1,'0:0:0:0:0:0:0:1','2017-08-14 10:12:27'),(127,1,'0:0:0:0:0:0:0:1','2017-08-14 10:12:32'),(128,1,'0:0:0:0:0:0:0:1','2017-08-14 10:14:49'),(129,1,'0:0:0:0:0:0:0:1','2017-08-14 10:33:55'),(130,1,'0:0:0:0:0:0:0:1','2017-08-14 10:34:08'),(131,1,'0:0:0:0:0:0:0:1','2017-08-14 10:34:20'),(132,1,'0:0:0:0:0:0:0:1','2017-08-14 11:08:13'),(133,1,'0:0:0:0:0:0:0:1','2017-08-14 11:08:25'),(134,1,'0:0:0:0:0:0:0:1','2017-08-14 11:08:32'),(135,1,'0:0:0:0:0:0:0:1','2017-08-14 11:20:54'),(136,1,'0:0:0:0:0:0:0:1','2017-08-14 11:31:24'),(137,1,'0:0:0:0:0:0:0:1','2017-08-14 11:31:28'),(138,1,'0:0:0:0:0:0:0:1','2017-08-14 11:41:05'),(139,1,'0:0:0:0:0:0:0:1','2017-08-14 11:41:09'),(140,1,'0:0:0:0:0:0:0:1','2017-08-14 11:41:11'),(141,1,'0:0:0:0:0:0:0:1','2017-08-14 11:41:13'),(142,1,'0:0:0:0:0:0:0:1','2017-08-14 11:42:36'),(143,1,'0:0:0:0:0:0:0:1','2017-08-14 11:42:43'),(144,1,'0:0:0:0:0:0:0:1','2017-08-14 11:42:45'),(145,1,'0:0:0:0:0:0:0:1','2017-08-14 11:42:48'),(146,1,'0:0:0:0:0:0:0:1','2017-08-14 11:46:29'),(147,1,'0:0:0:0:0:0:0:1','2017-08-14 11:46:33'),(148,1,'0:0:0:0:0:0:0:1','2017-08-14 16:33:37'),(149,2,'0:0:0:0:0:0:0:1','2017-08-14 16:33:54'),(150,1,'0:0:0:0:0:0:0:1','2017-08-14 17:03:41'),(151,1,'0:0:0:0:0:0:0:1','2017-08-14 17:34:16'),(152,1,'0:0:0:0:0:0:0:1','2017-08-14 18:06:13'),(153,1,'0:0:0:0:0:0:0:1','2017-08-15 09:24:44'),(154,2,'0:0:0:0:0:0:0:1','2017-08-15 11:45:54'),(155,1,'0:0:0:0:0:0:0:1','2017-08-15 11:46:13'),(156,1,'0:0:0:0:0:0:0:1','2017-08-15 15:06:44'),(157,1,'0:0:0:0:0:0:0:1','2017-08-15 15:29:44'),(158,1,'0:0:0:0:0:0:0:1','2017-08-15 15:58:49'),(159,1,'0:0:0:0:0:0:0:1','2017-08-15 16:17:24'),(160,1,'0:0:0:0:0:0:0:1','2017-08-15 16:19:09'),(161,1,'0:0:0:0:0:0:0:1','2017-08-15 16:52:37'),(162,1,'0:0:0:0:0:0:0:1','2017-08-15 17:00:46'),(163,1,'0:0:0:0:0:0:0:1','2017-08-15 17:48:44'),(164,1,'0:0:0:0:0:0:0:1','2017-08-15 17:51:53'),(165,1,'0:0:0:0:0:0:0:1','2017-08-15 17:55:11'),(166,1,'0:0:0:0:0:0:0:1','2017-08-15 17:57:42'),(167,1,'0:0:0:0:0:0:0:1','2017-08-15 18:05:25'),(168,1,'0:0:0:0:0:0:0:1','2017-08-15 18:08:34'),(169,1,'0:0:0:0:0:0:0:1','2017-08-15 18:10:47'),(170,1,'0:0:0:0:0:0:0:1','2017-08-16 09:10:53'),(171,1,'0:0:0:0:0:0:0:1','2017-08-16 09:14:53'),(172,1,'0:0:0:0:0:0:0:1','2017-08-16 09:15:56'),(173,1,'0:0:0:0:0:0:0:1','2017-08-16 09:28:36'),(174,1,'0:0:0:0:0:0:0:1','2017-08-16 09:30:05'),(175,1,'0:0:0:0:0:0:0:1','2017-08-16 09:43:10'),(176,1,'0:0:0:0:0:0:0:1','2017-08-16 10:04:50'),(177,1,'0:0:0:0:0:0:0:1','2017-08-16 10:05:38'),(178,1,'0:0:0:0:0:0:0:1','2017-08-16 10:06:34'),(179,1,'0:0:0:0:0:0:0:1','2017-08-16 10:09:26'),(180,1,'0:0:0:0:0:0:0:1','2017-08-16 10:28:27'),(181,1,'0:0:0:0:0:0:0:1','2017-08-16 10:34:22'),(182,1,'0:0:0:0:0:0:0:1','2017-08-16 10:43:15'),(183,1,'0:0:0:0:0:0:0:1','2017-08-16 10:49:54'),(184,1,'0:0:0:0:0:0:0:1','2017-08-16 10:51:23'),(185,1,'0:0:0:0:0:0:0:1','2017-08-16 10:53:38'),(186,1,'0:0:0:0:0:0:0:1','2017-08-16 10:55:07'),(187,1,'0:0:0:0:0:0:0:1','2017-08-16 11:02:00'),(188,1,'0:0:0:0:0:0:0:1','2017-08-16 11:03:23'),(189,1,'0:0:0:0:0:0:0:1','2017-08-16 11:32:22'),(190,1,'0:0:0:0:0:0:0:1','2017-08-16 11:54:11'),(191,1,'0:0:0:0:0:0:0:1','2017-08-16 11:58:03'),(192,1,'0:0:0:0:0:0:0:1','2017-08-16 14:19:18'),(193,1,'0:0:0:0:0:0:0:1','2017-08-16 14:22:10'),(194,1,'0:0:0:0:0:0:0:1','2017-08-16 14:28:30'),(195,1,'0:0:0:0:0:0:0:1','2017-08-16 14:35:33'),(196,1,'0:0:0:0:0:0:0:1','2017-08-16 14:40:21'),(197,1,'0:0:0:0:0:0:0:1','2017-08-16 15:07:31'),(198,1,'0:0:0:0:0:0:0:1','2017-08-16 15:07:36'),(199,1,'0:0:0:0:0:0:0:1','2017-08-16 15:08:59'),(200,1,'0:0:0:0:0:0:0:1','2017-08-16 15:32:01'),(201,1,'0:0:0:0:0:0:0:1','2017-08-16 15:46:07'),(202,1,'0:0:0:0:0:0:0:1','2017-08-16 15:46:19'),(203,1,'0:0:0:0:0:0:0:1','2017-08-16 15:50:17'),(204,1,'0:0:0:0:0:0:0:1','2017-08-16 16:02:38'),(205,4,'0:0:0:0:0:0:0:1','2017-08-16 17:22:07'),(206,3,'0:0:0:0:0:0:0:1','2017-08-16 17:22:50'),(207,4,'0:0:0:0:0:0:0:1','2017-08-16 17:23:19'),(208,1,'0:0:0:0:0:0:0:1','2017-08-16 17:23:30'),(209,1,'0:0:0:0:0:0:0:1','2017-08-16 18:02:59'),(210,1,'0:0:0:0:0:0:0:1','2017-08-17 09:31:12'),(211,1,'0:0:0:0:0:0:0:1','2017-08-17 09:37:14');
/*!40000 ALTER TABLE `t_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_resume`
--

DROP TABLE IF EXISTS `t_resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_resume` (
  `fId` int(11) NOT NULL,
  `personName` varchar(30) DEFAULT NULL,
  `graduated_year` date DEFAULT NULL,
  `educationBackground` varchar(30) DEFAULT NULL,
  `projects` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_resume`
--

LOCK TABLES `t_resume` WRITE;
/*!40000 ALTER TABLE `t_resume` DISABLE KEYS */;
INSERT INTO `t_resume` VALUES (1,'personName','0000-00-00','educationBackground','projeccts'),(15,'personName6','0000-00-00','中专','projects6'),(17,'personName7','0000-00-00','本科','projects7'),(18,'personName8','0000-00-00','中专','projects8'),(19,'personName9','0000-00-00','中专','projects9'),(20,'personName10','0000-00-00','本科','projects10'),(23,'PERSON1','0000-00-00','中专','PROJECTS1r\'po\'eject\'s'),(24,'PERSON1','0000-00-00','中专','PROJECTS1r\'po\'eject\'s'),(26,'person1','0000-00-00','中专','projects'),(27,'测试','0000-00-00','中专','项目'),(28,'测试2','0000-00-00','中专','项目人2'),(30,'侧室','0000-00-00','中专','项目4');
/*!40000 ALTER TABLE `t_resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(40) DEFAULT NULL,
  `descript` varchar(40) DEFAULT NULL COMMENT '角色f描述',
  `category` varchar(40) DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'ROLE_ADMIN','系统管理员','系统管理员'),(2,'ROLE_USER','普通用户','普通用户');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `last_ip` varchar(23) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'admin',1020,'123456','2017-08-17 09:37:14','0:0:0:0:0:0:0:1'),(2,'test1',10,'123456','2017-08-15 11:45:54','0:0:0:0:0:0:0:1'),(3,'注册用户1',5,'123456','2017-08-16 17:22:50','0:0:0:0:0:0:0:1'),(4,'注册用户2',10,'123456','2017-08-16 17:23:19','0:0:0:0:0:0:0:1'),(5,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_role`
--

DROP TABLE IF EXISTS `t_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `t_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`),
  CONSTRAINT `t_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_role`
--

LOCK TABLES `t_user_role` WRITE;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;
INSERT INTO `t_user_role` VALUES (1,1,1),(2,2,2),(4,4,2);
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-17 10:48:55
