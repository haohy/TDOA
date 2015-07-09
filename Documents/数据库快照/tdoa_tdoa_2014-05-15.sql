# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 202.119.236.192 (MySQL 5.5.37-0+wheezy1)
# Database: tdoa_tdoa
# Generation Time: 2014-05-15 03:45:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table MISSION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MISSION`;

CREATE TABLE `MISSION` (
  `mission_id` int(11) NOT NULL,
  `mission_name` varchar(45) DEFAULT NULL,
  `mission_publisher` varchar(45) DEFAULT NULL,
  `mission_charger` varchar(45) DEFAULT NULL,
  `mission_content` varchar(200) DEFAULT NULL,
  `mission_passtime` datetime DEFAULT NULL,
  `mission_starttime` datetime DEFAULT NULL,
  `mission_pubtime` datetime DEFAULT NULL,
  `mission_plan_end_time` datetime DEFAULT NULL,
  `mission_actuall_end_time` datetime DEFAULT NULL,
  `mission_status` varchar(45) DEFAULT NULL,
  `mission_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
