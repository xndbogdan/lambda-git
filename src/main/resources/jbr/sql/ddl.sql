# ************************************************************
# Sequel Pro SQL dump
# Version 5438
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.15)
# Database: LambdaSpring
# Generation Time: 2019-04-22 21:34:53 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
                              `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
                              `name` text COLLATE utf8mb4_general_ci,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_items`;

CREATE TABLE `order_items` (
                               `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
                               `video_id` bigint(11) unsigned DEFAULT NULL,
                               `price` double DEFAULT NULL,
                               `order_id` bigint(11) unsigned DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `video_id` (`video_id`),
                               KEY `order_id` (`order_id`),
                               CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`),
                               CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
                          `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
                          `user_id` bigint(11) DEFAULT NULL,
                          `date` timestamp NULL DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `user_id` (`user_id`),
                          CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
                         `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                         `password` varchar(33) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
                         `firstname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                         `lastname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
                         `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
                         `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
                         `phone` int(11) DEFAULT NULL,
                         `id` bigint(20) NOT NULL AUTO_INCREMENT,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`username`, `password`, `firstname`, `lastname`, `email`, `address`, `phone`, `id`)
VALUES
('xndbogdan','81ca3418a1a1c5ecf857ecddbc42b564','Mosteanu','Bogdan','aftermathhmusic@gmail.com','Al Pravat Nr. 4, Ap 33',723400149,2);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table videos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `videos`;

CREATE TABLE `videos` (
                          `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                          `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                          `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
                          `Price` double DEFAULT NULL,
                          `File_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                          `User_id` bigint(20) NOT NULL,
                          `Approval` smallint(6) NOT NULL DEFAULT '0',
                          `Category_id` int(11) DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `FK_Videos_Users` (`User_id`),
                          CONSTRAINT `FK_Videos_Users` FOREIGN KEY (`User_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
