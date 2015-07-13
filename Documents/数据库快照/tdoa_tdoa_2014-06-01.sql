# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 202.119.236.192 (MySQL 5.5.37-0+wheezy1)
# Database: tdoa_tdoa
# Generation Time: 2014-06-01 15:52:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ACCOUNT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACCOUNT`;

CREATE TABLE `ACCOUNT` (
  `account_id` int(11) NOT NULL COMMENT '账号ID',
  `account_name` varchar(45) NOT NULL DEFAULT '' COMMENT '账号名称',
  `account_password` varchar(45) NOT NULL DEFAULT '' COMMENT '账号密码',
  `POST_post_id` int(11) NOT NULL COMMENT '账号对应的职位',
  `POWER_power_level` int(11) NOT NULL COMMENT '账号权限等级',
  `account_holder` int(11) NOT NULL COMMENT '账号当前使用者',
  `account_status` int(11) NOT NULL COMMENT '账号当前状态',
  PRIMARY KEY (`account_id`,`POST_post_id`,`POWER_power_level`,`account_holder`),
  KEY `fk_ACCOUNT_POST1_idx` (`POST_post_id`),
  KEY `fk_ACCOUNT_POWER1_idx` (`POWER_power_level`),
  KEY `fk_ACCOUNT_USER1_idx` (`account_holder`),
  CONSTRAINT `fk_ACCOUNT_POST1` FOREIGN KEY (`POST_post_id`) REFERENCES `POST` (`post_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ACCOUNT_POWER1` FOREIGN KEY (`POWER_power_level`) REFERENCES `POWER` (`power_level`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ACCOUNT_USER1` FOREIGN KEY (`account_holder`) REFERENCES `USER` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ACCOUNT` WRITE;
/*!40000 ALTER TABLE `ACCOUNT` DISABLE KEYS */;

INSERT INTO `ACCOUNT` (`account_id`, `account_name`, `account_password`, `POST_post_id`, `POWER_power_level`, `account_holder`, `account_status`)
VALUES
	(1,'test','098f6bcd4621d373cade4e832627b4f6',1,3,1,0);

/*!40000 ALTER TABLE `ACCOUNT` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CONFIG`;

CREATE TABLE `CONFIG` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table FILE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FILE`;

CREATE TABLE `FILE` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `mission_id` int(11) NOT NULL COMMENT '文件对应的MissionID',
  `file_name` varchar(45) NOT NULL DEFAULT '' COMMENT '文件名',
  `file_address` varchar(100) NOT NULL DEFAULT '' COMMENT '文件地址',
  `file_upload_time` datetime NOT NULL COMMENT '文件上传时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table MISSION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MISSION`;

CREATE TABLE `MISSION` (
  `mission_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `mission_name` varchar(45) NOT NULL DEFAULT '' COMMENT '任务标题',
  `mission_publisher` int(11) NOT NULL COMMENT '任务创建者账号ID',
  `mission_charger` int(11) DEFAULT NULL COMMENT '任务审核账号ID',
  `mission_content` varchar(200) NOT NULL DEFAULT '' COMMENT '任务详情',
  `mission_passtime` datetime DEFAULT NULL COMMENT '任务通过审核时间',
  `mission_starttime` date NOT NULL COMMENT '任务计划开始时间',
  `mission_pubtime` datetime NOT NULL COMMENT '任务发布时间',
  `mission_plan_end_time` date NOT NULL COMMENT '任务计划完成时间',
  `mission_actuall_end_time` datetime DEFAULT NULL COMMENT '任务实际完成时间',
  `mission_status` varchar(45) NOT NULL DEFAULT '待审核' COMMENT '任务当前状态',
  `mission_remark` varchar(100) DEFAULT '' COMMENT '领导对任务的补充批注',
  `mission_duplicate` varchar(3) NOT NULL DEFAULT 'off' COMMENT '任务是否按年重复发生：off不重复；on重复发生',
  `mission_account` int(11) DEFAULT NULL COMMENT '任务指派的账号ID',
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

LOCK TABLES `MISSION` WRITE;
/*!40000 ALTER TABLE `MISSION` DISABLE KEYS */;

INSERT INTO `MISSION` (`mission_id`, `mission_name`, `mission_publisher`, `mission_charger`, `mission_content`, `mission_passtime`, `mission_starttime`, `mission_pubtime`, `mission_plan_end_time`, `mission_actuall_end_time`, `mission_status`, `mission_remark`, `mission_duplicate`, `mission_account`)
VALUES
	(1,'t1',1,NULL,'任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情任务详情',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','off',1),
	(2,'t2',1,NULL,'萨法',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','off',1),
	(4,'aaa',1,NULL,'s',NULL,'2014-06-21','2014-06-01 00:00:00','2009-07-31',NULL,'待审核','','off',1),
	(5,'额她儿童',1,NULL,'而特尔',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','off',1),
	(6,'位52354 ',1,NULL,'34 5234&nbsp;',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','on',1),
	(7,'温热委屈',1,NULL,'asl;dkfhjaskldjfklasdjfls;dfj',NULL,'2014-05-29','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','on',1),
	(8,'qwetrtqrtwert',1,NULL,'qwrtewrytewywrt',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','on',1),
	(9,'wqetrw',1,NULL,'qwerqwt',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','off',1),
	(10,'ewrtwert',1,NULL,'wertewrtwe',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','on',1),
	(11,'erqwetrqw',1,NULL,'qwtrwtrew',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','off',1),
	(12,'9',1,NULL,'k',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','off',1),
	(13,'i u 一 u 与 i',1,NULL,'看见了好可怜好',NULL,'2014-05-29','2014-06-01 23:33:17','2014-06-01',NULL,'待审核','','off',1);

/*!40000 ALTER TABLE `MISSION` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table OFFICE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OFFICE`;

CREATE TABLE `OFFICE` (
  `office_id` int(11) NOT NULL COMMENT '职务ID',
  `office_name` varchar(45) NOT NULL DEFAULT '' COMMENT '职务名称',
  PRIMARY KEY (`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='post';

LOCK TABLES `OFFICE` WRITE;
/*!40000 ALTER TABLE `OFFICE` DISABLE KEYS */;

INSERT INTO `OFFICE` (`office_id`, `office_name`)
VALUES
	(1,'考试中心'),
	(2,'综合管理科');

/*!40000 ALTER TABLE `OFFICE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table POST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `POST`;

CREATE TABLE `POST` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职务ID',
  `post_name` varchar(45) NOT NULL DEFAULT '' COMMENT '职务名称',
  `OFFICE_office_id` int(11) NOT NULL COMMENT '职务所属部门ID',
  PRIMARY KEY (`post_id`,`OFFICE_office_id`),
  KEY `fk_POST_OFFICE1_idx` (`OFFICE_office_id`),
  CONSTRAINT `fk_POST_OFFICE1` FOREIGN KEY (`OFFICE_office_id`) REFERENCES `OFFICE` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='职务信息表';

LOCK TABLES `POST` WRITE;
/*!40000 ALTER TABLE `POST` DISABLE KEYS */;

INSERT INTO `POST` (`post_id`, `post_name`, `OFFICE_office_id`)
VALUES
	(1,'主任',1),
	(2,'副主任',2);

/*!40000 ALTER TABLE `POST` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table POWER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `POWER`;

CREATE TABLE `POWER` (
  `power_level` int(11) NOT NULL COMMENT '权限等级',
  `power_name` varchar(45) NOT NULL DEFAULT '' COMMENT '权限名称',
  PRIMARY KEY (`power_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `POWER` WRITE;
/*!40000 ALTER TABLE `POWER` DISABLE KEYS */;

INSERT INTO `POWER` (`power_level`, `power_name`)
VALUES
	(1,'普通账号'),
	(2,'管理员账号'),
	(3,'超级管理员账号');

/*!40000 ALTER TABLE `POWER` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table USER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER`;

CREATE TABLE `USER` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(45) NOT NULL DEFAULT '' COMMENT '用户名称',
  `user_tel` varchar(45) NOT NULL DEFAULT '' COMMENT '用户联系方式',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;

INSERT INTO `USER` (`user_id`, `user_name`, `user_tel`, `user_email`)
VALUES
	(1,'test','15005173785','ijry@qq.com');

/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
