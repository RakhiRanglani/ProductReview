-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: heroku_9edc56665c3c516
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `cat_id` int NOT NULL,
  `cat_name` text,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Electronics'),(2,'Computers & Accessories'),(3,'Cables & Accessories'),(4,'Cables & Interconnects'),(5,'Ethernet Cables'),(6,'Computer Cable Adapters'),(7,'Computer Speakers'),(8,'Television & Video'),(9,'DVD Players & Recorders'),(10,'DVD Players');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_products`
--

DROP TABLE IF EXISTS `favorite_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `favorite_products` (
  `user_id` int NOT NULL,
  `asin` text NOT NULL,
  ` favorite_products_pkey` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (` favorite_products_pkey`),
  KEY `favorite_products_user_id_fkey_idx` (`user_id`),
  CONSTRAINT `favorite_products_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_products`
--

LOCK TABLES `favorite_products` WRITE;
/*!40000 ALTER TABLE `favorite_products` DISABLE KEYS */;
INSERT INTO `favorite_products` VALUES (1,'B0007T27FU',9),(1,'B002AR5XIK',10),(1,'B004G7D0EG',11),(2,'B002K3Z3E8',12),(2,'B003SVWCSG',13),(1,'B00000JHWX',14),(2,'B00000JHWX',15);
/*!40000 ALTER TABLE `favorite_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_reviews`
--

DROP TABLE IF EXISTS `favorite_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `favorite_reviews` (
  `user_id` int NOT NULL,
  `review_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`review_id`),
  KEY `favorite_reviews_review_id_fkey_idx` (`review_id`),
  CONSTRAINT `favorite_reviews_review_id_fkey` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`review_id`),
  CONSTRAINT `favorite_reviews_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_reviews`
--

LOCK TABLES `favorite_reviews` WRITE;
/*!40000 ALTER TABLE `favorite_reviews` DISABLE KEYS */;
INSERT INTO `favorite_reviews` VALUES (1,1),(2,1),(2,2),(2,3),(1,4);
/*!40000 ALTER TABLE `favorite_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `asin` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int NOT NULL,
  PRIMARY KEY (`asin`(20),`cat_id`),
  KEY `product_categories_cat_id_fkey_idx` (`cat_id`),
  CONSTRAINT `product_categories_cat_id_fkey` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES ('B00000JHWX',1),('B00001P4XH',2);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `asin` varchar(50) NOT NULL,
  `title` text NOT NULL,
  `description` text,
  `price` double NOT NULL,
  `image` text NOT NULL,
  `scores` json DEFAULT NULL,
  `n_scores` int DEFAULT NULL,
  `pg_score` double DEFAULT NULL,
  `pos_words` json DEFAULT NULL,
  `neg_words` json DEFAULT NULL,
  PRIMARY KEY (`asin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('B00000JHWX','Toshiba SD-3109 DVD Player','Toshiba designed the new SD3109 to be a cornerstone of Audio/Video performance and versatility. \nAn advanced 10 bit 27 MHz high resolution D/A converter delivers superior picture performance. The advanced picture performance of the SD3109 \nis complemented by a built-in Dolby Digital decoder, DTS capability and Spatializer(r) N-2-2 virtual surround sound.',37.99,'http://ecx.images-amazon.com/images/I/61FTEC40BDL._SX300_.gif','{\"score\": \"0, 1, 0, 0, 5\"}',6,3.5625,'{\"nscores\": \"play, just,disc,zoom,sound,picture,use,right,ll,like\"}','{\"pgscore\": \"skip,scene,work,hold,fast,buttons,way,virtually,start,skips\"}'),('B00001P4XH','Koss VC20 Volume Control','The Koss VC-20 volume control can be used with any music player. \nA convenient pocket or belt clip lets you position the VC-20 where it\'s most comfortable for you.',7.55,'http://ecx.images-amazon.com/images/I/41t9Z7uYK%2BL._SY300_.jpg','{\"score\": \"11, 10, 23, 52, 88\"}',184,4.010309278350515,'{\"nscores\": \"computer, clip,audio,recommend,easy,headset,music, length,handy,player\"}','{\"pgscore\": \"useless,sources,options,muffled,limited,garbage,clarity,slider,zune,weak\"}');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL,
  `review` text CHARACTER SET utf8 NOT NULL,
  `asin` varchar(50) CHARACTER SET utf8 NOT NULL,
  `score` int NOT NULL,
  `summary` text CHARACTER SET utf8 NOT NULL,
  `time` timestamp NOT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'I had a 1996 PC that I needed to run.  It booted up and ran the display.  Unfortunately I did not have a 1996 keyboard.  This adapter filled my need.','B00001P4XH',5,'Need to run a very old PC','2011-10-26 23:00:00'),(2,'Perfect if you have an older type keyboard plug and need to use a PS-2 type keyboard with it.','B00000JHWX',5,'Does What\'s Suppose To','2009-05-02 23:00:00'),(3,'Item that arrived was opposite gender from what is pictured, both ends.  In addition, one of the pins was badly bent--something easily fixable, but not in condition to sell.','B00001P4XH',1,'QA needed','2014-05-07 23:00:00'),(4,'Use with an opposed adapter to monitor a server with an old rack mount terminal. Worked as expected. 5 star because you can fined these.','B00000JHWX',5,'Perfect if you need it','2011-01-25 00:00:00');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`(100))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Rakhi','rakhiranglani@yahoo.com','Mumbai@8520'),(2,'Pooja Ranglani','pooja@gmail.com','Mumbai@8520');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-29 18:06:06
