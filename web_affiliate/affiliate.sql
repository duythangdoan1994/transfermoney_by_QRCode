-- MySQL Script generated by MySQL Workbench
-- Wed Aug  9 16:54:18 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema affiliate_plus
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema affiliate_plus
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `affiliate_plus` DEFAULT CHARACTER SET utf8mb4 ;
USE `affiliate_plus` ;

-- -----------------------------------------------------
-- Table `affiliate_plus`.`auth_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`auth_group` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`django_content_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`django_content_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `model` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_76bd3d3b_uniq` (`app_label` ASC, `model` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`auth_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`auth_permission` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `content_type_id` INT(11) NOT NULL,
  `codename` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id` ASC, `codename` ASC),
  CONSTRAINT `auth_permission_ibfk_1`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `affiliate_plus`.`django_content_type` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`auth_group_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`auth_group_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `group_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id` ASC, `permission_id` ASC),
  INDEX `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id` ASC),
  CONSTRAINT `auth_group_permissions_ibfk_1`
    FOREIGN KEY (`group_id`)
    REFERENCES `affiliate_plus`.`auth_group` (`id`),
  CONSTRAINT `auth_group_permissions_ibfk_2`
    FOREIGN KEY (`permission_id`)
    REFERENCES `affiliate_plus`.`auth_permission` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`auth_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`auth_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `last_login` DATETIME(6) NULL DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(150) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `first_name` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `last_name` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `email` VARCHAR(254) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`auth_user_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`auth_user_groups` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `group_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_groups_user_id_94350c0c_uniq` (`user_id` ASC, `group_id` ASC),
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id` ASC),
  CONSTRAINT `auth_user_groups_ibfk_1`
    FOREIGN KEY (`group_id`)
    REFERENCES `affiliate_plus`.`auth_group` (`id`),
  CONSTRAINT `auth_user_groups_ibfk_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `affiliate_plus`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`auth_user_user_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`auth_user_user_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id` ASC, `permission_id` ASC),
  INDEX `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id` ASC),
  CONSTRAINT `auth_user_user_permissions_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `affiliate_plus`.`auth_user` (`id`),
  CONSTRAINT `auth_user_user_permissions_ibfk_2`
    FOREIGN KEY (`permission_id`)
    REFERENCES `affiliate_plus`.`auth_permission` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`authentications_authentications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`authentications_authentications` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `access_token` VARCHAR(256) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `last_updated` DATETIME(6) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `correlation_id` VARCHAR(128) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `authentications_authentications_user_id_75c61a11_fk_auth_user_id` (`user_id` ASC),
  CONSTRAINT `authentications_authentications_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `affiliate_plus`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`django_admin_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`django_admin_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME(6) NOT NULL,
  `object_id` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `action_flag` SMALLINT(5) UNSIGNED NOT NULL,
  `change_message` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `content_type_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id` ASC),
  INDEX `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id` ASC),
  CONSTRAINT `django_admin_log_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `affiliate_plus`.`auth_user` (`id`),
  CONSTRAINT `django_admin_log_ibfk_2`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `affiliate_plus`.`django_content_type` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`django_migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`django_migrations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `name` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `applied` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`django_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`django_session` (
  `session_key` VARCHAR(40) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `session_data` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `expire_date` DATETIME(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_de54fa62` (`expire_date` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_shop` INT(11) NULL DEFAULT NULL,
  `id_broker` INT(11) NULL DEFAULT NULL,
  `id_customer` INT(11) NULL DEFAULT NULL,
  `discount` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `bonus` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `status` INT(11) NULL DEFAULT NULL COMMENT '0: pending\n1: success\n2: cancel',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`transactions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_roles` INT(11) NOT NULL,
  `status` INT(11) NULL DEFAULT NULL COMMENT '0: pending\n1: success\n2: cancel',
  `amount` DECIMAL(15,5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`user` (
  `iduser` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `password` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `Role` INT(11) NOT NULL COMMENT '0: admin\n1: shop\n2: broker\n3: customer',
  `status` INT(11) NOT NULL DEFAULT '0' COMMENT '0: pending\n1: success\n2: cancel',
  `email` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `mobile_phone` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE INDEX `iduser_UNIQUE` (`iduser` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `affiliate_plus`.`wallet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `affiliate_plus`.`wallet` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_user` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `id_wallet` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `token_wallet` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;