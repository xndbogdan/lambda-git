CREATE DATABASE IF NOT EXISTS LambdaSpring;
USE LambdaSpring;

DROP TABLE IF EXISTS `LambdaSpring`.`users`;
CREATE TABLE `LambdaSpring`.`users` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(33) NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `phone` INT NULL,
  PRIMARY KEY (`username`));