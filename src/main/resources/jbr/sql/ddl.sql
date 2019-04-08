CREATE DATABASE IF NOT EXISTS LambdaSpring;
USE LambdaSpring;

DROP TABLE IF EXISTS `LambdaSpring`.`videos`;

CREATE TABLE `videos` (
                          `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                          `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                          `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
                          `Price` double DEFAULT NULL,
                          `File_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                          `User_id` bigint(20) NOT NULL,
                          `Approval` smallint(6) NOT NULL DEFAULT '0',
                          PRIMARY KEY (`id`),
                          KEY `FK_Videos_Users` (`User_id`),
                          CONSTRAINT `FK_Videos_Users` FOREIGN KEY (`User_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `LambdaSpring`.`users`;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
