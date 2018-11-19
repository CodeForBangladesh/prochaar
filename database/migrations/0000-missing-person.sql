-- +migrate Up

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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `users` (
     `uuid`              varchar(30) NOT NULL,
     `first_name`        text NOT NULL,
     `last_name`         text,
     `profile_picture`   text,
     `primary_address`   text NOT NULL,
     `secondary_address` text,
     `contact_number`    text NOT NULL,
     `email`             text NOT NULL,
     `password`          text NOT NULL,
     `created_at`        datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updated_at`        datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     `deleted_at`        datetime DEFAULT NULL,
     PRIMARY KEY ( `uuid` ),
     KEY `index_on_email` (`email`(30))
) ENGINE=innodb DEFAULT charset=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `reports` (
     `uuid`           varchar(30) NOT NULL,
     `reported_by`    text NOT NULL,
     `name`           text NOT NULL,
     `details`        json NOT NULL,
     `picture_url`    json NOT NULL,
     `last_location`  varchar(30) NOT NULL,
     `missing_since`  datetime NOT NULL,
     `contact_number` text NOT NULL,
     `found`          boolean NOT NULL,
     `created_at`     datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updated_at`     datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     `deleted_at`     datetime DEFAULT NULL,
     PRIMARY KEY (`uuid`)
) ENGINE=innodb DEFAULT charset=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `address` (
     `uuid`            varchar(30) NOT NULL,
     `street_address`  text,
     `thana`           text,
     `district_code`   text,
     `geo_hash`        text,
     `victim_location` boolean NOT NULL,
     `user_ref`        text NOT NULL,
     `created_at`      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updated_at`      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     `deleted_at`      datetime DEFAULT NULL,
     PRIMARY KEY (`uuid`)
) ENGINE=innodb DEFAULT charset=utf8 COLLATE=utf8_unicode_ci;


-- +migrate Down
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `address`;
DROP TABLE IF EXISTS `reports`;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
