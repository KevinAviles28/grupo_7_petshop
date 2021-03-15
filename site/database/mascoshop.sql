-- MySQL Script generated by MySQL Workbench
-- Thu Mar 11 01:08:54 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema testmascoshop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema testmascoshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mascoshop` DEFAULT CHARACTER SET utf8 ;
USE `mascoshop` ;

-- -----------------------------------------------------
-- Table `testmascoshop`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascoshop`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(100) NOT NULL,
  `pais` VARCHAR(45) NULL,
  `localidad` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `category` INT NULL,
  `avatar` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testmascoshop`.`subcategorys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascoshop`.`subcategorys` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testmascoshop`.`categorys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascoshop`.`categorys` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `subcategory_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `subcategory_id_idx` (`subcategory_id` ASC),
  CONSTRAINT `subcategory_id`
    FOREIGN KEY (`subcategory_id`)
    REFERENCES `mascoshop`.`subcategorys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testmascoshop`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascoshop`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testmascoshop`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascoshop`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category_id` INT NULL,
  `name` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `stock` INT NOT NULL,
  `discount` INT NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `image_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `category_id_idx` (`category_id` ASC),
  INDEX `image_id_idx` (`image_id` ASC),
  CONSTRAINT `category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `mascoshop`.`categorys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `image_id`
    FOREIGN KEY (`image_id`)
    REFERENCES `mascoshop`.`images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testmascoshop`.`purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascoshop`.`purchases` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NULL,
  `cliente_id` INT NULL,
  `fecha` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `product_id_idx` (`product_id` ASC),
  INDEX `cliente_id_idx` (`cliente_id` ASC),
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `mascoshop`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cliente_id`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `mascoshop`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testmascoshop`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascoshop`.`cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `prod_id` INT NULL,
  `user_id` INT NULL,
  `cantidad` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `prod_id_idx` (`prod_id` ASC),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `prod_id`
    FOREIGN KEY (`prod_id`)
    REFERENCES `mascoshop`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mascoshop`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
