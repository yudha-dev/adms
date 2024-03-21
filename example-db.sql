-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: easy_iclock
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_logs`
--

DROP TABLE IF EXISTS `attendance_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `device_id` bigint unsigned NOT NULL,
  `pin` varchar(30) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fingertime` datetime NOT NULL,
  `status` tinyint unsigned NOT NULL,
  `verify` tinyint unsigned NOT NULL,
  `work_code` smallint unsigned NOT NULL,
  `reserved` smallint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_attendance_logs` (`device_id`,`pin`,`fingertime`),
  CONSTRAINT `attendance_logs_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_logs`
--

LOCK TABLES `attendance_logs` WRITE;
/*!40000 ALTER TABLE `attendance_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_numbers`
--

DROP TABLE IF EXISTS `auto_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_numbers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `number` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_numbers`
--

LOCK TABLES `auto_numbers` WRITE;
/*!40000 ALTER TABLE `auto_numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `device_id` bigint unsigned NOT NULL,
  `command` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` tinyint DEFAULT '1',
  `return_command` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `commands_device_id_foreign` (`device_id`),
  CONSTRAINT `commands_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commands`
--

LOCK TABLES `commands` WRITE;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
INSERT INTO `commands` VALUES (1,2,'CLEAR LOG',1,NULL,'2023-02-09 08:48:39','2023-02-09 08:48:39',NULL),(2,2,'CLEAR DATA',1,NULL,'2023-02-09 08:49:04','2023-02-09 08:49:04',NULL),(3,2,'LOG',1,NULL,'2023-02-09 08:49:11','2023-02-09 08:49:11',NULL),(4,2,'DATA QUERY ATTLOG StartTime=09 Feb 2023 EndTime=09 Feb 2023',1,NULL,'2023-02-09 08:56:13','2023-02-09 08:56:13',NULL),(5,2,'INFO',1,NULL,'2023-02-09 08:57:56','2023-02-09 08:57:56','2023-02-09 16:57:56'),(6,1,'DATA QUERY ATTLOG StartTime=2023-02-10 01:00:00 EndTime=10 Feb 2023 19:00:00',1,NULL,'2023-02-10 00:52:30','2023-02-10 00:52:30','2023-02-10 08:52:30'),(7,1,'LOG',1,NULL,'2023-02-10 00:53:52','2023-02-10 00:53:52','2023-02-10 08:53:52'),(8,1,'DATA QUERY ATTLOG StartTime=2023-02-10 02:30:00 EndTime=10 Feb 2023 23:59:00',1,NULL,'2023-02-10 00:55:20','2023-02-10 00:55:20','2023-02-10 08:55:20'),(9,1,'DATA QUERY ATTLOG StartTime=2023-02-10 02:30:00 EndTime=10 Feb 2023 23:59:00',1,NULL,'2023-02-10 00:55:58','2023-02-10 00:55:58','2023-02-10 08:55:58'),(10,1,'DATA QUERY ATTLOG StartTime=2023-02-10 02:00:50 EndTime=2023-02-10 23:59:59',1,NULL,'2023-02-10 00:56:31','2023-02-10 00:56:31','2023-02-10 08:56:31'),(11,1,'DATA QUERY ATTLOG StartTime=2023-02-10 02:30:00 EndTime=10 Feb 2023 23:59:00',1,NULL,'2023-02-10 01:55:53','2023-02-10 01:55:53','2023-02-10 09:55:53'),(12,1,'DATA QUERY ATTLOG StartTime=2023-02-10 02:30:00 EndTime=10 Feb 2023 23:59:00',1,NULL,'2023-02-10 01:56:22','2023-02-10 01:56:22','2023-02-10 09:56:22'),(13,1,'CHECK',1,NULL,'2023-02-10 01:56:41','2023-02-10 01:56:41','2023-02-10 09:56:41'),(14,1,'CHECK',1,NULL,'2023-02-10 02:07:57','2023-02-10 02:07:57','2023-02-10 10:07:57'),(15,1,'CHECK',1,NULL,'2023-02-10 02:08:32','2023-02-10 02:08:32','2023-02-10 10:08:32'),(16,1,'CHECK',1,NULL,'2023-02-10 02:09:18','2023-02-10 02:09:18','2023-02-10 10:09:18'),(17,1,'LOG',1,NULL,'2023-02-10 02:09:29','2023-02-10 02:09:29','2023-02-10 10:09:29');
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(40) COLLATE utf8mb3_unicode_ci NOT NULL,
  `additional_info` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `attlog_stamp` int DEFAULT NULL,
  `operlog_stamp` int DEFAULT NULL,
  `attphotolog_stamp` int DEFAULT NULL,
  `error_delay` int DEFAULT '30',
  `delay` int DEFAULT '30',
  `trans_times` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '00:00;14:05',
  `trans_interval` int DEFAULT '1',
  `trans_flag` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '1111111100',
  `timezone` int DEFAULT '7',
  `realtime` tinyint DEFAULT '1',
  `encrypt` tinyint DEFAULT '0',
  `server_version` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `table_name_stamp` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `devices_serial_number_unique` (`serial_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'03161446800308','Ver 2.0.12-20150625,0,09,192.168.1.254,107.150.111',10002,NULL,NULL,30,30,'00:00;14:05',1,'1111111100',7,1,0,'2.2.14',NULL,'2023-01-25 04:10:13','2023-05-05 12:52:56','Mesin 1'),(2,'CKEB221060250','Ver 8.0.4.2-20200723,153,316,39279,192.168.1.203,10,-1,0,0,101',9999,NULL,NULL,30,30,'00:00;14:05',1,'1111111100',7,1,0,'2.4.1',NULL,'2023-01-25 04:42:07','2023-01-27 03:42:32','Mesin Padding Kanan'),(3,'0316144680030888',NULL,10002,NULL,NULL,30,30,'00:00;14:05',1,'1111111100',7,1,0,NULL,NULL,'2023-01-26 07:27:36','2023-01-27 03:43:43','Mesin 2');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_permissions`
--

DROP TABLE IF EXISTS `menu_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_permissions` (
  `menu_id` bigint unsigned NOT NULL,
  `permission_id` bigint unsigned NOT NULL,
  `status` char(1) COLLATE utf8mb3_unicode_ci DEFAULT '1',
  PRIMARY KEY (`menu_id`,`permission_id`),
  KEY `fk_menu_permission_permissions` (`permission_id`),
  CONSTRAINT `fk_menu_permission_menus` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  CONSTRAINT `fk_menu_permission_permissions` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_permissions`
--

LOCK TABLES `menu_permissions` WRITE;
/*!40000 ALTER TABLE `menu_permissions` DISABLE KEYS */;
INSERT INTO `menu_permissions` VALUES (4,1,'1'),(5,5,'1'),(6,9,'1'),(7,13,'1'),(9,29,'1'),(12,21,'1'),(13,25,'1'),(14,33,'1'),(15,37,'1'),(16,41,'1');
/*!40000 ALTER TABLE `menu_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `icon` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `route` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `_lft` int unsigned DEFAULT NULL,
  `_rgt` int unsigned DEFAULT NULL,
  `seq_number` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Master Data','Header menu master','1','2021-08-09 08:10:07','2023-01-27 10:31:45','cil-address-book',NULL,NULL,19,28,1),(4,'Menu','Manage menu','1','2021-08-09 08:10:07','2023-01-27 10:31:45','cil-address-book','base/menus',1,20,21,1),(5,'User','Manage users','1','2021-08-09 08:10:07','2023-01-27 10:31:45','cil-address-book','base/users',1,22,23,2),(6,'Role','Manage role','1','2021-08-09 08:10:07','2023-01-27 10:31:45','cil-address-book','base/roles',1,24,25,3),(7,'Permission','Manage permissions','1','2021-08-09 08:10:07','2023-01-27 10:31:45','cil-address-book','base/permissions',1,26,27,1),(8,'Attendance','Header attendance','1','2023-01-25 13:52:21','2023-01-27 10:31:45','cil-address-book',NULL,NULL,7,18,2),(9,'Log Finger','Attendance Logfinger','1','2023-01-25 13:53:48','2023-01-27 10:31:45','cil-list','attendanceLogs',8,16,17,1),(10,'Utility','Utility for administrator','1','2023-01-25 14:08:29','2023-01-25 14:12:14','cil-settings',NULL,NULL,1,6,2),(11,'Clear Cache','Clear cache application','1','2023-01-25 14:09:11','2023-01-25 14:12:14','cil-trash','artisan/clear_cache',10,4,5,1),(12,'Fingerprint Device','List device','1','2023-01-25 14:10:34','2023-01-27 10:31:45','cil-devices','devices',8,14,15,2),(13,'User Device','User in device','1','2023-01-25 14:11:08','2023-01-27 10:31:45','cil-user','userDevices',8,12,13,3),(14,'Command','Command to devices','1','2023-01-25 14:11:40','2023-01-27 10:31:45','cil-command','commands',8,10,11,4),(15,'Setting','Setting application','1','2023-01-25 14:12:14','2023-01-25 14:12:14','cil-settings','settings',10,2,3,2),(16,'Webhook Device','Set url to forward data from device','1','2023-01-27 10:31:45','2023-01-27 10:31:45','cil-media-skip-forward','webhooks',8,8,9,5);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (123,'2014_10_12_000000_create_users_table',1),(124,'2014_10_12_100000_create_password_resets_table',1),(125,'2017_08_03_055212_create_auto_numbers',1),(126,'2019_08_19_000000_create_failed_jobs_table',1),(127,'2019_12_14_000001_create_personal_access_tokens_table',1),(128,'2021_07_07_080836_create_permission_tables',1),(129,'2021_08_06_225424_create_menus_table',1),(130,'2021_08_06_225434_create_menu_permissions_table',1),(131,'2021_09_08_054823_create_activity_log_table',1),(132,'2021_09_09_152314_alter_user_add_deleted_at',1),(133,'2023_01_24_132050_create_devices',1),(134,'2023_01_24_132146_create_attendance_logs',1),(135,'2023_01_24_132233_create_user_devices',1),(136,'2023_01_24_132305_create_commands',1),(137,'2023_01_24_132643_create_settings',1),(138,'2023_01_24_135831_create_template_fingerprint_devices',1),(139,'2023_01_26_151048_create_webhooks',2),(141,'2023_01_27_103335_add_name_column_device',3),(143,'2023_02_09_112611_add_command_return',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\Base\\User',1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'menus-index','web',NULL,NULL),(2,'menus-create','web',NULL,NULL),(3,'menus-update','web',NULL,NULL),(4,'menus-delete','web',NULL,NULL),(5,'users-index','web',NULL,NULL),(6,'users-create','web',NULL,NULL),(7,'users-update','web',NULL,NULL),(8,'users-delete','web',NULL,NULL),(9,'roles-index','web',NULL,NULL),(10,'roles-create','web',NULL,NULL),(11,'roles-update','web',NULL,NULL),(12,'roles-delete','web',NULL,NULL),(13,'permissions-index','web',NULL,NULL),(14,'permissions-create','web',NULL,NULL),(15,'permissions-update','web',NULL,NULL),(16,'permissions-delete','web',NULL,NULL),(17,'template_fingerprint_devices-index','web',NULL,NULL),(18,'template_fingerprint_devices-create','web',NULL,NULL),(19,'template_fingerprint_devices-update','web',NULL,NULL),(20,'template_fingerprint_devices-delete','web',NULL,NULL),(21,'devices-index','web',NULL,NULL),(22,'devices-create','web',NULL,NULL),(23,'devices-update','web',NULL,NULL),(24,'devices-delete','web',NULL,NULL),(25,'user_devices-index','web',NULL,NULL),(26,'user_devices-create','web',NULL,NULL),(27,'user_devices-update','web',NULL,NULL),(28,'user_devices-delete','web',NULL,NULL),(29,'attendance_logs-index','web',NULL,NULL),(30,'attendance_logs-create','web',NULL,NULL),(31,'attendance_logs-update','web',NULL,NULL),(32,'attendance_logs-delete','web',NULL,NULL),(33,'commands-index','web',NULL,NULL),(34,'commands-create','web',NULL,NULL),(35,'commands-update','web',NULL,NULL),(36,'commands-delete','web',NULL,NULL),(37,'settings-index','web',NULL,NULL),(38,'settings-create','web',NULL,NULL),(39,'settings-update','web',NULL,NULL),(40,'settings-delete','web',NULL,NULL),(41,'webhooks-index','web','2023-01-27 03:27:28','2023-01-27 03:27:28'),(42,'webhooks-create','web','2023-01-27 03:27:28','2023-01-27 03:27:28'),(43,'webhooks-update','web','2023-01-27 03:27:28','2023-01-27 03:27:28'),(44,'webhooks-delete','web','2023-01-27 03:27:28','2023-01-27 03:27:28');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb3_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'administrator','web','2021-10-26 15:21:21','2021-10-26 15:21:21');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_fingerprint_devices`
--

DROP TABLE IF EXISTS `template_fingerprint_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_fingerprint_devices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `device_id` bigint unsigned NOT NULL,
  `pin` varchar(30) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fid` int NOT NULL,
  `size` int NOT NULL,
  `valid` tinyint NOT NULL,
  `tmp` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_fingerprint_devices_pin_fid_unique` (`pin`,`fid`),
  KEY `template_fingerprint_devices_device_id_foreign` (`device_id`),
  CONSTRAINT `template_fingerprint_devices_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_fingerprint_devices`
--

LOCK TABLES `template_fingerprint_devices` WRITE;
/*!40000 ALTER TABLE `template_fingerprint_devices` DISABLE KEYS */;
INSERT INTO `template_fingerprint_devices` VALUES (1,1,'1079',6,1160,1,'SiVTUzIxAAADZmUECAUHCc7QAAAbZ2kBAAAAg4serGZPAHwPlQCmAP9powBuAHQPGwByZpIPyAB+AEMPWmaoAFYPvABwADJqtwC6ADoNggDUZlIOmADfAIMPa2biAE8OPgAsANBrVQDxAFINawD6ZjcPowD7APsPR2b9ANwOVQA7AM9oiAAEAUsPUgAJZ0cPWwAPAZMP5WYhAaQPoQDkAUFoRQAnAdYPAQAqZ6kPpgAtAfYNl2YuAcgNxADyAZVpbgBBAdYPdQBEZ3EOjgBKASYOaeZXCTP6oYivgJgdqHje+R7ynA+IfXIj5feOFm4OeGJiC3+HtPpq7hjIKQqj9BO3RIFeZT8FbgheEU/+mpiPhML94flEgb7kbYuVeb2CAfuyle/xPAud+XD3qnaMjVkJcH/88OofRAQpD1oKCPwWb2gG3Y3KfCcEUZtHEldzcBNYfe6Yi4Bu/34P3BRVEs8F/PPJbUTHtvOYiQHnrfCUK3kCt/SaEkMBMN/CWY+NZR8qDF91nQS1JSAyAQEZFo9lAZ44fcIHxbI7ZTVWDACCRDI4OJnB/sEMAIKI9PxPPcEuCwCsi4CAGGgFAGNbaQdVBWaYX/f/JwzFkWcXfcHAb3YGxZlmm8H9MAoAnql6waeKwG8JAKao/f6YOTELAJ9ytHHBPsL+BQDidN/+LHYBxXqMwsW3g8A8MQsAxICGB8LAGsB7CQDMgdIzw5tWEwEDja1NfMGkwH6DbBUADpePp8Kje8F4PzvAWWwB0J8k/v8E/sOZkAUAsKliAX4FZletVsHAbswAvt4oK3XCBQBsvEqncAUAsLxGRA0D0789/3vDwAbEa28Bur40/1IHkAdmXdBQPQsAUeNKFTn8WQMAmiY9/mABZ+tP/v+9BgM091rE/n4ZxVj5tlLASir9/Tgu/DLBRgQAPf2GKgZmrf09lQQAd/006QIAoP5AwcMApZhBwsLEwgXViAsv/kQHEJUOjMDCnTgDEJoOQzoFEzEXU/9PHhHGFpSbKMBvwsHEAKxoEPzCwfzAWtgQ/niSIv3/wnU6yMujwMDAwsDAOML8pv/A/v8DEFskTKYFEMgsEHjBEMtfCGwDEI5WrsEJdpNL6f77/wRFwm0R/1aDwP8EhsMLBxDkXIOFBFJBZgpDAQAAC4BS','2023-01-25 04:35:39','2023-01-25 04:35:39'),(2,1,'1079',3,1108,1,'Sn1TUzIxAAADPj0ECAUHCc7QAAAbP2kBAAAAg+MZnz5MAIcPggCaAA0wWgCFAPsOvQCIPh8PhwC2APIPZT66AEYPvwAPADcxdwDMAEAPcQDqPjgPygAMAfMP5T4TASoONwDcAc4xKQAbAVsPNgAnP6wOwQAmAYkPzT48AUANrwCAAdYxxwBGAfIOHQBLP5IO6ABIAWAPmz5OAeUPVwCXAegweABeAfEOQABdP+8OYABhAbcOYUZSa1+PWoh789Qoj9xn7r+2KyQtLZbopfvG8DoYXjQ3EAspmvwa/4Q94P4dCwMn0wRxOILvme9VDzP+fkDg98LjLXQm5+BhIJBLc0vrvIYhND9vYQ8BG6tcn21krO33rebY8qGqbbeVYREeVFTuznChXRRtZ5u1AsSMEgr1wXhj/aDCkQcNgn4N0f96NBN9uYgJgsuFaYb2ASArAQE1Gc89AWksDMMIxag6MT/+wP4IAFM8DwkqDAByQf07L/wGVgUA0UUa/QYDp02JgMINAJlV9w3A/S9UBACEW2S+EABXXffA9SlH/irBDwCGXcP9O3X+VVcEAEmba4szAX5fg8LDucLD/MBmBwBPYqiJbzEBhmMMM1Q6/sNVwQwAbnB3V4Rh/hMAdnED/Tv/Nv47/8HB/XfWAF269ST9//7AOsD9/8DA/v7DwdQAf7cR/DFb/sCe//jBDwB0ioDCAMLC/MHBwf9rEsV8jCAowP5oRP7t/wc+7qQkNQoApKZUusD/wD0PAKamRcN2wD7+//4E/A0+ba0a+cBAisH+AA8AbrU3K63A/cH/OA0AiLnySkfB+sEvDQBjeknDY8P8/sH+NssAaoFCZUT/MVHTAL34tcP+wsGCBsLA/cDBwMLBwAV9Dz7CzTFkwP86xE4yAb3OOn7Al8GBMgF2z0BKwDtANh4BFtPMVEs6//0Swf3/S0HCO8LD/sD9fQcAtCk0/H7+BRDLEDpNGhMLFMzAXVf/Ofn5wvrBSv7B/zhBHS4qF8xn/lcE/P3F/fr+/8D9BcH9/sH+/v7//zoEEwscWjsDEMHsPfk7EcJJaf5TwRDfdRJDBRC7WTX7/sEFELphAzyXQgM1QgEAAAtFlwA','2023-01-25 04:35:39','2023-01-25 04:35:39'),(3,1,'1340',6,1280,1,'Sv1TUzIxAAADvr4ECAUHCc7QAAAbv2kBAAAAg2Me6L5AAJgP6AClAJexeQBzAPIPfAB3voIPxwChAEoPg76iAGAPtgBtACGwsACxAGoOLAC+vi4PpgDBAJQOeL7GAE4P4wATADWxyQDXAKoPZgDfvj8OcgDhAIgPyL7oAE8P7QAuAD+xhwDyADsPsQD2vkYPvgD7AAYOtL4EAacO8ADOAU2xrQAQAaMPfwAVv4EPjgAYAWsPWb4jAdUPZQDhAeixigAyAYMPmwA1v/wPdQBBAcQPLbpKFzsLsvyaEUC5ypSTc6/T9vTsT0JhYW1ZJ8tjZas+ENtwtLuUlbVu7UtxGf3fWPu1Oe+jCel1F88wgr378S7/ef7QC8oxEF3Vd1JtzO+puz+VcQlRF8QD7huMjhYY8QpH8MlTwPXh8y798A32Q2ObGB+ZdsBHt1k4BBUo8hQWAcAz7CS9/L3jVNy6Zsi/GS/KDE92t1Hk2c7WHBsg8cFSwNdlh46akBU+l5T+EQZpg+sYOpuvMiA2AQLxG/i2AZAh+jD+/QQDZSQcSg0A54aaw319eX4IAFKQ68LqJgcAtDQM/TwMvuVel3jCiET+wX0QAEdl4vyzwP5DPcD///7CyAB/z/H///w4L5QLAwtwiZJ6wFvIALbIgf+dfsCGzQC+yBH//Vj+E8U/hmA/Rv/+Kzc5wf6tAAORpG9xB4aI2sMGAMedlwbCna0BPZ/cOMAEKf5B/MD/Pv8QxcOjMcOnwcGEWPEKA8KjZMGAVcHKAMgbIf/9wMBH8f3+QwoAf6diwgXD/OhHJQC5qRzvQfxAGv79wPz59zP9QPz3/v3//QX//qEGAKyxcJ4HwhC+57mpfsSPrHjA6wcA6ME0wgU/AK8BDDr/BBA+MWeOBAC1wiT+OPwbvn/D2v/+/j7/+UDB/v3A//4F/P5D//7A/MED1XIbeMEHAKXEVwfCwR4IAHfJU8AHUSC7AbDJTMOcwQB/dU2ABAC2zeghFr7+xrGLb8MG/8EtwMH/jA4ADdSufMTIxcPBwgfCx3rJEgDk2DQ4S/9D/vtX/cLCSAgDHt5Gw8PGyHEEAxvgQKoYAQQnrVl8a8Kdw8LAu8DAfnMGAHHjSTvBwkICAIP1Q8LDAItLPMLFqQQAtPlPf/8IEO0OSTj8/UH9wAUQ8w6G/R26EWEx/T4G1WI7Q1XBBBB5PsVlAK5mQIPCBxC8QwXNfA0QTkr6OGvDfm9aDRBSUMmDQ3xqwgYQm1xFXfy7Eddgej5ShwAI/QAAAAtFUg','2023-01-25 04:35:39','2023-01-25 04:35:39'),(4,1,'1340',3,1668,1,'TaFTUzIxAAAE4uUECAUHCc7QAAAc42kBAAAAhA80UuIwAOsPhwD9AALtrwBOAIkPvABX4mcPiABUAM0Pm+JdAIQOgQCtAADtmABpAA4ObABr4o4NwwBvAOEPl+J1AHsObAC/APftdgCDAP8P5QCI4lUPgQCUAN4PseKZACcPRABsAEvttQCxAC8PugC94kQOXAC+AIYPIeK+ANEPnQAeAE3tagDdAMUOtADm4sgOowDlAIMPeeLoAFoOxQApADPtMgDtAEkPdgDr4kEPZwDwAH8NbeL/ALsOawDNAaPsTQAJASEOBQAV41QPOwATAYgOz+IZAT4OegDkAeTtcAAiAYYP8wAo4+UNSQAsAdUMo+IsAd8PewD0AevtKAAzAeYNkAA344sMvQA0ASkOIeI9AfoOkgCLAf3vegBPAfgO/wBU43sOUQBTAbwOa+JfAX4OWgCaAfnstoSf5LPnfAPKQqeHWQU+/JN9GYJMZu5g/aQABYFkTHjd/Sn1jP2RaCyiyJdFjESAhWKcDWkW3ZfDnvZA2W+dev3ubPR1EbPYHQyt5ZT/T+ZqhSdjER3PKDpDnPoOmyoHlwyeYM78FQqn6Arusuf/LZKC3vSrgT7jl4bniG99pQdS6qvx2P4FDRBuUOTMcBEQ5P+UCULzvJDBlpmiAPnWE5PlWipy/ip4PevY/eL4AQBk8JUX/ReBAKVjVe+RDBAjydVSaJt8QPlzad4VHS24amXd2euWVK5j2V7ZEkw79KolmXTjDeKc1f3uhYg0LRklrPaCjvrqlBA9i9P47O+FBFfYiZ6DqD4QIQ6vsF57WRdpGqWDwAIq7/d+5X2JAo8ICeCkg7KVLXxIAhIe3ImBgZIE7ISFYxeFiAtrXq/6C8I9AQJNHLHPAGD6asLAdFkMxXMdk8PCwGplw8EAh/52hw4AkiRFwoMhZsBYDwCc6IPFIX+HwVPABMWKPOExEgCwOIwHwceXecH/hWoExS44gIISAKhMjEjBjyBnwMH+dgvFdVaJinjAagkAuFLzHf07//4FAE5UBx81DgB3V2e9eGAdhBMAm12JB6R4iWrBVRcA066njyDC/8TDwMMFwsSEZWQGAK1y20z74QHEcyT/A8WPcGHFDQBudes5/fki/FX+USAAQ3lzJo3C/8HDwTvDkSXEloPDwMUOxsBnCgCJeQD78zVJ8wFpfWLDcaFqxBz+Ig4AeoE//fgc/j9EVQ8AQJMSxlTB/S78/9UA03WlwP/Cj8AAwMcdiAcAt5si8FMB4nypRlIKAIWrVL5URwUAgquFwybkAUWsTFnA3gC2TqrBwsOllzqQxiLFxsjEw8IFwo/mAXivUIMIxbi2z0ptBQC0tPRUAeKmtzREEQCYutQi/P3++P39jv9WHQQAf71DL8MAXCBHgMMFAF4HRpXvAZ3WvcDDBMTMJMXCwsDDBsVE2aH+wYwHAJobSfvS/gcAn95GBSr67gGj6EMu/TvAJiACAH/tU/3GAMcSNsAFAMjw9P945AEv8UnAK8MAMRNH/8AjCAB08kTO/DQPALby///4H//+//3B/gX/xSIHAEb4PcAGyMfmEU0NMcrAyhDH90L5/MBKNofBB/JYMwbDAxAPP4cgAhCgQHHAxhBzsoHBBhC8VUVtxOQRv1x9VsGXQgTpQgEAAAtFlwA','2023-01-25 04:35:39','2023-01-25 04:35:39'),(5,1,'1369',6,1296,1,'SolTUzIxAAADyskECAUHCc7QAAAby2kBAAAAg3cir8peAAoPegCnAH3FpgB3AIUP/AB9yvcPTQB+ALYPd8qGAAAPSABPAPXFwACMABEPrgCeyncPWACqADwPksqtAIAPUABwAGPFmwC5AH4P9QDBylcOzADCAFUPlMrMAA4PJwAQANvEewDWAGcP+QDdyuEOVADiAJkOgMrjAAQPyAAtAJTFngDpAIEPeADzypIPNwD0AJUPQMr5ANsPZAA5AFLFSwACAd0PQwAIy0gOLQA7AYwPWMo8AToOQwCCAUPFTwBJATcOTABJyy4OwYan+TKNSUsW+QN1xX7fdIzDpAGNhbP+mX+Otxt20Y5Khc+OX00kAbr9DozaCahIcH7Zem4ZJJhyTDcFKQQ6dVcO+qKTDQbtqQCMcWXRfIFaeB758/o8NnoVOZHRD2yPfk+4+taJQWTLWI3E6JIxCqmGaH6CSU8MIZyJh5j7Us6vCmoaiX9wdwk61Px6FLsE+Xf6uEh2zAM0j5j/pr3b9LZ4TAf4jppFy/n2RhLLiApJ3zoQqQW5/w7wS8HU+jEL0Pvo/dk73vTT+xPrImmtMQIgOgECD9JCB8pkS3dsAwB1XA8LCAB2XoPCB8DCC34LAKdeiaeHgMIBfmIDNcPqBANkYhBXCQB2oH3BNcPCwXwJAGZzirZ6wggAo3lF/8IJ/5EFAKt5ycE1zwFJf3GQBsV3gDBB/gMAcIhFwgjKeYkGwitM/QYDjo1rwsDCwcAAwFoSwDsJAGdffcAKlcLBDQBvWP385UfAOwUAaGV0wk8LAFuq98A7/v0L/sH8BQCOaYPBkQkATLRnwwViwsIBT7lifv++CANcuIPDcYMDxSzAkMMNAMjEkAVvhAnDhAUA0MXS/zLfAfTHoofCo8DBrIHEwG4EAF/OCvwEAHbVa8FABgO01PT7wP3/wAB7EGZ4EQBX3yzA/TX/wPw+//6G/gbKiOEA/FkHxTjhkMHCwHYJAFLogwjEwsRSDwB+7JQKxcDFk8DBBnEFys3sIEHBE8U68xAu/jDB/f0E/sM3/v/ABwDBNxz8//4FADP2VwdkBMo4+FDB/8EE/gbKQPxM/8DCwxBgylbCwYEIEI0GT5XAWgsQigco+v81MsA4BxCCyVDAS8EKEJEO9zwp/ZUEEIcPScJHBxNFF0mdwMIH1aUU6DR9AxCYGfHABNqhGi1UggXVkiL+VxIQ3jartMGRD8TBxHVsFdXkNX7DfInDw8QGwsE1xcDBwMID1TA8jMAEEKRANEZSQcoKQwEAAAuAUg','2023-01-25 04:35:39','2023-01-25 04:35:39'),(6,2,'5541',5,1172,1,'Si1TUzIxAAADbm4ECAUHCc7QAAAbb2kBAAAAg5MbX25UAHoPMABMAHBhMwCnAPQPkACvbnMPogDAAEUPum7HAAkMTAAMAPJh5QDLAA4N4gDPbmcP2wDNAEwNVm7nAGUPagA8AGdhiAAFAWQPeAAFb4IPnwAOAZoOi24iAUkP5wDmATVhowAkAUENpQAkb0YPrgAnAcwL0m4qAY4NrQD0AS1kTgA+AUEPdgA9b6wLnAA/AeAMkG5ZAR8PvwCcAQFhZgtLC1uLi4Asb1YPSoCShR+SXe6Xga8BDXrO+wgZAIqCgX7/m4DF4g+N6Ib6Bz6TGRvndjMB8H5HgYBlOAPSdLMBeAMtbmYcLQZeHGsAdUpTfV5GXSJ0/k41OAv65BrseKrk28ouSDtlFDzmlmU3AgPkvN/Fy7Iw5Fp6hV7h3SeC7vTsGf8v+4ongu5Qio2mQfqceqplMP9GdmIf61QZsS/XIUtABuUxAmwJGzgDAGb3/fxqAaQ1ADoHxTQ+Z8VC/wMApPoD/GIBO0v9Vv+Q/1BrAVhTgIUIxXRQbllCBgBZWbJaw2UB5WqG/8C1ZMJoAV9ielnAwQBLAHzCwA0AUKr6wlHB/0vC/w7FSH+ZwUZlQjoKxYqE6MLAwIRaCcWSiW5VWP8KAIZLgHXqWxMA/pCJBP2IkcL9wsH/wq9dE27+pZCFdHIE/sGuwxMA+62MtnTDHljA/40GAJSud6/BwMIRAPxwiWGuw1F4w/9gyACc0YF4c4uCFMX7w+Jdwf/Ba8FGXYBhAbXGfVpwBHjBFA4ATsfxRvltSZAFAN/QEErNAFGGaH54FgEDKZeHkcDBwXh0wFVvG27+9ZrEUMG9wvyswcTAwMB3BcHGYwFu9un8wTv9VFXBCgBb/WS7g2lnAWj9Z4PBQQwT1wWDwsDEwwWfcWcRhAVkgokFCRP1DHHFwJ+E1xCgYPv/+//+/Dn7+ZL9Hfn2/BnUBAzMdnVxeIDBBcLDrsKBBhCeEqfEwc4HEIYmTMJTBRPPKUnGnwcQLCgzkPj7/f0FEJsqSuUWEP8qqYC5wsOsicLAd8PAkQMSbDM9/xEQtfMexKrKyMKlxcQGw8D7GBBQOsz8B/38kf1B/v///zr//5H6/fv8wPrGEEgsR8IDEFFC+MAGfpxEKcKDUocACC0AAAALRVI','2023-01-26 01:26:32','2023-01-26 01:26:32'),(7,2,'5541',4,1148,1,'Sh9TUzIxAAADXGMECAUHCc7QAAAbXWkBAAAAg4EZ51y7AIYPRgAEAGVT4ADBAA8PVQDJXPQPswDLAMEPeVzRAGYPrgAtAAhTMwD0AFwPRgD1XPQPTgD/ACQP4VwJASEPpwDPARdTVgAUAeAPfgAUXZUOagAeASENgFwkAfoNagDjAepRSwAtAdsPvwAyXfANzQAyAfYPR1w7AdwPuAD5AT1TewA9ARMM8wA8XdAPcgBSAZkOTyZuhV9/JwKuDlTbQYrrDNsHxJKNra/vxfv+EbL0Ei5TcqcCPQt7+RVHN3xDfPf6h5KhvoPv0QIyhAf/0dO28N8PhYLzCQF+tP1RAsH7QIIVPDNZ3P4xBQT24lQEEtXrWAZ0+Zau+AAJD3n/FeNqpCgJvfb2oOYUdlwYDHr/MQ7DrfRxLSe9uj0bZPSSp4ry9UrubRt3MipXACA0AQLLG29fAVNOdMILxc1YJmf/wXzACMV/YyjBw2T+DwA/bIo1wXf/b3AExUuQOzkDAENyZwUSAl53hllzw1IEwv2eTw4A/n+GOoRtnGjABgBcmqL/VU8B+4mMwXgEaXE4ZBMA/JOMvsLCnMCFalb/FMX3n9N/g8BwwcAEXVVIAfGiicH/ScFkPnLBWhUA+3WQe9d/cnRWwhbF4LTQwMRfZId3BWlzRAAAvJPD/AbDd57+hcLAwXinwQpc4b2GdMLBBv0AXOTCEMAEAIbDZAAGALfHADODCgPOyPRBwCnBzACsl3zCwJB1B8W3zl80Qg4Ads+uwsMkesLBJAUAstRnOAkAsugJ/zr+wxIJAIb18P46/DtIAf/0noN8VcHAPsDBdwQALzJcalQRSwJafsI4/hNNAgKgd3fBAcDC2MEEEOYIHoIEE78NJMH9EBHGDqM1w8CShsFkwhC0RJLCw8R+EdVqGYIv//39MMA4RPxbEb8aHjM9yhBtQuPA/C7+KPD/B0xnImA+CRBCIvSh/f0q/ggQTCgDof0bwBUQTujgZ6Iw/TM4/Vo7BxMiM/r9+v36BQcTKjJtwcBcBdXONWz+VQUQfjo4+vmgBRBBPWJXwhB1Ymj/w/1wBdV9Q1D7+f8EELiENzZZEX9IdMJ20RAmPObBR8H+wQT+/qf+/f39wSuXQgNXQgEAAAtFlwA','2023-01-26 01:26:32','2023-01-26 01:26:32');
/*!40000 ALTER TABLE `template_fingerprint_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_devices`
--

DROP TABLE IF EXISTS `user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_devices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `device_id` bigint unsigned NOT NULL,
  `pin` varchar(30) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `pri` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `passwd` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `card` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `grp` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tz` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `verify` tinyint NOT NULL,
  `vice_card` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_devices_device_id_pin_unique` (`device_id`,`pin`),
  CONSTRAINT `user_devices_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_devices`
--

LOCK TABLES `user_devices` WRITE;
/*!40000 ALTER TABLE `user_devices` DISABLE KEYS */;
INSERT INTO `user_devices` VALUES (1,1,'1079','Hendri','14','1234','','1','0000000100000000',0,'',NULL,NULL,'2023-01-25 04:24:25','2023-01-25 04:27:17'),(2,1,'1340','Ratih','14','','','1','0000000100000000',0,'',NULL,NULL,'2023-01-25 04:24:25','2023-01-25 04:27:17'),(3,1,'1369','Septin','14','1369','','1','0000000100000000',0,'',NULL,NULL,'2023-01-25 04:24:25','2023-01-25 04:27:17'),(4,1,'5142','Yopi','0','','','1','0000000100000000',0,'',NULL,NULL,'2023-01-25 04:24:25','2023-01-25 04:27:17'),(13,1,'5383','Imelda','0','','','1','0000000100000000',0,'',NULL,NULL,'2023-01-25 04:27:41','2023-01-25 04:31:54'),(14,1,'5331','Utami','0','','','1','0000000100000000',0,'',NULL,NULL,'2023-01-25 04:27:41','2023-01-25 04:31:54'),(15,1,'5368','Sulimah','0','','','1','0000000100000000',0,'',NULL,NULL,'2023-01-25 04:27:41','2023-01-25 04:31:54'),(16,1,'5404','Renita','0','','','1','0000000100000000',0,'',NULL,NULL,'2023-01-25 04:27:41','2023-01-25 04:31:54'),(17,1,'5523','Sulati','0','','','1','0000000100000000',0,'',NULL,NULL,'2023-01-25 04:27:41','2023-01-25 04:31:54'),(18,1,'3213','Anik','0','','','1','0000000100000000',0,'',NULL,NULL,'2023-01-25 04:27:41','2023-01-25 04:31:54'),(19,1,'5519','Setiasih','0','','','1','0000000100000000',0,'',NULL,NULL,'2023-01-25 04:31:54','2023-01-25 04:31:54'),(21,2,'5541','Agus','0','','','1','0000000100000000',0,'',NULL,NULL,'2023-01-26 01:26:27','2023-01-26 01:26:27');
/*!40000 ALTER TABLE `user_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrator','admin@admin.com',NULL,'$2y$10$Vi/M3mYzPevq1UG2m33ZZeO0oi8x2Vk/0Qihwd/hLBS4MrzGXe/nO',NULL,'2021-10-26 15:21:17','2021-10-26 15:21:17',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhooks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `device_id` bigint unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `webhooks_device_id_unique` (`device_id`),
  CONSTRAINT `webhooks_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhooks`
--

LOCK TABLES `webhooks` WRITE;
/*!40000 ALTER TABLE `webhooks` DISABLE KEYS */;
INSERT INTO `webhooks` VALUES (1,2,'https://fssafafa.ssds.comfdsb','2023-01-27 04:06:53','2023-01-27 04:06:53'),(2,1,'http://127.0.0.1:8001/iclock/webhook?deviceId=3','2023-01-27 06:20:27','2023-01-27 07:43:10');
/*!40000 ALTER TABLE `webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'easy_iclock'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 19:56:14
