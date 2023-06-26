-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: financedb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(500) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  `isActivity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (9,'tranhuuthanh','$2a$10$HxwZrSRucqm93bfIWhVr/uiA0aGVXGlug52lgdPw6mYVgh2XTBLAO','tranhuuthanh@gmail.com',2,1),(10,'tranhuutruong','$2a$10$mpKHLu9aMySR4VToqQq5keTRiPdL9ASWQr/wQjjl3W/ppHUN6sXPG','tranhuutruong290401@gmail.com',1,1),(11,'lequocthien','$2a$10$WbOxp9dIZR7RAxf4lqGtsO3bgz6wR/RJM5.ZwLjitVKrlD4zgNx7m','tranthithuylinh02112011@gmail.com',2,1),(15,'tranminhlong','$2a$10$mGyly4QFZQ78AWmCwmcKL.XsjcU41mnQ621TLrmdEbQlhymkk7Zj.','tranminhlong@gmail.com',2,1),(21,'phuochieu12','$2a$10$HCicN6EXswN1vJ0aJyXt/u4Dcw95wrl5y9ozXuaygIThm1LhzR4ye','phuochie@gmail.com',2,1),(26,'user01','$2a$10$CLc0vsRFdcYDs8Qb.xIn3eY5chGNL/aDiGNhEQ28z/Dp2HWGbxR/i','abcdef@gmail.com',2,0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_cards`
--

DROP TABLE IF EXISTS `bank_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_cards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `balance` decimal(65,2) NOT NULL,
  `cardnumber` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` text NOT NULL,
  `updated_at` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cardnumber` (`cardnumber`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `bank_cards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_cards`
--

LOCK TABLES `bank_cards` WRITE;
/*!40000 ALTER TABLE `bank_cards` DISABLE KEYS */;
INSERT INTO `bank_cards` VALUES (10,10,'MSB',10024334.00,'12345678','Ngân hàng hàng hải Việt Nam','2023-04-07 14:22:27','05/06/2023 18:08:22'),(117,11,'VietcomBank',1500000.00,'0985723525','Ngân hàng Thương mại Cổ phần Ngoại thương','18/04/2023 11:40:44','19/04/2023 23:08:12'),(119,10,'VietcomBank',14900000.00,'098572352','Ngân hàng Tây Nam Bộ','21/04/2023 01:47:26','21/04/2023 01:47:26'),(120,10,'BIDV',15220000.00,'010010183456','Ngân hàng TMCP Đầu tư và Phát triển Việt Nam','23/04/2023 12:08:26','23/04/2023 12:08:26');
/*!40000 ALTER TABLE `bank_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `mp_budgets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mp_budgets_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
INSERT INTO `budgets` VALUES (13,10,58,1100000.00,'2023-05-01','2023-05-31','Tiền mua đồ dùng học tập'),(15,10,68,1500000.00,'2023-05-01','2023-05-31','Sinh hoạt hàng ngày'),(16,10,65,1000000.00,'2023-05-01','2023-05-31','Mua quần áo');
/*!40000 ALTER TABLE `budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `created_at` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `updated_at` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_type_idx` (`user_id`,`type`) USING BTREE,
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,10,'Bán xe máy mua xe máy mới','Bán xe máy','#00ffff',1,'2023-04-06 16:43:54','12/04/2023 17:23:25'),(58,10,'ABCDEF','Giáo dục','#7fff00',2,'13/04/2023 16:10:09','13/04/2023 17:10:18'),(61,11,'Đi khắp mọi nơi','Đi du lịch','#ec6349',2,'19/04/2023 23:00:04','20/04/2023 01:12:21'),(62,11,'Tiền lương các tháng','Lấy lương','#6cec49',1,'19/04/2023 23:04:09','19/04/2023 23:04:09'),(65,10,'Mua quần áo mới hàng tháng','Mua quần áo','#e32323',2,'23/04/2023 11:50:12','23/04/2023 11:53:22'),(66,10,'Tụ tập bạn bè cuối tuần','Giải trí','#2330e3',2,'23/04/2023 11:54:25','23/04/2023 11:54:25'),(67,10,'Lương đi làm hàng tháng','Lương','#3fe15f',1,'23/04/2023 11:54:59','23/04/2023 11:54:59'),(68,10,'Tiền ăn uống trang trải hàng ngày','Sinh hoạt phí','#e13faf',2,'23/04/2023 11:55:54','23/04/2023 11:55:54'),(69,10,'Để dành một khoản cho bản thân','Tiết kiệm','#8bace9',1,'23/04/2023 11:57:48','25/04/2023 22:19:54'),(70,10,'việc học','Việc học hành','#FFDB1A',2,'23/05/2023 14:42:43','23/05/2023 14:42:43');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `balance` decimal(20,2) NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `deposit` decimal(20,2) NOT NULL,
  `deadline` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals`
