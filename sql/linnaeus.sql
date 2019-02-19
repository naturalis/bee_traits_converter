# ************************************************************
# Sequel Pro SQL dump
# Version 5425
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.38)
# Database: linnaeus_ng_bees
# Generation Time: 2018-12-05 14:40:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table activity_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activity_log`;

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `controller` varchar(64) NOT NULL,
  `view` varchar(64) NOT NULL,
  `data_before` text,
  `data_after` text,
  `note` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`user`),
  FULLTEXT KEY `fulltext` (`controller`,`data_before`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;

INSERT INTO `activity_log` (`id`, `project_id`, `user_id`, `user`, `controller`, `view`, `data_before`, `data_after`, `note`, `created`, `last_change`)
VALUES
	(1,1,1,'sys admin (sysadmin - sys@admin.com)','projects','data','a:13:{s:2:\"id\";s:1:\"1\";s:8:\"sys_name\";s:21:\"Project internal name\";s:15:\"sys_description\";s:19:\"Project description\";s:10:\"short_name\";N;s:5:\"title\";s:21:\"Project visible title\";s:7:\"css_url\";N;s:16:\"includes_hybrids\";s:1:\"0\";s:8:\"keywords\";N;s:11:\"description\";N;s:5:\"group\";N;s:9:\"published\";s:1:\"1\";s:7:\"created\";s:19:\"2018-12-05 13:49:33\";s:11:\"last_change\";s:19:\"2018-12-05 14:49:33\";}','a:13:{s:2:\"id\";s:1:\"1\";s:8:\"sys_name\";s:21:\"Project internal name\";s:15:\"sys_description\";s:19:\"Project description\";s:10:\"short_name\";N;s:5:\"title\";s:10:\"Bee Traits\";s:7:\"css_url\";N;s:16:\"includes_hybrids\";s:1:\"0\";s:8:\"keywords\";N;s:11:\"description\";N;s:5:\"group\";N;s:9:\"published\";s:1:\"1\";s:7:\"created\";s:19:\"2018-12-05 13:49:33\";s:11:\"last_change\";s:19:\"2018-12-05 14:49:33\";}','Saved project','2018-12-05 15:03:06','2018-12-05 14:03:06'),
	(2,1,1,'sys admin (sysadmin - sys@admin.com)','projects','data','a:13:{s:2:\"id\";s:1:\"1\";s:8:\"sys_name\";s:21:\"Project internal name\";s:15:\"sys_description\";s:19:\"Project description\";s:10:\"short_name\";N;s:5:\"title\";s:10:\"Bee Traits\";s:7:\"css_url\";N;s:16:\"includes_hybrids\";s:1:\"0\";s:8:\"keywords\";N;s:11:\"description\";N;s:5:\"group\";N;s:9:\"published\";s:1:\"1\";s:7:\"created\";s:19:\"2018-12-05 13:49:33\";s:11:\"last_change\";s:19:\"2018-12-05 14:49:33\";}','a:13:{s:2:\"id\";s:1:\"1\";s:8:\"sys_name\";s:10:\"Bee Traits\";s:15:\"sys_description\";s:19:\"Project description\";s:10:\"short_name\";N;s:5:\"title\";s:10:\"Bee Traits\";s:7:\"css_url\";N;s:16:\"includes_hybrids\";s:1:\"0\";s:8:\"keywords\";N;s:11:\"description\";N;s:5:\"group\";N;s:9:\"published\";s:1:\"1\";s:7:\"created\";s:19:\"2018-12-05 13:49:33\";s:11:\"last_change\";s:19:\"2018-12-05 14:49:33\";}','Saved project','2018-12-05 15:03:15','2018-12-05 14:03:15'),
	(3,1,1,'sys admin (sysadmin - sys@admin.com)','projects','ajax_interface',NULL,'a:4:{s:2:\"id\";N;s:9:\"module_id\";s:2:\"15\";s:6:\"active\";s:1:\"y\";s:10:\"project_id\";s:1:\"1\";}','Active module','2018-12-05 15:20:50','2018-12-05 14:20:50'),
	(4,1,1,'sys admin (sysadmin - sys@admin.com)','projects','ajax_interface',NULL,'a:4:{s:2:\"id\";N;s:9:\"module_id\";s:2:\"16\";s:6:\"active\";s:1:\"y\";s:10:\"project_id\";s:1:\"1\";}','Active module','2018-12-05 15:20:52','2018-12-05 14:20:52'),
	(5,1,1,'sys admin (sysadmin - sys@admin.com)','projects','ajax_interface',NULL,'a:4:{s:2:\"id\";N;s:9:\"module_id\";s:2:\"11\";s:6:\"active\";s:1:\"y\";s:10:\"project_id\";s:1:\"1\";}','Active module','2018-12-05 15:20:54','2018-12-05 14:20:54'),
	(6,1,1,'sys admin (sysadmin - sys@admin.com)','projects','ajax_interface',NULL,'a:4:{s:2:\"id\";N;s:9:\"module_id\";s:1:\"5\";s:6:\"active\";s:1:\"y\";s:10:\"project_id\";s:1:\"1\";}','Active module','2018-12-05 15:20:55','2018-12-05 14:20:55'),
	(7,1,1,'sys admin (sysadmin - sys@admin.com)','projects','ajax_interface',NULL,'a:4:{s:2:\"id\";N;s:9:\"module_id\";s:1:\"4\";s:6:\"active\";s:1:\"y\";s:10:\"project_id\";s:1:\"1\";}','Active module','2018-12-05 15:21:02','2018-12-05 14:21:02'),
	(8,1,1,'sys admin (sysadmin - sys@admin.com)','projects','ajax_interface',NULL,'a:4:{s:2:\"id\";N;s:9:\"module_id\";s:2:\"13\";s:6:\"active\";s:1:\"y\";s:10:\"project_id\";s:1:\"1\";}','Active module','2018-12-05 15:21:08','2018-12-05 14:21:08'),
	(9,1,1,'sys admin (sysadmin - sys@admin.com)','nsr','ranks',NULL,'a:1:{i:0;a:8:{s:2:\"id\";s:1:\"1\";s:10:\"project_id\";s:1:\"1\";s:7:\"rank_id\";s:1:\"1\";s:9:\"parent_id\";N;s:11:\"lower_taxon\";s:1:\"0\";s:16:\"keypath_endpoint\";s:1:\"0\";s:7:\"created\";s:19:\"2018-12-05 15:22:54\";s:11:\"last_change\";s:19:\"2018-12-05 15:22:54\";}}','Updated project ranks','2018-12-05 15:22:54','2018-12-05 14:22:54'),
	(10,1,1,'sys admin (sysadmin - sys@admin.com)','nsr','ranks',NULL,'a:1:{i:0;a:8:{s:2:\"id\";s:1:\"2\";s:10:\"project_id\";s:1:\"1\";s:7:\"rank_id\";s:2:\"56\";s:9:\"parent_id\";s:1:\"1\";s:11:\"lower_taxon\";s:1:\"0\";s:16:\"keypath_endpoint\";s:1:\"0\";s:7:\"created\";s:19:\"2018-12-05 15:22:54\";s:11:\"last_change\";s:19:\"2018-12-05 15:22:54\";}}','Updated project ranks','2018-12-05 15:22:54','2018-12-05 14:22:54'),
	(11,1,1,'sys admin (sysadmin - sys@admin.com)','nsr','ranks',NULL,'a:1:{i:0;a:8:{s:2:\"id\";s:1:\"3\";s:10:\"project_id\";s:1:\"1\";s:7:\"rank_id\";s:2:\"57\";s:9:\"parent_id\";s:1:\"2\";s:11:\"lower_taxon\";s:1:\"0\";s:16:\"keypath_endpoint\";s:1:\"0\";s:7:\"created\";s:19:\"2018-12-05 15:22:54\";s:11:\"last_change\";s:19:\"2018-12-05 15:22:54\";}}','Updated project ranks','2018-12-05 15:22:54','2018-12-05 14:22:54'),
	(12,1,1,'sys admin (sysadmin - sys@admin.com)','nsr','ranks',NULL,'a:1:{i:0;a:8:{s:2:\"id\";s:1:\"4\";s:10:\"project_id\";s:1:\"1\";s:7:\"rank_id\";s:2:\"63\";s:9:\"parent_id\";s:1:\"3\";s:11:\"lower_taxon\";s:1:\"0\";s:16:\"keypath_endpoint\";s:1:\"0\";s:7:\"created\";s:19:\"2018-12-05 15:22:54\";s:11:\"last_change\";s:19:\"2018-12-05 15:22:54\";}}','Updated project ranks','2018-12-05 15:22:54','2018-12-05 14:22:54'),
	(13,1,1,'sys admin (sysadmin - sys@admin.com)','nsr','ranks',NULL,'a:1:{i:0;a:8:{s:2:\"id\";s:1:\"5\";s:10:\"project_id\";s:1:\"1\";s:7:\"rank_id\";s:2:\"65\";s:9:\"parent_id\";s:1:\"4\";s:11:\"lower_taxon\";s:1:\"0\";s:16:\"keypath_endpoint\";s:1:\"0\";s:7:\"created\";s:19:\"2018-12-05 15:22:54\";s:11:\"last_change\";s:19:\"2018-12-05 15:22:54\";}}','Updated project ranks','2018-12-05 15:22:54','2018-12-05 14:22:54'),
	(14,1,1,'sys admin (sysadmin - sys@admin.com)','nsr','ranks',NULL,'a:1:{i:0;a:8:{s:2:\"id\";s:1:\"6\";s:10:\"project_id\";s:1:\"1\";s:7:\"rank_id\";s:2:\"75\";s:9:\"parent_id\";s:1:\"5\";s:11:\"lower_taxon\";s:1:\"1\";s:16:\"keypath_endpoint\";s:1:\"0\";s:7:\"created\";s:19:\"2018-12-05 15:22:54\";s:11:\"last_change\";s:19:\"2018-12-05 15:22:54\";}}','Updated project ranks','2018-12-05 15:22:54','2018-12-05 14:22:54'),
	(15,1,1,'sys admin (sysadmin - sys@admin.com)','nsr','taxon_new',NULL,'a:3:{s:2:\"id\";i:1;s:5:\"taxon\";s:6:\"Apidae\";s:7:\"rank_id\";s:1:\"2\";}','new concept Apidae (first taxon)','2018-12-05 15:39:27','2018-12-05 14:39:27'),
	(16,1,1,'sys admin (sysadmin - sys@admin.com)','nsr','taxon_new',NULL,'s:28:\"tn.nlsr.concept/0LRD2QVY8SPH\";','created NSR ID tn.nlsr.concept/0LRD2QVY8SPH','2018-12-05 15:39:27','2018-12-05 14:39:27'),
	(17,1,1,'sys admin (sysadmin - sys@admin.com)','nsr','taxon_new','a:18:{s:2:\"id\";s:1:\"1\";s:5:\"taxon\";s:6:\"Apidae\";s:6:\"author\";N;s:9:\"parent_id\";N;s:7:\"rank_id\";s:1:\"2\";s:11:\"taxon_order\";N;s:9:\"is_hybrid\";s:1:\"0\";s:10:\"list_level\";s:1:\"0\";s:9:\"base_rank\";s:2:\"56\";s:12:\"base_rank_id\";s:2:\"56\";s:11:\"lower_taxon\";s:1:\"0\";s:5:\"nomen\";s:0:\"\";s:4:\"rank\";s:7:\"familia\";s:14:\"taxon_no_infix\";s:6:\"Apidae\";s:6:\"nsr_id\";s:11:\"LRD2QVY8SPH\";s:6:\"parent\";N;s:10:\"is_deleted\";b:0;s:8:\"presence\";a:18:{s:11:\"presence_id\";N;s:13:\"presence82_id\";N;s:12:\"reference_id\";N;s:14:\"presence_label\";N;s:20:\"presence_information\";N;s:26:\"presence_information_title\";N;s:20:\"presence_index_label\";N;s:16:\"presence82_label\";N;s:10:\"habitat_id\";N;s:13:\"habitat_label\";N;s:9:\"expert_id\";N;s:15:\"organisation_id\";N;s:11:\"expert_name\";N;s:17:\"organisation_name\";N;s:15:\"reference_label\";N;s:16:\"reference_author\";N;s:14:\"reference_date\";N;s:29:\"presence_information_one_line\";s:0:\"\";}}','a:1:{s:8:\"presence\";a:1:{s:29:\"presence_information_one_line\";s:0:\"\";}}','updated concept Apidae','2018-12-05 15:39:27','2018-12-05 14:39:27'),
	(18,1,1,'sys admin (sysadmin - sys@admin.com)','nsr','taxon_new',NULL,'s:25:\"tn.nlsr.name/0INVWVJ8AUYE\";','created NSR ID tn.nlsr.name/0INVWVJ8AUYE','2018-12-05 15:39:27','2018-12-05 14:39:27'),
	(19,1,1,'sys admin (sysadmin - sys@admin.com)','nsr','taxon_new',NULL,'a:27:{s:2:\"id\";s:1:\"1\";s:8:\"taxon_id\";s:1:\"1\";s:4:\"name\";s:6:\"Apidae\";s:9:\"uninomial\";s:6:\"Apidae\";s:16:\"specific_epithet\";N;s:22:\"infra_specific_epithet\";N;s:10:\"authorship\";N;s:11:\"name_author\";N;s:15:\"authorship_year\";N;s:9:\"reference\";N;s:12:\"reference_id\";N;s:20:\"synonym_base_rank_id\";N;s:14:\"reference_name\";N;s:6:\"expert\";N;s:9:\"expert_id\";N;s:11:\"expert_name\";N;s:12:\"organisation\";N;s:15:\"organisation_id\";N;s:17:\"organisation_name\";N;s:7:\"type_id\";s:1:\"1\";s:7:\"rank_id\";N;s:8:\"nametype\";s:13:\"isValidNameOf\";s:11:\"language_id\";s:3:\"123\";s:8:\"language\";s:10:\"Scientific\";s:14:\"language_label\";N;s:6:\"nsr_id\";s:12:\"0INVWVJ8AUYE\";s:8:\"addition\";N;}','new name Apidae','2018-12-05 15:39:27','2018-12-05 14:39:27');

/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table actors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `actors`;

CREATE TABLE `actors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_alt` varchar(255) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `gender` enum('m','f') DEFAULT NULL,
  `is_company` tinyint(1) NOT NULL DEFAULT '0',
  `employee_of_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table actors_addresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `actors_addresses`;

CREATE TABLE `actors_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `address_label` varchar(255) NOT NULL,
  `address` varchar(2000) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table actors_taxa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `actors_taxa`;

CREATE TABLE `actors_taxa` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`taxon_id`,`actor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table beelduitwisselaar_batches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `beelduitwisselaar_batches`;

CREATE TABLE `beelduitwisselaar_batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_identifier` varchar(32) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `number_in_feed` int(5) NOT NULL DEFAULT '0',
  `number_downloaded` int(5) NOT NULL DEFAULT '0',
  `number_moved` int(5) NOT NULL DEFAULT '0',
  `number_saved` int(5) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table characteristics
# ------------------------------------------------------------

DROP TABLE IF EXISTS `characteristics`;

CREATE TABLE `characteristics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `sys_name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table characteristics_chargroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `characteristics_chargroups`;

CREATE TABLE `characteristics_chargroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `characteristic_id` int(11) NOT NULL,
  `chargroup_id` int(11) NOT NULL,
  `show_order` tinyint(4) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table characteristics_labels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `characteristics_labels`;

CREATE TABLE `characteristics_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `characteristic_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `label` text NOT NULL,
  `additional` text,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`characteristic_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table characteristics_labels_states
# ------------------------------------------------------------

DROP TABLE IF EXISTS `characteristics_labels_states`;

CREATE TABLE `characteristics_labels_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `label` text NOT NULL,
  `text` text,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`state_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table characteristics_matrices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `characteristics_matrices`;

CREATE TABLE `characteristics_matrices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `matrix_id` int(11) NOT NULL,
  `characteristic_id` int(11) NOT NULL,
  `show_order` smallint(6) NOT NULL DEFAULT '-1',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`matrix_id`,`characteristic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table characteristics_states
# ------------------------------------------------------------

DROP TABLE IF EXISTS `characteristics_states`;

CREATE TABLE `characteristics_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `characteristic_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_dimensions` varchar(16) DEFAULT NULL,
  `lower` float(23,3) DEFAULT NULL,
  `upper` float(23,3) DEFAULT NULL,
  `mean` float(23,3) DEFAULT NULL,
  `sd` float(23,3) DEFAULT NULL,
  `sys_name` varchar(255) NOT NULL,
  `show_order` tinyint(4) NOT NULL DEFAULT '-1',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`characteristic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table chargroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `chargroups`;

CREATE TABLE `chargroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `matrix_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `show_order` tinyint(4) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table chargroups_labels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `chargroups_labels`;

CREATE TABLE `chargroups_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `chargroup_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table choices_content_keysteps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `choices_content_keysteps`;

CREATE TABLE `choices_content_keysteps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `choice_txt` text,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`choice_id`,`language_id`),
  FULLTEXT KEY `fulltext` (`choice_txt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table choices_keysteps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `choices_keysteps`;

CREATE TABLE `choices_keysteps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `keystep_id` int(11) DEFAULT NULL,
  `show_order` int(2) DEFAULT NULL,
  `choice_img` varchar(255) DEFAULT NULL,
  `choice_image_params` varchar(255) DEFAULT NULL,
  `res_keystep_id` int(11) DEFAULT NULL,
  `res_taxon_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`keystep_id`),
  KEY `project_id_2` (`project_id`,`res_taxon_id`),
  KEY `project_id_3` (`project_id`,`res_keystep_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table commonnames
# ------------------------------------------------------------

DROP TABLE IF EXISTS `commonnames`;

CREATE TABLE `commonnames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `commonname` varchar(64) DEFAULT NULL,
  `transliteration` varchar(64) DEFAULT NULL,
  `show_order` int(4) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`taxon_id`),
  KEY `taxon_id` (`taxon_id`),
  KEY `project_id_2` (`project_id`,`taxon_id`,`language_id`),
  KEY `project_id_3` (`project_id`,`taxon_id`,`language_id`),
  FULLTEXT KEY `fulltext` (`commonname`,`transliteration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `subject` varchar(32) NOT NULL,
  `content` text,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`language_id`),
  FULLTEXT KEY `fulltext` (`subject`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table content_free_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_free_modules`;

CREATE TABLE `content_free_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `content` text,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`language_id`),
  KEY `project_id_2` (`project_id`,`module_id`,`page_id`,`language_id`),
  FULLTEXT KEY `fulltext` (`topic`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table content_introduction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_introduction`;

CREATE TABLE `content_introduction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `content` text,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`language_id`),
  KEY `project_id_2` (`project_id`,`page_id`,`language_id`),
  FULLTEXT KEY `fulltext` (`topic`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table content_keysteps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_keysteps`;

CREATE TABLE `content_keysteps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `keystep_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `content` text,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`keystep_id`,`language_id`),
  FULLTEXT KEY `fulltext` (`title`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table content_taxa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_taxa`;

CREATE TABLE `content_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `content` longtext,
  `title` varchar(64) DEFAULT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`taxon_id`,`language_id`,`page_id`),
  KEY `project_id_2` (`project_id`,`publish`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table diversity_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `diversity_index`;

CREATE TABLE `diversity_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `type_id` int(10) NOT NULL,
  `boundary` geometrycollection NOT NULL,
  `boundary_nodes` text NOT NULL,
  `score` tinyint(4) NOT NULL,
  `encoded_json` text NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table diversity_index_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `diversity_index_old`;

CREATE TABLE `diversity_index_old` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `type_id` int(10) NOT NULL,
  `boundary` geometrycollection NOT NULL,
  `boundary_nodes` text NOT NULL,
  `score` tinyint(4) NOT NULL,
  `encoded_json` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table dna_barcodes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dna_barcodes`;

CREATE TABLE `dna_barcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `taxon_literal` varchar(255) NOT NULL,
  `taxon_nsr_id` varchar(24) DEFAULT NULL,
  `barcode` varchar(32) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `date_literal` varchar(32) DEFAULT NULL,
  `specialist` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`taxon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table external_ids
# ------------------------------------------------------------

DROP TABLE IF EXISTS `external_ids`;

CREATE TABLE `external_ids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `external_id` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`taxon_id`),
  KEY `project_id_2` (`project_id`,`external_id`),
  KEY `project_id_3` (`project_id`,`taxon_id`,`external_id`),
  KEY `project_id_4` (`project_id`,`taxon_id`,`org_id`,`external_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table external_orgs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `external_orgs`;

CREATE TABLE `external_orgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `organisation_url` varchar(255) DEFAULT NULL,
  `general_url` varchar(255) DEFAULT NULL,
  `service_url` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table free_module_media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `free_module_media`;

CREATE TABLE `free_module_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `file_name` varchar(128) NOT NULL,
  `thumb_name` varchar(128) DEFAULT NULL,
  `original_name` varchar(128) NOT NULL,
  `mime_type` varchar(32) NOT NULL,
  `file_size` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table free_modules_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `free_modules_pages`;

CREATE TABLE `free_modules_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `got_content` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `show_order` mediumint(9) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `project_id_2` (`project_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table free_modules_projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `free_modules_projects`;

CREATE TABLE `free_modules_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL,
  `description` text,
  `show_order` tinyint(2) NOT NULL DEFAULT '0',
  `show_alpha` tinyint(1) NOT NULL DEFAULT '0',
  `active` enum('y','n') NOT NULL DEFAULT 'y',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table geodata_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `geodata_types`;

CREATE TABLE `geodata_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `colour` varchar(6) DEFAULT NULL,
  `type` enum('marker','polygon','both') DEFAULT 'both',
  `show_order` smallint(2) NOT NULL DEFAULT '99',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table geodata_types_titles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `geodata_types_titles`;

CREATE TABLE `geodata_types_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`type_id`,`language_id`),
  FULLTEXT KEY `fulltext` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table glossary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `glossary`;

CREATE TABLE `glossary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `term` varchar(255) NOT NULL,
  `definition` text NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`language_id`),
  KEY `idx_glossary1` (`project_id`,`language_id`),
  FULLTEXT KEY `fulltext` (`term`,`definition`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table glossary_media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `glossary_media`;

CREATE TABLE `glossary_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `glossary_id` int(11) NOT NULL,
  `file_name` varchar(128) NOT NULL,
  `thumb_name` varchar(128) DEFAULT NULL,
  `original_name` varchar(128) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `mime_type` varchar(32) NOT NULL,
  `file_size` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`glossary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table glossary_media_captions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `glossary_media_captions`;

CREATE TABLE `glossary_media_captions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`media_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table glossary_synonyms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `glossary_synonyms`;

CREATE TABLE `glossary_synonyms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `glossary_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `synonym` varchar(255) NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`glossary_id`),
  KEY `idx_glossary_synonym1` (`project_id`,`glossary_id`),
  FULLTEXT KEY `fulltext` (`synonym`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table gui_menu_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gui_menu_order`;

CREATE TABLE `gui_menu_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `matrix_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `ref_type` enum('char','group') NOT NULL,
  `show_order` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`matrix_id`),
  KEY `project_id_2` (`project_id`,`matrix_id`,`ref_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table habitat_labels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `habitat_labels`;

CREATE TABLE `habitat_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `habitat_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`project_id`,`habitat_id`,`language_id`),
  KEY `project_id` (`project_id`,`label`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `habitat_labels` WRITE;
/*!40000 ALTER TABLE `habitat_labels` DISABLE KEYS */;

INSERT INTO `habitat_labels` (`id`, `project_id`, `habitat_id`, `language_id`, `label`, `created`, `last_change`)
VALUES
	(1,1,1,24,'land','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(2,1,2,24,'land marien','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(3,1,3,24,'land zoet','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(4,1,4,24,'marien','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(5,1,5,24,'zoet','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(7,1,8,24,'brak','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(8,1,7,24,'marien zoet','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(9,1,9,24,'brak land','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(10,1,10,24,'brak marien','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(11,1,11,24,'brak zoet','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(12,1,12,24,'brak marien zoet','2018-12-05 13:49:24','2018-12-05 13:49:24');

/*!40000 ALTER TABLE `habitat_labels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table habitats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `habitats`;

CREATE TABLE `habitats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `sys_label` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `habitats` WRITE;
/*!40000 ALTER TABLE `habitats` DISABLE KEYS */;

INSERT INTO `habitats` (`id`, `project_id`, `sys_label`, `created`, `last_change`)
VALUES
	(1,1,'land','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(2,1,'land marien','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(3,1,'land zoet','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(4,1,'marien','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(5,1,'zoet','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(7,1,'marien zoet','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(8,1,'brak','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(9,1,'brak land','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(10,1,'brak marien','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(11,1,'brak zoet','2018-12-05 13:49:24','2018-12-05 13:49:24'),
	(12,1,'brak marien zoet','2018-12-05 13:49:24','2018-12-05 13:49:24');

/*!40000 ALTER TABLE `habitats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hotwords
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hotwords`;

CREATE TABLE `hotwords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `hotword` varchar(255) NOT NULL,
  `controller` varchar(32) NOT NULL,
  `view` varchar(32) NOT NULL,
  `params` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id_3` (`project_id`,`hotword`,`language_id`),
  KEY `project_id_2` (`project_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table hybrids
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hybrids`;

CREATE TABLE `hybrids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hybrid` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hybrid` (`hybrid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table interface_texts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `interface_texts`;

CREATE TABLE `interface_texts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `env` varchar(8) NOT NULL DEFAULT 'app',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `text` (`text`(255),`env`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `interface_texts` WRITE;
/*!40000 ALTER TABLE `interface_texts` DISABLE KEYS */;

INSERT INTO `interface_texts` (`id`, `text`, `env`, `created`)
VALUES
	(1,X'53656C65637420612070726F6A65637420746F20776F726B206F6E','admin','2018-12-05 13:49:24'),
	(2,X'50726F6A65637473','admin','2018-12-05 13:49:24'),
	(3,X'57656C636F6D65206261636B2C2025732E','admin','2018-12-05 13:49:24'),
	(4,X'4C6F6767656420696E206173','admin','2018-12-05 13:49:24'),
	(5,X'4C6F67206F7574','admin','2018-12-05 13:49:24'),
	(6,X'53656C65637420612070726F6A65637420746F20776F726B206F6E3A','admin','2018-12-05 13:49:24'),
	(7,X'53797374656D2061646D696E697374726174696F6E207461736B733A','admin','2018-12-05 13:49:24'),
	(8,X'43726561746520612070726F6A656374','admin','2018-12-05 13:49:24'),
	(9,X'44656C65746520612070726F6A656374','admin','2018-12-05 13:49:24'),
	(10,X'496D706F7274204C696E6E6165757320322064617461','admin','2018-12-05 13:49:24'),
	(11,X'436F6C6C61626F7261746F72206F76657276696577','admin','2018-12-05 13:49:24'),
	(12,X'526967687473206D6174726978','admin','2018-12-05 13:49:24'),
	(13,X'496E74657266616365','admin','2018-12-05 13:49:24'),
	(14,X'4C6F676F7574','admin','2018-12-05 13:49:24'),
	(15,X'4C6F67696E','admin','2018-12-05 13:49:24'),
	(16,X'4C6F6720696E20746F2061646D696E697374657220796F7572204C696E6E616575732070726F6A656374','admin','2018-12-05 13:49:24'),
	(17,X'596F757220757365726E616D653A','admin','2018-12-05 13:49:24'),
	(18,X'6F75722070617373776F72643A','admin','2018-12-05 13:49:24'),
	(19,X'52656D656D626572206D65','admin','2018-12-05 13:49:24'),
	(20,X'556E61626C6520746F206C6F6720696E3F2057686174206973207468652070726F626C656D20796F752061726520657870657269656E63696E673F','admin','2018-12-05 13:49:24'),
	(21,X'4920666F72676F74206D792070617373776F726420616E642F6F7220757365726E616D653A2025737265736574206D792070617373776F726425732E','admin','2018-12-05 13:49:24'),
	(22,X'4D792070617373776F726420646F65736E277420776F726B206F72206D79206163636F756E74206D61792068617665206265656E20636F6D70726F6D697365643A20706C65617365202573636F6E74616374207468652068656C706465736B25732E','admin','2018-12-05 13:49:24'),
	(23,X'4261636B20746F204C696E6E61657573204E4720726F6F74','admin','2018-12-05 13:49:24'),
	(24,X'496E74726F64756374696F6E','app','2018-12-05 13:49:24'),
	(25,X'476C6F7373617279','app','2018-12-05 13:49:24'),
	(26,X'4C697465726174757265','app','2018-12-05 13:49:24'),
	(27,X'53706563696573','app','2018-12-05 13:49:24'),
	(28,X'4869676865722074617861','app','2018-12-05 13:49:24'),
	(29,X'446963686F746F6D6F7573206B6579','app','2018-12-05 13:49:24'),
	(30,X'4D6174726978206B6579','app','2018-12-05 13:49:24'),
	(31,X'446973747269627574696F6E','app','2018-12-05 13:49:24'),
	(32,X'4164646974696F6E616C207465787473','app','2018-12-05 13:49:24'),
	(33,X'496E646578','app','2018-12-05 13:49:24'),
	(34,X'536561726368','app','2018-12-05 13:49:24'),
	(35,X'70726F6A65637473','app','2018-12-05 13:49:24'),
	(36,X'6C6F67696E','app','2018-12-05 13:49:24'),
	(37,X'68656C70','app','2018-12-05 13:49:24'),
	(38,X'6E6F742079657420617661696C61626C65','app','2018-12-05 13:49:24'),
	(39,X'636F6E74616374','app','2018-12-05 13:49:24'),
	(41,X'57656C636F6D65','app','2018-12-05 13:49:24'),
	(42,X'436F6E7472696275746F7273','app','2018-12-05 13:49:24'),
	(43,X'41626F757420455449','app','2018-12-05 13:49:24'),
	(44,X'5365617263682E2E2E','app','2018-12-05 13:49:24'),
	(45,X'4C6F6164696E67206170706C69636174696F6E','app','2018-12-05 13:49:24'),
	(46,X'436F6E74656E7473','app','2018-12-05 13:49:24'),
	(47,X'4261636B','app','2018-12-05 13:49:24'),
	(48,X'4261636B20746F20','app','2018-12-05 13:49:24'),
	(49,X'50726576696F7573','app','2018-12-05 13:49:24'),
	(50,X'4E657874','app','2018-12-05 13:49:24'),
	(52,X'496E6465783A205370656369657320616E64206C6F7765722074617861','app','2018-12-05 13:49:24'),
	(53,X'5370656369657320616E64206C6F7765722074617861','app','2018-12-05 13:49:24'),
	(54,X'436F6D6D6F6E206E616D6573','app','2018-12-05 13:49:24'),
	(55,X'496E6465783A204869676865722074617861','app','2018-12-05 13:49:24'),
	(56,X'496E6465783A20436F6D6D6F6E206E616D6573','app','2018-12-05 13:49:24'),
	(57,X'4C616E67756167653A','app','2018-12-05 13:49:24'),
	(58,X'53686F7720616C6C','app','2018-12-05 13:49:24'),
	(59,X'476C6F73736172793A2022257322','app','2018-12-05 13:49:24'),
	(60,X'53796E6F6E796D','app','2018-12-05 13:49:24'),
	(61,X'666F72','app','2018-12-05 13:49:24'),
	(62,X'4C6974657261747572653A2022257322','app','2018-12-05 13:49:24'),
	(63,X'53706563696573206D6F64756C6520696E646578','app','2018-12-05 13:49:24'),
	(64,X'4D65646961','app','2018-12-05 13:49:24'),
	(65,X'436C617373696669636174696F6E','app','2018-12-05 13:49:24'),
	(66,X'4E616D6573','app','2018-12-05 13:49:24'),
	(67,X'53706563696573206D6F64756C653A20222573222028257329','app','2018-12-05 13:49:24'),
	(68,X'486967686572207461786120696E646578','app','2018-12-05 13:49:24'),
	(69,X'48696768657220746178613A20222573222028257329','app','2018-12-05 13:49:24'),
	(70,X'446963686F746F6D6F7573206B65793A20737465702025733A2022257322','app','2018-12-05 13:49:24'),
	(71,X'53746570','app','2018-12-05 13:49:24'),
	(72,X'52656D61696E696E67','app','2018-12-05 13:49:24'),
	(73,X'4578636C75646564','app','2018-12-05 13:49:24'),
	(74,X'257320706F737369626C652025732072656D61696E696E673A','app','2018-12-05 13:49:24'),
	(75,X'2573202573206578636C756465643A','app','2018-12-05 13:49:24'),
	(76,X'4E6F2063686F69636573206D61646520796574','app','2018-12-05 13:49:24'),
	(77,X'4669727374','app','2018-12-05 13:49:24'),
	(78,X'4465636973696F6E2070617468','app','2018-12-05 13:49:24'),
	(79,X'52657475726E20746F2066697273742073746570','app','2018-12-05 13:49:24'),
	(80,X'52657475726E20746F2073746570','app','2018-12-05 13:49:24'),
	(81,X'4D617472697820222573223A206964656E74696679','app','2018-12-05 13:49:24'),
	(82,X'4964656E74696679','app','2018-12-05 13:49:24'),
	(83,X'4578616D696E65','app','2018-12-05 13:49:24'),
	(84,X'436F6D70617265','app','2018-12-05 13:49:24'),
	(85,X'4D61747269783A','app','2018-12-05 13:49:24'),
	(86,X'43686172616374657273','app','2018-12-05 13:49:24'),
	(87,X'536F7274','app','2018-12-05 13:49:24'),
	(88,X'537461746573','app','2018-12-05 13:49:24'),
	(89,X'416464','app','2018-12-05 13:49:24'),
	(90,X'44656C657465','app','2018-12-05 13:49:24'),
	(91,X'436C65617220616C6C','app','2018-12-05 13:49:24'),
	(92,X'536561726368202667743B2667743B','app','2018-12-05 13:49:24'),
	(93,X'53656C656374656420636F6D62696E6174696F6E206F662063686172616374657273','app','2018-12-05 13:49:24'),
	(94,X'547265617420756E6B6E6F776E73206173206D617463686573','app','2018-12-05 13:49:24'),
	(95,X'526573756C74206F66207468697320636F6D62696E6174696F6E206F662063686172616374657273','app','2018-12-05 13:49:24'),
	(96,X'4D617472697820222573223A206578616D696E65','app','2018-12-05 13:49:24'),
	(97,X'53656C6563742061207461786F6E','app','2018-12-05 13:49:24'),
	(98,X'53656C6563742061207461786F6E2066726F6D20746865206C69737420746F2076696577206368617261637465727320616E642063686172616374657220737461746573206F662074686973207461786F6E2E','app','2018-12-05 13:49:24'),
	(99,X'546865736520617265207573656420666F7220746865206964656E74696669636174696F6E2070726F6365737320756E646572204964656E746966792E','app','2018-12-05 13:49:24'),
	(100,X'54797065','app','2018-12-05 13:49:24'),
	(101,X'436861726163746572','app','2018-12-05 13:49:24'),
	(102,X'5374617465','app','2018-12-05 13:49:24'),
	(103,X'4D617472697820222573223A20636F6D70617265','app','2018-12-05 13:49:24'),
	(104,X'53656C6563742074776F20746178612066726F6D20746865206C6973747320616E6420636C69636B20436F6D7061726520746F20636F6D7061726520746865206368617261637465727320616E64206368617261637465722073746174657320666F7220626F746820746178612E2054686520726573756C74732073686F772074686520646966666572656E63657320616E642073696D696C6172697469657320666F7220626F746820746178612E','app','2018-12-05 13:49:24'),
	(105,X'556E69717565206368617261637465722073746174657320666F722025733A','app','2018-12-05 13:49:24'),
	(106,X'53686172656420636861726163746572207374617465733A','app','2018-12-05 13:49:24'),
	(107,X'556E697175652073746174657320696E','app','2018-12-05 13:49:24'),
	(108,X'5374617465732070726573656E7420696E20626F74683A','app','2018-12-05 13:49:24'),
	(109,X'5374617465732070726573656E7420696E206E6569746865723A','app','2018-12-05 13:49:24'),
	(110,X'4E756D626572206F6620617661696C61626C65207374617465733A','app','2018-12-05 13:49:24'),
	(111,X'5461786F6E6F6D69632064697374616E63653A','app','2018-12-05 13:49:24'),
	(112,X'50726F6A656374206F76657276696577','admin','2018-12-05 13:49:24'),
	(113,X'436F6E74656E74','admin','2018-12-05 13:49:24'),
	(114,X'57656C636F6D65','admin','2018-12-05 13:49:24'),
	(115,X'436F6E7472696275746F7273','admin','2018-12-05 13:49:24'),
	(116,X'5479706520746F2066696E643A','admin','2018-12-05 13:49:24'),
	(117,X'4D616E6167656D656E74207461736B733A','admin','2018-12-05 13:49:24'),
	(118,X'486F74776F726473','admin','2018-12-05 13:49:24'),
	(119,X'557365722061646D696E697374726174696F6E','admin','2018-12-05 13:49:24'),
	(120,X'50726F6A6563742061646D696E697374726174696F6E','admin','2018-12-05 13:49:24'),
	(121,X'5377697463682070726F6A65637473','admin','2018-12-05 13:49:24'),
	(122,X'45646974696E67206D61747269782022257322','admin','2018-12-05 13:49:24'),
	(123,X'70726576696577','admin','2018-12-05 13:49:24'),
	(124,X'73656C65637420616E6F74686572206D6174726978','admin','2018-12-05 13:49:24'),
	(125,X'63686172616374657273','admin','2018-12-05 13:49:24'),
	(126,X'736F72742063686172616374657273','admin','2018-12-05 13:49:24'),
	(127,X'74617861','admin','2018-12-05 13:49:24'),
	(128,X'646973706C61792063757272656E74206C696E6B7320706572207461786F6E','admin','2018-12-05 13:49:24'),
	(129,X'26206F74686572206D61747269636573','admin','2018-12-05 13:49:24'),
	(130,X'616464206E6577','admin','2018-12-05 13:49:24'),
	(131,X'656469742F64656C6574652073656C6563746564','admin','2018-12-05 13:49:24'),
	(132,X'616464206E6577207461786F6E','admin','2018-12-05 13:49:24'),
	(133,X'72656D6F76652073656C6563746564207461786F6E','admin','2018-12-05 13:49:24'),
	(134,X'737461746573','admin','2018-12-05 13:49:24'),
	(135,X'736F727420737461746573','admin','2018-12-05 13:49:24'),
	(136,X'6C696E6B73','admin','2018-12-05 13:49:24'),
	(137,X'64656C6574652073656C6563746564','admin','2018-12-05 13:49:24'),
	(138,X'4D61747269636573','admin','2018-12-05 13:49:24'),
	(139,X'42656C6F772069732061206C697374206F66206D617472696365732074686174206172652063757272656E746C7920646566696E65642E20496E206F7264657220746F20656469742061206D617472697827206E616D652C20636C69636B202265646974206E616D65222E20496E206F7264657220746F2065646974207468652061637475616C206D61747269782C20636C69636B202265646974206D6174726978222E','admin','2018-12-05 13:49:24'),
	(140,X'65646974206D6174726978','admin','2018-12-05 13:49:24'),
	(141,X'65646974206E616D65','admin','2018-12-05 13:49:24'),
	(142,X'64656C657465','admin','2018-12-05 13:49:24'),
	(143,X'6372656174652061206E6577206D6174726978','admin','2018-12-05 13:49:24'),
	(144,X'4E6577206D6174726978','admin','2018-12-05 13:49:24'),
	(145,X'4D6174726978206E616D653A','admin','2018-12-05 13:49:24'),
	(146,X'73617665','admin','2018-12-05 13:49:24'),
	(147,X'6261636B','admin','2018-12-05 13:49:24'),
	(148,X'53776974636820746F20616E6F74686572206D6174726978','app','2018-12-05 13:49:24'),
	(149,X'446973706C6179696E672022257322','app','2018-12-05 13:49:24'),
	(150,X'44697665727369747920696E646578','app','2018-12-05 13:49:24'),
	(151,X'476F20746F2074686973207461786F6E','app','2018-12-05 13:49:24'),
	(152,X'53656C656374206120646966666572656E74206D6170','app','2018-12-05 13:49:24'),
	(153,X'43686F6F73652061206D6170','app','2018-12-05 13:49:24'),
	(154,X'436F6D706172696E672074617861','app','2018-12-05 13:49:24'),
	(155,X'446973706C617973206F7665726C6170206265747765656E2074776F20746178612E','app','2018-12-05 13:49:24'),
	(156,X'436C656172206D6170','app','2018-12-05 13:49:24'),
	(157,X'53656C65637420746865206172656120796F752077616E7420746F2073656172636820627920636C69636B696E67207468652072656C6576616E7420737175617265732E','app','2018-12-05 13:49:24'),
	(158,X'5768656E2066696E69736865642C20636C69636B2027536561726368272E','app','2018-12-05 13:49:24'),
	(159,X'7265636F726473','app','2018-12-05 13:49:24'),
	(160,X'53656172636820726573756C7473','app','2018-12-05 13:49:24'),
	(161,X'436F6D706172696E672074617861202225732220616E642022257322','app','2018-12-05 13:49:24'),
	(162,X'53696D706C652064697373696D696C617269747920636F656666696369656E74','app','2018-12-05 13:49:24'),
	(163,X'2863757272656E7429','admin','2018-12-05 13:49:24'),
	(164,X'496E646578','admin','2018-12-05 13:49:24'),
	(165,X'50726F6A6563742073657474696E6773','admin','2018-12-05 13:49:24'),
	(166,X'50726F6A656374206D6F64756C6573','admin','2018-12-05 13:49:24'),
	(167,X'41737369676E20636F6C6C61626F7261746F727320746F206D6F64756C6573','admin','2018-12-05 13:49:24'),
	(168,X'47657420696E666F','admin','2018-12-05 13:49:24'),
	(169,X'4578706F7274','admin','2018-12-05 13:49:24'),
	(170,X'496E7465726E616C2070726F6A656374206E616D653A','admin','2018-12-05 13:49:24'),
	(171,X'496E7465726E616C2070726F6A656374206465736372697074696F6E3A','admin','2018-12-05 13:49:24'),
	(172,X'50726F6A6563742049443A','admin','2018-12-05 13:49:24'),
	(173,X'50726F6A656374207469746C653A','admin','2018-12-05 13:49:24'),
	(174,X'4465736372697074696F6E2028666F722068746D6C206D6574612D746167293A','admin','2018-12-05 13:49:24'),
	(175,X'4B6579776F7264732028666F722068746D6C206D6574612D7461673B207365706172617465207769746820737061636573293A','admin','2018-12-05 13:49:24'),
	(176,X'50726F6A656374206C616E6775616765733A','admin','2018-12-05 13:49:24'),
	(177,X'616464206C616E6775616765','admin','2018-12-05 13:49:24'),
	(178,X'546869732070726F6A65637420696E636C756465732068796272696420746178613A','admin','2018-12-05 13:49:24'),
	(179,X'796573','admin','2018-12-05 13:49:24'),
	(180,X'6E6F','admin','2018-12-05 13:49:24'),
	(181,X'5075626C6973682070726F6A6563743A','admin','2018-12-05 13:49:24'),
	(182,X'4C616E6775616765','admin','2018-12-05 13:49:24'),
	(183,X'44656661756C74','admin','2018-12-05 13:49:24'),
	(184,X'5472616E736C6174696F6E','admin','2018-12-05 13:49:24'),
	(185,X'537461747573','admin','2018-12-05 13:49:24'),
	(186,X'63757272656E74','admin','2018-12-05 13:49:24'),
	(187,X'746F206265207472616E736C61746564','admin','2018-12-05 13:49:24'),
	(188,X'7472616E736C61746564','admin','2018-12-05 13:49:24'),
	(189,X'7075626C6973686564','admin','2018-12-05 13:49:24'),
	(190,X'756E7075626C697368','admin','2018-12-05 13:49:24'),
	(191,X'6D616B652064656661756C74','admin','2018-12-05 13:49:24'),
	(192,X'756E7075626C6973686564','admin','2018-12-05 13:49:24'),
	(193,X'7075626C697368','admin','2018-12-05 13:49:24'),
	(214,X'456163682070726F6A6563742063616E2068617665206F6E6520646963686F746F6D6F7573206B65792E2054686174206B657920636F6E7369737473206F662061207468656F7265746963616C6C7920756E6C696D69746564206E756D626572206F662073746570732E2045616368207374657020636F6E7369737473206F662061206E756D6265722C2061207469746C6520616E642061206465736372697074696F6E2C20706C75732061206D6178696D756D206F6620666F75722063686F696365732E20456163682063686F69636520636F6E7369737473206F662061207469746C6520616E642061207465787420616E642F6F7220616E20696D6167652E20416C736F2C20656163682063686F696365206861732061207461726765743A2074686520636F6E6E656374696F6E20746F20746865206E65787420656C656D656E742077697468696E20746865206B65792E20546865207461726765742063616E2065697468657220626520616E6F7468657220737465702C206F722061207461786F6E2E','admin','2018-12-05 13:49:24'),
	(195,X'576F6F7264656E6C696A7374','app','2018-12-05 13:49:24'),
	(196,X'536F6F7274','app','2018-12-05 13:49:24'),
	(198,X'28636F6D6D6F6E206E616D65206F6620257329','app','2018-12-05 13:49:24'),
	(199,X'53706563696573206E616D6573','app','2018-12-05 13:49:24'),
	(200,X'53706563696573206465736372697074696F6E73','app','2018-12-05 13:49:24'),
	(201,X'537065636965732073796E6F6E796D73','app','2018-12-05 13:49:24'),
	(202,X'5370656369657320636F6D6D6F6E206E616D6573','app','2018-12-05 13:49:24'),
	(203,X'53706563696573206D65646961','app','2018-12-05 13:49:24'),
	(204,X'53656C656374206D6F64756C657320746F206578706F7274','admin','2018-12-05 13:49:24'),
	(205,X'6964656E7469666965722028616E6420456E676C697368207472616E736C6174696F6E29','admin','2018-12-05 13:49:24'),
	(206,X'7472616E736C6174696F6E20696E202573','admin','2018-12-05 13:49:24'),
	(207,X'496E74657266616365207472616E736C6174696F6E73','admin','2018-12-05 13:49:24'),
	(208,X'3C2070726576696F7573','admin','2018-12-05 13:49:24'),
	(209,X'6E657874203E','admin','2018-12-05 13:49:24'),
	(210,X'436F6E74656E7473','admin','2018-12-05 13:49:24'),
	(211,X'4D616E6167656D656E74','admin','2018-12-05 13:49:24'),
	(212,X'53686F7720616C6C207465787473','admin','2018-12-05 13:49:24'),
	(213,X'53686F7720756E7472616E736C61746564207465787473','admin','2018-12-05 13:49:24'),
	(215,X'596F752063616E206564697420746865206B65792066726F6D20746865207374617274706F696E742C20666F6C6C6F77696E672069747320737472756374757265206173207468652075736572732077696C6C207365652069742E204164646974696F6E616C6C792C20796F752063616E206372656174652073656374696F6E73206F6620796F7572206B6579207468617420617265206E6F742079657420636F6E6E656374656420746F20746865206D61696E206B65792E20496E2074686174207761792C207365766572616C2070656F706C652063616E20776F726B206F6E20646966666572656E74207061727473206F6620746865206B6579206174207468652073616D652074696D652E204F6E63652066696E69736865642C20612073656374696F6E2063616E20626520686F6F6B656420757020746F20746865206D61696E206B65792062792073696D706C792063686F6F73696E67207468652073656374696F6E73207374617274696E6720737465702061732074686520746172676574206F6620612063686F69636520616C72656164792070617274206F6620746865206D61696E206B65792E','admin','2018-12-05 13:49:24'),
	(216,X'5768696C65206E617669676174696E67207468726F75676820796F7572206B6579206F72206B65792073656374696F6E732C2061206B657970617468206973206D61696E7461696E65642061742074686520746F70206F66207468652073637265656E2C206A7573742062656E6561746820746865206E617669676174696F6E616C2062726561646372756D6220747261696C2E20596F752063616E206E617669676174652077697468696E20796F7572206B657920627920636C69636B696E6720656C656D656E747320696E20746865206B6579706174682E20417320746865206B6579706174682063616E206265636F6D65207175697465206C617267652C206F6E6C7920746865206C6173742066657720656C656D656E7473206172652073686F772E20546F207365652074686520636F6D706C657465206B6579706174682C20636C69636B207468652025732073796D626F6C20617420697473207665727920626567696E6E696E672E','admin','2018-12-05 13:49:24'),
	(217,X'45646974206B6579202866726F6D207374617274706F696E7429','admin','2018-12-05 13:49:24'),
	(218,X'45646974206B65792073656374696F6E73','admin','2018-12-05 13:49:24'),
	(219,X'4B6579206D6170','admin','2018-12-05 13:49:24'),
	(220,X'436F6D70757465207461786F6E206469766973696F6E','admin','2018-12-05 13:49:24'),
	(221,X'52656E756D626572207374657073','admin','2018-12-05 13:49:24'),
	(222,X'54617861206E6F742070617274206F6620746865206B6579','admin','2018-12-05 13:49:24'),
	(223,X'4B65792076616C69646174696F6E','admin','2018-12-05 13:49:24'),
	(224,X'446566696E652072616E6B7320746861742063616E2061707065617220696E206B6579','admin','2018-12-05 13:49:24'),
	(225,X'536574206B65792074797065','admin','2018-12-05 13:49:24'),
	(226,X'53746F7265206B657920747265652028666F722072756E74696D6520706572666F726D616E636520707572706F73657329','admin','2018-12-05 13:49:24'),
	(227,X'53686F77206B65792073746570202573','admin','2018-12-05 13:49:24'),
	(228,X'756E646566696E6564','admin','2018-12-05 13:49:24'),
	(229,X'73686F7720656E746972652070617468','admin','2018-12-05 13:49:24'),
	(230,X'4B657970617468','admin','2018-12-05 13:49:24'),
	(231,X'46756C6C206B657970617468','admin','2018-12-05 13:49:24'),
	(232,X'636C6F7365','admin','2018-12-05 13:49:24'),
	(233,X'53746570','admin','2018-12-05 13:49:24'),
	(234,X'65646974','admin','2018-12-05 13:49:24'),
	(235,X'43686F69636573','admin','2018-12-05 13:49:24'),
	(236,X'63686F696365207469746C65','admin','2018-12-05 13:49:24'),
	(237,X'63686F696365206C6561647320746F','admin','2018-12-05 13:49:24'),
	(238,X'6368616E6765206F72646572','admin','2018-12-05 13:49:24'),
	(675,X'42656C6F772061726520616C6C207461786120696E20796F75722070726F6A6563742074686174206172652070617274206F66207468652068696768657220746178612E20416C6C206C6F77657220746178612063616E20626520666F756E6420696E2074686520257373706563696573206D6F64756C6525732E','admin','2018-12-05 13:49:24'),
	(240,X'616464206E65772063686F696365','admin','2018-12-05 13:49:24'),
	(241,X'52656D61696E696E672074617861','admin','2018-12-05 13:49:24'),
	(242,X'4578636C756465642074617861','admin','2018-12-05 13:49:24'),
	(243,X'456469742063686F696365202225732220666F722073746570202573','admin','2018-12-05 13:49:24'),
	(244,X'45646974696E672063686F696365','admin','2018-12-05 13:49:24'),
	(245,X'546578743A','admin','2018-12-05 13:49:24'),
	(246,X'496D6167653A','admin','2018-12-05 13:49:24'),
	(247,X'5461726765743A','admin','2018-12-05 13:49:24'),
	(248,X'6E65772073746570','admin','2018-12-05 13:49:24'),
	(249,X'286E6F6E6529','admin','2018-12-05 13:49:24'),
	(250,X'6F72','admin','2018-12-05 13:49:24'),
	(251,X'7461786F6E','admin','2018-12-05 13:49:24'),
	(252,X'756E646F206C6173742073617665','admin','2018-12-05 13:49:24'),
	(253,X'456E74657220746865207469746C652C20746578742C20616E206F7074696F6E616C20696D61676520616E642074686520746172676574206F6620746869732063686F6963652E205469746C6520616E64207465787420617265207361766564206175746F6D61746963616C6C7920616674657220796F75206861766520656E746572656420746865207465787420696E2074686520617070726F70726961746520696E7075742E','admin','2018-12-05 13:49:24'),
	(254,X'546F206368616E67652074686520737465702D6E756D6265722066726F6D20746865206175746F6D61746963616C6C792067656E657261746564206F6E652C20656E7465722061206E6577206E756D62657220616E6420636C69636B202773617665272E20506C65617365206E6F7465207468617420746865206E756D62657273206861766520746F20626520756E6971756520696E20796F7572206B65792E','admin','2018-12-05 13:49:24'),
	(255,X'746865206C616E6775616765','admin','2018-12-05 13:49:24'),
	(256,X'41726520796F75207375726520796F752077616E7420746F2064656C65746520257320222573223F','admin','2018-12-05 13:49:24'),
	(257,X'44656C6574696F6E2077696C6C20626520697272657665727369626C652E','admin','2018-12-05 13:49:24'),
	(258,X'46696E616C20636F6E6669726D6174696F6E3A','admin','2018-12-05 13:49:24'),
	(259,X'7361766564','admin','2018-12-05 13:49:24'),
	(260,X'496D6167652073617665642E','admin','2018-12-05 13:49:24'),
	(261,X'64656C65746520696D616765','admin','2018-12-05 13:49:24'),
	(262,X'73686F77','admin','2018-12-05 13:49:24'),
	(263,X'696D616765','admin','2018-12-05 13:49:24'),
	(264,X'6D6F7665','admin','2018-12-05 13:49:24'),
	(265,X'6B657973746570','admin','2018-12-05 13:49:24'),
	(266,X'456469742073746570202573','admin','2018-12-05 13:49:24'),
	(267,X'45646974696E67206B657973746570','admin','2018-12-05 13:49:24'),
	(268,X'4E756D6265723A','admin','2018-12-05 13:49:24'),
	(269,X'5469746C653A','admin','2018-12-05 13:49:24'),
	(270,X'456E74657220746865207469746C6520616E642074657874206F662074686973207374657020696E20796F7572206B657920696E2074686520766172696F7573206C616E6775616765732077697468696E20796F75722070726F6A6563742E205469746C6520616E64207465787420617265207361766564206175746F6D61746963616C6C7920616674657220796F75206861766520656E746572656420746865207465787420696E2074686520617070726F70726961746520696E7075742E','admin','2018-12-05 13:49:24'),
	(271,X'41726520796F75207375726520796F752077616E7420746F2064656C657465207468697320696D6167653F','admin','2018-12-05 13:49:24'),
	(272,X'4265776172653A20796F7520617265206368616E67696E672074686520746172676574206F6620746869732063686F6963652E0A546869732063616E207261646963616C6C7920616C7465722074686520776F726B696E6773206F6620796F7572206B65792E0A446F20796F75207769736820746F20636F6E74696E75653F','admin','2018-12-05 13:49:24'),
	(273,X'286E6577207374657029','admin','2018-12-05 13:49:24'),
	(274,X'286E6F6E6520646566696E656429','admin','2018-12-05 13:49:24'),
	(275,X'53746570206E756D6265722069732072657175697265642E20546865207361766564206E756D62657220666F72207468697320737465702069732025732E20546865206C6F7765737420756E75736564206E756D6265722069732025732E','admin','2018-12-05 13:49:24'),
	(276,X'496E74726F647563746965','app','2018-12-05 13:49:24'),
	(277,X'486F676572652074617861','app','2018-12-05 13:49:24'),
	(278,X'5461786F6E206C697374','admin','2018-12-05 13:49:24'),
	(279,X'45646974696E672022257322','admin','2018-12-05 13:49:24'),
	(280,X'7361766520616E642070726576696577','admin','2018-12-05 13:49:24'),
	(281,X'756E646F20286175746F2973617665','admin','2018-12-05 13:49:24'),
	(282,X'64656C657465207461786F6E','admin','2018-12-05 13:49:24'),
	(283,X'6E616D6520616E6420706172656E74','admin','2018-12-05 13:49:24'),
	(284,X'6D65646961','admin','2018-12-05 13:49:24'),
	(285,X'6C697465726174757265','admin','2018-12-05 13:49:24'),
	(286,X'73796E6F6E796D73','admin','2018-12-05 13:49:24'),
	(287,X'636F6D6D6F6E206E616D6573','admin','2018-12-05 13:49:24'),
	(288,X'2854686973207061676520686173206E6F74206265656E207075626C697368656420696E2074686973206C616E67756167652E20436C69636B20257368657265257320746F207075626C6973682E29','admin','2018-12-05 13:49:24'),
	(289,X'42656C6F772061726520616C6C207461786120696E20796F75722070726F6A6563742074686174206172652070617274206F66207468652073706563696573206D6F64756C652E20416C6C2068696768657220746178612063616E20626520666F756E6420696E207468652025736869676865722074617861206D6F64756C6525732E','admin','2018-12-05 13:49:24'),
	(290,X'546F20656469742061206E616D652C2072616E6B206F7220706172656E742C20636C69636B20746865207461786F6E2773206E616D652E20546F20656469742061207461786F6E27732070616765732C20636C69636B207468652070657263656E746167652D696E64696361746F7220666F722074686174207461786F6E20696E207468652027636F6E74656E742720636F6C756D6E2E20546F2065646974206D656469612066696C65732C2073796E6F796D73206F7220636F6D6D6F6E206E616D65732C20636C69636B207468652063656C6C20696E2074686520636F72726573706F6E64696E6720636F6C756D6E2E','admin','2018-12-05 13:49:24'),
	(291,X'596F752063616E206368616E676520746865206F72646572206F662070726573656E746174696F6E206F662074617861206F6E207468652073616D65206C6576656C202D20737563682061732074776F2067656E657261202D206279206D6F76696E6720746178612075702D206F7220646F776E7761726420627920636C69636B696E6720746865206172726F77732E','admin','2018-12-05 13:49:24'),
	(292,X'52616E6B','admin','2018-12-05 13:49:24'),
	(293,X'696D616765732C20766964656F732C20736F756E6466696C6573','admin','2018-12-05 13:49:24'),
	(294,X'4973206265696E67206564697465642062793A','admin','2018-12-05 13:49:24'),
	(295,X'6D656469612066696C6573','admin','2018-12-05 13:49:24'),
	(296,X'66696C6573','admin','2018-12-05 13:49:24'),
	(297,X'4E616D6573','admin','2018-12-05 13:49:24'),
	(298,X'6D6F7665206272616E636820646F776E7761726420696E207468652074726565','admin','2018-12-05 13:49:24'),
	(299,X'4164642061206E6577207461786F6E','admin','2018-12-05 13:49:24'),
	(300,X'53706563696573206D6F64756C65206F76657276696577','admin','2018-12-05 13:49:24'),
	(301,X'45646974696E6720746178613A','admin','2018-12-05 13:49:24'),
	(302,X'496D706F7274207461786F6E20747265652066726F6D2066696C65','admin','2018-12-05 13:49:24'),
	(303,X'496D706F7274207461786F6E20747265652066726F6D20436174616C6F677565204F66204C69666520286578706572696D656E74616C29','admin','2018-12-05 13:49:24'),
	(304,X'4F727068616E73202874617861206F757473696465206F6620746865206D61696E207461786F6E207472656529','admin','2018-12-05 13:49:24'),
	(305,X'446566696E65207461786F6E6F6D69632072616E6B73','admin','2018-12-05 13:49:24'),
	(306,X'4C6162656C207461786F6E6F6D69632072616E6B73','admin','2018-12-05 13:49:24'),
	(307,X'446566696E652063617465676F72696573','admin','2018-12-05 13:49:24'),
	(308,X'446566696E652073656374696F6E73','admin','2018-12-05 13:49:24'),
	(309,X'41737369676E207461786120746F20636F6C6C61626F7261746F7273','admin','2018-12-05 13:49:24'),
	(310,X'4E6577207461786F6E','admin','2018-12-05 13:49:24'),
	(311,X'4E6F20706172656E74','admin','2018-12-05 13:49:24'),
	(312,X'506172656E74207461786F6E3A20','admin','2018-12-05 13:49:24'),
	(313,X'52616E6B3A','admin','2018-12-05 13:49:24'),
	(314,X'5461786F6E206E616D653A','admin','2018-12-05 13:49:24'),
	(315,X'417574686F723A','admin','2018-12-05 13:49:24'),
	(316,X'7361766520616E642063726561746520616E6F74686572','admin','2018-12-05 13:49:24'),
	(317,X'7361766520616E6420676F20746F206D61696E207461786F6E2070616765','admin','2018-12-05 13:49:24'),
	(318,X'54686174207461786F6E2063616E6E6F742068617665206368696C6420746178612E','admin','2018-12-05 13:49:24'),
	(319,X'5461786F6E6F6D69632072616E6B73','admin','2018-12-05 13:49:24'),
	(320,X'436C69636B20746865206172726F77206E65787420746F20612072616E6B20746F2061646420746861742072616E6B20746F207468652073656C656374696F6E207573656420696E20746869732070726F6A6563742E2043757272656E746C792073656C65637465642072616E6B73206172652073686F776E206F6E207468652072696768742E20546F2072656D6F766520612072616E6B2066726F6D207468652073656C656374696F6E2C20646F75626C6520636C69636B20697420696E20746865206C697374206F6E207468652072696768742E205468652075707065726D6F73742072616E6B2C2025732C206973206D616E6461746F727920616E642063616E6E6F742062652064656C657465642E','admin','2018-12-05 13:49:24'),
	(321,X'53656C65637420616C6C207468652072616E6B73207573656420696E20436174616C6F677565204F66204C6966652C206D61726B656420696E20626C756520696E20746865206C6973742062656C6F77','admin','2018-12-05 13:49:24'),
	(322,X'416674657220796F752068617665206D6164652074686520617070726F7072696174652073656C656374696F6E2C20636C69636B2074686520736176652D627574746F6E2E200D0A4F6E636520796F752068617665207361766564207468652073656C656374696F6E2C20796F752063616E20','admin','2018-12-05 13:49:24'),
	(323,X'6368616E6765207468652072616E6B7327206E616D657320616E642070726F76696465207472616E736C6174696F6E73','admin','2018-12-05 13:49:24'),
	(324,X'496E206164646974696F6E2C20796F752063616E2073706563696679207768657265207468652064697374696E6374696F6E206265747765656E20746865206D6F64756C6573202268696768657220746178612220616E64202273706563696573222077696C6C2062652E2022486967686572207461786122206172652064657363726962656420636F6E636973656C792C20776865726561732074686520227370656369657322206D6F64756C6520616C6C6F777320666F72206120636F6D70726568656E73697665206465736372697074696F6E20666F722065616368207461786F6E2C20696E636C7564696E6720646966666572656E742063617465676F726965732C20696D616765732C20766964656F7320616E6420736F756E64732E204465737069746520697473206E616D652C20746865202273706563696573206D6F64756C652220646F6573206E6F7420726573747269637420636F6D70726568656E73697665206465736372697074696F6E7320746F207468652072616E6B206F6620737065636965733B207261746865722C20796F7520796F757273656C662063616E207370656369667920776861742072616E6B73206172652064657363726962656420696E20737563682061207761792E2054686520726564206C696E6520696E20746865206C697374206F662073656C65637465642072616E6B732062656C6F772073796D626F6C69736573207468652064697374696E6374696F6E2E20416C6C2072616E6B732061626F766520746865206C696E652066616C6C20756E64657220226869676865722074617861222C2074686F73652062656C6F7720697420756E64657220746865202273706563696573206D6F64756C65222E20596F752063616E206D6F766520746865206C696E6520627920636C69636B696E67207468652026756172723B20616E642026646172723B206172726F77732E205468652073657474696E67206973207361766564207768656E20796F7520636C69636B','admin','2018-12-05 13:49:24'),
	(325,X'736176652073656C65637465642072616E6B73','admin','2018-12-05 13:49:24'),
	(326,X'42652061647669736564207468617420746869732022626F726465722220697320646966666572656E742066726F6D20746865206F6E65207468617420646566696E65732074617861206F6620776861742072616E6B732063616E2062652074686520656E642D706F696E74206F6620796F7572206B6579732E20546861742064697374696E6374696F6E20697320646566696E656420696E207468652022646963686F746F6D6F7573206B657922206D6F64756C652E20486F77657665722C20746861742064697374696E6374696F6E206D757374206265206F6E207468652073616D65206C6576656C20617320746865206F6E6520796F7520646566696E6520686572652C206F722062656C6F772069742E2049742063616E206E6576657220626520686967657220757020696E207468652072616E6B206869657261726368792E','admin','2018-12-05 13:49:24'),
	(327,X'506C6561736520626520616476697365643A','admin','2018-12-05 13:49:24'),
	(328,X'64656C6574696E672070726576696F75736C7920646566696E65642072616E6B7320746F207768696368207461786120616C72656164792068617665206265656E2061737369676E65642077696C6C206C656176652074686F7365207461786120776974686F75742072616E6B2E','admin','2018-12-05 13:49:24'),
	(329,X'52616E6B733A','admin','2018-12-05 13:49:24'),
	(330,X'53656C65637465642072616E6B73','admin','2018-12-05 13:49:24'),
	(331,X'28646F75626C6520636C69636B20746F2064656C65746529','admin','2018-12-05 13:49:24'),
	(332,X'52616E6B732073617665642E','admin','2018-12-05 13:49:24'),
	(333,X'6E616D65','admin','2018-12-05 13:49:24'),
	(334,X'6D61696E2070616765','admin','2018-12-05 13:49:24'),
	(335,X'4F727068616E65642074617861','admin','2018-12-05 13:49:24'),
	(336,X'5468657265206172652063757272656E746C79206E6F206F727068616E6564207461786120696E20796F75722064617461626173652E','admin','2018-12-05 13:49:24'),
	(337,X'222573222073617665642E','admin','2018-12-05 13:49:24'),
	(338,X'2854686973207061676520686173206265656E207075626C697368656420696E2074686973206C616E67756167652E20436C69636B20257368657265257320746F20756E7075626C6973682E29','admin','2018-12-05 13:49:24'),
	(339,X'53797374656D2061646D696E697374726174696F6E','admin','2018-12-05 13:49:24'),
	(340,X'53656C656374207468652070726F6A65637420796F75207769736820746F2064656C6574652E','admin','2018-12-05 13:49:24'),
	(341,X'73656C656374','admin','2018-12-05 13:49:24'),
	(342,X'4C696E6E61657573203220696D706F7274','admin','2018-12-05 13:49:24'),
	(343,X'43686F6F73652066696C65','admin','2018-12-05 13:49:24'),
	(344,X'4372656174696E672070726F6A656374','admin','2018-12-05 13:49:24'),
	(345,X'436F756C64206E6F7420637265617465202573','admin','2018-12-05 13:49:24'),
	(652,X'436F6C6C61626F7261746F722064617461','admin','2018-12-05 13:49:24'),
	(653,X'557365726E616D653A','admin','2018-12-05 13:49:24'),
	(654,X'50617373776F72643A','admin','2018-12-05 13:49:24'),
	(348,X'496D706F7274','admin','2018-12-05 13:49:24'),
	(658,X'452D6D61696C20616464726573733A','admin','2018-12-05 13:49:24'),
	(659,X'54696D657A6F6E653A','admin','2018-12-05 13:49:24'),
	(660,X'53656E6420652D6D61696C206E6F74696669636174696F6E733A','admin','2018-12-05 13:49:24'),
	(657,X'4C617374206E616D653A','admin','2018-12-05 13:49:24'),
	(655,X'50617373776F72642028726570656174293A','admin','2018-12-05 13:49:24'),
	(656,X'4669727374206E616D653A','admin','2018-12-05 13:49:24'),
	(643,X'4C69746572617475726520616E6420676C6F737361727920666F722022257322','admin','2018-12-05 13:49:24'),
	(644,X'4164646974696F6E616C20636F6E74656E7420666F722022257322','admin','2018-12-05 13:49:24'),
	(645,X'4B65797320666F7220224E696575776520466C6F72612076616E204E656465726C616E6422','admin','2018-12-05 13:49:24'),
	(646,X'6E6577207461786F6E','admin','2018-12-05 13:49:24'),
	(647,X'4E657720686967686572207461786F6E','admin','2018-12-05 13:49:24'),
	(648,X'416C6C207573657273','admin','2018-12-05 13:49:24'),
	(649,X'76696577','admin','2018-12-05 13:49:24'),
	(650,X'72656D6F7665','admin','2018-12-05 13:49:24'),
	(651,X'437265617465206E657720636F6C6C61626F7261746F72','admin','2018-12-05 13:49:24'),
	(632,X'4E6F20766172696174696F6E732068617665206265656E20646566696E656420666F722074686973207461786F6E2E','admin','2018-12-05 13:49:24'),
	(633,X'617574686F723A','admin','2018-12-05 13:49:24'),
	(634,X'52656C61746564207461786120616E6420766172696174696F6E7320666F722022257322','admin','2018-12-05 13:49:24'),
	(635,X'4E424320657874726173','admin','2018-12-05 13:49:24'),
	(636,X'4164646974696F6E616C204E4243206461746120666F722022257322','admin','2018-12-05 13:49:24'),
	(637,X'44656C657465','admin','2018-12-05 13:49:24'),
	(638,X'4D6174726978736C657574656C','app','2018-12-05 13:49:24'),
	(639,X'436861726163746572','admin','2018-12-05 13:49:24'),
	(640,X'5370656369657320616E642072616E6B7320666F722022257322','admin','2018-12-05 13:49:24'),
	(641,X'53617665','admin','2018-12-05 13:49:24'),
	(642,X'4164646974696F6E616C2073706563696573206461746120666F722022257322','admin','2018-12-05 13:49:24'),
	(625,X'4D6170206461746120666F722022257322','admin','2018-12-05 13:49:24'),
	(626,X'44454C4554494F4E2057494C4C20424520495252455645525349424C452E','admin','2018-12-05 13:49:24'),
	(627,X'74686520766172696174696F6E','admin','2018-12-05 13:49:24'),
	(628,X'41726520796F75207375726520796F752077616E7420746F2064656C6574652074686520766172696174696F6E20222573223F','admin','2018-12-05 13:49:24'),
	(629,X'72656C61746564','admin','2018-12-05 13:49:24'),
	(630,X'556E6B6E6F776E206F72206E6F2070726F6A6563742049442E','app','2018-12-05 13:49:24'),
	(631,X'4261636B20746F204C696E6E61657573204E4720726F6F74','app','2018-12-05 13:49:24'),
	(375,X'66696C65','admin','2018-12-05 13:49:24'),
	(376,X'5761726E696E673A202225732220646F6573206E6F742065786973742E','admin','2018-12-05 13:49:24'),
	(377,X'5461786F6E206E616D6520616C726561647920696E2064617461626173652E','admin','2018-12-05 13:49:24'),
	(378,X'496D706F72742064617461','admin','2018-12-05 13:49:24'),
	(379,X'4461746120696D706F7274206F7074696F6E73','admin','2018-12-05 13:49:24'),
	(380,X'496D706F7274204E42432044696572656E64657465726D696E61746965','admin','2018-12-05 13:49:24'),
	(381,X'4E42432044696572656E64657465726D696E6174696520496D706F7274','admin','2018-12-05 13:49:24'),
	(382,X'5061727365642064617461206578616D706C65','admin','2018-12-05 13:49:24'),
	(672,X'436F6D6D6F6E206E616D6573','admin','2018-12-05 13:49:24'),
	(673,X'4D6F7665','admin','2018-12-05 13:49:24'),
	(385,X'437265617465642070726F6A656374','admin','2018-12-05 13:49:24'),
	(386,X'53656C65637420746865207374616E64617264206D6F64756C657320796F75207769736820746F2075736520696E20796F75722070726F6A6563743A','admin','2018-12-05 13:49:24'),
	(387,X'42657369646573207468657365207374616E64617264206D6F64756C65732C20796F752063616E2061646420757020746F203520657874726120636F6E74656E74206D6F64756C657320746F20796F75722070726F6A6563743A','admin','2018-12-05 13:49:24'),
	(388,X'456E746572206E6577206D6F64756C652773206E616D653A','admin','2018-12-05 13:49:24'),
	(389,X'616464206D6F64756C65','admin','2018-12-05 13:49:24'),
	(390,X'4D6F64756C65','admin','2018-12-05 13:49:24'),
	(391,X'416374696F6E73','admin','2018-12-05 13:49:24'),
	(392,X'70617274206F66207468652070726F6A656374','admin','2018-12-05 13:49:24'),
	(393,X'6E6F742070617274206F66207468652070726F6A656374','admin','2018-12-05 13:49:24'),
	(394,X'616464','admin','2018-12-05 13:49:24'),
	(395,X'4D6174726978','admin','2018-12-05 13:49:24'),
	(396,X'4E657720636861726163746572','admin','2018-12-05 13:49:24'),
	(397,X'4E6577206368617263746572697374696320666F72206D61747269782022257322','admin','2018-12-05 13:49:24'),
	(398,X'41646420746865206E616D6520616E642074797065206F6620746865206368617263746572697374696320796F752077616E7420746F206164642E2054686520666F6C6C6F77696E67207479706573206F662063686172637465726973746963732061726520617661696C61626C653A','admin','2018-12-05 13:49:24'),
	(399,X'74657874','admin','2018-12-05 13:49:24'),
	(400,X'61207465787475616C206465736372697074696F6E2E','admin','2018-12-05 13:49:24'),
	(401,X'616E20696D6167652C20766964656F206F7220736F756E6466696C652E','admin','2018-12-05 13:49:24'),
	(402,X'72616E6765','admin','2018-12-05 13:49:24'),
	(403,X'612076616C75652072616E67652C20646566696E65642062792061206C6F7765737420616E64206120686967686573742076616C75652E','admin','2018-12-05 13:49:24'),
	(404,X'646973747269627574696F6E','admin','2018-12-05 13:49:24'),
	(405,X'612076616C756520646973747269627574696F6E2C20646566696E65642062792061206D65616E20616E642076616C75657320666F72206F6E6520616E642074776F207374616E6461726420646576696174696F6E732E','admin','2018-12-05 13:49:24'),
	(406,X'4368617261637465726973746963206E616D653A','admin','2018-12-05 13:49:24'),
	(407,X'43686172616374657220747970653A','admin','2018-12-05 13:49:24'),
	(671,X'53796E6F6E796D73','admin','2018-12-05 13:49:24'),
	(670,X'4C697465726174757265','admin','2018-12-05 13:49:24'),
	(669,X'4D65646961','admin','2018-12-05 13:49:24'),
	(668,X'5461786F6E','admin','2018-12-05 13:49:24'),
	(412,X'4465736372697074696F6E','admin','2018-12-05 13:49:24'),
	(413,X'44657461696C6564204465736372697074696F6E','admin','2018-12-05 13:49:24'),
	(414,X'45636F6C6F6779','admin','2018-12-05 13:49:24'),
	(415,X'436F6E736572766174696F6E','admin','2018-12-05 13:49:24'),
	(416,X'52656C6576616E6365','admin','2018-12-05 13:49:24'),
	(417,X'526570726F64756374697665','admin','2018-12-05 13:49:24'),
	(418,X'45616368207461786F6E207061676520636F6E7369737473206F66206F6E65206F72206D6F72652063617465676F726965732C20776974682061206D6178696D756D206F662025732E205468652066697273742063617465676F72792C20272573272C206973206D616E6461746F72792E','admin','2018-12-05 13:49:24'),
	(419,X'42656C6F772C20796F752063616E20737065636966792074686520636F7272656374206C6162656C206F6620656163682063617465676F727920696E20746865206C616E6775616765206F72206C616E67756167657320646566696E656420696E20796F75722070726F6A6563742E204F6E20746865206C6566742068616E6420736964652C20746865206C6162656C7320696E207468652064656661756C74206C616E67756167652061726520646973706C617965642E204F6E207468652072696768742068616E6420736964652C20746865206C6162656C7320696E20746865206F74686572206C616E6775616765732061726520646973706C617965642E205468657365206172652073686F776E2061206C616E677561676520617420612074696D653B20796F752063616E20737769746368206265747765656E206C616E67756167657320627920636C69636B696E6720697473206E616D652061742074686520746F70206F662074686520636F6C756D6E2E205468652063757272656E7420616374697665206C616E67756167652069732073686F776E20756E6465726C696E65642E','admin','2018-12-05 13:49:24'),
	(420,X'5465787420796F7520656E746572206973206175746F6D61746963616C6C79207361766564207768656E20796F75206C656176652074686520696E707574206669656C642E','admin','2018-12-05 13:49:24'),
	(421,X'43617465676F7279','admin','2018-12-05 13:49:24'),
	(422,X'4164642061206E65772063617465676F72793A','admin','2018-12-05 13:49:24'),
	(674,X'546865206E616D65202225732220616C7265616479206578697374732E','admin','2018-12-05 13:49:24'),
	(667,X'4E6F20636F6D6D6F6E206E616D65732068617665206265656E20646566696E656420666F722074686973207461786F6E2E','admin','2018-12-05 13:49:24'),
	(666,X'4164646974696F6E616C206461746120666F722022436869726F6E6F6D69646165206578757669616522','admin','2018-12-05 13:49:24'),
	(665,X'4B65797320666F722022436869726F6E6F6D69646165206578757669616522','admin','2018-12-05 13:49:24'),
	(664,X'557365726E616D6520616C7265616479206578697374732E','admin','2018-12-05 13:49:24'),
	(663,X'53656C65637420746865206D6F64756C657320746861742077696C6C2062652061737369676E656420746F207468697320636F6C6C61626F7261746F72','admin','2018-12-05 13:49:24'),
	(430,X'536176696E67206D61747269782064617461','admin','2018-12-05 13:49:24'),
	(662,X'4163746976653A','admin','2018-12-05 13:49:24'),
	(432,X'53746F72696E672072616E6B732C207370656369657320616E6420766172696174696F6E73','admin','2018-12-05 13:49:24'),
	(433,X'596F75206861766520746F20646566696E65206174206C65617374206F6E65206C616E677561676520696E20796F75722070726F6A656374206265666F726520796F752063616E2061646420616E7920746178612E','admin','2018-12-05 13:49:24'),
	(434,X'446566696E65206C616E677561676573206E6F772E','admin','2018-12-05 13:49:24'),
	(661,X'526F6C6520696E2063757272656E742070726F6A6563743A','admin','2018-12-05 13:49:24'),
	(436,X'436F6D6D6F6E206E616D657320666F722022257322','admin','2018-12-05 13:49:24'),
	(437,X'636F6D6D6F6E206E616D65','admin','2018-12-05 13:49:24'),
	(438,X'7472616E736C697465726174696F6E','admin','2018-12-05 13:49:24'),
	(439,X'6D6F7665207570','admin','2018-12-05 13:49:24'),
	(440,X'646F776E','admin','2018-12-05 13:49:24'),
	(441,X'4164642061206E657720636F6D6D6F6E206E616D653A','admin','2018-12-05 13:49:24'),
	(442,X'636F6D6D6F6E206E616D653A','admin','2018-12-05 13:49:24'),
	(443,X'7472616E736C697465726174696F6E3A','admin','2018-12-05 13:49:24'),
	(444,X'6C616E67756167653A','admin','2018-12-05 13:49:24'),
	(445,X'416674657220796F7520686176652061646465642061206E657720636F6D6D6F6E206E616D652C20796F752077696C6C20626520616C6C6F77656420746F2070726F7669646520746865206E616D65206F6620697473206C616E677561676520696E2074686520766172696F757320696E74657266616365206C616E677561676573207468617420796F75722070726F6A65637420757365732E','admin','2018-12-05 13:49:24'),
	(446,X'50726F6A65637420636F6C6C61626F7261746F72206F76657276696577','admin','2018-12-05 13:49:24'),
	(447,X'64617973','admin','2018-12-05 13:49:24'),
	(448,X'6669727374206E616D65','admin','2018-12-05 13:49:24'),
	(449,X'6C617374206E616D65','admin','2018-12-05 13:49:24'),
	(450,X'757365726E616D65','admin','2018-12-05 13:49:24'),
	(451,X'652D6D61696C','admin','2018-12-05 13:49:24'),
	(452,X'726F6C65','admin','2018-12-05 13:49:24'),
	(453,X'6C61737420616363657373','admin','2018-12-05 13:49:24'),
	(454,X'50726F6A65637420636F6C6C61626F7261746F7273','admin','2018-12-05 13:49:24'),
	(455,X'416C6C20636F6C6C61626F7261746F7273','admin','2018-12-05 13:49:24'),
	(456,X'43726561746520636F6C6C61626F7261746F72','admin','2018-12-05 13:49:24'),
	(457,X'616464206E657720666F722022257322','admin','2018-12-05 13:49:24'),
	(458,X'536F727420737461746573206F6620636861726163746572697374696320222573222E','admin','2018-12-05 13:49:24'),
	(459,X'6D6F766520646F776E','admin','2018-12-05 13:49:24'),
	(460,X'45646974696E67206368617261637465722022257322','admin','2018-12-05 13:49:24'),
	(461,X'4E657720737461746520666F722022257322','admin','2018-12-05 13:49:24'),
	(462,X'45646974696E672061207374617465206F66207468652074797065202225732220666F7220746865206368617261637465722022257322206F66206D617472697820222573222E','admin','2018-12-05 13:49:24'),
	(463,X'4E616D653A','admin','2018-12-05 13:49:24'),
	(464,X'43686F6F736520612066696C6520746F2075706C6F61643A','admin','2018-12-05 13:49:24'),
	(465,X'416C6C6F77656420666F726D6174733A','admin','2018-12-05 13:49:24'),
	(466,X'2573','admin','2018-12-05 13:49:24'),
	(467,X'6D61782E','admin','2018-12-05 13:49:24'),
	(468,X'7065722066696C65','admin','2018-12-05 13:49:24'),
	(469,X'7361766520616E642072657475726E20746F206D6174726978','admin','2018-12-05 13:49:24'),
	(470,X'7361766520616E642061646420616E6F7468657220737461746520666F72202671756F743B25732671756F743B','admin','2018-12-05 13:49:24'),
	(471,X'45646974696E6720737461746520666F722022257322','admin','2018-12-05 13:49:24'),
	(472,X'41206D656469612066696C652069732072657175697265642E','admin','2018-12-05 13:49:24'),
	(473,X'6368617261637465726973746963','admin','2018-12-05 13:49:24'),
	(474,X'537461746520222573222073617665642E','admin','2018-12-05 13:49:24'),
	(475,X'43757272656E7420696D6167653A','admin','2018-12-05 13:49:24'),
	(476,X'4C6F776572206C696D69742028696E636C7573697665293A','admin','2018-12-05 13:49:24'),
	(477,X'5570706572206C696D69742028696E636C7573697665293A','admin','2018-12-05 13:49:24'),
	(478,X'41726520796F7520737572653F','admin','2018-12-05 13:49:24'),
	(479,X'65646974206368617261637465722067726F757073','admin','2018-12-05 13:49:24'),
	(480,X'53656172636820616E64207265706C616365','admin','2018-12-05 13:49:24'),
	(481,X'46696E64','admin','2018-12-05 13:49:24'),
	(482,X'53656172636820666F723A','admin','2018-12-05 13:49:24'),
	(483,X'456E636C6F7365206D756C7469706C6520776F726473207769746820646F75626C652071756F7465732028222920746F2073656172636820666F7220746865206C69746572616C20737472696E672E','admin','2018-12-05 13:49:24'),
	(484,X'496E206D6F64756C65733A','admin','2018-12-05 13:49:24'),
	(485,X'53706563696573','admin','2018-12-05 13:49:24'),
	(486,X'4D6174726978206B6579','admin','2018-12-05 13:49:24'),
	(487,X'5265706C616365','admin','2018-12-05 13:49:24'),
	(488,X'5265706C61636520776974683A','admin','2018-12-05 13:49:24'),
	(489,X'446F206E6F7420656E636C6F7365206D756C7469706C6520776F726473207769746820646F75626C652071756F7465732C20756E6C65737320796F752077616E74207468656D2061732070617274206F66207468652061637475616C207265706C6163656D656E7420737472696E672E','admin','2018-12-05 13:49:24'),
	(490,X'5265706C616365206F7074696F6E733A','admin','2018-12-05 13:49:24'),
	(491,X'436F6E6669726D20706572206D61746368','admin','2018-12-05 13:49:24'),
	(492,X'5265706C61636520616C6C20776974686F757420636F6E6669726D6174696F6E','admin','2018-12-05 13:49:24'),
	(493,X'736561726368','admin','2018-12-05 13:49:24'),
	(494,X'5461786F6E2D7374617465206C696E6B73','admin','2018-12-05 13:49:24'),
	(495,X'56696577696E67207461786F6E2D7374617465206C696E6B7320696E20746865206D61747269782022257322','admin','2018-12-05 13:49:24'),
	(496,X'76696577206D6174726978','admin','2018-12-05 13:49:24'),
	(497,X'43686F6F73652061207461786F6E3A','admin','2018-12-05 13:49:24'),
	(499,X'5374617465','admin','2018-12-05 13:49:24'),
	(500,X'4E6F206C696E6B7320666F756E642E','admin','2018-12-05 13:49:24'),
	(501,X'416464696E672074617861','admin','2018-12-05 13:49:24'),
	(502,X'7361766520616E642061646420616E6F74686572207461786F6E','admin','2018-12-05 13:49:24'),
	(503,X'566172696174696F6E3A','admin','2018-12-05 13:49:24'),
	(504,X'45646974696E6720636861726163746572202225732220666F72206D61747269782022257322','admin','2018-12-05 13:49:24'),
	(505,X'5461786F6E2061646465642E','admin','2018-12-05 13:49:24'),
	(506,X'5461786F6E20746F206164643A','admin','2018-12-05 13:49:24'),
	(507,X'566172696174696F6E20746F206164643A','admin','2018-12-05 13:49:24'),
	(508,X'766172696174696F6E73','admin','2018-12-05 13:49:24'),
	(509,X'53796E6F6E796D7320666F722022257322','admin','2018-12-05 13:49:24'),
	(510,X'4E6F2073796E6F6E796D732068617665206265656E20646566696E656420666F722074686973207461786F6E2E','admin','2018-12-05 13:49:24'),
	(511,X'4164642061206E65772073796E6F6E796D3A','admin','2018-12-05 13:49:24'),
	(512,X'73796E6F6E796D3A','admin','2018-12-05 13:49:24'),
	(513,X'56617274696174696F6E7320666F722022257322','admin','2018-12-05 13:49:24'),
	(514,X'73796E6F6E796D','admin','2018-12-05 13:49:24'),
	(515,X'617574686F72','admin','2018-12-05 13:49:24'),
	(516,X'766172696174696F6E','admin','2018-12-05 13:49:24'),
	(517,X'4164642061206E657720766172696174696F6E3A','admin','2018-12-05 13:49:24'),
	(518,X'566172696174696F6E7320666F722022257322','admin','2018-12-05 13:49:24'),
	(519,X'45646974696E672025732022257322','admin','2018-12-05 13:49:24'),
	(520,X'53796E6F6E796D7320666F722025732022257322','admin','2018-12-05 13:49:24'),
	(521,X'476C6F7373617279207465726D73','app','2018-12-05 13:49:24'),
	(522,X'476C6F73736172792073796E6F6E796D73','app','2018-12-05 13:49:24'),
	(523,X'476C6F7373617279206D65646961','app','2018-12-05 13:49:24'),
	(524,X'4C69746572617279207265666572656E636573','app','2018-12-05 13:49:24'),
	(525,X'656E74657220736561726368207465726D','app','2018-12-05 13:49:24'),
	(526,X'546865206D6F64756C652022257322206973206E6F742070617274206F6620796F75722070726F6A6563742E','admin','2018-12-05 13:49:24'),
	(527,X'5B73796E2E5D','app','2018-12-05 13:49:24'),
	(528,X'596F752063616E2061737369676E207061727473206F6620746865207461786F6E207472656520746F20737065636966696320636F6C6C61626F7261746F722E2049662061737369676E65642C20636F6C6C61626F7261746F72732063616E206F6E6C792065646974207468652061737369676E6564207461786F6E2C20616E6420616C6C20746178612062656E6561746820697420696E20746865207461786F6E20747265652E204966206120636F6C6C61626F7261746F7220686173206E6F20746178612061737369676E656420746F2068696D2C2068652063616E2065646974206E6F20746178612E','admin','2018-12-05 13:49:24'),
	(529,X'596F752063616E2061737369676E206D756C7469706C65207461786120746F207468652073616D6520636F6C6C61626F7261746F722E20486F77657665722C20696620796F752061737369676E20646966666572656E74207461786120746861742061707065617220696E207468652073616D65206272616E6368206F6620746865207461786F6E20747265652C2074686520746178612068696768657374207570207468652073616D65206272616E63682074616B657320707265636564656E742E','admin','2018-12-05 13:49:24'),
	(530,X'41737369676E207461786F6E','admin','2018-12-05 13:49:24'),
	(531,X'746F2075736572','admin','2018-12-05 13:49:24'),
	(532,X'43757272656E742061737369676E6D656E74733A','admin','2018-12-05 13:49:24'),
	(533,X'436F6C6C61626F7261746F72','admin','2018-12-05 13:49:24'),
	(534,X'5461786F6E6F6D69632072616E6B733A206C6162656C73','admin','2018-12-05 13:49:24'),
	(535,X'42656C6F772C20796F752063616E20737065636966792074686520636F7272656374206C6162656C206F6620656163682072616E6B20696E20746865206C616E6775616765206F72206C616E67756167657320646566696E656420696E20796F75722070726F6A6563742E','admin','2018-12-05 13:49:24'),
	(536,X'4F6E20746865206C6566742068616E6420736964652C20746865206C6162656C7320696E207468652064656661756C74206C616E67756167652061726520646973706C617965643B206F6E207468652072696768742068616E6420736964652C20746865206C6162656C7320696E20746865206F74686572206C616E6775616765732E205468657365206172652073686F776E2061206C616E677561676520617420612074696D653B20796F752063616E20737769746368206265747765656E206C616E67756167657320627920636C69636B696E6720697473206E616D652061742074686520746F70206F662074686520636F6C756D6E2E205468652063757272656E7420616374697665206C616E67756167652069732073686F776E20756E6465726C696E65642E','admin','2018-12-05 13:49:24'),
	(538,X'54617861206C697374','app','2018-12-05 13:49:24'),
	(539,X'4F6E6C79207370656369657320616E642062656C6F772063616E20636F6E7461696E2073706163657320696E207468656972206E616D65732E','admin','2018-12-05 13:49:24'),
	(540,X'546865206E616D6520796F752073706563696669656420636F6E7461696E7320696E76616C696420636861726163746572732E','admin','2018-12-05 13:49:24'),
	(541,X'546865206E756D626572206F662073706163657320696E20746865206E616D6520646F6573206E6F74207365656D20746F206D61746368207468652073656C65637465642072616E6B2E','admin','2018-12-05 13:49:24'),
	(542,X'546865206E756D626572206F662073706163657320696E20746865206E616D6520646F6573206E6F74206D61746368207468652073656C65637465642072616E6B2E','admin','2018-12-05 13:49:24'),
	(543,X'412025732073686F756C64206265206C696E6B656420746F2025732E20546869732072656C6174696F6E73686970206973206E6F7420656E666F726365642C20736F20796F752063616E206C696E6B20746F2025732C206275742074686973206D617920726573756C7420696E2070726F626C656D7320776974682074686520636C617373696669636174696F6E2E','admin','2018-12-05 13:49:24'),
	(544,X'222573222063616E6E6F742062652073656C6563746564206173206120706172656E7420666F7220222573222E','admin','2018-12-05 13:49:24'),
	(545,X'4D61726B6572732061726520696E736572746564206175746F6D61746963616C6C792E','admin','2018-12-05 13:49:24'),
	(546,X'7361766520616E79776179','admin','2018-12-05 13:49:24'),
	(547,X'5468652073656C656374656420706172656E74207461786F6E2063616E206E6F742068617665206368696C6472656E2E','admin','2018-12-05 13:49:24'),
	(548,X'4E6F207461786F6E204944207370656369666965642E','app','2018-12-05 13:49:24'),
	(554,X'496E6465783A2073706563696573','admin','2018-12-05 13:49:24'),
	(555,X'4869676865722054617861','admin','2018-12-05 13:49:24'),
	(556,X'436C69636B20746F2062726F7773653A','admin','2018-12-05 13:49:24'),
	(621,X'6964656E746966696572','admin','2018-12-05 13:49:24'),
	(622,X'28617320746865206F726967696E616C20746167732061726520696E2025732C207468657920646F206E6F742072657175697265207472616E736C6174696E6729','admin','2018-12-05 13:49:24'),
	(623,X'417320746865206F726967696E616C20746167732061726520696E2025732C207468657920646F206E6F742072657175697265207472616E736C6174696E672C2062757420696620796F7520646F20737065636966792061207472616E736C6174696F6E2C2069742077696C6C206F76657272756C6520746865206F726967696E616C207461672E','admin','2018-12-05 13:49:24'),
	(624,X'44656C6574652074616720616E6420616C6C20697473207472616E736C6174696F6E7321','admin','2018-12-05 13:49:24'),
	(676,X'506C65617365206E6F7465207468617420796F752063616E206F6E6C792064656C657465207461786120746861742068617665206E6F206368696C6472656E2C20696E206F7264657220746F206D61696E7461696E206120636F7272656374207461786F6E2073747275637475726520696E207468652073706563696573206D6F64756C652E','admin','2018-12-05 13:49:24'),
	(677,X'50617373776F726420737472656E6774683A','admin','2018-12-05 13:49:24'),
	(678,X'286C6561766520626C616E6B20746F206C6561766520756E6368616E67656429','admin','2018-12-05 13:49:24'),
	(679,X'737461747573','admin','2018-12-05 13:49:24'),
	(680,X'41646420636F6C6C61626F7261746F72','admin','2018-12-05 13:49:24'),
	(681,X'4164642075736572','admin','2018-12-05 13:49:24'),
	(682,X'746F2070726F6A656374','admin','2018-12-05 13:49:24'),
	(683,X'696E2074686520726F6C65206F66','admin','2018-12-05 13:49:24'),
	(684,X'63616E63656C','admin','2018-12-05 13:49:24'),
	(685,X'4C6F67696E206661696C65642E','admin','2018-12-05 13:49:24'),
	(686,X'5461786F6E20697320616C7265616479206265696E672065646974656420627920616E6F7468657220656469746F722E','admin','2018-12-05 13:49:24'),
	(687,X'45646974696E67206C69746572617475726520222573202825732922','admin','2018-12-05 13:49:24'),
	(688,X'437265617465206E6577','admin','2018-12-05 13:49:24'),
	(689,X'4E756D626572206F6620617574686F72733A','admin','2018-12-05 13:49:24'),
	(690,X'6F6E65','admin','2018-12-05 13:49:24'),
	(691,X'74776F','admin','2018-12-05 13:49:24'),
	(692,X'6D6F7265','admin','2018-12-05 13:49:24'),
	(693,X'657420616C2E','admin','2018-12-05 13:49:24'),
	(694,X'596561722026616D703B2073756666697820286F7074696F6E616C293A','admin','2018-12-05 13:49:24'),
	(695,X'5265666572656E63653A','admin','2018-12-05 13:49:24'),
	(696,X'546178612074686973207265666572656E6365207065727461696E7320746F3A','admin','2018-12-05 13:49:24'),
	(697,X'417574686F72733A','admin','2018-12-05 13:49:24'),
	(698,X'54686174206E616D6520616C7265616479206578697374732C20616C626569742077697468206120646966666572656E7420706172656E742E','admin','2018-12-05 13:49:24'),
	(699,X'52616E6B2063616E6E6F74206265206879627269642E','admin','2018-12-05 13:49:24'),
	(700,X'4879627269643A','admin','2018-12-05 13:49:24'),
	(701,X'6E6F20687962726964','admin','2018-12-05 13:49:24'),
	(702,X'696E746572737065636966696320687962726964','admin','2018-12-05 13:49:24'),
	(703,X'696E74657267656E6572696320687962726964','admin','2018-12-05 13:49:24'),
	(704,X'50617373776F726420746F6F2073686F72743B2073686F756C64206265206265747765656E20257320616E6420257320636861726163746572732E','admin','2018-12-05 13:49:24'),
	(705,X'42656C6F772061726520796F757220757365726E616D6520616E642070617373776F726420666F722061636365737320746F20746865204C696E6E61657573204E472061646D696E697374726174696F6E3A0A557365726E616D653A2025730A50617373776F72643A2025730A0A596F752063616E20616363657373204C696E6E61657573204E472061743A0A5B5B75726C5D5D','admin','2018-12-05 13:49:24'),
	(706,X'3C68746D6C3E42656C6F772061726520796F757220757365726E616D6520616E642070617373776F726420666F722061636365737320746F20746865204C696E6E61657573204E472061646D696E697374726174696F6E3A3C6272202F3E0A557365726E616D653A2025733C6272202F3E0A50617373776F72643A2025733C6272202F3E0A3C6272202F3E0A596F752063616E20616363657373204C696E6E61657573204E472061743A3C6272202F3E0A3C6120687265663D225B5B75726C5D5D223E5B5B75726C5D5D3C2F613E','admin','2018-12-05 13:49:24'),
	(707,X'4E6F206D617472696365732068617665206265656E20646566696E65642E','app','2018-12-05 13:49:24'),
	(708,X'53796E6F6E796D73','app','2018-12-05 13:49:24'),
	(709,X'5461786F6E206C697374','app','2018-12-05 13:49:24'),
	(710,X'4261636B20746F','admin','2018-12-05 13:49:24'),
	(711,X'4C696E6E61657573204E4720726F6F74','admin','2018-12-05 13:49:24'),
	(712,X'68616269746174','app','2018-12-05 13:49:24'),
	(713,X'546578742069732072657175697265642E','admin','2018-12-05 13:49:24'),
	(714,X'4D65616E3A','admin','2018-12-05 13:49:24'),
	(715,X'5374616E6461726420646576696174696F6E3A','admin','2018-12-05 13:49:24'),
	(716,X'5573696E67206D617472697820222573222C2066756E6374696F6E2022257322','app','2018-12-05 13:49:24'),
	(717,X'73776974636820746F20','app','2018-12-05 13:49:24'),
	(718,X'736F7274','app','2018-12-05 13:49:24'),
	(719,X'616464','app','2018-12-05 13:49:24'),
	(720,X'64656C657465','app','2018-12-05 13:49:24'),
	(721,X'636C65617220616C6C','app','2018-12-05 13:49:24'),
	(722,X'747265617420756E6B6E6F776E73206173206D6174636865733A','app','2018-12-05 13:49:24'),
	(723,X'4C696E6E61657573204E4720726F6F74','app','2018-12-05 13:49:24'),
	(724,X'416C706861626574','app','2018-12-05 13:49:24'),
	(725,X'53657061726174696F6E20636F656666696369656E74','app','2018-12-05 13:49:24'),
	(726,X'4368617261637465722074797065','app','2018-12-05 13:49:24'),
	(727,X'4E756D626572206F6620737461746573','app','2018-12-05 13:49:24'),
	(728,X'456E747279206F72646572','app','2018-12-05 13:49:24'),
	(729,X'56616C75653A','app','2018-12-05 13:49:24'),
	(730,X'6F6B','app','2018-12-05 13:49:24'),
	(731,X'63616E63656C','app','2018-12-05 13:49:24'),
	(732,X'4E756D626572206F6620616C6C6F776564207374616E6461726420646576696174696F6E733A','app','2018-12-05 13:49:24'),
	(733,X'6C6F7765723A20','app','2018-12-05 13:49:24'),
	(734,X'75707065723A20','app','2018-12-05 13:49:24'),
	(735,X'456E74657220612076616C7565','app','2018-12-05 13:49:24'),
	(736,X'456E746572207468652072657175697265642076616C756520666F7220222573223A','app','2018-12-05 13:49:24'),
	(737,X'6D65616E3A20','app','2018-12-05 13:49:24'),
	(738,X'73643A20','app','2018-12-05 13:49:24'),
	(739,X'456E746572207468652072657175697265642076616C75657320666F7220222573223A','app','2018-12-05 13:49:24'),
	(740,X'436C69636B20257368657265257320746F207370656369667920612076616C75653B20796F752063616E20616C736F20646F75626C652D636C69636B202225732220746F20646F20736F2E','app','2018-12-05 13:49:24'),
	(741,X'506C6561736520656E74657220612076616C7565','app','2018-12-05 13:49:24'),
	(742,X'6D65616E','app','2018-12-05 13:49:24'),
	(743,X'7364','app','2018-12-05 13:49:24'),
	(744,X'4E65787420746F','app','2018-12-05 13:49:24'),
	(745,X'497427732061207465787421','app','2018-12-05 13:49:24'),
	(746,X'49742773206120706C6161746A653F','app','2018-12-05 13:49:24'),
	(747,X'4974277320612072616E67652E2E2E','app','2018-12-05 13:49:24'),
	(748,X'49742773206120646973747269627574696F6E21402324','app','2018-12-05 13:49:24'),
	(749,X'5768617465766572','app','2018-12-05 13:49:24'),
	(750,X'536F72742063686172616374657273','admin','2018-12-05 13:49:24'),
	(751,X'50726576696F757320746F','app','2018-12-05 13:49:24'),
	(752,X'73796E6F6E796D','app','2018-12-05 13:49:24'),
	(753,X'6F66','app','2018-12-05 13:49:24'),
	(754,X'4B65797320666F7220224C696E6E6165757320494922','admin','2018-12-05 13:49:24'),
	(755,X'4164646974696F6E616C206461746120666F7220224C696E6E6165757320494922','admin','2018-12-05 13:49:24'),
	(756,X'636865636B6C697374','app','2018-12-05 13:49:24'),
	(757,X'686162697461743A2022257322','app','2018-12-05 13:49:24'),
	(758,X'636865636B6C6973743A2022257322','app','2018-12-05 13:49:24'),
	(759,X'3A2022257322','app','2018-12-05 13:49:24'),
	(760,X'333A2022257322','app','2018-12-05 13:49:24'),
	(761,X'746F706963','app','2018-12-05 13:49:24'),
	(762,X'343A2022257322','app','2018-12-05 13:49:24'),
	(763,X'343A33','app','2018-12-05 13:49:24'),
	(764,X'333A33','app','2018-12-05 13:49:24'),
	(765,X'343A34','app','2018-12-05 13:49:24'),
	(766,X'333A34','app','2018-12-05 13:49:24'),
	(767,X'67656C696A6B656E646520736F6F7274656E','app','2018-12-05 13:49:24'),
	(768,X'4D6564696120666F722022257322','admin','2018-12-05 13:49:24'),
	(769,X'75706C6F6164206D65646961','admin','2018-12-05 13:49:24'),
	(770,X'496D61676573','admin','2018-12-05 13:49:24'),
	(771,X'4F7665727669657720696D616765','admin','2018-12-05 13:49:24'),
	(772,X'566964656F73','admin','2018-12-05 13:49:24'),
	(773,X'536F756E64','admin','2018-12-05 13:49:24'),
	(774,X'4E6577206D6564696120666F722022257322','admin','2018-12-05 13:49:24'),
	(775,X'75706C6F6164','admin','2018-12-05 13:49:24'),
	(776,X'5365652063757272656E74206D6564696120666F722074686973207461786F6E','admin','2018-12-05 13:49:24'),
	(777,X'416C6C6F776564204D494D452D7479706573','admin','2018-12-05 13:49:24'),
	(778,X'46696C6573206F662074686520666F6C6C6F77696E67204D494D452D74797065732061726520616C6C6F7765643A','admin','2018-12-05 13:49:24'),
	(779,X'7365652062656C6F7720666F7220696E666F726D6174696F6E206F6E2075706C6F6164696E67206172636869766573','admin','2018-12-05 13:49:24'),
	(780,X'4F76657277726974696E6720616E64206964656E746963616C2066696C65206E616D6573','admin','2018-12-05 13:49:24'),
	(781,X'416C6C2075706C6F616465642066696C6573206172652061737369676E656420756E697175652066696C65206E616D65732C20736F207468657265206973206E6F2064616E676572206F66206163636964656E74616C6C79206F76657277726974696E6720616E206578697374696E672066696C652E20546865206F726967696E616C2066696C65206E616D6573206172652072657461696E656420696E207468652070726F6A65637420646174616261736520616E642073686F776E20696E20746865206D65646961206D616E6167656D656E742073637265656E732E','admin','2018-12-05 13:49:24'),
	(782,X'55706C6F6164696E67206D756C7469706C652066696C6573206174206F6E6365','admin','2018-12-05 13:49:24'),
	(783,X'496E207468652063757272656E742048544D4C2D73706563696669636174696F6E20746865726520617265206E6F2063726F73732D62726F7377657220706F73736962696C697469657320666F72207468652075706C6F6164696E67206F66206D756C7469706C652066696C6573206174206F6E636520776974686F7574207265736F7274696E6720746F20466C617368206F72204A6176612E20446573706974652074686973206C696D69746174696F6E2C20796F752063616E2075706C6F6164207365766572616C20696D61676573206174206F6E636520627920616464696E67207468656D20746F2061205A49502D6172636869766520616E642075706C6F6164696E6720746861742066696C652E20546865206170706C69636174696F6E2077696C6C20756E7061636B20746865205A49502D66696C6520616E642073746F7265207468652073657061726174652066696C657320636F6E7461696E65642077697468696E2E20546F207468652066696C65732077697468696E2061205A49502D66696C65207468652073616D65206C696D69746174696F6E732077697468207265676172647320746F20666F726D617420616E642073697A65206170706C7920617320746F2066696C65732074686174206172652075706C6F61646564206E6F726D616C6C792E','admin','2018-12-05 13:49:24'),
	(784,X'47726F75703A','admin','2018-12-05 13:49:24'),
	(785,X'50726F6A65637420696E666F','admin','2018-12-05 13:49:24'),
	(786,X'257320746178612C20776974683A','admin','2018-12-05 13:49:24'),
	(787,X'2573206D656469612066696C6573','admin','2018-12-05 13:49:24'),
	(788,X'257320636F6D6D6F6E206E616D6573','admin','2018-12-05 13:49:24'),
	(789,X'25732073796E6F6E796D73','admin','2018-12-05 13:49:24'),
	(790,X'2573207061676573','admin','2018-12-05 13:49:24'),
	(791,X'257320676C6F737361727920656E7472696573','admin','2018-12-05 13:49:24'),
	(792,X'2573206C697465726174757265207265666572656E636573','admin','2018-12-05 13:49:24'),
	(793,X'206164646974696F6E616C20696E666F206D6F64756C65732077697468206120746F74616C206F66202573207061676573','admin','2018-12-05 13:49:24'),
	(794,X'257320737465707320696E207468652064696368746F6D6F7573206B6579','admin','2018-12-05 13:49:24'),
	(795,X'2573206D6174726978206B6579287329','admin','2018-12-05 13:49:24'),
	(796,X'2573206D6170206974656D73','admin','2018-12-05 13:49:24'),
	(797,X'257320766172696174696F6E73','admin','2018-12-05 13:49:24'),
	(798,X'2876616E20257329206F626A656374656E20696E20687569646967652073656C6563746965','app','2018-12-05 13:49:24'),
	(799,X'28646573656C65637465657229','app','2018-12-05 13:49:24'),
	(800,X'64657461696C73','app','2018-12-05 13:49:24'),
	(801,X'77697320676573656C656374656572646520656967656E736368617070656E','app','2018-12-05 13:49:24'),
	(802,X'77697320676573656C6563746565726465206B656E6D65726B656E','app','2018-12-05 13:49:24'),
	(803,X'7465727567','app','2018-12-05 13:49:24'),
	(804,X'47656C696A6B656E646520736F6F7274656E2076616E','app','2018-12-05 13:49:24'),
	(805,X'47656C696A6B656E646520736F6F7274656E2076616E202573','app','2018-12-05 13:49:24'),
	(806,X'5A6F656B726573756C746174656E20766F6F72202573','app','2018-12-05 13:49:24'),
	(807,X'476562617365657264206F70','app','2018-12-05 13:49:24'),
	(808,X'6D65657220696E666F','app','2018-12-05 13:49:24'),
	(809,X'45646974696E672070616765','admin','2018-12-05 13:49:24'),
	(810,X'4368616E67652070616765206F72646572','admin','2018-12-05 13:49:24'),
	(811,X'546F7069633A','admin','2018-12-05 13:49:24'),
	(812,X'63757272656E7420696D61676520666F72207468697320706167653A','admin','2018-12-05 13:49:24'),
	(813,X'28636C69636B20746F2064656C65746520696D61676529','admin','2018-12-05 13:49:24'),
	(814,X'45646974696E6720676C6F7373617279207465726D2022257322','admin','2018-12-05 13:49:24'),
	(815,X'5465726D3A','admin','2018-12-05 13:49:24'),
	(816,X'446566696E6974696F6E3A','admin','2018-12-05 13:49:24'),
	(817,X'53796E6F6E796D733A','admin','2018-12-05 13:49:24'),
	(818,X'28646F75626C652D636C69636B20612073796E6F6E796D20746F2072656D6F76652069742066726F6D20746865206C69737429','admin','2018-12-05 13:49:24'),
	(819,X'45646974206D656469612066696C6573','admin','2018-12-05 13:49:24'),
	(820,X'55706461746520686F74776F726473','admin','2018-12-05 13:49:24'),
	(821,X'42726F77736520616C6C20686F74776F726473','admin','2018-12-05 13:49:24'),
	(822,X'42726F77736520686F74776F726473','admin','2018-12-05 13:49:24'),
	(823,X'416C6C20686F74776F726473','admin','2018-12-05 13:49:24'),
	(824,X'55706461746520686F74776F726473207461626C65','admin','2018-12-05 13:49:24'),
	(825,X'436F6D6D6F6E204E616D6573','admin','2018-12-05 13:49:24'),
	(826,X'636F6E7461696E732074686520666F6C6C6F77696E672074617861','app','2018-12-05 13:49:24'),
	(827,X'73746570','app','2018-12-05 13:49:24'),
	(828,X'42726F77736520686F74776F72647320696E20','admin','2018-12-05 13:49:24'),
	(829,X'536F727420636861726163746572732062793A','app','2018-12-05 13:49:24'),
	(830,X'636F6D6D6F6E206E616D65206F66202573','app','2018-12-05 13:49:24'),
	(831,X'5A6F656B206F70206E61616D','app','2018-12-05 13:49:24'),
	(832,X'7A6F656B','app','2018-12-05 13:49:24'),
	(833,X'5A6F656B206F70206B656E6D65726B656E','app','2018-12-05 13:49:24'),
	(834,X'616C6C65206B656E6D65726B656E20746F6E656E','app','2018-12-05 13:49:24'),
	(835,X'616C6C65206B656E6D65726B656E2076657262657267656E','app','2018-12-05 13:49:24'),
	(836,X'6F6E646572736368656964656E6465206B656E6D65726B656E','app','2018-12-05 13:49:24'),
	(837,X'736C756974656E','app','2018-12-05 13:49:24'),
	(838,X'4D65657220726573756C746174656E206C6164656E','app','2018-12-05 13:49:24'),
	(839,X'6D65657220726573756C746174656E206C6164656E','app','2018-12-05 13:49:24'),
	(840,X'4B6965732065656E207761617264652074757373656E20257320656E20257325732E','app','2018-12-05 13:49:24'),
	(841,X'6D616C65','app','2018-12-05 13:49:24'),
	(842,X'66656D616C65','app','2018-12-05 13:49:24'),
	(843,X'64697374696E637469657665206B656E6D65726B656E','app','2018-12-05 13:49:24'),
	(844,X'7468652070616765','admin','2018-12-05 13:49:24'),
	(845,X'4B65797320666F7220224F726368696473206F66204E6577204775696E65612E20566F6C2E204949492E22','admin','2018-12-05 13:49:24'),
	(846,X'4164646974696F6E616C206461746120666F7220224F726368696473206F66204E6577204775696E65612E20566F6C2E204949492E22','admin','2018-12-05 13:49:24'),
	(847,X'4B65797320666F7220222D746573742070726F6A65637420C2AB4E61727768616CC2BB2028323031332D30322D31395431353A31373A34392B30313A30302922','admin','2018-12-05 13:49:24'),
	(848,X'4164646974696F6E616C206461746120666F7220222D746573742070726F6A65637420C2AB4E61727768616CC2BB2028323031332D30322D31395431353A31373A34392B30313A30302922','admin','2018-12-05 13:49:24'),
	(849,X'4B65797320666F7220222D746573742070726F6A65637420C2AB536861726BC2BB2028323031332D30322D31395431353A32323A33332B30313A30302922','admin','2018-12-05 13:49:24'),
	(850,X'4164646974696F6E616C206461746120666F7220222D746573742070726F6A65637420C2AB536861726BC2BB2028323031332D30322D31395431353A32323A33332B30313A30302922','admin','2018-12-05 13:49:24'),
	(851,X'4B65797320666F7220224D6172696E65204D616D6D616C7322','admin','2018-12-05 13:49:24'),
	(852,X'4164646974696F6E616C206461746120666F7220224D6172696E65204D616D6D616C7322','admin','2018-12-05 13:49:24'),
	(853,X'4B65797320666F7220224F726368696473206F66204E6577204775696E65612E20566F6C2E20564922','admin','2018-12-05 13:49:24'),
	(854,X'4164646974696F6E616C206461746120666F7220224F726368696473206F66204E6577204775696E65612E20566F6C2E20564922','admin','2018-12-05 13:49:24'),
	(855,X'44656C65746520616E206F727061686E65642070726F6A656374','admin','2018-12-05 13:49:24'),
	(856,X'44656C65746520616E206F727068616E65642070726F6A656374','admin','2018-12-05 13:49:24'),
	(857,X'44656C657465206F707268616E65642070726F6A656374','admin','2018-12-05 13:49:24'),
	(858,X'44656C657465206F727068616E65642070726F6A656374','admin','2018-12-05 13:49:24'),
	(859,X'44656C657465206F727068616E65642064617461','admin','2018-12-05 13:49:24'),
	(860,X'4D65726765206F746865722070726F6A656374','admin','2018-12-05 13:49:24'),
	(861,X'4D657267652070726F6A656374','admin','2018-12-05 13:49:24'),
	(862,X'42657369646573207468657365207374616E64617264206D6F64756C65732C20796F752063616E2061646420757020746F2020657874726120636F6E74656E74206D6F64756C657320746F20796F75722070726F6A6563743A','admin','2018-12-05 13:49:24'),
	(863,X'4B65797320666F7220224F726368696473206F66204E6577204775696E656120566F6C20494922','admin','2018-12-05 13:49:24'),
	(864,X'4164646974696F6E616C206461746120666F7220224F726368696473206F66204E6577204775696E656120566F6C20494922','admin','2018-12-05 13:49:24'),
	(865,X'4B65797320666F7220224F726368696473206F66204E6577204775696E65612E20566F6C2E20495622','admin','2018-12-05 13:49:24'),
	(866,X'4164646974696F6E616C206461746120666F7220224F726368696473206F66204E6577204775696E65612E20566F6C2E20495622','admin','2018-12-05 13:49:24'),
	(867,X'4B65797320666F7220224F726368696473206F66204E6577204775696E65612E20566F6C2E205622','admin','2018-12-05 13:49:24'),
	(868,X'4164646974696F6E616C206461746120666F7220224F726368696473206F66204E6577204775696E65612E20566F6C2E205622','admin','2018-12-05 13:49:24'),
	(869,X'53656C656374207468652070726F6A65637420796F75207769736820746F206D6572676520696E746F207468652063757272656E742070726F6A6563742C20222573222E','admin','2018-12-05 13:49:24'),
	(870,X'4261636B','admin','2018-12-05 13:49:24'),
	(871,X'596F75206172652061626F757420746F206D65726765207468652070726F6A656374202225732220696E746F20222573222E','admin','2018-12-05 13:49:24'),
	(872,X'446F20796F75207769736820746F20636F6E74696E75653F','admin','2018-12-05 13:49:24'),
	(873,X'6D65726765','admin','2018-12-05 13:49:24'),
	(874,X'61646420616E20696D61676520746F20746869732070616765','admin','2018-12-05 13:49:24'),
	(875,X'44656C65746520616C6C20686F74776F726473','admin','2018-12-05 13:49:24'),
	(876,X'486F74776F72647320696E202573206D6F64756C65','admin','2018-12-05 13:49:24'),
	(877,X'5265666572656E63656420696E2074686520666F6C6C6F77696E6720746178613A','app','2018-12-05 13:49:24'),
	(878,X'4164646974696F6E616C206461746120666F7220224E696575776520466C6F72612076616E204E656465726C616E6422','admin','2018-12-05 13:49:24'),
	(879,X'446963686F746F6D6520736C657574656C','app','2018-12-05 13:49:24'),
	(880,X'566572737072656964696E67','app','2018-12-05 13:49:24'),
	(881,X'4E657720676C6F7373617279207465726D','admin','2018-12-05 13:49:24'),
	(882,X'42726F7773696E6720676C6F7373617279','admin','2018-12-05 13:49:24'),
	(883,X'746F706963','admin','2018-12-05 13:49:24'),
	(884,X'54686520696D6167652066696C6520666F7220746865206D61702022257322206973206D697373696E672E','app','2018-12-05 13:49:24'),
	(885,X'54797065206C6F63616C697479','admin','2018-12-05 13:49:24'),
	(886,X'43686F6F736520612073706563696573','admin','2018-12-05 13:49:24'),
	(887,X'286E6F206461746129','admin','2018-12-05 13:49:24'),
	(888,X'656469742064617461','admin','2018-12-05 13:49:24'),
	(889,X'43686F6F736520612073706563696573','app','2018-12-05 13:49:24'),
	(890,X'436C69636B2061207370656369657320746F206578616D696E65','app','2018-12-05 13:49:24'),
	(891,X'7370656369657320636F6D70617269736F6E','app','2018-12-05 13:49:24'),
	(892,X'206F7220','app','2018-12-05 13:49:24'),
	(893,X'6D617020736561726368','app','2018-12-05 13:49:24'),
	(894,X'5461786F6E','app','2018-12-05 13:49:24'),
	(895,X'4E756D626572206F662067656F20656E7472696573','app','2018-12-05 13:49:24'),
	(896,X'70726576696F7573','app','2018-12-05 13:49:24'),
	(897,X'6E657874','app','2018-12-05 13:49:24'),
	(898,X'53656C656374207468652064657369726564206F7074696F6E20666F722065616368206F66207468652074617861206C69737465642062656C6F7720616E64207072657373202773617665272E','admin','2018-12-05 13:49:24'),
	(899,X'41747461636820746F20706172656E743A','admin','2018-12-05 13:49:24'),
	(900,X'446F206E6F7468696E67','admin','2018-12-05 13:49:24'),
	(901,X'6F6B','admin','2018-12-05 13:49:24'),
	(902,X'6265696465','app','2018-12-05 13:49:24'),
	(903,X'6D616E','app','2018-12-05 13:49:24'),
	(904,X'76726F7577','app','2018-12-05 13:49:24'),
	(905,X'496D706F7274207374617465206C6162656C7320666F72204E42432044696572656E64657465726D696E61746965','admin','2018-12-05 13:49:24'),
	(906,X'5061727365642064617461','admin','2018-12-05 13:49:24'),
	(907,X'536176696E67206C6162656C73','admin','2018-12-05 13:49:24'),
	(908,X'436F756C64206E6F74207265736F6C76652073746174652022252220282573292E','admin','2018-12-05 13:49:24'),
	(909,X'436F756C64206E6F74207265736F6C7665207374617465202225732220282573292E','admin','2018-12-05 13:49:24'),
	(910,X'436F756C64206E6F74207265736F6C7665207374617465202225732220666F722025732E','admin','2018-12-05 13:49:24'),
	(911,X'536B6970706564206C6162656C20666F72207374617465202225732220666F7220257320286E6F207472616E736C6174696F6E292E','admin','2018-12-05 13:49:24'),
	(912,X'536B6970706564207374617465202225732220666F7220257320286E6F207472616E736C6174696F6E292E','admin','2018-12-05 13:49:24'),
	(913,X'5570646174656420696D61676520666F72202225732220746F2025732E','admin','2018-12-05 13:49:24'),
	(914,X'446F6E652E','admin','2018-12-05 13:49:24'),
	(915,X'6B62','admin','2018-12-05 13:49:24'),
	(916,X'64656C657465207468697320696D616765','admin','2018-12-05 13:49:24'),
	(917,X'73617665206465736372697074696F6E','admin','2018-12-05 13:49:24'),
	(918,X'6D6F766520696D61676520646F776E77617264','admin','2018-12-05 13:49:24'),
	(919,X'6D6F766520696D61676520757077617264','admin','2018-12-05 13:49:24'),
	(920,X'53617665643A2025732028257329','admin','2018-12-05 13:49:24'),
	(921,X'426F6B746F7272656E2064657465726D696E6572656E','app','2018-12-05 13:49:24'),
	(922,X'2076616E20','app','2018-12-05 13:49:24'),
	(923,X'76616E202573','app','2018-12-05 13:49:24'),
	(924,X'4D65726765206F746865722070726F6A65637420696E746F2063757272656E74','admin','2018-12-05 13:49:24'),
	(925,X'4578706F72742070726F6A656374206461746120746F20584D4C2D66696C652E','admin','2018-12-05 13:49:24'),
	(926,X'6578706F7274','admin','2018-12-05 13:49:24'),
	(927,X'496D6167657320616E64206F74686572206D656469612066696C65732073686F756C6420626520636F706965642062792068616E642C20616E6420617265207265666572656E63656420696E20746865206578706F72742066696C652062792066696C656E616D65206F6E6C792E20546865792063616E20626520666F756E6420696E207468652073657276657220666F6C6465723A3C6272202F3E','admin','2018-12-05 13:49:24'),
	(928,X'4372656174696E67206E65772070616765','admin','2018-12-05 13:49:24'),
	(929,X'4E6F20737065636965732068617665206265656E20646566696E65642E','admin','2018-12-05 13:49:24'),
	(930,X'4E6F20746178612068617665206265656E20646566696E65642E','admin','2018-12-05 13:49:24'),
	(931,X'496E7365727420696E7465726E616C206C696E6B','admin','2018-12-05 13:49:24'),
	(932,X'436F6E74656E74207061676573','admin','2018-12-05 13:49:24'),
	(933,X'506167653A','admin','2018-12-05 13:49:24'),
	(934,X'476C6F737361727920616C706861626574','admin','2018-12-05 13:49:24'),
	(935,X'4C65747465723A','admin','2018-12-05 13:49:24'),
	(936,X'476C6F7373617279207465726D','admin','2018-12-05 13:49:24'),
	(937,X'4C69746572617475726520696E646578','admin','2018-12-05 13:49:24'),
	(938,X'4C69746572617475726520616C706861626574','admin','2018-12-05 13:49:24'),
	(939,X'4C697465726174757265207265666572656E6365','admin','2018-12-05 13:49:24'),
	(940,X'53706563696573206D6F64756C6520696E646578','admin','2018-12-05 13:49:24'),
	(941,X'53706563696573206D6F64756C652064657461696C','admin','2018-12-05 13:49:24'),
	(942,X'537065636965733A','admin','2018-12-05 13:49:24'),
	(943,X'43617465676F72793A','admin','2018-12-05 13:49:24'),
	(944,X'486967686572207461786120696E646578','admin','2018-12-05 13:49:24'),
	(945,X'48696768657220746178612064657461696C','admin','2018-12-05 13:49:24'),
	(946,X'546178613A','admin','2018-12-05 13:49:24'),
	(947,X'446963686F746F6D6F7573206B6579','admin','2018-12-05 13:49:24'),
	(948,X'446973747269627574696F6E20696E646578','admin','2018-12-05 13:49:24'),
	(949,X'446973747269627574696F6E2064657461696C','admin','2018-12-05 13:49:24'),
	(950,X'456C656D656E743A','admin','2018-12-05 13:49:24'),
	(951,X'5465737420696E646578','admin','2018-12-05 13:49:24'),
	(952,X'5465737420746F706963','admin','2018-12-05 13:49:24'),
	(953,X'566E75726B20696E646578','admin','2018-12-05 13:49:24'),
	(954,X'566E75726B20746F706963','admin','2018-12-05 13:49:24'),
	(955,X'496E736572742061206C696E6B20746F3A','admin','2018-12-05 13:49:24'),
	(956,X'4D6F64756C653A','admin','2018-12-05 13:49:24'),
	(957,X'696E73657274206C696E6B','admin','2018-12-05 13:49:24'),
	(958,X'4E657720696D616765','admin','2018-12-05 13:49:24'),
	(959,X'45646974206461746120666F722022257322','admin','2018-12-05 13:49:24'),
	(960,X'636F7079','admin','2018-12-05 13:49:24'),
	(961,X'7265736574','admin','2018-12-05 13:49:24'),
	(962,X'636C656172','admin','2018-12-05 13:49:24'),
	(963,X'44617461207479706573','admin','2018-12-05 13:49:24'),
	(964,X'5365742072756E74696D65206D61702074797065','admin','2018-12-05 13:49:24'),
	(965,X'53746F726520636F6D706163746564206461746120666F72204C696E6E616575732032206D6170732028666F722072756E74696D6520706572666F726D616E636520707572706F73657329','admin','2018-12-05 13:49:24'),
	(966,X'42656C6F772C20796F752063616E20646566696E6520757020746F2074656E207479706573206F662067656F67726170686963616C6C79206F7267616E6973656420646174612E204F6E636520646566696E65642C20796F752063616E2073706563696679206C6F636174696F6E73206F6E20746865206D617020666F72206561636820737065636965732C20666F72206576657279206461746120747970652E','admin','2018-12-05 13:49:24'),
	(967,X'4164642061206E6577206461746120747970653A','admin','2018-12-05 13:49:24'),
	(968,X'437265617465206E65772070726F6A656374','admin','2018-12-05 13:49:24'),
	(969,X'456E746572207468652070726F6A6563742773206E616D652C206465736372697074696F6E20616E642076657273696F6E2062656C6F772C20616E6420636C69636B2027736176652720746F20637265617465207468652070726F6A6563742E','admin','2018-12-05 13:49:24'),
	(970,X'50726F6A656374206E616D653A','admin','2018-12-05 13:49:24'),
	(971,X'50726F6A6563742076657273696F6E3A','admin','2018-12-05 13:49:24'),
	(972,X'50726F6A656374206465736372697074696F6E3A','admin','2018-12-05 13:49:24'),
	(973,X'28666F72207265666572656E6365206F6E6C7929','admin','2018-12-05 13:49:24'),
	(974,X'44656661756C742070726F6A656374206C616E6775616765733A','admin','2018-12-05 13:49:24'),
	(975,X'28796F752063616E206368616E67652074686973206C6174657229','admin','2018-12-05 13:49:24'),
	(976,X'41732073797374656D2061646D696E6973747261746F722C20796F752077696C6C206175746F6D61746963616C6C79206265206D6164652073797374656D2061646D696E6973747261746F72206F6620746865206E65772070726F6A6563742E20496E20746861742063617061636974792C20796F752077696C6C2062652061626C6520746F206372656174652075736572732C20616464206D6F64756C657320616E642065786563757465206F746865722061646D696E697374726174697665207461736B7320666F7220746865206E65776C7920637265617465642070726F6A6563742E','admin','2018-12-05 13:49:24'),
	(977,X'50726F6A65637420272573272073617665642E','admin','2018-12-05 13:49:24'),
	(978,X'257341646D696E6973747261746520746865206E65772070726F6A6563742E2573','admin','2018-12-05 13:49:24'),
	(979,X'70726576696F7573','admin','2018-12-05 13:49:24'),
	(980,X'6E657874','admin','2018-12-05 13:49:24'),
	(981,X'286E6F207465726D732068617665206265656E20646566696E656429','admin','2018-12-05 13:49:24'),
	(982,X'4E6577207265666572656E6365','admin','2018-12-05 13:49:24'),
	(983,X'42726F7773696E67206C697465726174757265','admin','2018-12-05 13:49:24'),
	(984,X'286E6F207265666572656E6365732068617665206265656E20646566696E656429','admin','2018-12-05 13:49:24'),
	(985,X'2873756273656374696F6E29','admin','2018-12-05 13:49:24'),
	(986,X'4B657970617468202873756273656374696F6E29','admin','2018-12-05 13:49:24'),
	(987,X'46756C6C2073756273656374696F6E206B6579706174683A','admin','2018-12-05 13:49:24'),
	(988,X'42656C6F772069732061206772617068696320726570726573656E746174696F6E206F6620796F7572206B65792E20436C69636B2061206E6F646520746F2073656520746865207374657073207468617420666F6C6C6F772066726F6D2069742E20436C69636B20616E64206472616720746F206D6F76652074686520656E7469726520747265652E','admin','2018-12-05 13:49:24'),
	(989,X'436C69636B20746F2073656520737465702022257322','admin','2018-12-05 13:49:24'),
	(990,X'4B65792073656374696F6E73','admin','2018-12-05 13:49:24'),
	(991,X'224B65792073656374696F6E732220617265207061727473206F662074686520646963686F746F6D6F7573206B6579207468617420617265206E6F7420636F6E6E656374656420746F2074686520656E74697265206B65792E2050757420646966666572656E746C792C207468657920617265207374657073207468617420617265206E6F7420746865207374617274696E672073746570206F6620796F7572206B65792C206E6F722074686520746172676574206F6620616E792063686F69636520696E20616E6F7468657220737465702E204279206372656174696E672073656374696F6E732C20646966666572656E7420636F6C6C61626F7261746F72732063616E20776F726B206F6E207370656369666963207061727473206F6620746865206B65792C20776869636820617265206C6174657220686F6F6B656420757020746F20746865206D61696E206B65792E','admin','2018-12-05 13:49:24'),
	(992,X'417661696C61626C652073656374696F6E732028636C69636B20746F2065646974293A','admin','2018-12-05 13:49:24'),
	(993,X'53746172742061206E65772073756273656374696F6E','admin','2018-12-05 13:49:24'),
	(994,X'64656C65746520616C6C20696D61676573','admin','2018-12-05 13:49:24'),
	(995,X'2873686F7720616C6C29','admin','2018-12-05 13:49:24'),
	(996,X'596F75206E65656420746F2070726F6365737320616E642073746F726520796F7572206B6579207472656520746F2073656520746865206C697374206F6620706F737369626C65206F7574636F6D65732E','admin','2018-12-05 13:49:24'),
	(997,X'436F756C64206E6F742063726561746520706167652E','admin','2018-12-05 13:49:24'),
	(998,X'4461746120666F722022257322','admin','2018-12-05 13:49:24'),
	(999,X'53656C656374696F6E20747970653A','admin','2018-12-05 13:49:24'),
	(1000,X'436F6F7264696E617465733A','admin','2018-12-05 13:49:24'),
	(1001,X'53656C656374207468652074797065206F66206461746120796F75206172652064726177696E67206F6E20746865206D61703A','admin','2018-12-05 13:49:24'),
	(1002,X'282573616464206F72206368616E6765206461746174797065732E257329','admin','2018-12-05 13:49:24'),
	(1003,X'546F20656E61626C652073657474696E67206D61726B6572732028706F696E7473206F6E20746865206D6170292C20636C69636B2074686520627574746F6E2062656C6F772E','admin','2018-12-05 13:49:24'),
	(1004,X'5468656E20636C69636B206F6E2074686520617070726F7072696174652073706F74206F6E20746865206D617020746F20706C6163652061206D61726B65722E20546F2072656D6F76652061206D61726B65722C2072696768742D636C69636B206F6E2069742E','admin','2018-12-05 13:49:24'),
	(1005,X'546F20656E61626C652064726177696E6720706F6C79676F6E732C20636C69636B2074686520627574746F6E2062656C6F772E','admin','2018-12-05 13:49:24'),
	(1006,X'5468656E20647261772074686520706F6C79676F6E20627920636C69636B696E672074686520617070726F7072696174652073706F7473206F6E20746865206D61702E205768656E2066696E69736865642064726177696E672C20636C69636B2074686520627574746F6E20616761696E2E20546F2072656D6F7665206120706F6C79676F6E2C2072696768742D636C69636B206F6E2069742E','admin','2018-12-05 13:49:24'),
	(1007,X'5768656E20796F752061726520646F6E652C20636C69636B2027736176652720746F2073746F726520616C6C206F6363757272656E6365732E','admin','2018-12-05 13:49:24'),
	(1008,X'646174612074797065','admin','2018-12-05 13:49:24'),
	(1009,X'4C696E6E616575732032206D617073','admin','2018-12-05 13:49:24'),
	(1010,X'22257322','admin','2018-12-05 13:49:24'),
	(1011,X'53776974636820746F20616E6F74686572206D61703A','admin','2018-12-05 13:49:24'),
	(1012,X'6564697461626C65206D6170','admin','2018-12-05 13:49:24'),
	(1013,X'636F70792064617461','admin','2018-12-05 13:49:24'),
	(1014,X'536574207468652074797065206F66206D617020746861742077696C6C2061707065617220696E207468652072756E74696D6520696E746572666163653A','admin','2018-12-05 13:49:24'),
	(1015,X'45','app','2018-12-05 13:49:24'),
	(1016,X'4E','app','2018-12-05 13:49:24'),
	(1017,X'636C656172206D6170','admin','2018-12-05 13:49:24'),
	(1018,X'53746F726520636F6D706163746564204C696E6E6165757320322064617461','admin','2018-12-05 13:49:24'),
	(1019,X'436C69636B2074686520627574746F6E2062656C6F7720746F2068617665207468652073797374656D2073746F726520746865204C696E6E616575732032206D6170206461746120696E2061206D6F726520636F6D7061637420666F726D2E','admin','2018-12-05 13:49:24'),
	(1020,X'506C65617365206E6F746520746861742C20646570656E64696E67206F6E207468652073697A65206F6620796F757220646174612C2074686973206D696768742074616B65206120666577206D696E757465732E','admin','2018-12-05 13:49:24'),
	(1021,X'73746F726520636F6D7061637465642064617461','admin','2018-12-05 13:49:24'),
	(1022,X'436F6D7061637465642064617461207361766564','admin','2018-12-05 13:49:24'),
	(1023,X'57','app','2018-12-05 13:49:24'),
	(1024,X'53','app','2018-12-05 13:49:24'),
	(1025,X'436F7079206F6363757272656E6365732066726F6D2022257322','admin','2018-12-05 13:49:24'),
	(1026,X'43686F6F736520746865207370656369657320796F752077616E7420746F20636F707920746865206D61702064617461206F66202225732220746F3A','admin','2018-12-05 13:49:24'),
	(1027,X'45646974696E6720676C6F7373617279207465726D','admin','2018-12-05 13:49:24'),
	(1028,X'44656C6574696E67207461786F6E2022257322','admin','2018-12-05 13:49:24'),
	(1029,X'596F75206172652061626F757420746F2064656C65746520746865207461786F6E20222573222C20776869636820686173206368696C64207461786120636F6E6E656374656420746F2069742E20506C65617365207370656369667920776861742073686F756C642068617070656E20746F2074686520636F6E6E6563746564206368696C6420746178612E2054686572652061726520746872656520706F73736962696C69746965733A','admin','2018-12-05 13:49:24'),
	(1030,X'4F727068616E733A','admin','2018-12-05 13:49:24'),
	(1031,X'7475726E207468656D20696E746F20226F727068616E73222E204F727068616E7320617265207461786120746861742061726520756E636F6E6E656374656420746F20746865206D61696E207461786F6E20747265652E20596F752077696C6C206E65656420746F20696E646976696475616C6C79207265617474616368207468656D206C617465722E','admin','2018-12-05 13:49:24'),
	(1032,X'44656C6574653A','admin','2018-12-05 13:49:24'),
	(1033,X'64656C657465207468656D2061732077656C6C2E204566666563746976656C7920746869732077696C6C2064656C6574652074686520656E74697265206272616E63682066726F6D207461786F6E202225732220616E6420646F776E2E','admin','2018-12-05 13:49:24'),
	(1034,X'4174746163683A','admin','2018-12-05 13:49:24'),
	(1035,X'617474616368207468656D206173206368696C6420746F2074686520706172656E74206F6620222573222C2077686963682069732074686520257320222573222E2054686572652077696C6C206265206E6F206368616E676520696E207468652072616E6B206F6620746865207265617474616368656420746178612E','admin','2018-12-05 13:49:24'),
	(1036,X'4F727068616E','admin','2018-12-05 13:49:24'),
	(1037,X'41747461636820746F','admin','2018-12-05 13:49:24'),
	(1038,X'6D6F7665206272616E63682075707761726420696E207468652074726565','admin','2018-12-05 13:49:24'),
	(1039,X'286F727068616E29','admin','2018-12-05 13:49:24'),
	(1040,X'4E6F20746178612068617665206265656E2061737369676E656420746F20796F752E','admin','2018-12-05 13:49:24'),
	(1041,X'4E656465726C616E647320536F6F7274656E7265676973746572','app','2018-12-05 13:49:24'),
	(1042,X'4368616E676520612070726F6A656374204944','admin','2018-12-05 13:49:24'),
	(1043,X'53656C656374207468652070726F6A656374206F6620776869636820796F75207769736820746F206368616E6765207468652049442E','admin','2018-12-05 13:49:24'),
	(1044,X'53656C656374207468652070726F6A656374206F6620776869636820796F75207769736820746F206368616E67652074686520494420616E6420656E74657220746865206E65772049442E','admin','2018-12-05 13:49:24'),
	(1045,X'412070726F6A656374207769746820494420257320616C72656164792065786973747320282573292E','admin','2018-12-05 13:49:24'),
	(1046,X'4E6F20706172656E742073656C65637465642028796F752063616E207374696C6C2073617665292E','admin','2018-12-05 13:49:24'),
	(1047,X'446963686F746F6D6F7573206B6579207374657073','app','2018-12-05 13:49:24'),
	(1048,X'446963686F746F6D6F7573206B65792063686F69636573','app','2018-12-05 13:49:24'),
	(1049,X'4D6174726978206B6579206D61747269636573','app','2018-12-05 13:49:24'),
	(1050,X'4D6174726978206B65792063686172616374657273','app','2018-12-05 13:49:24'),
	(1051,X'4D6174726978206B657920737461746573','app','2018-12-05 13:49:24'),
	(1052,X'4E6176696761746F72','app','2018-12-05 13:49:24'),
	(1053,X'67656F67726170686963616C2064617461','app','2018-12-05 13:49:24'),
	(1054,X'596F75722073656172636820666F7220222573222070726F647563656420257320726573756C74732E','app','2018-12-05 13:49:24'),
	(1055,X'457870616E6420616C6C','app','2018-12-05 13:49:24'),
	(1056,X'616E64','app','2018-12-05 13:49:24'),
	(1057,X'5461786F6E3A','app','2018-12-05 13:49:24'),
	(1058,X'696E','app','2018-12-05 13:49:24'),
	(1059,X'4974206973206E6F7420706F737369626C6520746F206A756D70206469726563746C7920746F20612073706563696669632073746570206F722063686F696365206F662074686520646963686F746F6D6F7573206B6579','app','2018-12-05 13:49:24'),
	(1060,X'2573537461727420746865206B65792066726F6D2074686520737461727425732E','app','2018-12-05 13:49:24'),
	(1061,X'63686F696365','app','2018-12-05 13:49:24'),
	(1062,X'73656172636820726573756C7473','app','2018-12-05 13:49:24'),
	(1063,X'53746F7265206B65792074726565','admin','2018-12-05 13:49:24'),
	(1064,X'436C69636B2074686520627574746F6E2062656C6F7720746F2068617665207468652073797374656D2073746F7265206120747265652D7374727563747572656420726570726573656E746174696F6E206F6620746865206B65792C20726571756972656420666F722072756E74696D6520707572706F7365732E','admin','2018-12-05 13:49:24'),
	(1065,X'506C65617365206E6F746520746861742C20646570656E64696E67206F6E207468652073697A65206F6620796F7572206B65792C2074686973206D696768742074616B65206120666577206D696E757465732E','admin','2018-12-05 13:49:24'),
	(1066,X'73746F7265206B65792074726565','admin','2018-12-05 13:49:24'),
	(1067,X'4B65792074726565207361766564','admin','2018-12-05 13:49:24'),
	(1068,X'4C697465726174757572','app','2018-12-05 13:49:24'),
	(1069,X'53686F7274206E616D6520666F722055524C3A','admin','2018-12-05 13:49:24'),
	(1070,X'556E6B6E6F776E2070726F6A656374206F7220696E76616C69642070726F6A6563742049442E','app','2018-12-05 13:49:24'),
	(1071,X'42656C6F772069732061206C697374206F6620737465707320776974686F757420616E792063686F696365732E20546F20656469742C20636C69636B20746865206E616D652074686520737465702E','admin','2018-12-05 13:49:24'),
	(1072,X'42656C6F772069732061206C697374206F662073746570732077697468206F6E6C79206F6E652063686F6963652E20546F20656469742C20636C69636B20746865206E616D652074686520737465702E','admin','2018-12-05 13:49:24'),
	(1073,X'42656C6F772069732061206C697374206F6620756E636F6E6E65637465642063686F696365732C20692E652E2074686F7365207468617420646F206E6F74206C65616420746F20616E6F746865722073746570206F722061207461786F6E2E20546F20656469742C20636C69636B20746865206E616D65206F6620656974686572207468652073746570206F72207468652063686F6963652E','admin','2018-12-05 13:49:24'),
	(1074,X'63686F696365','admin','2018-12-05 13:49:24'),
	(1075,X'5461786F6E3A','admin','2018-12-05 13:49:24'),
	(1076,X'73746570','admin','2018-12-05 13:49:24'),
	(1077,X'5461786F6E2072616E6B7320696E206B6579','admin','2018-12-05 13:49:24'),
	(1078,X'42656C6F772C20796F752063616E20646566696E652074617861206F6620776861742072616E6B206F722072616E6B732077696C6C2062652070617274206F6620796F757220646963686F746F6D6F7573206B65792E','admin','2018-12-05 13:49:24'),
	(1079,X'5468652074617861207468617420617265206F6620612072616E6B2062656C6F772074686520726564206C696E6520696E20746865206C6973742062656C6F772061726520617661696C61626C6520696E20796F7572206B65792E20546F206368616E6765207468652073656C656374696F6E2C206D6F76652074686520726564206C696E65207570206F7220646F776E20627920636C69636B696E67207468652026756172723B20616E642026646172723B206172726F77732E20546F20696E636C75646520616C6C2072616E6B732C206D6F766520746865206C696E6520746F2074686520746F70206F6620746865206C6973742C2061626F7665207468652066697273742072616E6B2E204173206174206C65617374206F6E652072616E6B20697320726571756972656420746F20626520696E636C756465642C20746865206C696E652063616E6E6F74206265206D6F7665642062656C6F7720746865206C6F776573742072616E6B2E205768656E20796F752061726520736174697366696564207769746820796F75722073656C656374696F6E2C20636C69636B2074686520736176652D627574746F6E2E','admin','2018-12-05 13:49:24'),
	(1080,X'506C65617365206E6F74652074686174206368616E67696E6720746869732073657474696E672077696C6C206E6F742064657461636820616E7920746178612074686174206861766520616C7265616479206265656E20617474616368656420746F20616E20656E642D706F696E74206F6620796F7572206B65792E20546178612074686174206861766520612072616E6B2074686174206973206E6F206C6F6E6765722070617274206F66207468652073656C656374696F6E2062656C6F772077696C6C2072656D61696E20636F6E6E656374656420746F20746865206B65792C20756E74696C20796F75206D616E75616C6C7920646574616368207468656D2E','admin','2018-12-05 13:49:24'),
	(1081,X'53617665642E','admin','2018-12-05 13:49:24'),
	(1082,X'42656C6F772069732061206C697374206F662074617861207468617420617265206E6F74207965742070617274206F6620796F7572206B65793A','admin','2018-12-05 13:49:24'),
	(1083,X'4E6F206B65792073656374696F6E732061726520617661696C61626C652E','admin','2018-12-05 13:49:24'),
	(1084,X'476562617365657264206F703A','app','2018-12-05 13:49:24'),
	(1085,X'426574656B656E69732069636F6E656E3A','app','2018-12-05 13:49:24'),
	(1086,X'75706C6F616420616E64207061727365','admin','2018-12-05 13:49:24'),
	(1087,X'435356206461746120696D706F7274','admin','2018-12-05 13:49:24'),
	(1088,X'696D706F7274','admin','2018-12-05 13:49:24'),
	(1089,X'5361766564207061676520222573222E','admin','2018-12-05 13:49:24'),
	(1090,X'4469657267726F657074656B7374656E3A2022257322','app','2018-12-05 13:49:24'),
	(1091,X'466F756E64206E6F2073746174657320666F722022257322','admin','2018-12-05 13:49:24'),
	(1092,X'436C69636B20746F2065646974207461786F6E2022257322','admin','2018-12-05 13:49:24'),
	(1093,X'4D6174726978206B657920696E646578','admin','2018-12-05 13:49:24'),
	(1094,X'4D6174726978206B657973','admin','2018-12-05 13:49:24'),
	(1095,X'496E74726F64756374696F6E','admin','2018-12-05 13:49:24'),
	(1096,X'476C6F7373617279','admin','2018-12-05 13:49:24'),
	(1097,X'4E6176696761746F72','admin','2018-12-05 13:49:24'),
	(1098,X'537465703A','admin','2018-12-05 13:49:24'),
	(1099,X'436C617373696669636174696F6E','admin','2018-12-05 13:49:24'),
	(1100,X'436F756C64206E6F74207265736F6C76652073696D696C61722069642022257322','admin','2018-12-05 13:49:24'),
	(1101,X'50726F6A65637420222522206E6F7420666F756E6420696E207468652064617461626173652E','admin','2018-12-05 13:49:24'),
	(1102,X'496D706F72742068616C7465642E','admin','2018-12-05 13:49:24'),
	(1103,X'536B697070656420696D61676520666F72202225732220286E6F7420737065636966696564292E','admin','2018-12-05 13:49:24'),
	(1104,X'436F756C64206E6F74207265736F6C766520636861726163746572202225222E','admin','2018-12-05 13:49:24'),
	(1105,X'286E6F7420696E20616E792067726F757029','admin','2018-12-05 13:49:24'),
	(1106,X'6E6F7420696E20616E792067726F75703A','admin','2018-12-05 13:49:24'),
	(1107,X'6E6F7420696E20616E792067726F7570','admin','2018-12-05 13:49:24'),
	(1108,X'412067726F7570206E616D6564202225732220616C7265616479206578697374732E','admin','2018-12-05 13:49:24'),
	(1109,X'64656C6574652067726F7570','admin','2018-12-05 13:49:24'),
	(1110,X'5361766520616E642066696E69736820696D706F7274','admin','2018-12-05 13:49:24'),
	(1111,X'6C616E6775616765','admin','2018-12-05 13:49:24'),
	(1112,X'72656163717569726520737461746520696D6167652064696D656E73696F6E73','admin','2018-12-05 13:49:24'),
	(1113,X'557064617465642073746174657320666F7220222573222E','admin','2018-12-05 13:49:24'),
	(1114,X'53657474696E6773','admin','2018-12-05 13:49:24'),
	(1115,X'412073657474696E67207769746820746865206E616D65202225732220616C7265617379206578697374732E','admin','2018-12-05 13:49:24'),
	(1116,X'412073657474696E67207769746820746865206E616D65202225732220616C7265616479206578697374732E','admin','2018-12-05 13:49:24'),
	(1117,X'412076616C756520697320726571756972656420666F7220222573222E','admin','2018-12-05 13:49:24'),
	(1118,X'50726F6A6563742064617461','admin','2018-12-05 13:49:24'),
	(1119,X'656473','admin','2018-12-05 13:49:24'),
	(1120,X'456469742070726F6A65637420636F6C6C61626F7261746F72','admin','2018-12-05 13:49:24'),
	(1121,X'28686173206E6576657220776F726B6564206F6E2070726F6A65637429','admin','2018-12-05 13:49:24'),
	(1122,X'50726F6A65637420726F6C653A','admin','2018-12-05 13:49:24'),
	(1123,X'416374697665','admin','2018-12-05 13:49:24'),
	(1124,X'53656C65637420746865206D6F64756C657320746861742077696C6C2062652061737369676E656420746F207468697320636F6C6C61626F7261746F723A','admin','2018-12-05 13:49:24'),
	(1125,X'5461786F6E2066696C652075706C6F6164','admin','2018-12-05 13:49:24'),
	(1126,X'435356206669656C642064656C696D697465723A','admin','2018-12-05 13:49:24'),
	(1127,X'28636F6D6D6129','admin','2018-12-05 13:49:24'),
	(1128,X'2873656D692D636F6C6F6E29','admin','2018-12-05 13:49:24'),
	(1129,X'7461622073746F70','admin','2018-12-05 13:49:24'),
	(1130,X'546F206C6F61642061206C697374206F6620746178612066726F6D2066696C652C20636C69636B20746865202762726F777365272D627574746F6E2061626F76652C2073656C656374207468652066696C6520746F206C6F61642066726F6D20796F757220636F6D707574657220616E6420636C69636B202775706C6F6164272E0D0A54686520636F6E74656E7473206F66207468652066696C652077696C6C20626520646973706C6179656420736F20796F752063616E20726576696577207468656D206265666F726520746865792061726520736176656420746F20796F75722070726F6A65637427732064617461626173652E','admin','2018-12-05 13:49:24'),
	(1131,X'5468652066696C65206D757374206D6565742074686520666F6C6C6F77696E6720636F6E646974696F6E733A','admin','2018-12-05 13:49:24'),
	(1132,X'54686520666F726D6174206E6565647320746F206265204353562E','admin','2018-12-05 13:49:24'),
	(1133,X'546865206669656C642064656C696D69746572206D757374206265206120636F6D6D612C2073656D692D636F6C6F6E206F72207461622073746F702C20616E642063616E2062652073656C65637465642061626F76652E','admin','2018-12-05 13:49:24'),
	(1134,X'546865206669656C647320696E20746865204353562D66696C65202A6D61792A20626520656E636C6F73656420627920222028646F75626C652D71756F746573292C206275742074686973206973206E6F74206D616E6461746F72792E','admin','2018-12-05 13:49:24'),
	(1135,X'54686572652073686F756C64206265206F6E65207461786F6E20706572206C696E652E204E6F20686561646572206C696E652073686F756C642062652070726573656E742E','admin','2018-12-05 13:49:24'),
	(1136,X'45616368207461786F6E20636F6E7369737473206F662074686520666F6C6C6F77696E67206669656C64733A','admin','2018-12-05 13:49:24'),
	(1137,X'5461786F6E206E616D65','admin','2018-12-05 13:49:24'),
	(1138,X'5461786F6E2072616E6B','admin','2018-12-05 13:49:24'),
	(1139,X'696E2074686174206F726465722E205468652066697273742074776F20617265206D616E6461746F72792E20','admin','2018-12-05 13:49:24'),
	(1140,X'52616E6B732073686F756C64206D6174636820746865206C697374206F662072616E6B7320796F7520686176652073656C656374656420666F7220796F75722070726F6A6563742E','admin','2018-12-05 13:49:24'),
	(1141,X'54686573652063757272656E746C79206172653A','admin','2018-12-05 13:49:24'),
	(1142,X'54617861207769746820612072616E6B207468617420646F6573206E6F742061707065617220696E2074686973206C6973742077696C6C206E6F74206265206C6F616465642E','admin','2018-12-05 13:49:24'),
	(1143,X'4879627269647320617265206F6E6C7920706F737369626C6520666F722074686520666F6C6C6F77696E672072616E6B733A','admin','2018-12-05 13:49:24'),
	(1144,X'506172656E742D6368696C642072656C6174696F6E732061726520617373756D656420746F702D646F776E2C206F6E65206272616E636820617420612074696D652E20466F7220696E7374616E63652C206C6F6164696E673A','admin','2018-12-05 13:49:24'),
	(1145,X'696E2074686973206F726465722077696C6C20636F72726563746C79206D61696E7461696E207468652072656C6174696F6E73206265747765656E2047656E75732C205370656369657320616E6420496E667261737065636965732E','admin','2018-12-05 13:49:24'),
	(1146,X'446F776E6C6F616420612073616D706C65204353562D66696C65','admin','2018-12-05 13:49:24'),
	(1147,X'496D706F7274207461786F6E20636F6E74656E742066726F6D2066696C65','admin','2018-12-05 13:49:24'),
	(1148,X'546F206C6F6164207461786120636F6E74656E742066726F6D2066696C652C20636C69636B20746865202762726F777365272D627574746F6E2061626F76652C2073656C656374207468652066696C6520746F206C6F61642066726F6D20796F757220636F6D707574657220616E6420636C69636B202775706C6F6164272E','admin','2018-12-05 13:49:24'),
	(1149,X'45616368206C696E6520636F6E7369737473206F662074686520666F6C6C6F77696E67206669656C64733A','admin','2018-12-05 13:49:24'),
	(1150,X'5461786F6E204944202863757272656E746C79207468657265206973206E6F206175746F6D61746564206C6F6F6B7570202D20736F72727929','admin','2018-12-05 13:49:24'),
	(1151,X'4C616E6775616765204944','admin','2018-12-05 13:49:24'),
	(1152,X'4F6E65206F72206D6F7265206669656C647320636F6E7461696E696E67207468652061637475616C20636F6E74656E742C206F6E65206669656C64207065722063617465676F72792E20416C6C20636F6E74656E742077696C6C206265206C6F61646564203C693E61732069733C2F693E2C20616E642077696C6C206F766572777269746520616E79206578697374616E74206461746120666F72207468617420636F6D62696E6174696F6E206F66207461786F6E20616E642063617465676F72792E','admin','2018-12-05 13:49:24'),
	(1153,X'5468652066697273742074776F206669656C647320617265206D616E6461746F72792C20616C6C206669656C64732061726520657870656374656420696E20746865206F7264657220646973706C617965642061626F76652E','admin','2018-12-05 13:49:24'),
	(1154,X'546865206669727374206C696E652073686F756C6420636F6E7461696E20746865206669656C6420686561646572733A','admin','2018-12-05 13:49:24'),
	(1155,X'5461786F6E2049443A206F7074696F6E616C2C2070726F6772616D206578706C696369746C7920657870656374732074686520666972737420636F6C756D6E20746F20626520746865207461786F6E2049442E','admin','2018-12-05 13:49:24'),
	(1156,X'4C616E67756167652049443A206F7074696F6E616C2C2070726F6772616D206578706C696369746C7920657870656374732074686520666972737420636F6C756D6E20746F20626520746865207461786F6E2049442E','admin','2018-12-05 13:49:24'),
	(1157,X'54686520636F6E74656E7420636F6C756D6E732073686F756C642068617665207468652073797374656D206E616D6573206F662074686520636F72726573706F6E64696E672063617465676F7269657320696E20796F75722070726F6A6563742E2043757272656E746C792C207468657365206172653A','admin','2018-12-05 13:49:24'),
	(1158,X'4F6E65206F72206D6F7265206669656C647320636F6E7461696E696E67207468652061637475616C20636F6E74656E742C206F6E65206669656C64207065722063617465676F72792E20416C6C20636F6E74656E742077696C6C206265206C6F61646564203C693E61732069733C2F693E2C20616E79206578697374616E74206461746120666F72207468617420636F6D62696E6174696F6E206F66207461786F6E20616E642063617465676F72792077696C6C206265206F7665727772697474656E2E','admin','2018-12-05 13:49:24'),
	(1159,X'4F6E65206F72206D6F7265206669656C647320636F6E7461696E696E67207468652061637475616C20636F6E74656E742C206F6E65206669656C64207065722063617465676F72792E20416C6C20636F6E74656E742077696C6C206265206C6F61646564203C693E61732069733C2F693E2C20616E79206578697374656E74206461746120666F72207468617420636F6D62696E6174696F6E206F66207461786F6E20616E642063617465676F72792077696C6C206265206F7665727772697474656E20776974686F7574207761726E696E672E','admin','2018-12-05 13:49:24'),
	(1160,X'54686520636F6E74656E7420636F6C756D6E20686561646572732073686F756C6420636F6E7461696E207468652073797374656D206E616D6573206F662074686520636F72726573706F6E64696E672063617465676F7269657320696E20796F75722070726F6A6563742E2043757272656E746C792C207468657365206172653A','admin','2018-12-05 13:49:24'),
	(1161,X'556E6B6E6F776E2072616E6B','admin','2018-12-05 13:49:24'),
	(1162,X'55707065726D6F7374207461786F6E206973206E6F7420612025732C20616E642068617320612072616E6B207468617420686173206E6F20696D6D65646961746520706172656E742E','admin','2018-12-05 13:49:24'),
	(1163,X'546865206669656C642064656C696D69746572206D757374206265206120636F6D6D612E','admin','2018-12-05 13:49:24'),
	(1164,X'73617665642028636F756C64206E6F742073617665206365727461696E2048544D4C2D7461677329','admin','2018-12-05 13:49:24'),
	(1165,X'53706563696573206D6F64756C653A2022257322','app','2018-12-05 13:49:24'),
	(1166,X'48696768657220746178613A2022257322','app','2018-12-05 13:49:24'),
	(1167,X'4B65797320666F7220224575706861757369696473206F662074686520576F726C64204F6365616E22','admin','2018-12-05 13:49:24'),
	(1168,X'4164646974696F6E616C206461746120666F7220224575706861757369696473206F662074686520576F726C64204F6365616E22','admin','2018-12-05 13:49:24'),
	(1169,X'5365742072756E74696D65206B65792074797065','admin','2018-12-05 13:49:24'),
	(1170,X'536574207468652074797065206F66206B657920746861742077696C6C2061707065617220696E207468652072756E74696D6520696E746572666163653A','admin','2018-12-05 13:49:24'),
	(1171,X'446973747269627574696F6E','admin','2018-12-05 13:49:24'),
	(1172,X'496E73756666696369656E7420646174612E','admin','2018-12-05 13:49:24'),
	(1173,X'4F6E65206F72206D6F7265206669656C647320636F6E7461696E696E67207468652061637475616C20636F6E74656E742C206F6E65206669656C64207065722063617465676F72792E20416C6C20636F6E74656E742077696C6C206265206C6F61646564203C693E61732069733C2F693E2C20616E79206578697374616E74206461746120666F72207468617420636F6D62696E6174696F6E206F66207461786F6E20616E642063617465676F72792077696C6C206265206F7665727772697474656E20776974686F7574207761726E696E672E','admin','2018-12-05 13:49:24'),
	(1174,X'4B65797320666F722022446167766C696E646572732076616E204575726F706122','admin','2018-12-05 13:49:24'),
	(1175,X'4164646974696F6E616C206461746120666F722022446167766C696E646572732076616E204575726F706122','admin','2018-12-05 13:49:24'),
	(1176,X'4B65797320666F7220222D746573742070726F6A65637420C2AB4F727978C2BB2028323031332D30342D31365430393A34353A32342B30323A30302922','admin','2018-12-05 13:49:24'),
	(1177,X'4B65797320666F7220222D746573742070726F6A65637420C2AB4C6F6273746572C2BB2028323031332D30342D31365431303A30333A33382B30323A30302922','admin','2018-12-05 13:49:24'),
	(1178,X'4B65797320666F7220222D746573742070726F6A65637420C2AB4561676C65C2BB2028323031332D30342D31365431303A30373A35312B30323A30302922','admin','2018-12-05 13:49:24'),
	(1179,X'43686F6F73652061206D617472697820746F20757365','app','2018-12-05 13:49:24'),
	(1180,X'4B65797320666F7220222D746573742070726F6A65637420C2AB57617370C2BB2028323031332D30342D31365431343A31333A30302B30323A30302922','admin','2018-12-05 13:49:24'),
	(1181,X'4164646974696F6E616C206461746120666F7220222D746573742070726F6A65637420C2AB57617370C2BB2028323031332D30342D31365431343A31333A30302B30323A30302922','admin','2018-12-05 13:49:24'),
	(1182,X'41206465736372697074696F6E2069732072657175697265642E','admin','2018-12-05 13:49:24'),
	(1183,X'4D6173732075706C6F616420696D61676573','admin','2018-12-05 13:49:24'),
	(1184,X'436C656172206361636865','admin','2018-12-05 13:49:24'),
	(1185,X'47656E65726963206578706F7274','admin','2018-12-05 13:49:24'),
	(1186,X'4578706F7274206D756C74692D656E747279206B657920666F72204C696E6E61657573204D6F62696C65','admin','2018-12-05 13:49:24'),
	(1187,X'4D616E6167652062617369632070726F6A65637420696E666F726D6174696F6E','admin','2018-12-05 13:49:24'),
	(1188,X'4D616E6167652070726F6A656374206D6F64756C6573','admin','2018-12-05 13:49:24'),
	(1189,X'4D616E6167652073797374656D2073657474696E6773','admin','2018-12-05 13:49:24'),
	(1190,X'456E7469747920636F756E7420666F722063757272656E742070726F6A656374','admin','2018-12-05 13:49:24'),
	(1191,X'4D65726765206F746865722070726F6A65637420696E746F2063757272656E742070726F6A656374','admin','2018-12-05 13:49:24'),
	(1192,X'496D706F72742072656D6F746520696D616765732066726F6D2066696C65','admin','2018-12-05 13:49:24'),
	(1193,X'4C69737420616C6C2073796E6F6E796D73','admin','2018-12-05 13:49:24'),
	(1194,X'4C69737420616C6C20636F6D6D6F6E206E616D6573','admin','2018-12-05 13:49:24'),
	(1195,X'4C697465726174757265207632','app','2018-12-05 13:49:24'),
	(1196,X'596F75722073656172636820666F7220222573222070726F6475636564206E6F20726573756C74732E','app','2018-12-05 13:49:24'),
	(1197,X'457874656E7369766520736561726368','admin','2018-12-05 13:49:24'),
	(1198,X'4C697465726174757265207632','admin','2018-12-05 13:49:24'),
	(1199,X'53706563696573206E616D6573','admin','2018-12-05 13:49:24'),
	(1200,X'53706563696573206465736372697074696F6E73','admin','2018-12-05 13:49:24'),
	(1201,X'537065636965732073796E6F6E796D73','admin','2018-12-05 13:49:24'),
	(1202,X'5370656369657320636F6D6D6F6E206E616D6573','admin','2018-12-05 13:49:24'),
	(1203,X'53706563696573206D65646961','admin','2018-12-05 13:49:24'),
	(1204,X'436F6C6C6170736520616C6C','app','2018-12-05 13:49:24'),
	(1205,X'496E666F726D61746965206F70204E656465726C616E647320536F6F7274656E7265676973746572','app','2018-12-05 13:49:24'),
	(1206,X'6F706E6965757720626567696E6E656E','app','2018-12-05 13:49:24'),
	(1207,X'4E6F207461786F6E204944207370656369666965642E','admin','2018-12-05 13:49:24'),
	(1208,X'4869676865722074617861206C697374','admin','2018-12-05 13:49:24'),
	(1209,X'4461746120696D706F7274','admin','2018-12-05 13:49:24'),
	(1210,X'53776974636820746F206869676865722074617861206C697374','admin','2018-12-05 13:49:24'),
	(1211,X'4973206265696E6720656469746564206279','admin','2018-12-05 13:49:24'),
	(1212,X'41726520796F75207375726520796F752077616E7420746F207065726D616E656E746C7920736F727420746865207461786120616C7068616265746963616C6C7920706572207461786F6E6F6D6963206C6576656C3F','admin','2018-12-05 13:49:24'),
	(1213,X'436C6561722070726F6A656374206361636865','admin','2018-12-05 13:49:24'),
	(1214,X'5461786F6E206E616D6573','app','2018-12-05 13:49:24'),
	(1215,X'57656C636F6D652C2025732E','admin','2018-12-05 13:49:24'),
	(1216,X'446174617479706573','app','2018-12-05 13:49:24'),
	(1217,X'5374657073','app','2018-12-05 13:49:24'),
	(1218,X'43686F69636573','app','2018-12-05 13:49:24'),
	(1219,X'4974656D73','app','2018-12-05 13:49:24'),
	(1220,X'5665726E6163756C617273','app','2018-12-05 13:49:24'),
	(1221,X'496D706F7274207461786F6E20747265652066726F6D20436174616C6F677565204F66204C696665','admin','2018-12-05 13:49:24'),
	(1222,X'444E4120626172636F646573','app','2018-12-05 13:49:24'),
	(1223,X'4E6F206F7220756E6B6E6F776E207461786F6E204944207370656369666965642E','app','2018-12-05 13:49:24'),
	(1224,X'4E6F206F7220696C6C6567616C207461786F6E204944207370656369666965642E','app','2018-12-05 13:49:24'),
	(1225,X'4E6F6D656E636C6174757265','app','2018-12-05 13:49:24'),
	(1226,X'4E6F206F7220696C6C6567616C2070726F6A656374204944207370656369666965642E','app','2018-12-05 13:49:24'),
	(1229,X'41727469636C65','app','2018-12-05 13:49:24'),
	(1230,X'426F6F6B','app','2018-12-05 13:49:24'),
	(1231,X'5265706F7274','app','2018-12-05 13:49:24'),
	(1232,X'426F6F6B50617274','app','2018-12-05 13:49:24'),
	(1233,X'53657269616C576F726B','app','2018-12-05 13:49:24'),
	(1234,X'6D616E75736372697074','app','2018-12-05 13:49:24'),
	(1235,X'507265737352656C65617365','app','2018-12-05 13:49:24'),
	(1236,X'506572696F646963616C','app','2018-12-05 13:49:24'),
	(1237,X'43686170746572','app','2018-12-05 13:49:24'),
	(1312,X'557365722063616E206F6E6C792062652064656C657465642062792073797374656D2061646D696E2E','admin','2018-12-05 13:49:24'),
	(1239,X'706167696E613A','app','2018-12-05 13:49:24'),
	(1240,X'4E61616D676576696E67','app','2018-12-05 13:49:24'),
	(1241,X'6765656E','app','2018-12-05 13:49:24'),
	(1242,X'736F6F7274656E20696E20746F7461616C','app','2018-12-05 13:49:24'),
	(1243,X'696E6865656D73','app','2018-12-05 13:49:24'),
	(1244,X'53746174757320766F6F726B6F6D656E3A','app','2018-12-05 13:49:24'),
	(1245,X'4E69657473206765766F6E64656E2E','app','2018-12-05 13:49:24'),
	(1246,X'676576657374696764','app','2018-12-05 13:49:24'),
	(1247,X'436F6D706C657465206578706F727420666F72204C696E6E61657573204D6F62696C65','admin','2018-12-05 13:49:24'),
	(1248,X'73617665206E6577206F72646572','admin','2018-12-05 13:49:24'),
	(1249,X'7461786F6E6F6D79','admin','2018-12-05 13:49:24'),
	(1250,X'6E616D6573','admin','2018-12-05 13:49:24'),
	(1251,X'7061676573','admin','2018-12-05 13:49:24'),
	(1252,X'41616E74616C20736F6F7274656E20696E204E656465726C616E64','app','2018-12-05 13:49:24'),
	(1253,X'41616E74616C20736F6F7274656E20696E204E656465726C616E64206D65742073746174757320766F6F726B6F6D656E20312C2031612C20322C203261206F66203262','app','2018-12-05 13:49:24'),
	(1254,X'536F6F7274656E206D657420666F746F2773','app','2018-12-05 13:49:24'),
	(1255,X'41616E74616C20736F6F7274656E20696E2068657420536F6F7274656E7265676973746572206D657420C3A9C3A96E206F66206D65657220666F746F2773','app','2018-12-05 13:49:24'),
	(1256,X'546F7461616C2061616E74616C20736F6F7274666F746F277320696E2068657420536F6F7274656E7265676973746572','app','2018-12-05 13:49:24'),
	(1257,X'466F746F2773','app','2018-12-05 13:49:24'),
	(1258,X'4765616363657074656572646520736F6F72746E616D656E','app','2018-12-05 13:49:24'),
	(1259,X'4E656465726C616E647365206E616D656E','app','2018-12-05 13:49:24'),
	(1260,X'09456E67656C7365206E616D656E','app','2018-12-05 13:49:24'),
	(1261,X'456E67656C7365206E616D656E','app','2018-12-05 13:49:24'),
	(1262,X'4C69746572617475757262726F6E6E656E','app','2018-12-05 13:49:24'),
	(1263,X'5370656369616C697374656E','app','2018-12-05 13:49:24'),
	(1264,X'41616E74616C20736F6F7274656E20696E204E656465726C616E64206D65742073746174757320766F6F726B6F6D656E20312C2031612C20322C203261206F662032622E','app','2018-12-05 13:49:24'),
	(1265,X'4E6F2072616E6B732068617665206265656E20646566696E65642E','admin','2018-12-05 13:49:24'),
	(1266,X'436F6E74656E74206E6F7420666F756E642E','admin','2018-12-05 13:49:24'),
	(1267,X'42656B696A6B20616C6C65206765676576656E73','app','2018-12-05 13:49:24'),
	(1268,X'4D65657220726563656E74652061666265656C64696E67656E','app','2018-12-05 13:49:24'),
	(1269,X'4C6F6361746965','app','2018-12-05 13:49:24'),
	(1270,X'466F746F6772616166','app','2018-12-05 13:49:24'),
	(1271,X'56616C696461746F72','app','2018-12-05 13:49:24'),
	(1272,X'446174756D20706C61617473696E67','app','2018-12-05 13:49:24'),
	(1273,X'47656E657261746520706172656E74616765207461626C65','admin','2018-12-05 13:49:24'),
	(1274,X'46696E6420737065636965733A','admin','2018-12-05 13:49:24'),
	(1275,X'4E6577207461786F6E20636F6E63657074','admin','2018-12-05 13:49:24'),
	(1276,X'4E616D657320666F722022257322','admin','2018-12-05 13:49:24'),
	(1277,X'437265617465206E6577207265666572656E6365','admin','2018-12-05 13:49:24'),
	(1278,X'42726F777365207265666572656E636573','admin','2018-12-05 13:49:24'),
	(1279,X'536561726368207265666572656E636573','admin','2018-12-05 13:49:24'),
	(1280,X'45646974206C697465726174757265','admin','2018-12-05 13:49:24'),
	(1281,X'45646974207265666572656E6365','admin','2018-12-05 13:49:24'),
	(1282,X'46696E6420746178613A','admin','2018-12-05 13:49:24'),
	(1283,X'566572737072656964696E67736B61617274656E','app','2018-12-05 13:49:24'),
	(1284,X'5472656E646772616669656B656E','app','2018-12-05 13:49:24'),
	(1285,X'31','app','2018-12-05 13:49:24'),
	(1286,X'45646974207461786F6E20636F6E63657074','admin','2018-12-05 13:49:24'),
	(1287,X'4163746976697479206C6F67','admin','2018-12-05 13:49:24'),
	(1288,X'42657765726B20776574656E736368617070656C696A6B65206E61616D','admin','2018-12-05 13:49:24'),
	(1289,X'42657765726B206E616D65','admin','2018-12-05 13:49:24'),
	(1290,X'436C6F7365','admin','2018-12-05 13:49:24'),
	(1291,X'52657365742070617373776F7264','admin','2018-12-05 13:49:24'),
	(1292,X'546F20726573657420796F75722070617373776F72642C20656E74657220796F7520652D6D61696C206164647265737320616E64207072657373202272657365742070617373776F7264223A','admin','2018-12-05 13:49:24'),
	(1293,X'596F757220652D6D61696C616464726573733A','admin','2018-12-05 13:49:24'),
	(1294,X'4261636B20746F206C6F67696E','admin','2018-12-05 13:49:24'),
	(1295,X'546178612067656D61726B6565726420616C732076657277696A64657264','admin','2018-12-05 13:49:24'),
	(1296,X'50726F6A65637420636F6C6C61626F7261746F722064617461','admin','2018-12-05 13:49:24'),
	(1297,X'452D6D61696C206E6F74696669636174696F6E733A','admin','2018-12-05 13:49:24'),
	(1298,X'72656D6F76652066726F6D2070726F6A656374','admin','2018-12-05 13:49:24'),
	(1299,X'4C617374206C6F67696E3A','admin','2018-12-05 13:49:24'),
	(1300,X'4D6F64756C652061737369676E6D656E7420696E2063757272656E742070726F6A6563742C20222573223A','admin','2018-12-05 13:49:24'),
	(1301,X'61737369676E','admin','2018-12-05 13:49:24'),
	(1302,X'54686973207573657220697320616C736F20636F6C6C61626F726174696E6720696E2074686520666F6C6C6F77696E672070726F6A656374733A','admin','2018-12-05 13:49:24'),
	(1303,X'45646974206163746F72','admin','2018-12-05 13:49:24'),
	(1304,X'706167696E613A','admin','2018-12-05 13:49:24'),
	(1305,X'496D706F7274204E4243206D756C74692D656E747279206B6579','admin','2018-12-05 13:49:24'),
	(1306,X'496D706F7274206C6162656C7320666F72204E4243206D756C74692D656E747279206B6579','admin','2018-12-05 13:49:24'),
	(1307,X'596F7520617265206E6F7420617574686F72697A656420746F20646F20746861742E','admin','2018-12-05 13:49:24'),
	(1308,X'546F206761696E2061636365737320746F20746865207061676520796F75207765726520617474656D7074696E6720746F20766965772C20706C6561736520636F6E74616374206F6E65206F6620746865206C6561642065787065727473206F6620796F75722070726F6A6563743A','admin','2018-12-05 13:49:24'),
	(1309,X'45646974207461786F6E2070617373706F7274','admin','2018-12-05 13:49:24'),
	(1310,X'5461786F6E20696D61676573','admin','2018-12-05 13:49:24'),
	(1311,X'4C6974657261747575722028763229','app','2018-12-05 13:49:24'),
	(1313,X'52656D6F766520636F6C6C61626F7261746F72','admin','2018-12-05 13:49:24'),
	(1314,X'52656D6F76652075736572','admin','2018-12-05 13:49:24'),
	(1315,X'776974682074686520726F6C65206F66','admin','2018-12-05 13:49:24'),
	(1316,X'66726F6D2070726F6A656374','admin','2018-12-05 13:49:24'),
	(1317,X'452D6D61696C206164647265737320616C7265616479206578697374732E','admin','2018-12-05 13:49:24'),
	(1318,X'41737369676E20636F6C6C61626F7261746F7220746F206D6F64756C65','admin','2018-12-05 13:49:24'),
	(1319,X'41737369676E2075736572','admin','2018-12-05 13:49:24'),
	(1320,X'746F20746865206D6F64756C65','admin','2018-12-05 13:49:24'),
	(1321,X'696E207468652070726F6A656374','admin','2018-12-05 13:49:24'),
	(1322,X'557365722064617461207361766564','admin','2018-12-05 13:49:24'),
	(1323,X'4F6D73636872696A76696E67','app','2018-12-05 13:49:24'),
	(1324,X'446174756D','app','2018-12-05 13:49:24'),
	(1325,X'4765706C6161747374206F70','app','2018-12-05 13:49:24'),
	(1326,X'436F70797269676874','app','2018-12-05 13:49:24'),
	(1327,X'436F6E74616374616472657320666F746F6772616166','app','2018-12-05 13:49:24'),
	(1328,X'5374616E642076616E207A616B656E','app','2018-12-05 13:49:24'),
	(1329,X'48657420736F6F7274656E7265676973746572206265766174','app','2018-12-05 13:49:24'),
	(1330,X'496D706F7274206C696E6B7320746F2072656D6F746520696D616765732066726F6D204353562D66696C65','admin','2018-12-05 13:49:24'),
	(1331,X'496D706F7274206C696E6B7320746F206C6F63616C20696D616765732066726F6D204353562D66696C65','admin','2018-12-05 13:49:24'),
	(1332,X'496D706F727420696D6167652063617074696F6E732066726F6D204353562D66696C65','admin','2018-12-05 13:49:24'),
	(1333,X'5461786F6E2067726F757073','admin','2018-12-05 13:49:24'),
	(1334,X'257320736F6F7274656E20696E20746F7461616C202F202573206765766573746967646520736F6F7274656E','app','2018-12-05 13:49:24'),
	(1335,X'496E646578746162656C2062696A7765726B656E','admin','2018-12-05 13:49:24'),
	(1336,X'4E4243206D756C74692D656E747279206B657920696D706F7274','admin','2018-12-05 13:49:24'),
	(1337,X'496D706F72742066696E6973686564','admin','2018-12-05 13:49:24'),
	(1338,X'436F756C64206E6F74207265736F6C76652063686172616374657220222573222E','admin','2018-12-05 13:49:24'),
	(1339,X'5570646174656420696D61676520666F72202225732220746F20272573272E','admin','2018-12-05 13:49:24'),
	(1340,X'436F756C64206E6F74207265736F6C7665207374617465202225732220666F7220222573222E','admin','2018-12-05 13:49:24'),
	(1341,X'52652D6576616C756174696E672063686172616374657220747970657320287573696E672073657474696E6720226E65656420736F6D6522292E','admin','2018-12-05 13:49:24'),
	(1342,X'53657420636861726163746572207479706520666F72202225732220746F2025732E','admin','2018-12-05 13:49:24'),
	(1343,X'546F206761696E2061636365737320746F20746865207061676520796F75207765726520617474656D7074696E6720746F20766965772C20706C6561736520636F6E7461637420746865206C65616420657870657274206F6620796F75722070726F6A6563743A','admin','2018-12-05 13:49:24'),
	(1344,X'41737369676E20636F6C6C61626F7261746F7220746F206D6F64756C6573','admin','2018-12-05 13:49:24'),
	(1345,X'41737369676E20636F6C6C61626F7261746F727320746F20776F726B206F6E206D6F64756C65733A','admin','2018-12-05 13:49:24'),
	(1346,X'41737369676E20636F6C6C61626F7261746F727320746F20776F726B206F6E2066726565206D6F64756C65733A','admin','2018-12-05 13:49:24'),
	(1347,X'72656D6F766520617320636F6C6C61626F7261746F72','admin','2018-12-05 13:49:24'),
	(1348,X'656469742075736572','admin','2018-12-05 13:49:24'),
	(1349,X'61646420617320636F6C6C61626F7261746F72','admin','2018-12-05 13:49:24'),
	(1350,X'61646420616C6C20636F6C6C61626F7261746F7273','admin','2018-12-05 13:49:24'),
	(1351,X'6E6F2066726565206D6F64756C65732068617665206265656E20646566696E6564','admin','2018-12-05 13:49:24'),
	(1352,X'676F20257368657265257320746F20646566696E65206D6F64756C6573','admin','2018-12-05 13:49:24'),
	(1353,X'55697467656272656964207A6F656B656E206E61617220736F6F7274656E','app','2018-12-05 13:49:24'),
	(1354,X'536F6F727467726F6570','app','2018-12-05 13:49:24'),
	(1355,X'53746174757320766F6F726B6F6D656E','app','2018-12-05 13:49:24'),
	(1356,X'6B6C696B20766F6F722068656C70206F76657220646974206F6E6465726465656C','app','2018-12-05 13:49:24'),
	(1357,X'6765766573746967646520736F6F7274656E','app','2018-12-05 13:49:24'),
	(1358,X'6E696574206765766573746967646520736F6F7274656E','app','2018-12-05 13:49:24'),
	(1359,X'4D756C74696D65646961','app','2018-12-05 13:49:24'),
	(1360,X'6D657420666F746F28277329','app','2018-12-05 13:49:24'),
	(1361,X'6D657420766572737072656964696E67736B61617274','app','2018-12-05 13:49:24'),
	(1362,X'6D6574207472656E646772616669656B','app','2018-12-05 13:49:24'),
	(1363,X'444E4120626172636F64696E67','app','2018-12-05 13:49:24'),
	(1364,X'6D65742065656E206F66206D656572206578656D706C6172656E207665727A616D656C64','app','2018-12-05 13:49:24'),
	(1365,X'6D696E6465722064616E2064726965206578656D706C6172656E207665727A616D656C64','app','2018-12-05 13:49:24'),
	(1366,X'476573656C6563746565726465206B656E6D65726B656E','app','2018-12-05 13:49:24'),
	(1367,X'616C6C65732076657277696A646572656E','app','2018-12-05 13:49:24'),
	(1368,X'526573756C746174656E20736F72746572656E206F703A','app','2018-12-05 13:49:24'),
	(1369,X'576574656E736368617070656C696A6B206E61616D','app','2018-12-05 13:49:24'),
	(1370,X'4E656465726C616E647365206E61616D','app','2018-12-05 13:49:24'),
	(1371,X'53746174757320766F6F726B6F6D656E3D22','app','2018-12-05 13:49:24'),
	(1372,X'766F6F72','app','2018-12-05 13:49:24'),
	(1373,X'45786F74656E','app','2018-12-05 13:49:24'),
	(1374,X'456469742074726169742067726F757073','admin','2018-12-05 13:49:24'),
	(1375,X'55706C6F616420612064617461207368656574','admin','2018-12-05 13:49:24'),
	(1376,X'53656C6563742070726F6A6563742064617461207479706573','admin','2018-12-05 13:49:24'),
	(1377,X'54726169742067726F757073','admin','2018-12-05 13:49:24'),
	(1378,X'54726169742067726F7570','admin','2018-12-05 13:49:24'),
	(1379,X'54726169742067726F757020747261697473','admin','2018-12-05 13:49:24'),
	(1380,X'25733A20747261697473','admin','2018-12-05 13:49:24'),
	(1381,X'25733A206E6577207472616974','admin','2018-12-05 13:49:24'),
	(1382,X'6461746120747970653A','admin','2018-12-05 13:49:24'),
	(1383,X'6461746520666F726D61743A','admin','2018-12-05 13:49:24'),
	(1384,X'73797374656D206E616D65','admin','2018-12-05 13:49:24'),
	(1385,X'636F6465','admin','2018-12-05 13:49:24'),
	(1386,X'6465736372697074696F6E','admin','2018-12-05 13:49:24'),
	(1387,X'6D61782E206C656E677468','admin','2018-12-05 13:49:24'),
	(1388,X'756E6974','admin','2018-12-05 13:49:24'),
	(1389,X'50726F6A6563742064617461207479706573','admin','2018-12-05 13:49:24'),
	(1390,X'5472616974732073657474696E6773','admin','2018-12-05 13:49:24'),
	(1391,X'446174612075706C6F6164','admin','2018-12-05 13:49:24'),
	(1392,X'25733A202573','admin','2018-12-05 13:49:24'),
	(1393,X'54726169742076616C756573','admin','2018-12-05 13:49:24'),
	(1394,X'76616C756573','admin','2018-12-05 13:49:24'),
	(1395,X'63757272656E742076616C75657320282573293A','admin','2018-12-05 13:49:24'),
	(1396,X'63616E6E6F7420616464206120656D7074792076616C7565','admin','2018-12-05 13:49:24'),
	(1397,X'25732076616C756573207361766564','admin','2018-12-05 13:49:24'),
	(1398,X'69732067656C696A6B2061616E','app','2018-12-05 13:49:24'),
	(1399,X'6973206F6E67656C696A6B2061616E','app','2018-12-05 13:49:24'),
	(1400,X'6E61','app','2018-12-05 13:49:24'),
	(1401,X'6E61206F662067656C696A6B2061616E','app','2018-12-05 13:49:24'),
	(1402,X'766F6F72206F662067656C696A6B2061616E','app','2018-12-05 13:49:24'),
	(1403,X'6C6967742074757373656E','app','2018-12-05 13:49:24'),
	(1404,X'6C696774206E6965742074757373656E','app','2018-12-05 13:49:24'),
	(1405,X'76616C75652063616E6E6F74206265206E756C6C','admin','2018-12-05 13:49:24'),
	(1406,X'696C6C6567616C2076616C7565','admin','2018-12-05 13:49:24'),
	(1407,X'7765616B207472616974206D61746368','admin','2018-12-05 13:49:24'),
	(1408,X'44617461206D617463686564','admin','2018-12-05 13:49:24'),
	(1409,X'5365636F6E642076616C75652073616D652061732066697273743A206E6F7420612072616E67652028636F6C756D6E2025732C206C696E657320257320262025733A2025733D3D257329','admin','2018-12-05 13:49:24'),
	(1410,X'556E7265736F6C7661626C65207461786F6E3A2025732028257329','admin','2018-12-05 13:49:24'),
	(1411,X'53617665642025732076616C7565732C206661696C65642025732E','admin','2018-12-05 13:49:24'),
	(1412,X'44617461207361766564','admin','2018-12-05 13:49:24'),
	(1413,X'6D657420666F746F27733B20','app','2018-12-05 13:49:24'),
	(1414,X'45786F74656E706173706F6F7274','app','2018-12-05 13:49:24'),
	(1415,X'45786F74656E706173706F6F7274656E','app','2018-12-05 13:49:24'),
	(1416,X'6D6574206E6F6720444E412D6578656D706C6172656E207465207665727A616D656C656E3B20','app','2018-12-05 13:49:24'),
	(1417,X'6D657420444E412D6578656D706C6172656E207665727A616D656C643B20','app','2018-12-05 13:49:24'),
	(1418,X'53746174757320766F6F726B6F6D656E3D','app','2018-12-05 13:49:24'),
	(1419,X'4D657420666F746F27733B20','app','2018-12-05 13:49:24'),
	(1420,X'42756C6B2075706C6F616420286D61746368696E6729','admin','2018-12-05 13:49:24'),
	(1421,X'5461786F6E2074726169742064617461','admin','2018-12-05 13:49:24'),
	(1422,X'4D657420766572737072656964696E67736B6161727428656E293B20','app','2018-12-05 13:49:24'),
	(1423,X'5A6F6E646572207472656E646772616669656B3B20','app','2018-12-05 13:49:24'),
	(1424,X'4D657420444E412D6578656D706C6172656E207665727A616D656C643B20','app','2018-12-05 13:49:24'),
	(1425,X'556E6B6E6F776E207265666572656E6365206964202573','admin','2018-12-05 13:49:24'),
	(1426,X'4D6574206E6F6720444E412D6578656D706C6172656E207465207665727A616D656C656E3B20','app','2018-12-05 13:49:24'),
	(1427,X'42756C6B2075706C6F6164202866757274686572206D61746368696E6729','admin','2018-12-05 13:49:24'),
	(1428,X'42756C6B2075706C6F61642028736176696E6729','admin','2018-12-05 13:49:24'),
	(1429,X'536176656420617574686F722022257322','admin','2018-12-05 13:49:24'),
	(1430,X'5361766564207265666572656E63652022257322','admin','2018-12-05 13:49:24'),
	(1431,X'72656469726563747320746F3A','admin','2018-12-05 13:49:24'),
	(1432,X'4E5352204944207265736F6C766572','admin','2018-12-05 13:49:24'),
	(1433,X'4D756C74692D707572706F7365206578706F7274','admin','2018-12-05 13:49:24'),
	(1434,X'4D6574207472656E646772616669656B3B20','app','2018-12-05 13:49:24'),
	(1435,X'466F7220736F6D65206F7220616C6C20746178612C20746865726520616C7265616479206172652076616C75657320666F7220746869732074726169742067726F757020696E207468652064617461626173652E2054686573652077696C6C206265206F7665727772697474656E20627920796F7572206E657720646174612E','admin','2018-12-05 13:49:24'),
	(1436,X'756E7265736F6C766564207265666572656E6365','admin','2018-12-05 13:49:24'),
	(1437,X'75706C6F616420612066696C652077697468207265666572656E63652023202F206C6974657261747572652049442064617461','admin','2018-12-05 13:49:24'),
	(1438,X'5265736F6C766564207265666572656E6365202320257320746F2022257322','admin','2018-12-05 13:49:24'),
	(1439,X'636C656172206C6173742075706C6F6164','admin','2018-12-05 13:49:24'),
	(1440,X'53756D6D617279','admin','2018-12-05 13:49:24'),
	(1441,X'53617665642025732074726169742076616C7565732C206661696C65642025732E','admin','2018-12-05 13:49:24'),
	(1442,X'287468657365207265636F7264732077657265206E6F7420736176656429','admin','2018-12-05 13:49:24'),
	(1443,X'4572726F727320647572696E6720736176696E67','admin','2018-12-05 13:49:24'),
	(1444,X'287468657365207265636F726473207765726520736176656429','admin','2018-12-05 13:49:24'),
	(1445,X'5761726E696E677320647572696E6720736176696E67','admin','2018-12-05 13:49:24'),
	(1446,X'4C6963656E746965','app','2018-12-05 13:49:24'),
	(1447,X'4D6574612D64617461','admin','2018-12-05 13:49:24'),
	(1448,X'42657765726B206E61616D','admin','2018-12-05 13:49:24'),
	(1449,X'4D6565722061666265656C64696E67656E','app','2018-12-05 13:49:24'),
	(1450,X'4E61616D20636F6E63657074206469726563742061616E70617373656E','admin','2018-12-05 13:49:24'),
	(1451,X'47656C64696765206E61616D206469726563742061616E70617373656E','admin','2018-12-05 13:49:24'),
	(1452,X'42726F77736520696D61676573','admin','2018-12-05 13:49:24'),
	(1453,X'416C6C65206B656E6D65726B656E20656E207265666572656E746965732076657277696A646572656E3F','admin','2018-12-05 13:49:24'),
	(1454,X'4D697373696E672066756E6374696F6E20224578706F7274436F6E74726F6C6C65723A3A6578706F72744E737222','admin','2018-12-05 13:49:24'),
	(1455,X'4578706F7274204E53522074617861207769746820636F6E74656E7420616E64206E616D6573','admin','2018-12-05 13:49:24'),
	(1456,X'4578706F7274207461786F6E206461746120746F20584D4C','admin','2018-12-05 13:49:24'),
	(1457,X'4D6574612D646174612062756C6B','admin','2018-12-05 13:49:24'),
	(1458,X'4D6F64756C652073657474696E6773','admin','2018-12-05 13:49:24'),
	(1459,X'4F7665727A696368742076616E206465204E656465726C616E6473652062696F6469766572736974656974','app','2018-12-05 13:49:24'),
	(1460,X'496E64656C696E67','app','2018-12-05 13:49:24'),
	(1461,X'566F6F726B6F6D656E','app','2018-12-05 13:49:24'),
	(1462,X'537461747573','app','2018-12-05 13:49:24'),
	(1463,X'48616269746174','app','2018-12-05 13:49:24'),
	(1464,X'5265666572656E746965','app','2018-12-05 13:49:24'),
	(1465,X'457870657274','app','2018-12-05 13:49:24'),
	(1466,X'576161726E656D696E67656E','app','2018-12-05 13:49:24'),
	(1467,X'55697467656272656964207A6F656B656E','app','2018-12-05 13:49:24'),
	(1468,X'466F746F2773207A6F656B656E','app','2018-12-05 13:49:24'),
	(1469,X'5461786F6E6F6D697363686520626F6F6D','app','2018-12-05 13:49:24'),
	(1470,X'6E61617220626F76656E','app','2018-12-05 13:49:24'),
	(1471,X'546F6F6C626F78','app','2018-12-05 13:49:24'),
	(1472,X'4578706F72746565722028616C732043535629','app','2018-12-05 13:49:24'),
	(1473,X'41666472756B6B656E','app','2018-12-05 13:49:24'),
	(1474,X'616C6C657320696E2D2F7569746B6C617070656E','app','2018-12-05 13:49:24'),
	(1475,X'4D657420646974207A6F656B73636865726D206D61616B206A652075697465656E6C6F70656E64652073656C65637469657320286F6E64657229736F6F7274656E2E205665727275696D206A652073656C656374696520646F6F72206D6565722064616E2031207761617264652062696E6E656E2065656E206B656E6D65726B2074652073656C6563746572656E202862696A762E20736F6F7274656E206D65742053746174757320766F6F726B6F6D656E20316120266C743B622667743B6F66266C743B2F622667743B203162292E205665726E617577206A652073656C656374696520646F6F722065656E207761617264652062696E6E656E2065656E20616E646572206B656E6D65726B2074652073656C6563746572656E202862696A762E20736F6F7274656E206D65742053746174757320766F6F726B6F6D656E20316120266C743B622667743B656E266C743B2F622667743B206D657420666F746F5C2773292E204472756B206F70203E206F6D2065656E206B656E6D65726B7761617264652074652073656C6563746572656E2E','app','2018-12-05 13:49:24'),
	(1476,X'68756C702062696A207A6F656B656E','app','2018-12-05 13:49:24'),
	(1477,X'6D61616B2065656E206B65757A65','app','2018-12-05 13:49:24'),
	(1478,X'466F746F28277329','app','2018-12-05 13:49:24'),
	(1479,X'7A6F6E64657220666F746F2773','app','2018-12-05 13:49:24'),
	(1480,X'566572737072656964696E67736B6161727428656E29','app','2018-12-05 13:49:24'),
	(1481,X'6D657420766572737072656964696E67736B6161727428656E29','app','2018-12-05 13:49:24'),
	(1482,X'7A6F6E64657220766572737072656964696E67736B61617274656E','app','2018-12-05 13:49:24'),
	(1483,X'5472656E646772616669656B','app','2018-12-05 13:49:24'),
	(1484,X'7A6F6E646572207472656E646772616669656B','app','2018-12-05 13:49:24'),
	(1485,X'76616E','app','2018-12-05 13:49:24'),
	(1486,X'536F6F7274656E2F74617861206D65742061666265656C64696E6728656E293A','app','2018-12-05 13:49:24'),
	(1487,X'466F746F','app','2018-12-05 13:49:24'),
	(1488,X'546F70203520666F746F67726166656E','app','2018-12-05 13:49:24'),
	(1489,X'466F746F67726161662028666F746FE28099732F736F6F7274656E29','app','2018-12-05 13:49:24'),
	(1490,X'42656B696A6B20766F6C6C6564696765206C696A7374','app','2018-12-05 13:49:24'),
	(1491,X'546F7020352076616C696461746F72656E','app','2018-12-05 13:49:24'),
	(1492,X'56616C696461746F722028666F746FE28099732F736F6F7274656E29','app','2018-12-05 13:49:24'),
	(1493,X'536F6F72746E61616D','app','2018-12-05 13:49:24'),
	(1494,X'4E6161722064657A6520736F6F7274','app','2018-12-05 13:49:24'),
	(1495,X'5A6F656B726573756C746174656E','app','2018-12-05 13:49:24'),
	(1496,X'47657A6F636874206F70','app','2018-12-05 13:49:24'),
	(1497,X'52656C6576616E746965','app','2018-12-05 13:49:24'),
	(1498,X'576574656E736368617070656C696A6B65206E61616D','app','2018-12-05 13:49:24'),
	(1499,X'42726F6E','app','2018-12-05 13:49:24'),
	(1500,X'417574657572287329','app','2018-12-05 13:49:24'),
	(1501,X'5075626C696361746965','app','2018-12-05 13:49:24'),
	(1502,X'546F7461616C2061616E74616C2061666265656C64696E67656E3A','app','2018-12-05 13:49:24'),
	(1503,X'426573636865726D696E6773737461747573','app','2018-12-05 13:49:24'),
	(1504,X'42726F6E3A','app','2018-12-05 13:49:24'),
	(1505,X'736F6F72746765676576656E73','app','2018-12-05 13:49:24'),
	(1506,X'41666265656C64696E67656E2062696A20736F6F72742F7461786F6E','app','2018-12-05 13:49:24'),
	(1507,X'536F6F7274656E2F74617861206D65742061666265656C64696E6728656E29','app','2018-12-05 13:49:24'),
	(1508,X'4E61616D','app','2018-12-05 13:49:24'),
	(1509,X'4973','app','2018-12-05 13:49:24'),
	(1510,X'52656769737472617469656E756D6D6572','app','2018-12-05 13:49:24'),
	(1511,X'5665727A616D656C646174756D2C20706C61617473','app','2018-12-05 13:49:24'),
	(1512,X'5665727A616D656C616172','app','2018-12-05 13:49:24'),
	(1513,X'4F7267616E697361746965','app','2018-12-05 13:49:24'),
	(1514,X'53746174757320726F6465206C696A7374','app','2018-12-05 13:49:24'),
	(1515,X'526563656E74652061666265656C64696E67656E','app','2018-12-05 13:49:24'),
	(1516,X'4A616172','app','2018-12-05 13:49:24'),
	(1517,X'546974656C','app','2018-12-05 13:49:24'),
	(1518,X'506572696F6469656B','app','2018-12-05 13:49:24'),
	(1519,X'566F6C756D65','app','2018-12-05 13:49:24'),
	(1520,X'506167696E612773','app','2018-12-05 13:49:24'),
	(1521,X'42656472656967696E6720656E20626573636865726D696E67','app','2018-12-05 13:49:24'),
	(1522,X'4F7665727A6963687420666F746F67726166656E','app','2018-12-05 13:49:24'),
	(1523,X'47657075626C69636565726420696E','app','2018-12-05 13:49:24'),
	(1524,X'526573756C746174656E','app','2018-12-05 13:49:24'),
	(1525,X'776574656E736368617070656C696A6B65206E61616D','app','2018-12-05 13:49:24'),
	(1526,X'73746174757320766F6F726B6F6D656E','app','2018-12-05 13:49:24'),
	(1527,X'6C696E6B206E61617220736F6F7274656E7265676973746572','app','2018-12-05 13:49:24'),
	(1528,X'566572737072656964696E67736B61617274','app','2018-12-05 13:49:24'),
	(1529,X'4D656572206F7665722064657A6520736F6F727420696E20646520424C574720566572737072656964696E677361746C6173','app','2018-12-05 13:49:24'),
	(1530,X'5569746765766572','app','2018-12-05 13:49:24'),
	(1531,X'4C696E6B','app','2018-12-05 13:49:24'),
	(1532,X'5075626C69636174696573','app','2018-12-05 13:49:24'),
	(1533,X'4F7665727A696368742076616C696461746F72656E','app','2018-12-05 13:49:24'),
	(1534,X'5265666572656E746965206E696574206765766F6E64656E2E','app','2018-12-05 13:49:24'),
	(1535,X'736F6F727420286F66206F6E6465726C696767656E64207461786F6E29','app','2018-12-05 13:49:24'),
	(1536,X'736F6F7274656E2028656E206F6E6465726C696767656E6465207461786129','app','2018-12-05 13:49:24'),
	(1537,X'5472656E64','app','2018-12-05 13:49:24'),
	(1538,X'4E65747765726B2045636F6C6F676973636865204D6F6E69746F72696E67','app','2018-12-05 13:49:24'),
	(1539,X'4B656E6D65726B656E','app','2018-12-05 13:49:24'),
	(1540,X'417274696B656C','admin','2018-12-05 13:49:24'),
	(1541,X'426F656B','admin','2018-12-05 13:49:24'),
	(1542,X'426F656B20286465656C29','admin','2018-12-05 13:49:24'),
	(1543,X'4461746162617365','admin','2018-12-05 13:49:24'),
	(1544,X'486F6F66647374756B','admin','2018-12-05 13:49:24'),
	(1545,X'4C697465726174757572','admin','2018-12-05 13:49:24'),
	(1546,X'4D616E75736372697074','admin','2018-12-05 13:49:24'),
	(1547,X'5065727362657269636874','admin','2018-12-05 13:49:24'),
	(1548,X'506572736F6F6E6C696A6B65206D65646564656C696E67','admin','2018-12-05 13:49:24'),
	(1549,X'526170706F7274','admin','2018-12-05 13:49:24'),
	(1550,X'5365726965','admin','2018-12-05 13:49:24'),
	(1551,X'54696A6473636872696674','admin','2018-12-05 13:49:24'),
	(1552,X'57656273697465','admin','2018-12-05 13:49:24'),
	(1553,X'566572736C6167','admin','2018-12-05 13:49:24'),
	(1554,X'5A6F6E64657220666F746F27733B20','app','2018-12-05 13:49:24'),
	(1555,X'5A6F6E64657220766572737072656964696E67736B6161727428656E293B20','app','2018-12-05 13:49:24'),
	(1556,X'4D6F64756C652073657474696E67733A20257320','admin','2018-12-05 13:49:24'),
	(1557,X'6E65772073657474696E672025732073617665642E','admin','2018-12-05 13:49:24'),
	(1558,X'76616C75652025732073617665642E','admin','2018-12-05 13:49:24'),
	(1559,X'5075626C696361746965766F726D656E','admin','2018-12-05 13:49:24'),
	(1560,X'53686F72746E616D6520666F722055524C202822736C756722293A','admin','2018-12-05 13:49:24'),
	(1561,X'4F706D65726B696E67','app','2018-12-05 13:49:24'),
	(1562,X'496E64657820706572207075626C696361746965766F726D','admin','2018-12-05 13:49:24'),
	(1563,X'416C7465726E617469766520666F726D733A','admin','2018-12-05 13:49:24'),
	(1564,X'61646420666F726D','admin','2018-12-05 13:49:24'),
	(1565,X'28616C7465726E617469766520666F726D732061726520616C736F206C696E6B656420746F2074686973206C656D6D612062792074686520686F74776F7264732D66756E6374696F6E29','admin','2018-12-05 13:49:24'),
	(1566,X'45646974206D756C74696D65646961','admin','2018-12-05 13:49:24'),
	(1567,X'496E76616C696420652D6D61696C20616464726573732E','admin','2018-12-05 13:49:24'),
	(1568,X'50617373776F726473206E6F74207468652073616D652E','admin','2018-12-05 13:49:24'),
	(1569,X'63617365206D69736D61746368','admin','2018-12-05 13:49:24'),
	(1570,X'4D616E6167656D656E74207461736B73','admin','2018-12-05 13:49:24'),
	(1571,X'61747472696275746573','admin','2018-12-05 13:49:24'),
	(1572,X'616C776179732068696464656E','admin','2018-12-05 13:49:24'),
	(1573,X'616C776179732068696465','admin','2018-12-05 13:49:24'),
	(1574,X'65787465726E616C207265666572656E6365','admin','2018-12-05 13:49:24'),
	(1575,X'47656E6572616C2073657474696E6773','admin','2018-12-05 13:49:24'),
	(1576,X'76616C75652064656C657465642E','admin','2018-12-05 13:49:24'),
	(1577,X'73657474696E672064656C657465642E','admin','2018-12-05 13:49:24'),
	(1578,X'52656461637469653A2062657765726B20696E686F7564','app','2018-12-05 13:49:24'),
	(1579,X'416674657220796F752068617665206D6164652074686520617070726F7072696174652073656C656374696F6E2C20636C69636B2074686520736176652D627574746F6E2E20204F6E636520796F752068617665207361766564207468652073656C656374696F6E2C20796F752063616E20','admin','2018-12-05 13:49:24'),
	(1580,X'496E206164646974696F6E2C20796F752063616E2073706563696679207768657265207468652064697374696E6374696F6E206265747765656E20746865206D6F64756C6573202268696768657220746178612220616E64202273706563696573222077696C6C2062652E20596F752063616E206D6F766520746865206C696E6520627920636C69636B696E67207468652026756172723B20616E642026646172723B206172726F77732E205468652073657474696E67206973207361766564207768656E20796F7520636C69636B','admin','2018-12-05 13:49:24'),
	(1581,X'4265206164766973656420746861742074686973206469766973696F6E20697320646966666572656E742066726F6D20746865206F6E65207468617420646566696E657320776869636820746178612063616E2062652074686520656E642D706F696E74206F6620796F7572206B6579732E20546861742064697374696E6374696F6E20697320646566696E656420696E207468652022646963686F746F6D6F7573206B657922206D6F64756C652E20486F77657665722C20746861742064697374696E6374696F6E206D757374206265206F6E207468652073616D65206C6576656C20617320746865206F6E6520796F7520646566696E6520686572652C206F722062656C6F772069742E2049742063616E206E6576657220626520686967657220757020696E207468652072616E6B206869657261726368792E','admin','2018-12-05 13:49:24'),
	(1582,X'5253206D6173746572206B6579','admin','2018-12-05 13:49:24'),
	(1583,X'637265617465','admin','2018-12-05 13:49:24'),
	(1584,X'436F6C6C61626F7261746F7273','admin','2018-12-05 13:49:24'),
	(1585,X'637265617465206E65772075736572','admin','2018-12-05 13:49:24'),
	(1586,X'43616E207075626C6973683A','admin','2018-12-05 13:49:24'),
	(1587,X'4D6F64756C65733A','admin','2018-12-05 13:49:24'),
	(1588,X'286C6561766520656D70747920666F7220616C6C29','admin','2018-12-05 13:49:24'),
	(1589,X'4669727374206E616D652073686F756C64206265206265747765656E20257320616E6420257320636861726163746572732E','admin','2018-12-05 13:49:24'),
	(1590,X'4C617374206E616D652073686F756C64206265206265747765656E20257320616E6420257320636861726163746572732E','admin','2018-12-05 13:49:24'),
	(1591,X'557365726E616D652073686F756C64206265206265747765656E20257320616E6420257320636861726163746572732E','admin','2018-12-05 13:49:24'),
	(1592,X'44617461206E6F742073617665642E','admin','2018-12-05 13:49:24'),
	(1593,X'55706461746564207269676874732E','admin','2018-12-05 13:49:24'),
	(1594,X'5570646174656420746178612E','admin','2018-12-05 13:49:24'),
	(1595,X'446174612073617665642E','admin','2018-12-05 13:49:24'),
	(1596,X'4372656174652061206E6577206D61747269783A','admin','2018-12-05 13:49:24'),
	(1597,X'496E7465726E616C206E616D65','admin','2018-12-05 13:49:24'),
	(1598,X'45646974206D6174726978206E616D65733A','admin','2018-12-05 13:49:24'),
	(1599,X'417661696C61626C65206D61747269636573','admin','2018-12-05 13:49:24'),
	(1600,X'496D706F7274204E657875732066696C65','admin','2018-12-05 13:49:24'),
	(1601,X'496D706F7274205344442066696C65','admin','2018-12-05 13:49:24'),
	(1602,X'42656C6F772069732061206C697374206F66206D617472696365732074686174206172652063757272656E746C7920646566696E65642E20496E206F7264657220746F20656469742061206D617472697827206E616D652C20636C69636B202265646974206E616D65222E20496E206F7264657220746F2065646974207468652061637475616C206D61747269782C20636C69636B20697473206E616D652E','admin','2018-12-05 13:49:24'),
	(1603,X'7365742061732064656661756C74','admin','2018-12-05 13:49:24'),
	(1604,X'6163717569726520737461746520696D6167652064696D656E73696F6E73','admin','2018-12-05 13:49:24'),
	(1605,X'47657420616E64207361766520737461746520696D6167652064696D656E73696F6E732028666F72206E65776C7920696D706F72746564206D6174726963657329','admin','2018-12-05 13:49:24'),
	(1606,X'617474616368206D65646961','admin','2018-12-05 13:49:24'),
	(1607,X'7469746C65','admin','2018-12-05 13:49:24'),
	(1608,X'6C6F636174696F6E','admin','2018-12-05 13:49:24'),
	(1609,X'70686F746F67726170686572','admin','2018-12-05 13:49:24'),
	(1610,X'74616773','admin','2018-12-05 13:49:24'),
	(1611,X'656E746572206D756C7469706C6520746167732073657061726174656420627920636F6D6D612773','admin','2018-12-05 13:49:24'),
	(1612,X'4372656174652061206E6577206D6174726978','admin','2018-12-05 13:49:24'),
	(1613,X'55706C6F6164','admin','2018-12-05 13:49:24'),
	(1614,X'436C65616E20757020656D7074792073746570732C206F727068616E65642063686F6963657320616E642067686F73746C792074617267657473','admin','2018-12-05 13:49:24'),
	(1615,X'496E73657274206E65772073746570','admin','2018-12-05 13:49:24'),
	(1616,X'4465636973696F6E2070617468202873756273656374696F6E29','admin','2018-12-05 13:49:24'),
	(1617,X'5374657073206C656164696E6720746F2074686973206F6E653A','admin','2018-12-05 13:49:24'),
	(1618,X'646F206E6F742073686F772072656D61696E696E6720616E64206578636C7564656420746178612028656E68616E63657320706572666F726D616E6365206F66207468697320706167653B20686173206E6F20656666656374206F6E207468652066726F6E742D656E64292E','admin','2018-12-05 13:49:24'),
	(1619,X'4465636973696F6E2070617468','admin','2018-12-05 13:49:24'),
	(1620,X'41726520796F75207375726520796F752077616E7420746F2064656C65746520746869732063686F6963653F','admin','2018-12-05 13:49:24'),
	(1621,X'76616C7565207570646174656420746F2025732E','admin','2018-12-05 13:49:24'),
	(1622,X'6E6965757720636F6E63657074','admin','2018-12-05 13:49:24'),
	(1623,X'7461786F6E6F6D6965','admin','2018-12-05 13:49:24'),
	(1624,X'72616E673A','admin','2018-12-05 13:49:24'),
	(1625,X'72616E67','admin','2018-12-05 13:49:24'),
	(1626,X'6F756465723A','admin','2018-12-05 13:49:24'),
	(1627,X'6F75646572','admin','2018-12-05 13:49:24'),
	(1628,X'67656C6469676520776574656E736368617070656C696A6B65206E61616D','admin','2018-12-05 13:49:24'),
	(1629,X'67656E7573206F6620756E696E6F6D69616C3A','admin','2018-12-05 13:49:24'),
	(1630,X'67656E7573','admin','2018-12-05 13:49:24'),
	(1631,X'736F6F72743A','admin','2018-12-05 13:49:24'),
	(1632,X'736F6F7274','admin','2018-12-05 13:49:24'),
	(1633,X'6465726465206E61616D6465656C3A','admin','2018-12-05 13:49:24'),
	(1634,X'286F6E646572736F6F72742C20666F726D612C2076617269657461732C206574632E29','admin','2018-12-05 13:49:24'),
	(1635,X'76756C20646520766F6C6C65646967652077616172646520766F6F72202761757465757273636861702720696E2C20696E636C7573696566206B6F6D6D612C206A61617274616C20656E206861616B6A65733B206865742070726F6772616D6D61206C65696474206465207761617264656E20766F6F722061757465757220656E206A616172206175746F6D6174697363682061662E','admin','2018-12-05 13:49:24'),
	(1636,X'61757465757273636861703A','admin','2018-12-05 13:49:24'),
	(1637,X'6175746575727363686170','admin','2018-12-05 13:49:24'),
	(1638,X'6175746575722873293A','admin','2018-12-05 13:49:24'),
	(1639,X'617574657572','admin','2018-12-05 13:49:24'),
	(1640,X'6A6161723A','admin','2018-12-05 13:49:24'),
	(1641,X'6A616172','admin','2018-12-05 13:49:24'),
	(1642,X'6578706572743A','admin','2018-12-05 13:49:24'),
	(1643,X'6F7267616E6973617469653A','admin','2018-12-05 13:49:24'),
	(1644,X'7075626C6963617469653A','admin','2018-12-05 13:49:24'),
	(1645,X'5075626C696361746965','admin','2018-12-05 13:49:24'),
	(1646,X'636F6E63657074','admin','2018-12-05 13:49:24'),
	(1647,X'636F6E636570746E61616D20776F726474206175746F6D617469736368652073616D656E67657374656C64206F702062617369732076616E2064652067656C6469676520776574656E736368617070656C696A6B65206E61616D2E','admin','2018-12-05 13:49:24'),
	(1648,X'6E61616D3A','admin','2018-12-05 13:49:24'),
	(1649,X'6E73722069643A','admin','2018-12-05 13:49:24'),
	(1650,X'28776F726474206175746F6D61746973636820676567656E65726565726429','admin','2018-12-05 13:49:24'),
	(1651,X'6E2E762E742E','admin','2018-12-05 13:49:24'),
	(1652,X'73746174757320766F6F726B6F6D656E206B616E20616C6C65656E20776F7264656E20696E676576756C6420766F6F7220736F6F7274656E20656E206C616765722E','admin','2018-12-05 13:49:24'),
	(1653,X'766F6F726B6F6D656E','admin','2018-12-05 13:49:24'),
	(1654,X'7374617475733A','admin','2018-12-05 13:49:24'),
	(1655,X'686162697461743A','admin','2018-12-05 13:49:24'),
	(1656,X'6F70736C61616E','admin','2018-12-05 13:49:24'),
	(1657,X'7465727567','admin','2018-12-05 13:49:24'),
	(1658,X'4E656465726C616E647365206E61616D','admin','2018-12-05 13:49:24'),
	(1659,X'746F70','admin','2018-12-05 13:49:24'),
	(1660,X'72616E67656E','admin','2018-12-05 13:49:24'),
	(1661,X'73746174757373656E','admin','2018-12-05 13:49:24'),
	(1662,X'28616C6C6529','admin','2018-12-05 13:49:24'),
	(1663,X'4120746F74616C206F66','admin','2018-12-05 13:49:24'),
	(1664,X'6D656469612066696C657320686173206265656E2075706C6F6164656420666F7220746869732070726F6A656374','admin','2018-12-05 13:49:24'),
	(1665,X'596F75206D757374206669727374','admin','2018-12-05 13:49:24'),
	(1666,X'75706C6F616420696D61676573','admin','2018-12-05 13:49:24'),
	(1667,X'42726F777365204D65646961','admin','2018-12-05 13:49:24'),
	(1668,X'66696C65206E616D65','admin','2018-12-05 13:49:24'),
	(1669,X'4E6F7468696E6720666F756E6420287965742921','admin','2018-12-05 13:49:24'),
	(1670,X'536561726368204D65646961','admin','2018-12-05 13:49:24'),
	(1671,X'42726F777365206D65646961206F6E205265736F75726365537061636520736572766572','admin','2018-12-05 13:49:24'),
	(1672,X'6D65646961206974656D2873292069732073746F72656420666F7220746869732070726F6A656374','admin','2018-12-05 13:49:24'),
	(1673,X'42726F777365204D65646961206F6E205265736F75726365537061636520736572766572','admin','2018-12-05 13:49:24'),
	(1674,X'4E657875732066696C652075706C6F6164','admin','2018-12-05 13:49:24'),
	(1675,X'4E6578757320696D706F7274','admin','2018-12-05 13:49:24'),
	(1676,X'537065636966792066696C65','admin','2018-12-05 13:49:24'),
	(1677,X'53444420496D706F7274','admin','2018-12-05 13:49:24'),
	(1678,X'45646974696E67206D6174726978202228736F7274206368617261637465727329','admin','2018-12-05 13:49:24'),
	(1679,X'496E7365727420612073746570206265666F72652073746570202573','admin','2018-12-05 13:49:24'),
	(1680,X'496E736572742061206E65772073746172742073746570206265666F72652073746570','admin','2018-12-05 13:49:24'),
	(1681,X'696E73657274','admin','2018-12-05 13:49:24'),
	(1682,X'496E7365727420612073746570206265747765656E','admin','2018-12-05 13:49:24'),
	(1683,X'616E642073746570','admin','2018-12-05 13:49:24'),
	(1684,X'496E7365727420612073746570206265747765656E207374657020257320616E64202573','admin','2018-12-05 13:49:24'),
	(1685,X'456469742074726169742067726F7570','admin','2018-12-05 13:49:24'),
	(1686,X'4E65772074726169742067726F7570','admin','2018-12-05 13:49:24'),
	(1687,X'4E6577206163746F72','admin','2018-12-05 13:49:24'),
	(1688,X'636F6E636570746B616172743A','admin','2018-12-05 13:49:24'),
	(1689,X'6E616D656E','admin','2018-12-05 13:49:24'),
	(1690,X'6E6965742D776574656E736368617070656C696A6B65206E61616D20746F65766F6567656E','admin','2018-12-05 13:49:24'),
	(1691,X'746F65766F6567656E2076616E2067656C64696765206E61616D2C2073796E6F6E69656D2C206574632E','admin','2018-12-05 13:49:24'),
	(1692,X'776574656E736368617070656C696A6B65206E61616D20746F65766F6567656E','admin','2018-12-05 13:49:24'),
	(1693,X'6F6E646572736F6F727420746F65766F6567656E2061616E2022257322','admin','2018-12-05 13:49:24'),
	(1694,X'706173706F6F7274','admin','2018-12-05 13:49:24'),
	(1695,X'61666265656C64696E67656E20284E53522D6F6E6C7929','admin','2018-12-05 13:49:24'),
	(1696,X'7461786F6E2062656B696A6B656E20696E2066726F6E742D656E6420286E696575772076656E7374657229','admin','2018-12-05 13:49:24'),
	(1697,X'7461786F6E206D61726B6572656E20616C732076657277696A64657264','admin','2018-12-05 13:49:24'),
	(1698,X'6E61616D207461786F6E20636F6E63657074206469726563742061616E70617373656E','admin','2018-12-05 13:49:24'),
	(1699,X'6B656E6D65726B656E20746F65766F6567656E3A','admin','2018-12-05 13:49:24'),
	(1700,X'55706C6F6164206D65646961','admin','2018-12-05 13:49:24'),
	(1701,X'28656E636C6F7365206D756C7469706C6520776F726473207769746820646F75626C652071756F7465732028222920746F2073656172636820666F7220746865206C69746572616C20737472696E6729','admin','2018-12-05 13:49:24'),
	(1702,X'696E206D6F64756C65733A','admin','2018-12-05 13:49:24'),
	(1703,X'4163746F72656E','admin','2018-12-05 13:49:24'),
	(1704,X'42656865657220536F6F7274656E7265676973746572','admin','2018-12-05 13:49:24'),
	(1705,X'4B656E6D65726B656E','admin','2018-12-05 13:49:24'),
	(1706,X'55736572206D616E6167656D656E74','admin','2018-12-05 13:49:24'),
	(1707,X'50726F6A656374206D616E6167656D656E74','admin','2018-12-05 13:49:24'),
	(1708,X'4C6974657261747575722028763229','admin','2018-12-05 13:49:24'),
	(1709,X'6465736372697074696F6E73','admin','2018-12-05 13:49:24'),
	(1710,X'6E6176696761746F72','admin','2018-12-05 13:49:24'),
	(1711,X'7374657073','admin','2018-12-05 13:49:24'),
	(1712,X'63686F69636573','admin','2018-12-05 13:49:24'),
	(1713,X'656E64706F696E7473','admin','2018-12-05 13:49:24'),
	(1714,X'7265666572656E636573','admin','2018-12-05 13:49:24'),
	(1715,X'6974656D73','admin','2018-12-05 13:49:24'),
	(1716,X'526573756C7473','admin','2018-12-05 13:49:24'),
	(1717,X'496D706F7274206F7074696F6E73','admin','2018-12-05 13:49:24'),
	(1718,X'5461786F6E6F6D69632074726565','admin','2018-12-05 13:49:24'),
	(1719,X'45787465726E616C204944207265736F6C766572','admin','2018-12-05 13:49:24'),
	(1720,X'6F6E6465726C696767656E64207461786F6E20746F65766F6567656E2061616E2022257322','admin','2018-12-05 13:49:24'),
	(1721,X'596F75722070617373776F72643A','admin','2018-12-05 14:02:11'),
	(1722,X'4920666F72676F74206D792070617373776F72643A','admin','2018-12-05 14:02:11'),
	(1723,X'7265736574206D792070617373776F7264','admin','2018-12-05 14:02:11'),
	(1724,X'4D792070617373776F726420646F65736E277420776F726B2C2049206861766520666F72676F7474656E206D7920757365726E616D65206F72206D79206163636F756E74206D61792068617665206265656E20636F6D70726F6D697365643A20706C65617365','admin','2018-12-05 14:02:11'),
	(1725,X'636F6E74616374207468652068656C706465736B206174','admin','2018-12-05 14:02:11'),
	(1726,X'53797374656D207461736B73','admin','2018-12-05 14:02:19'),
	(1727,X'50726F6A6563742061646D696E697374726174696F6E207461736B73','admin','2018-12-05 14:02:54'),
	(1728,X'50726F6A65637420696E666F726D6174696F6E','admin','2018-12-05 14:02:56'),
	(1729,X'73656172636820666F722061206E616D653A','admin','2018-12-05 14:22:00'),
	(1730,X'747970652061206E616D65','admin','2018-12-05 14:22:00'),
	(1731,X'7461786F6E6F6D696320747265653A','admin','2018-12-05 14:22:00'),
	(1732,X'6E6577207461786F6E20636F6E63657074','admin','2018-12-05 14:22:00'),
	(1733,X'7461736B733A','admin','2018-12-05 14:22:00'),
	(1734,X'7461786F6E20636F6E6365707473206D61726B65642061732064656C65746564','admin','2018-12-05 14:22:00'),
	(1735,X'75706461746520696E646578207461626C65','admin','2018-12-05 14:22:00'),
	(1736,X'6F727068616E65642074617861','admin','2018-12-05 14:22:00'),
	(1737,X'6D756C74692D707572706F7365206578706F7274','admin','2018-12-05 14:22:00'),
	(1738,X'7461786F6E20696D706F7274','admin','2018-12-05 14:22:00'),
	(1739,X'70617373706F727420696D706F7274','admin','2018-12-05 14:22:00'),
	(1740,X'70617373706F72742063617465676F72696573202822746162732229','admin','2018-12-05 14:22:00'),
	(1741,X'706167652073656374696F6E73','admin','2018-12-05 14:22:00'),
	(1742,X'7461786F6E6F6D69632072616E6B73','admin','2018-12-05 14:22:00'),
	(1743,X'4265206164766973656420746861742074686973206469766973696F6E20697320646966666572656E742066726F6D20746865206F6E65207468617420646566696E657320776869636820746178612063616E2062652074686520656E642D706F696E74206F6620796F7572206B6579732E2054686174206469766973696F6E20697320646566696E656420696E207468652073696E676C652D616363657373206B657920616E64206D756C746920656E747279206B6579206D6F64756C65732E','admin','2018-12-05 14:22:05'),
	(1744,X'6E657720636F6E63657074','admin','2018-12-05 14:39:18'),
	(1745,X'636C617373696669636174696F6E','admin','2018-12-05 14:39:18'),
	(1746,X'72616E6B','admin','2018-12-05 14:39:18'),
	(1747,X'706172656E74','admin','2018-12-05 14:39:18'),
	(1748,X'76616C696420736369656E7469666963206E616D65','admin','2018-12-05 14:39:18'),
	(1749,X'67656E7573206F7220756E696E6F6D69616C','admin','2018-12-05 14:39:18'),
	(1750,X'73706563696573','admin','2018-12-05 14:39:18'),
	(1751,X'7468697264206E616D6520656C656D656E74','admin','2018-12-05 14:39:18'),
	(1752,X'28737562737065636965732C20666F726D612C2076617269657461732C206574632E29','admin','2018-12-05 14:39:18'),
	(1753,X'656E7465722074686520636F6D706C6574652076616C756520666F7220617574686F72736869702C20696E636C7564696E6720636F6D6D612C207965617220616E6420627261636B6574733B207468652070726F6772616D206175746F6D61746963616C6C792064656475636573207468652076616C75657320666F7220617574686F7220616E6420796561722E','admin','2018-12-05 14:39:18'),
	(1754,X'617574686F7273686970','admin','2018-12-05 14:39:18'),
	(1755,X'617574686F72287329','admin','2018-12-05 14:39:18'),
	(1756,X'79656172','admin','2018-12-05 14:39:18'),
	(1757,X'636F6E63657074206E616D6520697320636F6E636174656E61746564206175746F6D61746963616C6C79206261736564206F6E207468652076616C696420736369656E7469666963206E616D652E','admin','2018-12-05 14:39:18'),
	(1758,X'4E616D6520696E20456E676C697368','admin','2018-12-05 14:39:18'),
	(1759,X'61737369676E206E6F2076616C7565','admin','2018-12-05 14:39:18'),
	(1760,X'7479706520746F2066696E64','admin','2018-12-05 14:39:18'),
	(1761,X'56756C20616C6C6520766572706C69636874652076656C64656E20696E3A','admin','2018-12-05 14:39:27'),
	(1762,X'436F6E6365707420736176656420776974686F757420706172656E742E','admin','2018-12-05 14:39:27'),
	(1763,X'4E657720636F6E6365707420637265617465642E','admin','2018-12-05 14:39:27'),
	(1764,X'4E616D6520616C72656164792065786973747320666F72','admin','2018-12-05 14:39:27'),
	(1765,X'616E6F74686572207461786F6E20636F6E63657074','admin','2018-12-05 14:39:27'),
	(1766,X'557064617465206E616D65207461786F6E20636F6E63657074206661696C65642E','admin','2018-12-05 14:39:27'),
	(1767,X'4E616D65206E6F742073617665642E','admin','2018-12-05 14:39:27'),
	(1768,X'52616E6B2073617665642E','admin','2018-12-05 14:39:27'),
	(1769,X'4E6577206E616D6520637265617465642E','admin','2018-12-05 14:39:27'),
	(1770,X'4E616D652073617665642E','admin','2018-12-05 14:39:27'),
	(1771,X'556E696E6F6D69616C2073617665642E','admin','2018-12-05 14:39:27'),
	(1772,X'547970652073617665642E','admin','2018-12-05 14:39:27'),
	(1773,X'4C616E67756167652073617665642E','admin','2018-12-05 14:39:27'),
	(1774,X'636F6E636570742063617264','admin','2018-12-05 14:39:28'),
	(1775,X'61646420636F6D6D6F6E206E616D65','admin','2018-12-05 14:39:28'),
	(1776,X'61646420736369656E7469666963206E616D65','admin','2018-12-05 14:39:28'),
	(1777,X'616464206368696C64207461786F6E20746F2022257322','admin','2018-12-05 14:39:28'),
	(1778,X'70617373706F7274','admin','2018-12-05 14:39:28'),
	(1779,X'65787065727473','admin','2018-12-05 14:39:28'),
	(1780,X'76696577207461786F6E20696E2066726F6E742D656E6420286E65772077696E646F7729','admin','2018-12-05 14:39:28'),
	(1781,X'6D61726B207461786F6E2061732064656C65746564','admin','2018-12-05 14:39:28'),
	(1782,X'72656E616D65207461786F6E20636F6E63657074206469726563746C79','admin','2018-12-05 14:39:28');

/*!40000 ALTER TABLE `interface_texts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table interface_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `interface_translations`;

CREATE TABLE `interface_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interface_text_id` int(11) NOT NULL,
  `language_id` tinyint(3) NOT NULL,
  `translation` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `interface_translations` WRITE;
/*!40000 ALTER TABLE `interface_translations` DISABLE KEYS */;

INSERT INTO `interface_translations` (`id`, `interface_text_id`, `language_id`, `translation`)
VALUES
	(3,75,24,'%s %s uitgesloten:'),
	(4,74,24,'%s mogelijk %s resterend:'),
	(5,43,24,'Over ETI'),
	(6,89,24,'Voeg toe'),
	(7,47,24,'Terug'),
	(8,48,24,'Terug naar'),
	(9,101,24,'Kenmerk'),
	(10,86,24,'Kenmerken'),
	(11,153,24,'Kies een kaart'),
	(12,91,24,'Maak alles leeg'),
	(13,156,24,'Maak de kaart leeg'),
	(14,54,24,'Gewone namen'),
	(15,84,24,'Vergelijk'),
	(16,39,24,'contact'),
	(17,46,24,'Inhoud'),
	(18,42,24,'Bijdragen van | Medewerkers'),
	(19,78,24,'Beslispad'),
	(20,90,24,'Verwijder'),
	(21,29,24,'Dichotome sleutel'),
	(22,155,24,'Toont overlap van twee taxa.'),
	(23,31,24,'Verspreiding'),
	(24,150,24,'Diversiteitindex'),
	(25,83,24,'Onderzoek'),
	(26,73,24,'Uitgezonderd'),
	(27,77,24,'Eerst'),
	(28,61,24,'voor'),
	(29,25,24,'Woordenlijst'),
	(30,151,24,'Ga naar dit taxon'),
	(31,37,24,'help'),
	(32,28,24,'Hogere taxa'),
	(33,82,24,'Identificeer'),
	(34,33,24,'Index'),
	(35,24,24,'Introductie'),
	(36,57,24,'Taal:'),
	(37,26,24,'Literatuur'),
	(38,45,24,'Programma wordt geladen'),
	(39,36,24,'login'),
	(40,30,24,'Matrixsleutel'),
	(41,148,24,'Selecteer een andere matrix'),
	(42,50,24,'Volgende'),
	(43,76,24,'Nog geen keuze(s) gemaakt'),
	(44,38,24,'nog niet beschikbaar'),
	(45,110,24,'Aantal beschikbare toestanden:'),
	(46,49,24,'Vorige'),
	(47,35,24,'projecten'),
	(48,159,24,'records'),
	(49,72,24,'Resterend'),
	(50,95,24,'Resultaat van deze combinatie kenmerken'),
	(51,79,24,'Terug naar stap 1 | Terug naar eerste keuze'),
	(52,80,24,'Terug naar stap | Terug naar keuze'),
	(53,34,24,'Zoek'),
	(54,92,24,'Zoek &gt;&gt;'),
	(55,160,24,'Zoekresultaten'),
	(56,44,24,'Zoek...'),
	(57,152,24,'Selecteer een andere kaart'),
	(58,97,24,'Selecteer een taxon'),
	(59,98,24,'Selecteer uit de lijst een taxon om de kenmerken en toestanden ervan te zien.'),
	(60,99,24,'Deze worden bij het selectieproces van de Snelzoeker gebruikt.'),
	(61,157,24,'Selecteer het zoekgebied door de relevante vierkanten aan te klikken.'),
	(62,104,24,'Selecteer twee taxa uit de lijst en klik Vergelijk om de kenmerken en toestanden ervan te vergelijken. De uitkomst toont de verschillen en overeenkomsten tussen beide taxa.'),
	(63,93,24,'Geselecteerde combinatie van kenmerken'),
	(64,106,24,'Gedeelde toestanden:'),
	(65,58,24,'Toon alle'),
	(66,87,24,'Sorteer'),
	(67,27,24,'Soort'),
	(68,53,24,'Soorten en lagere taxa'),
	(69,102,24,'Toestand'),
	(70,88,24,'Toestanden'),
	(71,108,24,'Toestanden in beide aanwezig:'),
	(72,109,24,'Toestanden in geen van beide aanwezig:'),
	(73,71,24,'Stap'),
	(74,148,24,'Verander van matrix'),
	(75,60,24,'Synoniem'),
	(76,111,24,'Taxonomische afstand:'),
	(77,94,24,'Behandel onbekenden als overeenkomend'),
	(78,100,24,'Type'),
	(79,105,24,'Unieke toestand voor %s:'),
	(80,107,24,'Unieke toestand in'),
	(81,41,24,'Welkom'),
	(82,158,24,'Wanneer gereed, klik \'Zoek\'.'),
	(94,147,24,'terug'),
	(84,23,24,'Terug naar Linnaeus NG \'root\''),
	(85,125,24,'Kenmerken'),
	(86,115,24,'Bijdragen van | Medewerkers'),
	(95,142,24,'verwijder'),
	(88,15,24,'login'),
	(89,2,24,'projecten'),
	(90,134,24,'Toestanden'),
	(91,114,24,'Welkom'),
	(92,177,24,'taal toevoegen'),
	(97,113,24,'Inhoud'),
	(130,208,24,'< vorige'),
	(99,182,24,'Taal'),
	(132,129,24,'& andere matrices'),
	(131,466,24,'\n\n'),
	(118,337,24,'\n'),
	(109,391,24,'Acties'),
	(110,394,24,'toevoegen'),
	(111,422,24,'Voeg een nieuwe categorie toe:'),
	(117,544,24,'\n'),
	(135,331,24,'(dubbelklik om te verwijderen)\n'),
	(134,163,24,'(huidig)\n'),
	(133,622,24,'\n'),
	(129,288,24,'\n'),
	(136,273,24,'(nieuwe stap)\n'),
	(143,842,24,'vrouw'),
	(142,841,24,'man'),
	(144,66,24,'Naamgeving'),
	(146,64,24,'Foto\'s');

/*!40000 ALTER TABLE `interface_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table introduction_media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `introduction_media`;

CREATE TABLE `introduction_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `file_name` varchar(128) NOT NULL,
  `thumb_name` varchar(128) DEFAULT NULL,
  `original_name` varchar(128) NOT NULL,
  `mime_type` varchar(32) NOT NULL,
  `file_size` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table introduction_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `introduction_pages`;

CREATE TABLE `introduction_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `got_content` tinyint(1) NOT NULL DEFAULT '0',
  `show_order` int(11) DEFAULT NULL,
  `hide_from_index` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table keysteps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `keysteps`;

CREATE TABLE `keysteps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `number` int(3) NOT NULL DEFAULT '0',
  `is_start` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idxKeystepsNumber` (`project_id`,`number`),
  KEY `project_id` (`project_id`),
  KEY `project_id_2` (`project_id`,`is_start`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table keysteps_taxa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `keysteps_taxa`;

CREATE TABLE `keysteps_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `keystep_id` int(11) NOT NULL,
  `taxon_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`keystep_id`,`taxon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table l2_diversity_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `l2_diversity_index`;

CREATE TABLE `l2_diversity_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `square_number` int(11) NOT NULL,
  `diversity_count` mediumint(9) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`map_id`,`type_id`,`square_number`),
  KEY `project_id_2` (`project_id`,`map_id`),
  KEY `project_id_3` (`project_id`,`map_id`,`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table l2_maps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `l2_maps`;

CREATE TABLE `l2_maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(64) DEFAULT NULL,
  `coordinates` varchar(255) NOT NULL,
  `rows` smallint(6) NOT NULL,
  `cols` smallint(6) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table l2_occurrences_taxa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `l2_occurrences_taxa`;

CREATE TABLE `l2_occurrences_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `square_number` mediumint(9) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id_3` (`project_id`,`taxon_id`,`map_id`,`type_id`,`square_number`),
  KEY `project_id` (`project_id`),
  KEY `project_id_2` (`project_id`,`taxon_id`,`map_id`),
  KEY `project_id_4` (`project_id`,`taxon_id`),
  KEY `taxon_id` (`taxon_id`),
  KEY `project_id_5` (`project_id`,`taxon_id`,`map_id`,`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table l2_occurrences_taxa_combi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `l2_occurrences_taxa_combi`;

CREATE TABLE `l2_occurrences_taxa_combi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `square_numbers` text NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`taxon_id`,`map_id`,`type_id`),
  KEY `project_id_2` (`project_id`,`taxon_id`,`map_id`),
  KEY `project_id_3` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table labels_languages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `labels_languages`;

CREATE TABLE `labels_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `label_language_id` int(11) NOT NULL,
  `label` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `labels_languages` WRITE;
/*!40000 ALTER TABLE `labels_languages` DISABLE KEYS */;

INSERT INTO `labels_languages` (`id`, `project_id`, `language_id`, `label_language_id`, `label`, `created`, `last_change`)
VALUES
	(1,1,24,24,'Nederlands','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(2,1,26,24,'Engels','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(3,1,123,24,'Wetenschappelijk','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(4,1,31,24,'Frans','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(5,1,36,24,'Duits','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(6,1,99,24,'Spaans','2018-12-05 13:49:25','2018-12-05 13:49:25');

/*!40000 ALTER TABLE `labels_languages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table labels_projects_ranks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `labels_projects_ranks`;

CREATE TABLE `labels_projects_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `project_rank_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `label` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`language_id`),
  KEY `project_id_2` (`project_id`,`project_rank_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table labels_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `labels_sections`;

CREATE TABLE `labels_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `label` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`language_id`),
  KEY `project_id_2` (`project_id`,`section_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table languages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(32) NOT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  `iso2` varchar(2) DEFAULT NULL,
  `locale_win` varchar(32) DEFAULT NULL,
  `locale_lin` varchar(16) DEFAULT NULL,
  `direction` enum('ltr','rtl') DEFAULT 'ltr',
  `show_order` int(2) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;

INSERT INTO `languages` (`id`, `language`, `iso3`, `iso2`, `locale_win`, `locale_lin`, `direction`, `show_order`, `created`)
VALUES
	(1,'Abkhaz','abk','ab',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(2,'Afrikaans','afr','af','Afrikaans','af_ZA','ltr',NULL,'2018-12-05 13:49:25'),
	(3,'Albanian','alb',NULL,'Albanian','sq_AL','ltr',NULL,'2018-12-05 13:49:25'),
	(4,'Amharic','amh','am',NULL,'am_ET','ltr',NULL,'2018-12-05 13:49:25'),
	(5,'Arabic','ara','ar','Arabic_Egypt','ar_EG','rtl',NULL,'2018-12-05 13:49:25'),
	(6,'Assyrian/Syriac','syr',NULL,'Syriac',NULL,'rtl',NULL,'2018-12-05 13:49:25'),
	(7,'Armenian','arm',NULL,'Armenian',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(8,'Assamese','asm','as',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(9,'Aymara','aym','ay',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(10,'Azeri','aze','az','Azeri_Cyrillic',NULL,'rtl',NULL,'2018-12-05 13:49:25'),
	(11,'Basque','baq',NULL,'Basque','eu_ES','ltr',NULL,'2018-12-05 13:49:25'),
	(12,'Belarusian','bel','be','Belarusian','be_BY','ltr',NULL,'2018-12-05 13:49:25'),
	(13,'Bengali','ben','bn','Bengali_India','bn_IN','ltr',NULL,'2018-12-05 13:49:25'),
	(14,'Bislama','bis','bi',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(15,'Bosnian','bos','bs','Bosnian_Latin','bs_BA','ltr',NULL,'2018-12-05 13:49:25'),
	(16,'Bulgarian','bul','bg','Bulgarian','bg_BG','ltr',NULL,'2018-12-05 13:49:25'),
	(17,'Burmese','bur',NULL,NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(18,'Catalan','cat','ca','Catalan','ca_ES','ltr',NULL,'2018-12-05 13:49:25'),
	(19,'Chinese','chi',NULL,'Chinese_PRC','zh_CN','ltr',NULL,'2018-12-05 13:49:25'),
	(20,'Croatian','hrv','hr','Croatian',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(21,'Czech','cze',NULL,'Czech','cs_CZ','ltr',NULL,'2018-12-05 13:49:25'),
	(22,'Danish','dan','da','Danish','da_DK','ltr',NULL,'2018-12-05 13:49:25'),
	(23,'Dhivehi','div','dv','Divehi',NULL,'rtl',NULL,'2018-12-05 13:49:25'),
	(24,'Dutch','dut','nl','Dutch','nl_NL','ltr',2,'2018-12-05 13:49:25'),
	(25,'Dzongkha','dzo','dz',NULL,'dz_BT','ltr',NULL,'2018-12-05 13:49:25'),
	(26,'English','eng','en','English','en_GB','ltr',1,'2018-12-05 13:49:25'),
	(27,'Estonian','est','et','Estonian','et_EE','ltr',NULL,'2018-12-05 13:49:25'),
	(28,'Fijian','fij','fj',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(29,'Filipino','fil',NULL,NULL,'fil_PH','ltr',NULL,'2018-12-05 13:49:25'),
	(30,'Finnish','fin','fi','Finnish','fi_FI','ltr',NULL,'2018-12-05 13:49:25'),
	(31,'French','fre','fr','French_Standard','fr_FR','ltr',5,'2018-12-05 13:49:25'),
	(32,'Frisian','frs',NULL,NULL,'fy_NL','ltr',NULL,'2018-12-05 13:49:25'),
	(33,'Gagauz','gag',NULL,NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(34,'Galician','glg','gl','Galician',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(35,'Georgian','geo','ka','Georgian',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(36,'German','ger','de','German_Standard','de_DE','ltr',4,'2018-12-05 13:49:25'),
	(37,'Greek','gre','el','Greek',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(38,'Gujarati','guj','gu','Gujarati',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(39,'Haitian Creole','hat','ht',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(40,'Hebrew','heb','he','Hebrew',NULL,'rtl',NULL,'2018-12-05 13:49:25'),
	(41,'Hindi','hin','hi','Hindi',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(42,'Hiri Motu','hmo','ho',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(43,'Hungarian','hun','hu','Hungarian',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(44,'Icelandic','ice','is','Icelandic',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(45,'Indonesian','ind','id','Indonesian',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(46,'Inuinnaqtun','ikt',NULL,NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(47,'Inuktitut','iku','iu',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(48,'Irish','gle','ga',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(49,'Italian','ita','it','Italian_Standard',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(50,'Japanese','jpn','ja','Japanese','ja_JP','ltr',NULL,'2018-12-05 13:49:25'),
	(51,'Kannada','kan','kn','Kannada',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(52,'Kashmiri','kas','ks','Kazakh',NULL,'rtl',NULL,'2018-12-05 13:49:25'),
	(53,'Kazakh','kaz','kk',NULL,NULL,'rtl',NULL,'2018-12-05 13:49:25'),
	(54,'Khmer','khm','km',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(55,'Korean','kor','ko','Korean','ko_KR','ltr',NULL,'2018-12-05 13:49:25'),
	(56,'Kurdish','kur','ku','Kyrgyz',NULL,'rtl',NULL,'2018-12-05 13:49:25'),
	(57,'Kyrgyz','kir','ky',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(58,'Lao','lao','lo',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(59,'Latin','lat','la',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(60,'Latvian','lav','lv','Latvian',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(61,'Lithuanian','lit','lt','Lithuanian',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(62,'Luxembourgish','ltz','lb',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(63,'Macedonian','mac','mk','Macedonian',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(64,'Malagasy','mlg','mg',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(65,'Malay','may','ms','Malay_Malaysia',NULL,'rtl',NULL,'2018-12-05 13:49:25'),
	(66,'Malayalam','mal','ml','Malayalam',NULL,'rtl',NULL,'2018-12-05 13:49:25'),
	(67,'Maltese','mlt','mt','Maltese',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(68,'Manx Gaelic','glv','gv',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(69,'Ma-ori','mao','mi','Maori',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(70,'Marathi','mar','mr','Marathi',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(71,'Mayan','myn',NULL,NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(72,'Moldovan','rum','ro',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(73,'Mongolian','mon','mn','Mongolian',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(74,'Ndebele','nde','nd',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(75,'Nepali','nep','ne',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(76,'Northern Sotho','nso',NULL,NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(77,'Norwegian','nor','no','Norwegian_Bokmal',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(78,'Occitan','oci','oc',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(79,'Oriya','ori','or',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(80,'Ossetian','oss','os',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(81,'Papiamento','pap',NULL,NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(82,'Pashto','pus','ps',NULL,NULL,'rtl',NULL,'2018-12-05 13:49:25'),
	(83,'Persian','per','fa',NULL,NULL,'rtl',NULL,'2018-12-05 13:49:25'),
	(84,'Polish','pol','pl','Polish',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(85,'Portuguese','por','pt','Portuguese_Standard',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(86,'Punjabi','pan','pa','Punjabi',NULL,'rtl',NULL,'2018-12-05 13:49:25'),
	(87,'Quechua','que','qu','Quechua_Bolivia',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(88,'Rhaeto-Romansh','roh','rm',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(89,'Russian','rus','ru','Russian','ru_RU','ltr',NULL,'2018-12-05 13:49:25'),
	(90,'Sanskrit','san','sa','Sanskrit','sa_IN','ltr',NULL,'2018-12-05 13:49:25'),
	(91,'Serbian','srp','sr','Serbian_Cyrillic','sr_ME','ltr',NULL,'2018-12-05 13:49:25'),
	(92,'Shona','sna','sn',NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(93,'Sindhi','snd','sd',NULL,'sd_IN','rtl',NULL,'2018-12-05 13:49:25'),
	(94,'Sinhala','sin','si',NULL,'si_LK','ltr',NULL,'2018-12-05 13:49:25'),
	(95,'Slovak','slo','sk','Slovak','sk_SK','ltr',NULL,'2018-12-05 13:49:25'),
	(96,'Slovene','slv','sl','Slovenian','sl_SI','ltr',NULL,'2018-12-05 13:49:25'),
	(97,'Somali','som','so',NULL,'so_SO','rtl',NULL,'2018-12-05 13:49:25'),
	(98,'Sotho','sot','st',NULL,'st_ZA','ltr',NULL,'2018-12-05 13:49:25'),
	(99,'Spanish','spa','es',NULL,'es_ES','ltr',3,'2018-12-05 13:49:25'),
	(100,'Sranan Tongo','srn',NULL,NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(101,'Swahili','swa','sw','Swahili',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(102,'Swati','ssw','ss',NULL,'ss_ZA','ltr',NULL,'2018-12-05 13:49:25'),
	(103,'Swedish','swe','sv','Swedish','sv_SE','ltr',NULL,'2018-12-05 13:49:25'),
	(104,'Tajik','tgk','tg',NULL,'tg_TJ','ltr',NULL,'2018-12-05 13:49:25'),
	(105,'Tamil','tam','ta','Tamil','ta_IN','ltr',NULL,'2018-12-05 13:49:25'),
	(106,'Telugu','tel','te','Telugu','te_IN','ltr',NULL,'2018-12-05 13:49:25'),
	(107,'Tetum','tet',NULL,NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(108,'Thai','tha','th','Thai','th_TH','ltr',NULL,'2018-12-05 13:49:25'),
	(109,'Tok Pisin','tpi',NULL,NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(110,'Tsonga','tog',NULL,NULL,'ts_ZA','ltr',NULL,'2018-12-05 13:49:25'),
	(111,'Tswana','tsn','tn',NULL,'tn_ZA','ltr',NULL,'2018-12-05 13:49:25'),
	(112,'Turkish','tur','tr','Turkish',NULL,'ltr',NULL,'2018-12-05 13:49:25'),
	(113,'Turkmen','tuk','tk',NULL,'tk_TM','rtl',NULL,'2018-12-05 13:49:25'),
	(114,'Ukrainian','ukr','uk','Ukrainian','uk_UA','ltr',NULL,'2018-12-05 13:49:25'),
	(115,'Urdu','urd','ur','Urdu','ur_PK','rtl',NULL,'2018-12-05 13:49:25'),
	(116,'Uzbek','uzb','uz','Uzbek_Cyrillic','uz_UZ','ltr',NULL,'2018-12-05 13:49:25'),
	(117,'Venda','ven','cy',NULL,'ve_ZA','ltr',NULL,'2018-12-05 13:49:25'),
	(118,'Vietnamese','vie','vi','Vietnamese','vi_VN','ltr',NULL,'2018-12-05 13:49:25'),
	(119,'Welsh','wel',NULL,'Welsh','cy_GB','ltr',NULL,'2018-12-05 13:49:25'),
	(120,'Xhosa','xho','xh','Xhosa','xh_ZA','ltr',NULL,'2018-12-05 13:49:25'),
	(121,'Yiddish','yid','yi',NULL,'yi_US','rtl',NULL,'2018-12-05 13:49:25'),
	(122,'Zulu','zul','zu','Zulu','zu_ZA','ltr',NULL,'2018-12-05 13:49:25'),
	(123,'Scientific','sci',NULL,NULL,NULL,'ltr',NULL,'2018-12-05 13:49:25');

/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table languages_projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `languages_projects`;

CREATE TABLE `languages_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `def_language` tinyint(1) NOT NULL DEFAULT '0',
  `active` enum('y','n') NOT NULL DEFAULT 'n',
  `tranlation_status` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_id_2` (`language_id`,`project_id`),
  KEY `language_id` (`language_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `languages_projects` WRITE;
/*!40000 ALTER TABLE `languages_projects` DISABLE KEYS */;

INSERT INTO `languages_projects` (`id`, `language_id`, `project_id`, `def_language`, `active`, `tranlation_status`, `created`)
VALUES
	(1,26,1,1,'y',0,'2018-12-05 13:49:33');

/*!40000 ALTER TABLE `languages_projects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table literature
# ------------------------------------------------------------

DROP TABLE IF EXISTS `literature`;

CREATE TABLE `literature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `author_first` varchar(64) NOT NULL,
  `author_second` varchar(64) DEFAULT NULL,
  `multiple_authors` tinyint(1) NOT NULL DEFAULT '0',
  `year` smallint(4) DEFAULT NULL,
  `suffix` varchar(3) DEFAULT NULL,
  `year_separator` varchar(8) DEFAULT NULL,
  `year_2` smallint(4) DEFAULT NULL,
  `suffix_2` varchar(3) DEFAULT NULL,
  `text` text NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  FULLTEXT KEY `fulltext` (`author_first`,`author_second`,`text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table literature_taxa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `literature_taxa`;

CREATE TABLE `literature_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `literature_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`taxon_id`,`literature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table literature2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `literature2`;

CREATE TABLE `literature2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `label` varchar(1000) NOT NULL,
  `alt_label` varchar(1000) DEFAULT NULL,
  `alt_label_language_id` int(11) DEFAULT NULL,
  `date` varchar(32) DEFAULT NULL,
  `author` varchar(1000) DEFAULT NULL,
  `publication_type` varchar(24) DEFAULT NULL,
  `publication_type_id` int(11) DEFAULT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `publishedin` varchar(500) DEFAULT NULL,
  `publishedin_id` int(11) DEFAULT NULL,
  `pages` varchar(100) DEFAULT NULL,
  `volume` varchar(32) DEFAULT NULL,
  `periodical` varchar(128) DEFAULT NULL,
  `periodical_id` int(11) DEFAULT NULL,
  `order_number` int(3) DEFAULT NULL,
  `external_link` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`project_id`),
  KEY `project_id` (`project_id`,`label`(250))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table literature2_authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `literature2_authors`;

CREATE TABLE `literature2_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `literature2_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id_2` (`project_id`,`literature2_id`,`actor_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table literature2_publication_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `literature2_publication_types`;

CREATE TABLE `literature2_publication_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `sys_label` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`sys_label`),
  KEY `id` (`id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table literature2_publication_types_labels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `literature2_publication_types_labels`;

CREATE TABLE `literature2_publication_types_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `publication_type_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`publication_type_id`,`language_id`),
  KEY `id` (`id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `literature2_publication_types_labels` WRITE;
/*!40000 ALTER TABLE `literature2_publication_types_labels` DISABLE KEYS */;

INSERT INTO `literature2_publication_types_labels` (`id`, `project_id`, `publication_type_id`, `language_id`, `label`, `created`, `last_change`)
VALUES
	(1,0,0,26,'Article','2018-12-05 13:49:25','2018-12-05 13:49:25');

/*!40000 ALTER TABLE `literature2_publication_types_labels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrices`;

CREATE TABLE `matrices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `sys_name` varchar(255) DEFAULT 'matrix',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table matrices_names
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrices_names`;

CREATE TABLE `matrices_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `matrix_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`matrix_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table matrices_taxa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrices_taxa`;

CREATE TABLE `matrices_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `matrix_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`matrix_id`,`taxon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table matrices_taxa_states
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrices_taxa_states`;

CREATE TABLE `matrices_taxa_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `matrix_id` int(11) NOT NULL,
  `taxon_id` int(11) DEFAULT NULL,
  `ref_matrix_id` int(11) DEFAULT NULL,
  `variation_id` int(11) DEFAULT NULL,
  `characteristic_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`matrix_id`,`taxon_id`,`characteristic_id`,`state_id`),
  UNIQUE KEY `project_id_5` (`project_id`,`matrix_id`,`variation_id`,`characteristic_id`,`state_id`),
  KEY `project_id_2` (`project_id`,`matrix_id`,`taxon_id`,`state_id`),
  KEY `project_id_3` (`project_id`,`matrix_id`,`variation_id`,`state_id`),
  KEY `project_id_4` (`project_id`,`matrix_id`,`ref_matrix_id`,`state_id`),
  KEY `project_id_6` (`project_id`,`matrix_id`,`ref_matrix_id`,`characteristic_id`,`state_id`),
  KEY `project_id_7` (`project_id`,`matrix_id`,`characteristic_id`,`state_id`),
  KEY `project_id_8` (`project_id`,`matrix_id`,`variation_id`),
  KEY `project_id_10` (`project_id`,`matrix_id`,`taxon_id`),
  KEY `project_id_9` (`project_id`,`matrix_id`,`ref_matrix_id`),
  KEY `state_id` (`state_id`),
  KEY `state_id_2` (`state_id`,`taxon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table matrices_variations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrices_variations`;

CREATE TABLE `matrices_variations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `matrix_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`matrix_id`,`variation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `rs_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `original_name` varchar(128) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `file_size` int(11) NOT NULL,
  `rs_original` varchar(255) NOT NULL,
  `rs_resized_1` varchar(255) DEFAULT NULL,
  `rs_resized_2` varchar(255) DEFAULT NULL,
  `rs_thumb_small` varchar(255) NOT NULL,
  `rs_thumb_medium` varchar(255) NOT NULL,
  `rs_thumb_large` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_1` (`project_id`,`deleted`,`name`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table media_captions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_captions`;

CREATE TABLE `media_captions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `media_modules_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `caption` varchar(500) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`media_modules_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table media_conversion_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_conversion_log`;

CREATE TABLE `media_conversion_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `module` varchar(50) NOT NULL,
  `media_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `old_file` varchar(255) NOT NULL,
  `new_file` varchar(255) NOT NULL,
  `error` varchar(255) DEFAULT NULL,
  `converted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `old_file` (`project_id`,`old_file`),
  KEY `item_id` (`project_id`,`module`,`item_id`),
  KEY `error` (`error`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table media_descriptions_taxon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_descriptions_taxon`;

CREATE TABLE `media_descriptions_taxon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`media_id`,`language_id`),
  FULLTEXT KEY `fulltext` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table media_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_meta`;

CREATE TABLE `media_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `sys_label` varchar(64) NOT NULL,
  `meta_data` varchar(1024) DEFAULT NULL,
  `meta_date` datetime DEFAULT NULL,
  `meta_number` float(16,8) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`media_id`),
  KEY `project_id_2` (`project_id`,`sys_label`),
  KEY `project_id_3` (`project_id`,`media_id`,`sys_label`),
  KEY `project_id_4` (`project_id`,`media_id`,`language_id`,`sys_label`),
  KEY `project_id_5` (`project_id`,`sys_label`,`meta_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table media_metadata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_metadata`;

CREATE TABLE `media_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `sys_label` varchar(64) NOT NULL,
  `metadata` varchar(1024) DEFAULT NULL,
  `metadata_date` datetime DEFAULT NULL,
  `metadata_number` float(16,8) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id_4` (`project_id`,`media_id`,`language_id`,`sys_label`),
  KEY `project_id` (`project_id`,`media_id`),
  KEY `project_id_2` (`project_id`,`sys_label`),
  KEY `project_id_3` (`project_id`,`media_id`,`sys_label`),
  KEY `project_id_5` (`project_id`,`sys_label`,`metadata_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table media_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_modules`;

CREATE TABLE `media_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `overview_image` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`media_id`,`module_id`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table media_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_tags`;

CREATE TABLE `media_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `tag` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`media_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table media_taxon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_taxon`;

CREATE TABLE `media_taxon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `thumb_name` varchar(255) DEFAULT NULL,
  `original_name` varchar(128) NOT NULL,
  `mime_type` varchar(32) NOT NULL,
  `file_size` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `overview_image` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id_3` (`project_id`,`taxon_id`,`file_name`),
  KEY `taxon_id` (`taxon_id`),
  KEY `project_id` (`project_id`),
  KEY `project_id_2` (`project_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table module_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `module_settings`;

CREATE TABLE `module_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `setting` varchar(64) NOT NULL,
  `info` varchar(1000) DEFAULT NULL,
  `default_value` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_settings_3` (`module_id`,`setting`),
  KEY `module_settings_2` (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `module_settings` WRITE;
/*!40000 ALTER TABLE `module_settings` DISABLE KEYS */;

INSERT INTO `module_settings` (`id`, `module_id`, `setting`, `info`, `default_value`, `created`, `last_change`)
VALUES
	(1,7,'calc_char_h_val','do or don\'t calculate the H-value for characters (disabling increases performance) [0,1]','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(2,7,'allow_empty_species','allow empty species (species with no content in the species module) to appear in the matrix (L2 legacy keys only) [0,1]','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(4,7,'use_emerging_characters','disable characters as long as their states do not apply to all remaining species/taxa. [0,1]','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(5,7,'use_character_groups','allow characters to be organised in groups. [0,1]','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(6,7,'browse_style','style of browsing through result sets [expand, paginate, show_all]','expand','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(7,7,'items_per_line','number of resulting species per line [number]','4','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(8,7,'items_per_page','number of resulting species per page (no effect when browse_style = \'show_all\') [number]','16','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(9,7,'always_show_details','icon for species characters normally only appears when resultset <= items_per_page. set this to 1 to always display the icon, regardless of the size of the resultset. [0,1]','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(10,7,'score_threshold','threshold of match percentage during identifying above which species displayed. setting to 100 only shows full matches, i.e. species that have all selected states. [0...100]','100','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(12,7,'img_to_thumb_regexp_pattern','reg exp replace pattern to match the URL of a species normal image (from the nsr_extras table) against for automatic creation of a thumbnail URL. works in unison with \'img_to_thumb_regexp_replacement\'. take *great* care that the reg exp is valid and properly escaped, as there is currently no check on its validity, and a broken reg exp will cause errors.\r\nthe default applies specifically to NSR-related keys.\r\n','/http:\\/\\/images.naturalis.nl\\/original\\//','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(13,7,'img_to_thumb_regexp_replacement','replacement string for the reg exp in \r\n\'img_to_thumb_regexp_pattern\' (see there). can be empty!','http://images.naturalis.nl/comping/','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(15,7,'initial_sort_column','column to initially sort the data set on (without settting, program sorts on scientific name)',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(16,7,'always_sort_by_initial','sort result set on \'initial_sort_column\' after matching percentages have been calculated (default behaviour is sorting by match percentage) [1,0]','0','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(17,7,'species_info_url','external URL for further info on a species. overrides the species-specific URL from the nsr_extras table as link under the info-icon (though in some skins that URL is also displayed in the details pop-up). expects a webservice URL that returns a JSON-object that at least has an element \'page\' with an element \'body\'. URL can be parametrised with %TAXON% (scientific name, key) and, optionally, %PID% (project ID). example:\r\n\r\nhttp://www.nederlandssoortenregister.nl/linnaeus_ng/app/views/webservices/taxon_page?pid=1&taxon=%TAXON%&cat=163',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(18,7,'introduction_topic_colophon_citation','topic name of the page from the introduction module to be used as colophon and citation-info.','Matrix colophon & citation','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(19,7,'introduction_topic_versions','topic name of the page from the introduction module to be used as version history.','Matrix version history','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(20,7,'introduction_topic_inline_info','topic name of the page from the introduction module containing additional info, to be displayed inline beneath the legend.','Matrix additional info','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(21,7,'popup_species_link_text','text for the remote link that appears in the pop-up that shows the info retrieved with species_info_url. only relevant when species_info_url is defined and if there\'s a species-specific info-URL in the nsr_extras as well. note: strictly speaking, this is not the right place for something purely textually, as setting-values are not considered to be language-dependent. oh well.','Meer details','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(23,7,'image_orientation','orientation of taxon images in search results of matrix key [landscape, portrait]','portrait','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(24,7,'show_scores','show the matching percentage in the results (only useful when score_threshold is below 100). [0,1]','0','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(25,7,'enable_treat_unknowns_as_matches','enables the function \"treat unknowns as matches\", which scores a taxon for which no state has been defined within a certain character as a match for that character (a sort of \"rather safe than sorry\"-setting). [0,1]','0','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(28,7,'suppress_details','suppresses retrieval and displaying of all character states for each item in de dataset. siginificantly reduces the footprint of the initial data-load. [0,1]','0','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(29,7,'similar_species_show_distinct_details_only','when displaying similar species or search results, normally all details are displayed, rather than only the distinct details of each species. set this setting to 1 to switch to distinct-only.','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(30,-1,'skin','styling of graphical interface of application front-end.','linnaeus_ng','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(34,-1,'suppress_restore_state','suppress the restoring of a module\'s earlier state from the same session when re-accessing the module (front-end only).','0','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(35,-1,'start_page','specific URL (relative) to redirect to when a user first opens the application (front-end).','/linnaeus_ng/app/views/linnaeus/','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(36,-1,'db_lc_time_names','MySQL locale for date and time names.','nl_NL','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(37,12,'url_help_search_presence','URL of the user help for the search category \"presence\" (NSR specific).',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(38,4,'use_taxon_variations','allow the use of taxon variations (currently in use in the matrix key only)',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(39,4,'base_url_images_main','base URL of main image in NSR-style search results.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(40,4,'base_url_images_thumb','base URL of thumb images in NSR-style search results.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(41,4,'base_url_images_overview','base URL of overview images in NSR-style search results.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(43,4,'base_url_images_thumb_s','base URL of smaller thumb images in NSR-style search results.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(44,-1,'taxon_main_image_base_url','taxon_main_image_base_url (needs to be re-examined)',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(45,4,'taxon_fetch_ez_data','taxon_fetch_ez_data (should be re-examined)',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(46,4,'include_overview_in_media','include the overview image in the general media page of a taxon as well.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(47,4,'lookup_list_species_max_results','max. results in species lookup list (front-end)',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(48,13,'literature2_import_match_threshold','default matching threshold for literature bulk import (percentage).','75','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(49,6,'keytype','l2 or lng (not sure what the difference is anymore)',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(50,7,'matrixtype','nbc (EIS-style) or lng (old L2-style). when the old style disappears, this will become obsolete.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(51,-1,'image_root_skin','root of the image files that come with the skin',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(52,12,'min_search_length','minimum length of search string','3','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(53,12,'max_search_length','maximum length of search string','50','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(54,12,'excerpt_pre-match_length','length of the displayed text excerpt preceding a search result.','35','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(55,12,'excerpt_post-match_length','length of the displayed text excerpt following a search result.','35','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(56,12,'excerpt_pre_post_match_string','text string to embed preceding and following text with','...','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(58,7,'image_root_skin','relative image root of the skin-images.','../../media/system/skins/responsive_matrix/','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(59,-1,'url_to_picture_license_info','URL to the page explaining the various picture licensing options (be aware, the same setting also exists, and should also be mainained, in the \'species\' module).\r\n',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(60,-1,'picture_license_default','the default license shown for pictures for which no license has been specified in the meta-data.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(61,7,'use_overview_image','use overview image from the species module as main species image.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(62,7,'species_module_link','link to use for the info-link when none is available for the taxon in the database. can be parametrised with %s for substitution of the taxon ID. note: \'species_info_url\' gets precedence.\n\n','../species/nsr_taxon.php?id=%s','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(63,7,'species_module_link_force','link to use for the info-link, even when there is one available in the database. can be parametrised with %s for substitution of the taxon ID.  note: \'species_info_url\' gets precedence.','../species/nsr_taxon.php?id=%s','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(64,7,'info_link_target','target of the info-link when retrieved from the database or specified by \'species_module_link\' or \'species_module_link_force\'. has no effect if \'species_info_url\' is defined, as that setting takes precedence and causes taxon-info to be displayed in a pop-up. leave blank for _blank (ha).',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(65,-1,'wiki_base_url',' Base URL to the help Wiki. Can be parametrized with %module% (translated to controllerPublicName) and %page% (translated to pageName)','http://linnaeus.naturalis.nl/wiki/%module%#hn_%page%','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(75,19,'rs_base_url','Base url to ResourceSpace server','https://resourcespace.naturalis.nl/plugins/','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(76,19,'rs_user_key','RS API user key for current project (set dynamically when user is created)',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(77,19,'rs_collection_id','RS collection ID for current project (set dynamically when user is created)',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(78,19,'rs_upload_api','Name of RS API to upload to RS','api_upload_lng','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(79,19,'rs_new_user_api','Name of RS API to create new RS user','api_new_user_lng','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(81,19,'rs_user_name','RS user name (project name @ server name)',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(82,19,'rs_password','RS password (set dynamically when user is created)',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(83,-1,'tree_show_upper_taxon','Show the most upper taxon in the taxonomic tree; if set to false, the top of the tree will display the name of the project instead.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(84,1,'welcome_topic_id','ID of the page with the old migrated welcome-page',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(85,4,'obsolete_passport_tabs','Legacy tab titles that should be flagged as obsolete in the passport editor (use JSON-string: {\"Old\":\"New\",\"Totally obsolete\":null})',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(86,7,'no_taxon_images','Make no attempt to show images for taxa','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(87,4,'higher_taxa_rank_prefix','Always prefix the taxon name with the rank for higher species','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(88,-1,'show_nsr_specific_stuff','Show or hide(*) various NSR-specific function','0','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(89,-1,'show_automatic_hybrid_markers','Show or hide automatic × marker for taxa of hybrid ranks','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(90,-1,'show_automatic_infixes','Show or hide automatic infixes \"var.\", \"subsp.\" and \"f.\" for taxa of appropriate ranks','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(91,-1,'concept_base_url','Base URL for concepts (requires the project generates NSR-style pseudo PURLs)',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(92,-1,'show_advanced_search_in_public_menu','Show advanced search link in public menu','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(93,1,'no_media','Don\'t use media module in the Introduction.','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(94,7,'no_media','Don\'t use media module in the Matrix.','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(95,4,'ext_tab_timeout','Time in seconds allowed for retrieval of external tab data before it is considered empty.','5','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(96,-1,'support_email','Support email address','linnaeus@naturalis.nl','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(97,-1,'email_settings','JSON-encoded email settings (for password reset)','{\"host\":\"smtp.gmail.com\",\"smtp_auth\":1,\"username\":\"noreply@naturalis.nl\",\"password\":\"********\",\"encryption\":\"ssl\",\"port\":465, \"sender_mail\" : \"noreply@naturalis.nl\", \"sender_name\" : \"Linnaeus NG\" }','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(98,7,'suppress_image_enlarge','suppress the large image popup','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(99,-1,'google_analytics_code','Google analytics code (\"UA-12345678-1\"). Can be a single code, or a JSON-encoded array with the form [ { \"code\" : \"UA-12345678-1\" },{ \"code\" : \"UA-98765432-2\" } ]',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(100,7,'matrix_main_title_header','General title added above the matrix\' actual name.','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(101,7,'generic_image_names','Names of images used for missing taxon images. Can be a single image name, or a JSON-encoded array with the form {\"portrait\":\"no_image_P.jpg\",\"landscape\":\"on_image_L.jpg\"}<br />Images should be present in the skin\'s image directory (no full URLs)','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(102,7,'hide_images_when_none_available','If none of the items in the resultset have an image, none are displayed. Set this to 0 to force the displaying of the generic \"no image\" image.','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(103,4,'suppress_parent_child_relation_checks','Suppress all checks on parent/child relations in when creating a taxon, except parent_base_rank < child_base_rank','0','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(104,12,'show_presence_in_results','Show presensce status in search result (advanced search only)','0','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(105,12,'show_taxon_rank_in_results','Show taxon rank in search result (simple search only)','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(106,12,'show_all_preferred_names_in_results','Show all preferred names in search result (advanced search only)','0','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(107,12,'search_filter_presence','Show presence-filter in advanced search','0','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(108,12,'search_filter_multimedia','Show multimedia-filter in advanced search','0','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(109,12,'search_filter_dna_barcodes','Show DNA-barcodes-filter in advanced search','0','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(110,-1,'site_header_subtitle','Slogan printed underneath the main project title (in some skins).',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25');

/*!40000 ALTER TABLE `module_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table module_settings_values
# ------------------------------------------------------------

DROP TABLE IF EXISTS `module_settings_values`;

CREATE TABLE `module_settings_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `setting_id` int(11) NOT NULL,
  `value` varchar(512) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_settings_3` (`project_id`,`setting_id`),
  KEY `module_settings_1` (`project_id`),
  KEY `module_settings_2` (`project_id`,`setting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `module_settings_values` WRITE;
/*!40000 ALTER TABLE `module_settings_values` DISABLE KEYS */;

INSERT INTO `module_settings_values` (`id`, `project_id`, `setting_id`, `value`, `created`, `last_change`)
VALUES
	(1,1,88,'0','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(2,1,65,'http://linnaeus.naturalis.nl/wiki/%module%#hn_%page%','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(3,1,30,'linnaeus_ng','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(4,1,51,'../../media/system/skins/linnaeus_ng/','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(5,1,96,'linnaeus@naturalis.nl','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(6,1,97,'{\"host\":\"smtp.gmail.com\",\"smtp_auth\":1,\"username\":\"noreply@naturalis.nl\",\"password\":\"********\",\"encryption\":\"ssl\",\"port\":465, \"sender_mail\" : \"noreply@naturalis.nl\", \"sender_name\" : \"Linnaeus NG\" }','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(7,1,99,'UA-21555206-6','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(8,1,95,'5','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(9,1,6,'expand','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(10,1,2,'1','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(11,1,10,'100','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(12,1,24,'0','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(13,1,62,'../species/nsr_taxon.php?id=%s','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(14,1,92,'1','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(15,0,75,'0','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(16,0,79,'0','2018-12-05 13:49:33','2018-12-05 13:49:33'),
	(17,0,78,'0','2018-12-05 13:49:33','2018-12-05 13:49:33');

/*!40000 ALTER TABLE `module_settings_values` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `controller` varchar(32) NOT NULL,
  `show_order` int(2) NOT NULL,
  `show_in_menu` tinyint(1) NOT NULL DEFAULT '1',
  `show_in_public_menu` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;

INSERT INTO `modules` (`id`, `module`, `description`, `controller`, `show_order`, `show_in_menu`, `show_in_public_menu`, `created`, `last_change`)
VALUES
	(1,'Introduction','Create articles to provide background information on your project','introduction',0,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(2,'Glossary','Project glossary','glossary',6,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(3,'Literature (old)','Old module for literature references (phased out)','literature',99,0,0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(4,'Species','Front-end implementation of the Taxon editor','species',3,0,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(5,'Higher taxa','Detailed pages for higher taxa (front-end only)','highertaxa',2,0,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(6,'Single-access key','Dichotomous key based on pictures and text','key',4,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(7,'Multi-access key','Key based on matrix of character states (matrix or multi-entry key)','matrixkey',5,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(10,'Additional texts','Welcome, About ETI, etc','content',99,0,0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(11,'Index','Front-end implementation of the Index module','index',1,0,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(12,'Search','Search and replace within all modules.','utilities',10,0,0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(13,'Literature','Manage your project\'s literature references','literature2',7,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(14,'Actors','Persons and organisations','actors',0,1,0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(15,'Taxon editor','Manage your taxon tree/species list (editor for Species module)','nsr',0,1,0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(16,'Traits','Manage species traits and link these to taxa','traits',0,1,0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(17,'Project management','Project management','projects',99,1,0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(18,'User management','User management','users',99,1,0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(19,'Media','Manage your project\'s multimedia files','media',99,1,0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(20,'Hotwords','Automatic linking of key words in the content of your site','hotwords',99,1,0,'2018-12-05 13:49:25','2018-12-05 13:49:25');

/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table modules_projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `modules_projects`;

CREATE TABLE `modules_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `show_order` tinyint(2) NOT NULL DEFAULT '0',
  `active` enum('y','n') NOT NULL DEFAULT 'y',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`module_id`),
  KEY `project_id_2` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `modules_projects` WRITE;
/*!40000 ALTER TABLE `modules_projects` DISABLE KEYS */;

INSERT INTO `modules_projects` (`id`, `project_id`, `module_id`, `show_order`, `active`, `created`)
VALUES
	(1,-1,17,99,'y','2018-12-05 15:02:10'),
	(2,-1,18,99,'y','2018-12-05 15:02:10'),
	(3,1,17,99,'y','2018-12-05 15:02:18'),
	(4,1,18,99,'y','2018-12-05 15:02:18'),
	(5,1,15,0,'y','2018-12-05 15:20:50'),
	(6,1,16,0,'y','2018-12-05 15:20:52'),
	(7,1,11,0,'y','2018-12-05 15:20:54'),
	(8,1,5,0,'y','2018-12-05 15:20:55'),
	(9,1,4,0,'y','2018-12-05 15:21:02'),
	(10,1,13,0,'y','2018-12-05 15:21:08');

/*!40000 ALTER TABLE `modules_projects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table name_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `name_types`;

CREATE TABLE `name_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `nametype` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`nametype`),
  KEY `id` (`id`,`project_id`),
  KEY `id_2` (`id`,`project_id`,`nametype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `name_types` WRITE;
/*!40000 ALTER TABLE `name_types` DISABLE KEYS */;

INSERT INTO `name_types` (`id`, `project_id`, `nametype`, `created`, `last_change`)
VALUES
	(1,1,'isValidNameOf','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(2,1,'isSynonymOf','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(3,1,'isSynonymSLOf','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(4,1,'isBasionymOf','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(5,1,'isHomonymOf','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(6,1,'isAlternativeNameOf','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(7,1,'isPreferredNameOf','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(8,1,'isMisspelledNameOf','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(9,1,'isInvalidNameOf','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(10,1,'isMisidentificationOf','2018-12-05 13:49:47','2018-12-05 13:49:47'),
	(11,1,'isNomenNudemOf','2018-12-05 13:49:47','2018-12-05 13:49:47');

/*!40000 ALTER TABLE `name_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table names
# ------------------------------------------------------------

DROP TABLE IF EXISTS `names`;

CREATE TABLE `names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `uninomial` varchar(64) DEFAULT NULL,
  `specific_epithet` varchar(64) DEFAULT NULL,
  `infra_specific_epithet` varchar(64) DEFAULT NULL,
  `authorship` varchar(128) DEFAULT NULL,
  `name_author` varchar(128) DEFAULT NULL,
  `authorship_year` varchar(16) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `expert` varchar(255) DEFAULT NULL,
  `expert_id` int(11) DEFAULT NULL,
  `organisation` varchar(255) DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  `rank_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`taxon_id`),
  KEY `project_id_2` (`project_id`,`taxon_id`,`language_id`),
  KEY `project_id_4` (`project_id`,`type_id`),
  KEY `project_id_3` (`project_id`,`uninomial`,`specific_epithet`),
  KEY `project_id_5` (`project_id`,`created`,`last_change`),
  KEY `project_id_6` (`project_id`,`taxon_id`,`type_id`),
  KEY `project_id_7` (`project_id`,`name`,`authorship`),
  KEY `project_id_8` (`project_id`,`uninomial`,`specific_epithet`,`infra_specific_epithet`),
  KEY `project_id_9` (`project_id`,`uninomial`),
  KEY `project_id_10` (`project_id`,`taxon_id`,`language_id`,`type_id`),
  KEY `name` (`name`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table names_additions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `names_additions`;

CREATE TABLE `names_additions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `addition` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table nbc_extras
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nbc_extras`;

CREATE TABLE `nbc_extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `ref_type` enum('taxon','variation','matrix') NOT NULL DEFAULT 'taxon',
  `name` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`ref_id`,`ref_type`),
  KEY `project_id_2` (`project_id`,`ref_id`,`ref_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table nsr_ids
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nsr_ids`;

CREATE TABLE `nsr_ids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `rdf_id` varchar(128) DEFAULT NULL,
  `nsr_id` varchar(128) DEFAULT NULL,
  `lng_id` int(11) NOT NULL,
  `item_type` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rdf_id` (`rdf_id`),
  KEY `nsr_id` (`nsr_id`),
  KEY `nsr_id_2` (`nsr_id`,`item_type`),
  KEY `item_type` (`item_type`),
  KEY `project_id` (`project_id`,`lng_id`,`item_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `nsr_ids` WRITE;
/*!40000 ALTER TABLE `nsr_ids` DISABLE KEYS */;

INSERT INTO `nsr_ids` (`id`, `project_id`, `rdf_id`, `nsr_id`, `lng_id`, `item_type`)
VALUES
	(1,1,'uk4f1v8y-3clu-spbd-n1gu-wfxg85rzjtgx','tn.nlsr.concept/0LRD2QVY8SPH',1,'taxon'),
	(2,1,'s13vvyxy-40ll-evlr-3mse-taj4t7ia94z6','tn.nlsr.name/0INVWVJ8AUYE',1,'name');

/*!40000 ALTER TABLE `nsr_ids` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table occurrences_taxa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `occurrences_taxa`;

CREATE TABLE `occurrences_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `type` enum('marker','polygon') NOT NULL,
  `coordinate` point DEFAULT NULL,
  `latitude` double(13,10) DEFAULT NULL,
  `longitude` double(13,10) DEFAULT NULL,
  `boundary` polygon DEFAULT NULL,
  `boundary_nodes` text,
  `nodes_hash` varchar(64) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`taxon_id`,`nodes_hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pages_taxa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages_taxa`;

CREATE TABLE `pages_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `page` varchar(32) NOT NULL,
  `def_page` tinyint(1) NOT NULL DEFAULT '0',
  `external_reference` varchar(4000) DEFAULT NULL,
  `always_hide` tinyint(1) NOT NULL DEFAULT '0',
  `page_blocks` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


LOCK TABLES `pages_taxa` WRITE;
/*!40000 ALTER TABLE `pages_taxa` DISABLE KEYS */;

INSERT INTO `pages_taxa` (`id`, `project_id`, `page`, `def_page`, `external_reference`, `always_hide`, `page_blocks`, `created`, `last_change`)
VALUES
	(1, 1, 'Description', 0, NULL, 0, NULL, '2018-12-05 13:49:33', '2018-12-05 13:49:33'),
	(2, 1, 'Nesting trait', 0, NULL, 0, NULL, '2018-12-10 11:43:08', '2018-12-10 11:44:45'),
	(3, 1, 'Lectic status', 0, NULL, 0, NULL, '2018-12-10 11:45:20', '2018-12-10 11:45:20'),
	(4, 1, 'Habitat', 0, NULL, 0, NULL, '2018-12-10 11:46:35', '2018-12-10 11:46:35'),
	(5, 1, 'Voltinism and parasites', 0, NULL, 0, NULL, '2018-12-10 11:47:15', '2018-12-10 11:47:15'),
	(6, 1, 'Systematics', 0, NULL, 0, NULL, '2018-12-10 13:18:18', '2018-12-10 13:18:18'),
	(7, 1, 'External numbers', 0, NULL, 0, NULL, '2018-12-10 13:23:14', '2018-12-10 13:23:14'),
	(8, 1, 'Status', 0, NULL, 0, NULL, '2018-12-10 13:23:14', '2018-12-10 13:23:14'),
	(9, 1, 'General traits', 0, '{\"url\":\"https:\\/\\/various-041.linnaeus.naturalis.nl\\/linnaeus_ng\\/app\\/views\\/traits\\/get.php?group=5\",\"substitute\":[],\"subst_transformation\":[],\"substitute_encode\":\"urlencode\",\"parameters\":{\"taxon\":\"id\",\"project\":\"project_id\",\"language\":\"language_id\"},\"param_transformation\":[],\"parameter_encode\":\"none\",\"rank\":\"\",\"check_type\":\"query\",\"query\":\"select if(sum(tot)>0,1,0) as `result` from (select count(*) as tot from traits_taxon_values _a left join traits_values _b on _a.project_id=_b.project_id and _a.value_id=_b.id left join traits_traits _c on _b.project_id=_c.project_id and _b.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 5 union select count(*) as tot from traits_taxon_freevalues _a left join traits_traits _c on _a.project_id=_c.project_id and _a.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 5)\",\"link_embed\":\"embed\",\"template\":\"_tab_traits_generic.tpl\",\"template_params\":\"{ \\\"page_title\\\": \\\" General traits \\\" }\"}', 0, NULL, '2018-12-20 13:07:27', '2018-12-20 13:15:27'),
	(10, 1, 'Distribution', 0, '{\"url\":\"https:\\/\\/various-041.linnaeus.naturalis.nl\\/linnaeus_ng\\/app\\/views\\/traits\\/get.php?group=1\",\"substitute\":[],\"subst_transformation\":[],\"substitute_encode\":\"urlencode\",\"parameters\":{\"taxon\":\"id\",\"project\":\"project_id\",\"language\":\"language_id\"},\"param_transformation\":[],\"parameter_encode\":\"none\",\"rank\":\"\",\"check_type\":\"query\",\"query\":\"select if(sum(tot)>0,1,0) as `result` from (select count(*) as tot from traits_taxon_values _a left join traits_values _b on _a.project_id=_b.project_id and _a.value_id=_b.id left join traits_traits _c on _b.project_id=_c.project_id and _b.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 1 union select count(*) as tot from traits_taxon_freevalues _a left join traits_traits _c on _a.project_id=_c.project_id and _a.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 1)\",\"link_embed\":\"embed\",\"template\":\"_tab_traits_generic.tpl\",\"template_params\":\"{ \\\"page_title\\\": \\\" Distribution \\\" }\"}', 0, NULL, '2018-12-20 14:47:17', '2018-12-20 14:53:08'),
	(11, 1, 'Crop resources', 0, '{\"url\":\"https:\\/\\/various-041.linnaeus.naturalis.nl\\/linnaeus_ng\\/app\\/views\\/traits\\/get.php?group=2\",\"substitute\":[],\"subst_transformation\":[],\"substitute_encode\":\"urlencode\",\"parameters\":{\"taxon\":\"id\",\"project\":\"project_id\",\"language\":\"language_id\"},\"param_transformation\":[],\"parameter_encode\":\"none\",\"rank\":\"\",\"check_type\":\"query\",\"query\":\"select if(sum(tot)>0,1,0) as `result` from (select count(*) as tot from traits_taxon_values _a left join traits_values _b on _a.project_id=_b.project_id and _a.value_id=_b.id left join traits_traits _c on _b.project_id=_c.project_id and _b.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 2 union select count(*) as tot from traits_taxon_freevalues _a left join traits_traits _c on _a.project_id=_c.project_id and _a.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 2)\",\"link_embed\":\"embed\",\"template\":\"_tab_traits_generic.tpl\",\"template_params\":\"{ \\\"page_title\\\": \\\" Crop resources \\\" }\"}', 0, NULL, '2018-12-20 14:47:28', '2018-12-20 14:55:57'),
	(12, 1, 'Species resources', 0, '{\"url\":\"https:\\/\\/various-041.linnaeus.naturalis.nl\\/linnaeus_ng\\/app\\/views\\/traits\\/get.php?group=3\",\"substitute\":[],\"subst_transformation\":[],\"substitute_encode\":\"urlencode\",\"parameters\":{\"taxon\":\"id\",\"project\":\"project_id\",\"language\":\"language_id\"},\"param_transformation\":[],\"parameter_encode\":\"none\",\"rank\":\"\",\"check_type\":\"query\",\"query\":\"select if(sum(tot)>0,1,0) as `result` from (select count(*) as tot from traits_taxon_values _a left join traits_values _b on _a.project_id=_b.project_id and _a.value_id=_b.id left join traits_traits _c on _b.project_id=_c.project_id and _b.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 3 union select count(*) as tot from traits_taxon_freevalues _a left join traits_traits _c on _a.project_id=_c.project_id and _a.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 3)\",\"link_embed\":\"embed\",\"template\":\"_tab_traits_generic.tpl\",\"template_params\":\"{ \\\"page_title\\\": \\\" Species resources \\\" }\"}', 0, NULL, '2018-12-20 14:47:58', '2018-12-20 15:05:49'),
	(13, 1, 'Specific resources', 0, '{\"url\":\"https:\\/\\/various-041.linnaeus.naturalis.nl\\/linnaeus_ng\\/app\\/views\\/traits\\/get.php?group=4\",\"substitute\":[],\"subst_transformation\":[],\"substitute_encode\":\"urlencode\",\"parameters\":{\"taxon\":\"id\",\"project\":\"project_id\",\"language\":\"language_id\"},\"param_transformation\":[],\"parameter_encode\":\"none\",\"rank\":\"\",\"check_type\":\"query\",\"query\":\"select if(sum(tot)>0,1,0) as `result` from (select count(*) as tot from traits_taxon_values _a left join traits_values _b on _a.project_id=_b.project_id and _a.value_id=_b.id left join traits_traits _c on _b.project_id=_c.project_id and _b.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 4 union select count(*) as tot from traits_taxon_freevalues _a left join traits_traits _c on _a.project_id=_c.project_id and _a.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 4)\",\"link_embed\":\"embed\",\"template\":\"_tab_traits_generic.tpl\",\"template_params\":\"{ \\\"page_title\\\": \\\" Specific resources \\\" }\"}', 0, NULL, '2018-12-20 14:48:07', '2018-12-20 15:07:52'),
	(14, 1, 'Biometrics - Female', 0, '{\"url\":\"https:\\/\\/various-041.linnaeus.naturalis.nl\\/linnaeus_ng\\/app\\/views\\/traits\\/get.php?group=6\",\"substitute\":[],\"subst_transformation\":[],\"substitute_encode\":\"urlencode\",\"parameters\":{\"taxon\":\"id\",\"project\":\"project_id\",\"language\":\"language_id\"},\"param_transformation\":[],\"parameter_encode\":\"none\",\"rank\":\"\",\"check_type\":\"query\",\"query\":\"select if(sum(tot)>0,1,0) as `result` from (select count(*) as tot from traits_taxon_values _a left join traits_values _b on _a.project_id=_b.project_id and _a.value_id=_b.id left join traits_traits _c on _b.project_id=_c.project_id and _b.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 6 union select count(*) as tot from traits_taxon_freevalues _a left join traits_traits _c on _a.project_id=_c.project_id and _a.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 6)\",\"link_embed\":\"embed\",\"template\":\"_tab_traits_generic.tpl\",\"template_params\":\"{ \\\"page_title\\\": \\\" Biometrics - Female \\\" }\"}', 0, NULL, '2018-12-20 14:48:07', '2018-12-20 15:07:52'),
	(15, 1, 'Biometrics - Male', 0, '{\"url\":\"https:\\/\\/various-041.linnaeus.naturalis.nl\\/linnaeus_ng\\/app\\/views\\/traits\\/get.php?group=7\",\"substitute\":[],\"subst_transformation\":[],\"substitute_encode\":\"urlencode\",\"parameters\":{\"taxon\":\"id\",\"project\":\"project_id\",\"language\":\"language_id\"},\"param_transformation\":[],\"parameter_encode\":\"none\",\"rank\":\"\",\"check_type\":\"query\",\"query\":\"select if(sum(tot)>0,1,0) as `result` from (select count(*) as tot from traits_taxon_values _a left join traits_values _b on _a.project_id=_b.project_id and _a.value_id=_b.id left join traits_traits _c on _b.project_id=_c.project_id and _b.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 7 union select count(*) as tot from traits_taxon_freevalues _a left join traits_traits _c on _a.project_id=_c.project_id and _a.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 7)\",\"link_embed\":\"embed\",\"template\":\"_tab_traits_generic.tpl\",\"template_params\":\"{ \\\"page_title\\\": \\\" Biometrics - Male \\\" }\"}', 0, NULL, '2018-12-20 14:48:07', '2018-12-20 15:07:52'),
	(16, 1, 'Biometrics - Worker', 0, '{\"url\":\"https:\\/\\/various-041.linnaeus.naturalis.nl\\/linnaeus_ng\\/app\\/views\\/traits\\/get.php?group=8\",\"substitute\":[],\"subst_transformation\":[],\"substitute_encode\":\"urlencode\",\"parameters\":{\"taxon\":\"id\",\"project\":\"project_id\",\"language\":\"language_id\"},\"param_transformation\":[],\"parameter_encode\":\"none\",\"rank\":\"\",\"check_type\":\"query\",\"query\":\"select if(sum(tot)>0,1,0) as `result` from (select count(*) as tot from traits_taxon_values _a left join traits_values _b on _a.project_id=_b.project_id and _a.value_id=_b.id left join traits_traits _c on _b.project_id=_c.project_id and _b.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 8 union select count(*) as tot from traits_taxon_freevalues _a left join traits_traits _c on _a.project_id=_c.project_id and _a.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 8)\",\"link_embed\":\"embed\",\"template\":\"_tab_traits_generic.tpl\",\"template_params\":\"{ \\\"page_title\\\": \\\" Biometrics - Worker \\\" }\"}', 0, NULL, '2018-12-20 14:48:07', '2018-12-20 15:07:52'),
	(17, 1, 'Foraging range', 0, '{\"url\":\"https:\\/\\/various-041.linnaeus.naturalis.nl\\/linnaeus_ng\\/app\\/views\\/traits\\/get.php?group=9\",\"substitute\":[],\"subst_transformation\":[],\"substitute_encode\":\"urlencode\",\"parameters\":{\"taxon\":\"id\",\"project\":\"project_id\",\"language\":\"language_id\"},\"param_transformation\":[],\"parameter_encode\":\"none\",\"rank\":\"\",\"check_type\":\"query\",\"query\":\"select if(sum(tot)>0,1,0) as `result` from (select count(*) as tot from traits_taxon_values _a left join traits_values _b on _a.project_id=_b.project_id and _a.value_id=_b.id left join traits_traits _c on _b.project_id=_c.project_id and _b.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 9 union select count(*) as tot from traits_taxon_freevalues _a left join traits_traits _c on _a.project_id=_c.project_id and _a.trait_id=_c.id where _a.project_id = %pid% and _a.taxon_id = %tid% and _c.trait_group_id = 9)\",\"link_embed\":\"embed\",\"template\":\"_tab_traits_generic.tpl\",\"template_params\":\"{ \\\"page_title\\\": \\\" Foraging range \\\" }\"}', 0, NULL, '2018-12-20 14:48:07', '2018-12-20 15:07:52');


/*!40000 ALTER TABLE `pages_taxa` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages_taxa_titles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages_taxa_titles`;

CREATE TABLE `pages_taxa_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`page_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table presence
# ------------------------------------------------------------

DROP TABLE IF EXISTS `presence`;

CREATE TABLE `presence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `sys_label` varchar(255) NOT NULL,
  `established` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `presence` WRITE;
/*!40000 ALTER TABLE `presence` DISABLE KEYS */;

INSERT INTO `presence` (`id`, `project_id`, `sys_label`, `established`, `created`, `last_change`)
VALUES
	(1,1,'presence statussen',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(2,1,'Exoot. Precieze status nog niet bepaald.',0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(3,1,'Exoot. Tussen 10 en 100 jaar zelfstandige handhaving.',1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(4,1,'Exoot. Incidentele import, geen voortplanting.',0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(5,1,'Exoot. Minder dan 10 jaar zelfstandige handhaving.',0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(6,1,'Exoot. Minimaal 100 jaar zelfstandige handhaving.',1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(7,1,'Incidenteel/Periodiek. Minder dan 10 jaar achtereen voortplanting en toevallige gasten.',0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(8,1,'Oorspronkelijk. Minimaal 10 jaar achtereen voortplanting.',1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(9,1,'In Nederland. Precieze status nog niet bepaald.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(10,1,'Onterecht gebruikte naam (auct.)',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(11,1,'Onterecht gemeld.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(12,1,'Gemeld. Onvoldoende gegevens voor beoordeling.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(13,1,'Oorspronkelijk. Precieze status nog niet bepaald.',0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(14,1,'Overig',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(15,1,'Gemeld. Nog niet beoordeeld.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(16,1,'Verwacht.',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(17,1,'presence statussen sinds 1982',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(18,1,'herverschenen?',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(19,1,'Nog te bepalen',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(20,1,'verdwenen',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(21,1,'verschenen',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(22,1,'verschenen?',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(23,1,'geen verandering',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(24,1,'Verwachte exoten',NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25');

/*!40000 ALTER TABLE `presence` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table presence_labels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `presence_labels`;

CREATE TABLE `presence_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `presence_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `information` varchar(1024) DEFAULT NULL,
  `information_short` varchar(255) DEFAULT NULL,
  `information_title` varchar(64) DEFAULT NULL,
  `index_label` varchar(10) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`project_id`,`presence_id`,`language_id`),
  KEY `project_id` (`project_id`,`presence_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `presence_labels` WRITE;
/*!40000 ALTER TABLE `presence_labels` DISABLE KEYS */;

INSERT INTO `presence_labels` (`id`, `project_id`, `presence_id`, `language_id`, `label`, `information`, `information_short`, `information_title`, `index_label`, `created`, `last_change`)
VALUES
	(1,1,1,24,'presence statussen',NULL,NULL,NULL,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(2,1,2,24,'Exoot. Precieze status nog niet bepaald.','Door de mens geïntroduceerd, precieze status moet nog bepaald worden.','Exoot. Precieze status nog niet bepaald.','Exoot (onbepaald)','2','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(3,1,3,24,'Exoot. Tussen 10 en 100 jaar zelfstandige handhaving.','Door de mens geïntroduceerd en heeft zich tussen 10 en 100 jaar zelfstandig kunnen handhaven (voortplantend).','Exoot. Tussen 10 en 100 jaar zelfstandige handhaving.','Exoot (10-99 jaar)','2b','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(4,1,4,24,'Exoot. Incidentele import, geen voortplanting.','Door de mens geïntroduceerd en zich niet voortplantend. Vaak zullen deze soorten niet worden opgenomen.\n nb. Voor langlevende soorten als bomen alleen 2a Ingeburgerd (min. drie generaties, 3 locaties) en 2c en 2d. Criteria NHN.','Exoot. Incidentele import, geen voortplanting.','Exoot: Incidentele import','2d','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(5,1,5,24,'Exoot. Minder dan 10 jaar zelfstandige handhaving.','Door de mens geïntroduceerd en heeft zich minder dan 10 jaar zelfstandig kunnen handhaven (voortplantend).','Exoot. Minder dan 10 jaar zelfstandige handhaving.','Exoot (minder dan 10 jaar)','2c','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(6,1,6,24,'Exoot. Minimaal 100 jaar zelfstandige handhaving.','Door de mens geïntroduceerd, en heeft zich minimaal 100 jaar na introductie zelfstandig kunnen handhaven (voortplantend).','Exoot. Minimaal 100 jaar zelfstandige handhaving.','Exoot (minstens 100 jaar)','2a','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(7,1,7,24,'Incidenteel/Periodiek. Minder dan 10 jaar achtereen voortplanting en toevallige gasten.','Op eigen kracht ons land bereikt, heeft zich minder dan 10 jaar achtereen voortgeplant. Ook voor toevallige gasten en soorten die periodiek (wintergasten) in ons land voorkomen/kwamen.','Incidenteel/Periodiek. Minder dan 10 jaar achtereen voortplanting en toevallige gasten.','Incidenteel/Periodiek','1b','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(8,1,8,24,'Oorspronkelijk. Minimaal 10 jaar achtereen voortplanting.','Op eigen kracht ons land bereikt en heeft zich minimaal 10 jaar achtereen voortgeplant. Deze categorie wordt ook wel Autochtoon genoemd.','Oorspronkelijk. Minimaal 10 jaar achtereen voortplanting.','Oorspronkelijk','1a','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(9,1,9,24,'In Nederland. Precieze status nog niet bepaald.','Soort komt in Nederland voor maar de precieze status moet nog worden bepaald.','In Nederland. Precieze status nog niet bepaald.','Correct, te verfijnen','0a','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(10,1,10,24,'Onterecht gebruikte naam (auct.)','Onterecht gebruikte naam, bijvoorbeeld als gevolg van een fout in een determinatietabel (auct nec - gevallen). Alleen voor soorten die niet in Nederland voorkomen. Indien bekend is dat de naam voor Nederland is gemeld, dan wordt 3b gekozen. In opmerkingenveld wordt aangeven welke soort bedoeld werd.','Onterecht gebruikte naam (auct.).','Auct','3d','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(11,1,11,24,'Onterecht gemeld.','Gemeld voor Nederland, maar onterecht, bijvoorbeeld als gevolg van een determinatiefout.','Onterecht gemeld.','Onterecht gemeld','3b','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(12,1,12,24,'Gemeld. Onvoldoende gegevens voor beoordeling.','Gemeld voor Nederland, maar de status is onduidelijk. Bijvoorbeeld namen zonder adequate bronvermelding, incidentele waarnemingen waaraan geen interpretatie te geven is of in de literatuur vermelde twijfelachtige vondsten waarvan geen bewijsmateriaal bewaard is gebleven. Uitleg in opmerkingenveld.','Gemeld. Onvoldoende gegevens voor beoordeling.','Onvoldoende gegevens','3a','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(13,1,13,24,'Oorspronkelijk. Precieze status nog niet bepaald.','Op eigen kracht ons land bereikt, precieze status moet nog bepaald worden.','Oorspronkelijk. Precieze status nog niet bepaald.','Oorspronkelijk (onbepaald)','1','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(14,1,14,24,'Overig','Namen die niet direct betrekking hebben op Nederland, maar waarvan het om een of andere reden toch wenselijk is dat ze worden opgenomen.','Overig.','overig','4','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(15,1,15,24,'Gemeld. Nog niet beoordeeld.','Gemeld voor de Nederlandse lijst, maar nog niet beoordeeld.','Gemeld. Nog niet beoordeeld.','Te beoordelen','0','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(16,1,16,24,'Verwacht.','Is niet gemeld voor Nederland, maar komt er mogelijk wel voor (of kan er op korte termijn terecht komen) op basis van waarnemingen in het buitenland.','Verwacht.','Verwacht','3c','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(17,1,17,24,'presence statussen sinds 1982',NULL,NULL,NULL,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(18,1,18,24,'herverschenen?',NULL,NULL,NULL,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(19,1,19,24,'Nog te bepalen',NULL,NULL,NULL,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(20,1,20,24,'verdwenen',NULL,NULL,NULL,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(21,1,21,24,'verschenen',NULL,NULL,NULL,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(22,1,22,24,'verschenen?',NULL,NULL,NULL,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(23,1,23,24,'geen verandering',NULL,NULL,NULL,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(24,1,24,24,'Exoot, verwacht.','Door de mens geïntroduceerd, verwacht.','Exoot, verwacht. ','Exoot (verwacht)','3cE','2018-12-05 13:49:25','2018-12-05 13:49:25');

/*!40000 ALTER TABLE `presence_labels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table presence_taxa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `presence_taxa`;

CREATE TABLE `presence_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `presence_id` int(11) DEFAULT NULL,
  `presence82_id` int(11) DEFAULT NULL,
  `habitat_id` int(11) DEFAULT NULL,
  `is_indigenous` tinyint(1) DEFAULT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `actor_org_id` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id1` (`project_id`,`taxon_id`),
  KEY `project_id2` (`project_id`,`taxon_id`,`presence_id`),
  KEY `project_id3` (`project_id`,`taxon_id`,`presence82_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_name` varchar(255) NOT NULL,
  `sys_description` text NOT NULL,
  `short_name` varchar(32) DEFAULT NULL,
  `title` varchar(64) NOT NULL,
  `css_url` varchar(255) DEFAULT NULL,
  `includes_hybrids` tinyint(1) NOT NULL DEFAULT '0',
  `keywords` text,
  `description` text,
  `group` varchar(64) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_name` (`sys_name`),
  UNIQUE KEY `short_name` (`short_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `sys_name`, `sys_description`, `short_name`, `title`, `css_url`, `includes_hybrids`, `keywords`, `description`, `group`, `published`, `created`, `last_change`)
VALUES
	(1,'Bee Traits','Project description',NULL,'Bee Traits',NULL,0,NULL,NULL,NULL,1,'2018-12-05 13:49:33','2018-12-05 13:49:33');

/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects_ranks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects_ranks`;

CREATE TABLE `projects_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lower_taxon` tinyint(1) DEFAULT '0',
  `keypath_endpoint` tinyint(1) DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id_2` (`project_id`,`rank_id`),
  KEY `project_id` (`project_id`),
  KEY `project_id_3` (`project_id`,`rank_id`,`parent_id`),
  KEY `project_id_4` (`project_id`),
  KEY `rank_id` (`rank_id`),
  KEY `id` (`id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `projects_ranks` WRITE;
/*!40000 ALTER TABLE `projects_ranks` DISABLE KEYS */;

INSERT INTO `projects_ranks` (`id`, `project_id`, `rank_id`, `parent_id`, `lower_taxon`, `keypath_endpoint`, `created`, `last_change`)
VALUES
	(1,1,1,NULL,0,0,'2018-12-05 15:22:54','2018-12-05 14:22:54'),
	(2,1,56,1,0,0,'2018-12-05 15:22:54','2018-12-05 14:22:54'),
	(3,1,57,2,0,0,'2018-12-05 15:22:54','2018-12-05 14:22:54'),
	(4,1,63,3,0,0,'2018-12-05 15:22:54','2018-12-05 14:22:54'),
	(5,1,65,4,0,0,'2018-12-05 15:22:54','2018-12-05 14:22:54'),
	(6,1,75,5,1,0,'2018-12-05 15:22:54','2018-12-05 14:22:54');

/*!40000 ALTER TABLE `projects_ranks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects_roles_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects_roles_users`;

CREATE TABLE `projects_roles_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `last_project_select` datetime DEFAULT NULL,
  `project_selects` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`role_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `projects_roles_users` WRITE;
/*!40000 ALTER TABLE `projects_roles_users` DISABLE KEYS */;

INSERT INTO `projects_roles_users` (`id`, `project_id`, `role_id`, `user_id`, `active`, `last_project_select`, `project_selects`, `created`)
VALUES
    (1,1,1,1,1,'2018-12-05 15:02:31',2,'2018-12-05 13:49:33'),
    (2,1,2,2,1,'2018-12-05 15:02:31',2,'2018-12-05 13:49:33');

/*!40000 ALTER TABLE `projects_roles_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ranks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ranks`;

CREATE TABLE `ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` varchar(128) NOT NULL,
  `additional` varchar(64) DEFAULT NULL,
  `default_label` varchar(32) DEFAULT NULL,
  `abbreviation` varchar(15) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `in_col` tinyint(1) DEFAULT '0',
  `can_hybrid` tinyint(1) DEFAULT '0',
  `ideal_parent_id` tinyint(3) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rank` (`rank`,`additional`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;

INSERT INTO `ranks` (`id`, `rank`, `additional`, `default_label`, `abbreviation`, `parent_id`, `in_col`, `can_hybrid`, `ideal_parent_id`, `created`, `last_change`)
VALUES
	(1,'regio',NULL,'Empire',NULL,NULL,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(2,'regnum',NULL,'Kingdom',NULL,1,1,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(3,'subregnum',NULL,'Subkingdom',NULL,2,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(4,'branch',NULL,'Branch',NULL,3,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(5,'infrakingdom',NULL,'Infrakingdom',NULL,4,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(6,'superphylum','or superdivision in botany','Superphylum ',NULL,5,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(7,'phylum','or division in botany','Phylum',NULL,6,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(8,'subphylum','or subdivision in botany','Subphylum',NULL,7,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(9,'infraphylum','or infradivision in botany','Infraphylum',NULL,8,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(10,'microphylum',NULL,'Microphylum',NULL,9,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(11,'supercohort','botany','Supercohort',NULL,10,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(12,'cohort','botany','Cohort',NULL,11,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(13,'subcohort','botany','Subcohort',NULL,12,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(14,'infracohort','botany','Infracohort',NULL,13,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(15,'superclass',NULL,'Superclass',NULL,14,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(16,'classis',NULL,'Class',NULL,15,1,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(17,'subclassis',NULL,'Subclass',NULL,16,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(18,'infraclass',NULL,'Infraclass',NULL,17,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(19,'parvclass',NULL,'Parvclass',NULL,18,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(20,'superdivisio','zoology','Superdivision',NULL,19,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(21,'divisio','zoology','Division',NULL,20,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(22,'subdivisio','zoology','Subdivision',NULL,21,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(23,'infradivision','zoology','Infradivision',NULL,22,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(24,'superlegion','zoology','Superlegion',NULL,23,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(25,'legion','zoology','Legion',NULL,24,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(26,'sublegion','zoology','Sublegion',NULL,25,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(27,'infralegion','zoology','Infralegion',NULL,26,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(28,'supercohort','zoology','Supercohort',NULL,27,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(29,'cohort','zoology','Cohort',NULL,28,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(30,'subcohort','zoology','Subcohort',NULL,29,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(31,'infracohort','zoology','Infracohort',NULL,30,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(32,'gigaorder','zoology','Gigaorder',NULL,31,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(33,'magnorder or megaorder','zoology','Megaorder',NULL,32,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(34,'grandorder or capaxorder','zoology','Grandorder',NULL,33,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(35,'mirorder or hyperorder','zoology','Hyperorder',NULL,34,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(36,'superorder',NULL,'Superorder',NULL,35,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(37,'series','for fishes','Series',NULL,36,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(38,'ordo',NULL,'Order',NULL,37,1,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(39,'parvorder','position in some  classifications','Parvorder',NULL,38,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(40,'nanorder','zoological','Nanorder',NULL,39,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(41,'hypoorder','zoological','Hypoorder',NULL,40,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(42,'minorder','zoological','Minorder',NULL,41,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(43,'subordo',NULL,'Suborder',NULL,42,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(44,'infraorder',NULL,'Infraorder',NULL,43,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(45,'parvorder','(usual position) or microorder (zoology)','Parvorder',NULL,44,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(46,'sectio','zoology','Section ',NULL,45,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(47,'subsectio','zoology','Subsection',NULL,46,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(48,'gigafamily','zoology','Gigafamily',NULL,47,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(49,'megafamily','zoology','Megafamily',NULL,48,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(50,'grandfamily','zoology','Grandfamily',NULL,49,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(51,'hyperfamily','zoology','Hyperfamily ',NULL,50,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(52,'superfamilia',NULL,'Superfamily',NULL,51,1,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(53,'epifamily','zoology','Epifamily ',NULL,52,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(54,'series','for lepidoptera','Series ',NULL,53,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(55,'group','for lepidoptera','Group',NULL,54,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(56,'familia',NULL,'Family',NULL,55,1,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(57,'subfamilia',NULL,'Subfamily',NULL,56,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(58,'infrafamily',NULL,'Infrafamily',NULL,57,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(59,'supertribe',NULL,'Supertribe',NULL,58,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(60,'tribus',NULL,'Tribe',NULL,59,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(61,'subtribus',NULL,'Subtribe',NULL,60,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(62,'infratribe',NULL,'Infratribe',NULL,61,0,0,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(63,'genus',NULL,'Genus',NULL,62,1,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(65,'subgenus',NULL,'Subgenus',NULL,63,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(66,'infragenus',NULL,'Infragenus',NULL,65,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(67,'sectio',NULL,'Section',NULL,66,0,1,63,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(68,'subsectio','botany','Subsection',NULL,67,0,1,63,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(69,'series','botany','Series',NULL,68,0,1,63,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(70,'subseries','botany','Subseries',NULL,69,0,1,63,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(71,'superspecies or species-group',NULL,'Species Group',NULL,70,0,1,63,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(72,'species subgroup',NULL,'Species Subgroup',NULL,71,0,1,63,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(73,'species complex',NULL,'Species Complex',NULL,72,0,1,63,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(74,'species aggregate',NULL,'Species Aggregate',NULL,73,0,1,63,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(75,'species',NULL,'Species',NULL,74,1,1,63,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(77,'infraspecies',NULL,'Infraspecies',NULL,75,0,1,74,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(78,'subspecific aggregate',NULL,'Subspecific Aggregate',NULL,77,0,1,74,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(79,'subspecies','or forma specialis for fungi, or variety for bacteria','Subspecies','subsp.',78,0,1,74,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(81,'varietas','zoology','Variety','var.',79,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(83,'subvarietas','botany','Subvariety','subvar.',81,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(84,'subsubvarietas',NULL,'Subsubvariety','subsubvar.',83,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(85,'forma','botany','Form','f.',84,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(86,'subforma','botany','Subform','subf.',85,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(88,'candidate',NULL,'Candidate',NULL,-1,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(89,'cultivar','botany','Cultivar',NULL,-1,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(90,'cultivar group','botany','Cultivar-group',NULL,-1,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(91,'denomination class',NULL,'Denomination Class',NULL,-1,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(92,'graft-chimaera',NULL,'Graft-chimaera',NULL,-1,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(94,'patho-variety',NULL,'Patho-variety',NULL,-1,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(95,'forma specialis','fungi','forma specialis',NULL,-1,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(96,'bio-variety',NULL,'Bio-variety',NULL,-1,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(64,'nothogenus','botany, used for taxa of hybrid origin','Nothogenus',NULL,62,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(76,'nothospecies','botany, used for taxa of hybrid origin','Nothospecies',NULL,74,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(80,'nothosubspecies','botany, used for taxa of hybrid origin','Nothosubspecies',NULL,78,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(82,'nothovarietas','botany, used for taxa of hybrid origin','Nothovarietas',NULL,79,0,1,NULL,'2018-12-05 13:49:25','2018-12-05 13:49:25');

/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rdf
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rdf`;

CREATE TABLE `rdf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `subject_type` varchar(32) NOT NULL,
  `predicate` varchar(32) NOT NULL,
  `object_id` int(11) NOT NULL,
  `object_type` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `role`, `description`, `hidden`, `created`)
VALUES
	(1,'System administrator','System administrator; creates new projects and lead experts',0,'2018-12-05 13:49:25'),
	(2,'Lead expert','Project administrator',0,'2018-12-05 13:49:25'),
	(3,'Editor','Project editor',0,'2018-12-05 13:49:25');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `section` varchar(32) NOT NULL,
  `show_order` int(2) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `setting` varchar(64) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id_2` (`project_id`,`setting`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table synonyms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `synonyms`;

CREATE TABLE `synonyms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `synonym` varchar(128) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `lit_ref_id` int(11) DEFAULT NULL,
  `show_order` int(4) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`taxon_id`),
  KEY `taxon_id` (`taxon_id`),
  FULLTEXT KEY `fulltext` (`synonym`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table tab_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tab_order`;

CREATE TABLE `tab_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `show_order` int(2) NOT NULL DEFAULT '99',
  `start_order` int(2) DEFAULT NULL,
  `suppress` tinyint(1) NOT NULL DEFAULT '0',
  `show_when_empty` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table taxa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taxa`;

CREATE TABLE `taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `rank_id` int(11) NOT NULL,
  `taxon_order` int(11) DEFAULT NULL,
  `is_hybrid` tinyint(1) DEFAULT '0',
  `list_level` int(5) DEFAULT '0',
  `is_empty` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id_4` (`project_id`,`taxon`,`rank_id`,`parent_id`),
  KEY `project_id` (`project_id`),
  KEY `project_id_2` (`project_id`,`parent_id`),
  KEY `project_id_3` (`project_id`,`parent_id`,`rank_id`),
  KEY `is_empty` (`is_empty`),
  KEY `taxon_order` (`taxon_order`),
  KEY `id` (`id`,`project_id`),
  FULLTEXT KEY `fulltext` (`taxon`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table taxa_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taxa_relations`;

CREATE TABLE `taxa_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `relation_id` int(11) NOT NULL,
  `ref_type` enum('taxon','variation') NOT NULL DEFAULT 'taxon',
  PRIMARY KEY (`id`),
  UNIQUE KEY `taxon_id` (`taxon_id`,`relation_id`,`ref_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table taxa_variations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taxa_variations`;

CREATE TABLE `taxa_variations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taxon_id` (`taxon_id`,`label`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table taxon_quick_parentage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taxon_quick_parentage`;

CREATE TABLE `taxon_quick_parentage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `parentage` varchar(4000) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id1` (`project_id`),
  KEY `project_id2` (`project_id`,`taxon_id`),
  FULLTEXT KEY `parentage_idx` (`parentage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table taxon_trend_years
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taxon_trend_years`;

CREATE TABLE `taxon_trend_years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `trend_year` int(4) NOT NULL,
  `trend` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table taxon_trends
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taxon_trends`;

CREATE TABLE `taxon_trends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `trend_label` varchar(64) NOT NULL,
  `trend` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table taxongroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taxongroups`;

CREATE TABLE `taxongroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sys_label` varchar(64) NOT NULL,
  `show_order` int(2) NOT NULL DEFAULT '99',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`sys_label`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table taxongroups_labels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taxongroups_labels`;

CREATE TABLE `taxongroups_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxongroup_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`taxongroup_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table taxongroups_taxa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taxongroups_taxa`;

CREATE TABLE `taxongroups_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxongroup_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `show_order` int(3) NOT NULL DEFAULT '999',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`taxongroup_id`,`taxon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table text_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `text_translations`;

CREATE TABLE `text_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `text_id` int(11) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `translation` varchar(4000) NOT NULL,
  `created` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `text_translations` WRITE;
/*!40000 ALTER TABLE `text_translations` DISABLE KEYS */;

INSERT INTO `text_translations` (`id`, `project_id`, `text_id`, `language_id`, `translation`, `created`, `last_update`)
VALUES
	(1,NULL,1,24,'Boolean','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(2,NULL,2,24,'Ja of Nee','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(3,NULL,3,24,'Lijst van termen','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(4,NULL,4,24,'Lijst van termen, tekst, max. 1000 karakters per term','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(5,NULL,5,24,'Lijst van termen plus optie eigen antwoord','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(6,NULL,6,24,'Lijst van termen, tekst, max. 1000 karakters per term, plus optie eigen antwoord (\"Anders, namelijk:\")','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(7,NULL,7,24,'Vrije invoer tekst','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(8,NULL,8,24,'Vrije invoer, tekst, max. 1000 karakters','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(9,NULL,9,24,'Numerieke lijst, gehele getallen','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(10,NULL,10,24,'Numerieke lijst, gehele getallen, plus optie eigen antwoord','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(11,NULL,11,24,'Numerieke lijst, gehele getallen (maximale precisie: 12,5), plus optie eigen antwoord (\"Anders, namelijk:\")','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(12,NULL,12,24,'Vrije invoer geheel getal','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(13,NULL,13,24,'Vrije invoer, geheel getal, zonder begrenzing','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(14,NULL,14,24,'Vrije invoer geheel getal, begrensd','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(15,NULL,15,24,'Vrije invoer, geheel getal, met boven- en/of ondergrens','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(16,NULL,16,24,'Numerieke lijst, decimale getallen','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(17,NULL,17,24,'Numerieke lijst, decimale getallen (maximale precisie: 12,5)','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(18,NULL,18,24,'Numerieke lijst, decimale getallen, plus optie eigen antwoord','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(19,NULL,19,24,'Numerieke lijst, decimale getallen, plus optie eigen antwoord (\"Anders, namelijk:\") (maximale precisie: 12,5)','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(20,NULL,20,24,'Vrije invoer decimaal getal','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(21,NULL,21,24,'Vrije invoer, decimaal getal, zonder begrenzing (maximale precisie: 12,5)','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(22,NULL,22,24,'Vrije invoer decimaal getal, begrensd','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(23,NULL,23,24,'Vrije invoer, decimaal getal, met boven- en/of ondergrens (maximale precisie: 12,5)','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(24,NULL,24,24,'Datumlijst (verschillende datumformaten)','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(25,NULL,25,24,'Datumlijst, plus optie eigen antwoord','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(26,NULL,26,24,'Datumlijst, plus optie eigen antwoord (\"Anders, namelijk:\"), verschillende datumformaten','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(27,NULL,27,24,'Vrije invoer datum (verschillende datumformaten)','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(28,NULL,28,24,'Vrije invoer datum, begrensd','2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(29,NULL,29,24,'Vrije invoer, datum, met boven- en/of ondergrens (verschillende datumformaten)','2018-12-05 13:49:25','2018-12-05 13:49:25');

/*!40000 ALTER TABLE `text_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table traits_date_formats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `traits_date_formats`;

CREATE TABLE `traits_date_formats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysname` varchar(64) NOT NULL,
  `format` varchar(64) NOT NULL,
  `format_hr` varchar(64) NOT NULL,
  `format_db` varchar(64) NOT NULL,
  `show_order` int(3) DEFAULT '0',
  `created` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sysname` (`sysname`),
  UNIQUE KEY `format` (`format`),
  UNIQUE KEY `format_hr` (`format_hr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `traits_date_formats` WRITE;
/*!40000 ALTER TABLE `traits_date_formats` DISABLE KEYS */;

INSERT INTO `traits_date_formats` (`id`, `sysname`, `format`, `format_hr`, `format_db`, `show_order`, `created`, `last_update`)
VALUES
	(1,'year','Y','JJJJ','%Y',0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(2,'fulldate','d-m-Y','DD-MM-JJJJ','%Y-%m-%d',1,'2018-12-05 13:49:25','2018-12-05 13:49:25');

/*!40000 ALTER TABLE `traits_date_formats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table traits_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `traits_groups`;

CREATE TABLE `traits_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sysname` varchar(64) NOT NULL,
  `name_tid` int(11) DEFAULT NULL,
  `description_tid` int(11) DEFAULT NULL,
  `all_link_text_tid` int(11) DEFAULT NULL,
  `help_link_url` varchar(255) DEFAULT NULL,
  `show_show_all_link` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_search` tinyint(1) NOT NULL DEFAULT '1',
  `show_order` int(3) DEFAULT '0',
  `created` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sysname` (`project_id`,`sysname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table traits_project_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `traits_project_types`;

CREATE TABLE `traits_project_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_type` (`project_id`,`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table traits_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `traits_settings`;

CREATE TABLE `traits_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `trait_group_id` int(11) NOT NULL,
  `setting` varchar(64) NOT NULL,
  `value` varchar(1000) NOT NULL,
  `created` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting` (`setting`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table traits_taxon_freevalues
# ------------------------------------------------------------

DROP TABLE IF EXISTS `traits_taxon_freevalues`;

CREATE TABLE `traits_taxon_freevalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `trait_id` int(11) NOT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `string_value` varchar(4000) DEFAULT NULL,
  `numerical_value` float(12,5) DEFAULT NULL,
  `numerical_value_end` float(12,5) DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `date_value_end` date DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`taxon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table traits_taxon_references
# ------------------------------------------------------------

DROP TABLE IF EXISTS `traits_taxon_references`;

CREATE TABLE `traits_taxon_references` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `trait_group_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `reference_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`trait_group_id`,`taxon_id`,`reference_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table traits_taxon_values
# ------------------------------------------------------------

DROP TABLE IF EXISTS `traits_taxon_values`;

CREATE TABLE `traits_taxon_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`taxon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table traits_traits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `traits_traits`;

CREATE TABLE `traits_traits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `trait_group_id` int(11) NOT NULL,
  `project_type_id` int(11) NOT NULL,
  `date_format_id` int(11) DEFAULT NULL,
  `sysname` varchar(64) NOT NULL,
  `name_tid` int(11) DEFAULT NULL,
  `code_tid` int(11) DEFAULT NULL,
  `description_tid` int(11) DEFAULT NULL,
  `max_length` float(12,5) DEFAULT NULL,
  `unit` varchar(32) DEFAULT NULL,
  `can_select_multiple` tinyint(1) NOT NULL DEFAULT '1',
  `can_include_comment` tinyint(1) NOT NULL DEFAULT '0',
  `can_be_null` tinyint(1) NOT NULL DEFAULT '0',
  `can_have_range` tinyint(1) NOT NULL DEFAULT '0',
  `show_index_numbers` tinyint(1) NOT NULL DEFAULT '0',
  `show_order` int(3) DEFAULT '0',
  `created` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sysname` (`project_id`,`trait_group_id`,`sysname`),
  KEY `project_id` (`project_id`,`id`,`trait_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table traits_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `traits_types`;

CREATE TABLE `traits_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysname` varchar(64) NOT NULL,
  `name_tid` int(11) DEFAULT NULL,
  `description_tid` int(11) DEFAULT NULL,
  `verification_function_name` varchar(64) DEFAULT NULL,
  `allow_values` tinyint(1) DEFAULT '1',
  `allow_max_length` tinyint(1) DEFAULT '0',
  `allow_unit` tinyint(1) DEFAULT '0',
  `allow_fractures` tinyint(1) DEFAULT '0',
  `allow_select_multiple` tinyint(1) NOT NULL DEFAULT '0',
  `allow_ranges` tinyint(1) DEFAULT '0',
  `allow_smaller_larger_than` tinyint(1) DEFAULT '0',
  `created` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sysname` (`sysname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `traits_types` WRITE;
/*!40000 ALTER TABLE `traits_types` DISABLE KEYS */;

INSERT INTO `traits_types` (`id`, `sysname`, `name_tid`, `description_tid`, `verification_function_name`, `allow_values`, `allow_max_length`, `allow_unit`, `allow_fractures`, `allow_select_multiple`, `allow_ranges`, `allow_smaller_larger_than`, `created`, `last_update`)
VALUES
	(1,'boolean',1,2,'check_boolean',0,0,0,0,0,0,0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(2,'stringlist',3,4,'check_stringlist',1,1,1,0,1,0,0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(3,'stringlistfree',5,6,'check_stringlistfree',1,1,1,0,1,0,0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(4,'stringfree',7,8,'check_stringfree',0,1,1,0,0,0,0,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(5,'intlist',9,NULL,'check_intlist',1,1,1,0,1,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(6,'intlistfree',10,11,'check_intlistfree',1,1,1,0,1,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(7,'intfree',12,13,'check_intfree',0,1,1,0,0,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(8,'intfreelimit',14,15,'check_intfreelimit',1,1,1,0,0,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(9,'floatlist',16,17,'check_floatlist',1,1,0,1,1,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(10,'floatlistfree',18,19,'check_floatlistfree',1,1,0,1,1,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(11,'floatfree',20,21,'check_floatfree',0,1,0,1,0,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(12,'floatfreelimit',22,23,'check_floatfreelimit',1,1,0,1,0,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(13,'datelist',24,NULL,'check_datelist',1,0,0,0,1,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(14,'datelistfree',25,26,'check_datelistfree',1,0,0,0,1,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(15,'datefree',27,NULL,'check_datefree',0,0,0,0,0,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25'),
	(16,'datefreelimit',28,29,'check_datefreelimit',1,0,0,0,0,1,1,'2018-12-05 13:49:25','2018-12-05 13:49:25');

/*!40000 ALTER TABLE `traits_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table traits_values
# ------------------------------------------------------------

DROP TABLE IF EXISTS `traits_values`;

CREATE TABLE `traits_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `trait_id` int(11) NOT NULL,
  `string_value` varchar(1000) DEFAULT NULL,
  `string_label_tid` int(11) DEFAULT NULL,
  `numerical_value` float(12,5) DEFAULT NULL,
  `numerical_value_end` float(12,5) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `is_lower_limit` tinyint(1) DEFAULT '0',
  `is_upper_limit` tinyint(1) DEFAULT '0',
  `lower_limit_label` varchar(16) DEFAULT NULL,
  `upper_limit_label` varchar(16) DEFAULT NULL,
  `show_order` int(3) DEFAULT '0',
  `created` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table trash_can
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trash_can`;

CREATE TABLE `trash_can` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `lng_id` int(11) NOT NULL,
  `item_type` varchar(32) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trash_can_1` (`project_id`,`lng_id`,`item_type`),
  KEY `trash_can_2` (`project_id`),
  KEY `trash_can_3` (`project_id`,`lng_id`,`item_type`),
  KEY `trash_can_4` (`project_id`,`lng_id`,`item_type`,`is_deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table trend_sources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trend_sources`;

CREATE TABLE `trend_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table user_item_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_item_access`;

CREATE TABLE `user_item_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_type` enum('taxon') NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_item_access_u1` (`project_id`,`user_id`,`item_id`,`item_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table user_module_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_module_access`;

CREATE TABLE `user_module_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `module_type` enum('standard','custom') NOT NULL DEFAULT 'standard',
  `can_read` tinyint(1) NOT NULL DEFAULT '1',
  `can_write` tinyint(1) NOT NULL DEFAULT '0',
  `can_publish` tinyint(1) NOT NULL DEFAULT '1',
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_module_access_u1` (`project_id`,`module_id`,`module_type`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email_address` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `last_login` datetime DEFAULT NULL,
  `logins` int(11) NOT NULL DEFAULT '0',
  `last_password_change` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email_address`),
  UNIQUE KEY `username_2` (`username`),
  KEY `password` (`password`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table users_taxa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_taxa`;

CREATE TABLE `users_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`taxon_id`,`user_id`),
  KEY `project_id_2` (`project_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table variation_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `variation_relations`;

CREATE TABLE `variation_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  `relation_id` int(11) NOT NULL,
  `ref_type` enum('taxon','variation') NOT NULL DEFAULT 'taxon',
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`variation_id`,`relation_id`,`ref_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table variations_labels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `variations_labels`;

CREATE TABLE `variations_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `label_type` enum('alternative','prefix','postfix','') NOT NULL DEFAULT 'alternative',
  `created` datetime NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




--
-- Dumping routines (FUNCTION) for database 'linnaeus_ng_bees'
--
DELIMITER ;;

# Dump of FUNCTION fnStripTags
# ------------------------------------------------------------

/*!50003 DROP FUNCTION IF EXISTS `fnStripTags` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`linnaeus_user`@`localhost`*/ /*!50003 FUNCTION `fnStripTags`( Dirty varchar(64000) ) RETURNS varchar(64000) CHARSET latin1
    DETERMINISTIC
BEGIN
  DECLARE iStart, iEnd, iLength int;
    WHILE Locate( '<', Dirty ) > 0 And Locate( '>', Dirty, Locate( '<', Dirty )) > 0 DO
      BEGIN
        SET iStart = Locate( '<', Dirty ), iEnd = Locate( '>', Dirty, Locate('<', Dirty ));
        SET iLength = ( iEnd - iStart) + 1;
        IF iLength > 0 THEN
          BEGIN
            SET Dirty = Insert( Dirty, iStart, iLength, '');
          END;
        END IF;
      END;
    END WHILE;
    RETURN Dirty;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