--

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
INSERT INTO `goals` VALUES (62,10,'Để dành cho bố mẹ xây nhà',30020000.00,100000000.00,4000000.00,'2023-11-14',1),(67,10,'Tiết kiệm mua máy tính mới',10000000.00,15000000.00,0.00,'2023-07-06',1);
/*!40000 ALTER TABLE `goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` text,
  `content` text,
  `is_read` tinyint(1) NOT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `card_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `transactiondate` date NOT NULL,
  `type` int NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  KEY `card_id` (`card_id`),
  KEY `type_user_id_transactiondate` (`type`,`user_id`,`transactiondate`) USING BTREE,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_4` FOREIGN KEY (`card_id`) REFERENCES `bank_cards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (230,10,58,10,'Mua sách',300000.00,'Nhà sách Phương Nam','2023-04-25',2,'Mua sách Văn học'),(231,10,3,10,'Bán khung xe',100000.00,'Cửa hàng sửa xe honda','2023-03-23',1,'Bán cái khung xe cũ mua khung xe mới'),(237,10,68,10,'Mua mì ăn sáng',100000.00,'Quận 9','2023-04-18',2,'Mì tôm Hảo Hảo'),(238,10,66,119,'Đi sinh nhật bạn',200000.00,'Quận 9','2023-04-21',2,'Sinh nhật bạn Trưởng'),(240,10,67,10,'Lấy lương',3000000.00,'VNPT Quận 9','2023-04-29',1,'Lương tháng 04'),(241,10,68,120,'Cafe sáng',50000.00,'Trạm cafe','2023-04-25',2,'Đi cafe với Trung'),(242,10,66,120,'test',200000.00,'abc','2023-04-25',2,'test'),(243,10,69,10,'Mẹ gửi tiền',1000000.00,'Quận 9','2023-04-25',1,'Mẹ cho tiền sài'),(245,10,68,10,'Ăn tối',25000.00,'Quán hủ tiếu','2023-04-25',2,'Ăn hủ tiếu với PA'),(246,10,68,10,'Ăn sáng',15000.00,'BCVT','2023-04-25',2,'Ăn sáng'),(247,10,68,10,'Mua hoa',150000.00,'Quận 9','2023-05-10',2,'Mua hoa tặng bạn tốt nghiệp'),(248,10,68,10,'Ăn sáng',20000.00,'Quận 9','2023-04-26',2,'Ăn bánh mì'),(249,10,68,10,'Ăn tối',30000.00,'Quận 9','2023-04-27',2,'Ăn phở bò'),(250,10,68,119,'Đổ xăng',50000.00,'Quận 9','2023-04-27',2,'Đổ xăng 24k/lit'),(251,10,69,10,'Chú Hùng cho',500000.00,'Dĩ An','2023-04-27',1,'Chú Hùng cho tiền đổ xăng'),(252,10,69,10,'Trả nợ',100000.00,'Quận 9','2023-04-27',1,'có người trả nợ'),(253,10,67,10,'Trợ cấp',500000.00,'VNPT','2023-04-27',1,'Công ty cho trợ cấp'),(254,10,69,119,'Làm thêm job ngoài',500000.00,'Quận 9','2023-04-27',1,'Làm thêm job sau giờ hành chính'),(255,10,66,119,'Đi picnic',300000.00,'Dĩ An','2023-04-28',2,'Đi cắm trại 30/04'),(256,10,69,10,'Mẹ gửi',500000.00,'Quận 9','2023-05-08',1,'Mẹ gửi tiền tiêu vặt'),(257,10,58,10,'Mua sách',200000.00,'Quận 9','2023-05-09',2,'Mua sách về IT'),(258,10,67,10,'Làm thêm',300000.00,'Quận 9','2023-05-09',1,'Làm thêm sau giờ học'),(259,10,69,10,'ABC trả nợ',100000.00,'Quận 9','2023-05-11',1,'Nợ từ tháng trước. Đã trả'),(260,10,68,10,'Mua gạo',50000.00,'Quận 9','2023-05-11',2,'Mua gạo 14k/kg'),(263,10,65,10,'mua bỉm tả',64666.00,'Sài Gòn','2023-05-25',2,'Cho con'),(264,10,67,10,'Lấy lương',2000000.00,'Quận 9','2023-05-23',1,'Lương tháng 05'),(265,10,68,10,'Mua xe máy',200000.00,'Quận 9','2023-05-23',2,'Mua xe mới'),(266,10,58,10,'Mua abc',700000.00,'Quận 9','2023-05-23',2,'abc'),(267,10,68,10,'Đóng tiền trọ',1000000.00,'Quận 9','2023-06-01',2,'Đóng tiền trọ tháng 6'),(269,10,69,120,'Tiết kiệm',500000.00,'Quận 9','2023-06-01',1,'Để dành'),(270,10,68,10,'Mua gạo',50000.00,'Quận 9','2023-06-02',2,'Mua gạo ăn'),(271,10,70,120,'Photo tài liệu',30000.00,'PTIT','2023-06-02',2,'Photo tài liệu môn HDV'),(272,10,3,10,'Mẹ cho tiền',500000.00,'Quận 9','2023-06-02',1,'Mẹ cho tiền tiêu vặt'),(274,10,67,10,'Lấy lương',1000000.00,'Quận 9','2023-06-05',1,'Lương');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `account_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`account_id`),
  KEY `id` (`id`),
  CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (8,'Trần','Hữu Thành','03/04/2023 09:00:16','',9),(9,'Trần','Hữu Trưởng','03/04/2023 09:03:09','',10),(10,'Lê','Quốc Thiên','03/04/2023 09:09:32','https://vapa.vn/wp-content/uploads/2022/12/tai-hinh-nen-anime-ngau-001.jpg',11),(11,'Tran','Minh Long','11/04/2023 14:10:27','',15),(17,'Phạm','Phước Hiếu','15/04/2023 11:08:41','',21),(22,'ABC','DEF','15/04/2023 11:22:42','',26);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-26 11:25:47
