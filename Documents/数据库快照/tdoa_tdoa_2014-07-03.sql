# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 202.119.236.192 (MySQL 5.5.37-0+wheezy1)
# Database: tdoa_tdoa
# Generation Time: 2014-07-03 06:38:40 +0000
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
	(0,'test2','098f6bcd4621d373cade4e832627b4f6',2,3,3,0),
	(1,'test','098f6bcd4621d373cade4e832627b4f6',1,3,1,0);

/*!40000 ALTER TABLE `ACCOUNT` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CONFIG`;

CREATE TABLE `CONFIG` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `config_name` varchar(50) NOT NULL DEFAULT '' COMMENT '配置名称',
  `config_value` varchar(500) NOT NULL DEFAULT '' COMMENT '配置值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `CONFIG` WRITE;
/*!40000 ALTER TABLE `CONFIG` DISABLE KEYS */;

INSERT INTO `CONFIG` (`id`, `config_name`, `config_value`)
VALUES
	(1,'website_domain','http://202.119.236.192'),
	(2,'website_name','通达教务精细化管理系统');

/*!40000 ALTER TABLE `CONFIG` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table FILE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FILE`;

CREATE TABLE `FILE` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `mission_id` int(11) NOT NULL COMMENT '文件对应的MissionID',
  `file_name` varchar(45) NOT NULL DEFAULT '' COMMENT '文件名',
  `file_url` varchar(100) NOT NULL DEFAULT '' COMMENT '文件地址',
  `file_upload_time` datetime NOT NULL COMMENT '文件上传时间',
  `file_type` int(11) NOT NULL COMMENT '文件种类，0表示初始参考，1表示完成提交文件',
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

LOCK TABLES `MISSION` WRITE;
/*!40000 ALTER TABLE `MISSION` DISABLE KEYS */;

INSERT INTO `MISSION` (`mission_id`, `mission_name`, `mission_publisher`, `mission_charger`, `mission_content`, `mission_passtime`, `mission_starttime`, `mission_pubtime`, `mission_plan_end_time`, `mission_actuall_end_time`, `mission_status`, `mission_remark`, `mission_duplicate`, `mission_account`)
VALUES
	(2,'t2',1,NULL,'萨法',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','off',1),
	(4,'aaa',1,NULL,'s',NULL,'2014-06-21','2014-06-01 00:00:00','2009-07-31',NULL,'已关闭','','off',1),
	(5,'额她儿童',1,NULL,'而特尔',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'已关闭','','off',1),
	(6,'位52354 ',1,NULL,'34 5234&nbsp;',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','on',1),
	(7,'温热委屈',1,NULL,'asl;dkfhjaskldjfklasdjfls;dfj',NULL,'2014-05-29','2014-06-01 00:00:00','2014-06-01',NULL,'已关闭','','on',1),
	(8,'qwetrtqrtwert',1,NULL,'qwrtewrytewywrt',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','on',1),
	(9,'wqetrw',1,NULL,'qwerqwt',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','off',1),
	(10,'ewrtwert',1,NULL,'wertewrtwe',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','on',1),
	(11,'erqwetrqw',1,NULL,'qwtrwtrew',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','off',1),
	(12,'9',1,NULL,'k',NULL,'2014-06-01','2014-06-01 00:00:00','2014-06-01',NULL,'待审核','','off',1),
	(13,'i u 一 u 与 i',1,NULL,'看见了好可怜好',NULL,'2014-05-29','2014-06-01 23:33:17','2014-06-01',NULL,'已关闭','','off',1),
	(14,'啊',1,NULL,'<span style=\"color:#9933E5;\"><u><em><s>手</s></em></u><u><em><s>术费沙发上是是删掉是</s></em></u><u><em><s>是发</s></em></u><u><em><s>是否是是否</s></em></u><em><s>是</s></em></span>',NULL,'2014-06-04','2014-06-04 16:45:36','2014-06-04',NULL,'已关闭','','off',NULL),
	(15,'爱的',1,NULL,'撒旦法',NULL,'2014-06-04','2014-06-04 16:47:10','2014-06-04',NULL,'已关闭','','off',NULL),
	(16,'s',1,NULL,'sadaf as<br />',NULL,'2014-06-13','2014-06-04 16:49:51','2014-06-17',NULL,'待审核','','off',NULL),
	(17,'wqerqwt',1,NULL,'qwetqetr',NULL,'2014-06-03','2014-06-04 18:32:24','2014-06-04',NULL,'待审核','','off',NULL),
	(18,'温热委屈',1,NULL,'修改',NULL,'2014-05-29','2014-06-15 00:00:57','2014-06-01',NULL,'已关闭','','off',NULL),
	(19,'a',1,NULL,'看见了好可怜好',NULL,'2014-05-15','2014-06-23 09:37:06','2014-05-17',NULL,'已关闭','','off',NULL),
	(20,'mod 13',1,NULL,'看见了好可怜好',NULL,'2014-05-30','2014-06-23 09:37:33','2014-06-01',NULL,'已关闭','','off',NULL),
	(21,'mod 7',1,NULL,'asl;dkfhjaskldjfklasdjfls;dfj',NULL,'2014-05-30','2014-06-23 09:40:36','2014-06-01',NULL,'待审核','','off',NULL),
	(22,'mod 21',1,NULL,'asl;dkfhjaskldjfks',NULL,'2014-05-31','2014-06-23 09:43:30','2014-06-21',NULL,'待审核','','off',NULL),
	(23,'温热委屈',1,NULL,'s',NULL,'2014-05-31','2014-06-23 09:44:22','2014-06-13',NULL,'已关闭','','off',NULL),
	(24,'温热委屈',1,NULL,'asl;dkfhjaskl',NULL,'2014-06-27','2014-06-23 09:48:47','2014-06-29',NULL,'待审核','','on',NULL),
	(25,'温热委屈 mod',1,NULL,'asl;dkfhjaskldjfklasdjfls;dfj',NULL,'2014-05-29','2014-06-23 10:05:56','2014-06-01',NULL,'已关闭','','off',NULL),
	(26,'温热委屈',1,NULL,'asl;dkfhjaskldjfklasdjfls;dfj',NULL,'2014-05-30','2014-06-23 10:20:24','2014-06-01',NULL,'已关闭','','off',NULL),
	(27,'aa',1,NULL,'asl;dkfhjaskldjfklasdjfls;dfj',NULL,'2014-06-08','2014-06-23 10:23:02','2014-06-27',NULL,'待审核','','off',NULL),
	(28,'moddddd',1,NULL,'25',NULL,'2014-05-29','2014-06-23 10:23:25','2014-06-01',NULL,'已关闭','','off',NULL),
	(29,'dailiang',1,NULL,'909009',NULL,'2014-06-08','2014-06-23 17:21:13','2014-06-28',NULL,'待审核','','off',NULL),
	(30,'mod 7',1,NULL,'asl;dkfhjaskldjfklasdjfls;dfj',NULL,'2014-05-30','2014-06-24 14:58:18','2014-06-01',NULL,'待审核','','off',NULL),
	(31,'天天',1,NULL,'qwrtewrytewywrt',NULL,'2014-06-01','2014-06-24 15:01:27','2014-06-01',NULL,'待审核','','off',NULL),
	(32,'天天1',1,NULL,'qwrtewrytewywrt',NULL,'2014-06-01','2014-06-24 15:02:25','2014-06-01',NULL,'待审核','','off',NULL),
	(33,'天天2',1,NULL,'qwrtewrytewywrt',NULL,'2014-06-01','2014-06-24 15:02:59','2014-06-01',NULL,'待审核','','off',NULL),
	(34,'测试一下',1,NULL,'嘿嘿',NULL,'2014-06-27','2014-06-24 15:12:15','2014-07-04',NULL,'待审核','','off',NULL),
	(35,'温热委屈12222',1,NULL,'asl;dkfhjaskldjfklasdjfls;dfj',NULL,'2014-05-30','2014-06-24 18:21:47','2014-06-01',NULL,'待审核','','off',NULL),
	(36,'啊',1,NULL,'嘿嘿，我们有新版了',NULL,'2014-06-06','2014-06-24 18:57:02','2014-06-13',NULL,'已关闭','','on',NULL),
	(37,'啊',1,NULL,'<p>\r\n	嘿嘿，我们有新版了\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	我又改了我又改了\r\n</p>',NULL,'2014-06-15','2014-06-24 18:57:55','2014-06-28',NULL,'已关闭','','off',NULL),
	(38,'撒地方黑龙江卡上的发射监控和罚款绿色减肥的话',1,NULL,'<span style=\"color:#ff0000;\">撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿',NULL,'2014-06-07','2014-06-24 21:58:01','2014-07-01',NULL,'已审核','','on',NULL),
	(39,'撒地方黑龙江5555555555卡上的发射监控和罚款绿色减肥的话',1,NULL,'<span style=\"color:#ff0000;\">撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿色减肥的话撒地方黑龙江卡上的发射监控和罚款绿',NULL,'2014-06-07','2014-06-24 21:59:30','2014-07-01',NULL,'已审核','','on',NULL),
	(40,'阿飒飒飒飒说',1,NULL,'阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说<br />阿飒飒飒飒说阿飒飒飒飒说阿飒',NULL,'2014-06-09','2014-06-24 22:06:57','2014-07-07',NULL,'待审核','','on',NULL),
	(41,'阿飒飒飒飒说',1,NULL,'阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说<br />阿飒飒飒飒说阿飒飒飒飒说阿飒',NULL,'2014-06-09','2014-06-24 22:07:00','2014-07-07',NULL,'待审核','','on',NULL),
	(42,'阿飒飒飒飒说',1,NULL,'阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说<br />阿飒飒飒飒说阿飒飒飒飒说阿飒',NULL,'2014-06-09','2014-06-24 22:07:01','2014-07-07',NULL,'待审核','','on',NULL),
	(43,'阿飒飒飒飒说',1,NULL,'阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说<br />阿飒飒飒飒说阿飒飒飒飒说阿飒',NULL,'2014-06-09','2014-06-24 22:07:01','2014-07-07',NULL,'待审核','','on',NULL),
	(44,'阿飒飒飒飒说',1,NULL,'阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说<br />阿飒飒飒飒说阿飒飒飒飒说阿飒',NULL,'2014-06-09','2014-06-24 22:07:02','2014-07-07',NULL,'待审核','','on',NULL),
	(45,'阿飒飒飒飒说',1,NULL,'阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说阿飒飒飒飒说<br />阿飒飒飒飒说阿飒飒飒飒说阿飒',NULL,'2014-06-09','2014-06-24 22:07:02','2014-07-07',NULL,'待审核','','on',NULL),
	(46,'了快回来快回来快回来快来看',1,NULL,'了快回来快回来快回来快来看了快回来快回来快回来快来看了快回来快回来快回来快来看了快回来快回来快回来快来看了快回来快回来快回来快来看了快回来快回来快回来快来看了快回来快回来快回来快来看了快回来快回来快回来快来看了快回来快回来快回来快来看<br />了快回来快回来快回来快来看了快回来快回来快回来快来看了快回来快回来快回来快来看了快回来快回来快回来快来看了快回来快回来快回来快来看了快回来快回来快回来快来',NULL,'2014-06-10','2014-06-24 22:11:25','2014-07-09',NULL,'待审核','','on',NULL),
	(47,'快乐就会立刻就会立刻回家看了',1,NULL,'快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会',NULL,'2014-06-23','2014-06-24 22:13:00','2014-07-02',NULL,'已关闭','','on',NULL),
	(48,'快乐就会立刻就会立刻回家看了',1,NULL,'快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会',NULL,'2014-06-23','2014-06-24 22:26:23','2014-07-02',NULL,'待审核','','on',NULL),
	(49,'回家就来开会开交流会',1,NULL,'回家就来开会开交流会回家就来开会开交流会回家就来开会开交流会回家就来开会开交流会回家就来开会开交流会',NULL,'2014-06-10','2014-06-24 22:26:54','2014-07-09',NULL,'待审核','','off',NULL),
	(50,'客观和恐惧感和健康更健康',1,NULL,'<span style=\"color:#ffff66;background-color: rgb(51, 102, 255);\">客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和',NULL,'2014-06-02','2014-06-24 22:34:32','2014-06-17',NULL,'待审核','','on',NULL),
	(51,'科技和空间',1,NULL,'何况快乐就好可怜好可怜好可怜好',NULL,'2014-06-27','2014-06-24 22:48:02','2014-07-09',NULL,'待审核','','off',NULL),
	(52,'科技和空间',1,NULL,'何况快乐就好可怜好可怜好可怜好',NULL,'2014-06-27','2014-06-24 22:50:45','2014-06-29',NULL,'待审核','','off',NULL),
	(53,'dsfakjshfdkljasdlkjfhkjaslhdflkjas撒的咖啡机哈就哭了多少',1,NULL,'dsfakjshfdkljasdlkjfhkjaslhdflkjas撒的咖啡机哈就哭了多少法赫卡里就阿萨德dsfakjshfdkljasdlkjfhkjaslhdflkjas撒的咖啡机哈就哭了多少法赫卡里就阿萨德dsfakjshfdkljasdlkjfhkjaslhdflkjas撒的咖啡机哈就哭了多少法赫卡里就阿萨德dsfakjshfdkljasdlkjfhkjaslhdflkjas撒的咖啡机哈就',NULL,'2014-06-03','2014-06-24 23:50:13','2014-06-29',NULL,'已审核','','off',NULL),
	(54,'三大空间里发哈善良看见对方',1,NULL,'三大空间里发哈善良看见对方三大空间里发哈善良看见对方三大空间里发哈善良看见对方三大空间里发哈善良看见对方三大空间里发哈善良看见对方三大空间里发哈善良看见对方三大空间里发哈善良看见对方三大空间里发哈善良看见对方<br />三大空间里发哈善良看见对方三大空间里发哈善良看见对方三大空间里发哈善良看见对方三大空间里发哈善良看见对方<br />三大空间里发哈善良看见对方三大空间里发哈善良看见对方三大空间里发',NULL,'2014-06-10','2014-06-24 23:51:23','2014-06-24',NULL,'待审核','','on',NULL),
	(55,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',1,NULL,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',NULL,'2014-06-03','2014-06-24 23:51:50','2014-06-18',NULL,'待审核','','on',NULL),
	(56,'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',1,NULL,'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',NULL,'2014-06-11','2014-06-24 23:55:22','2014-06-24',NULL,'待审核','','on',NULL),
	(57,'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',1,NULL,'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',NULL,'2014-06-11','2014-06-24 23:55:31','2014-06-24',NULL,'待审核','','on',NULL),
	(58,'ccccccccc',1,NULL,'ccccccccc<br />',NULL,'2014-06-04','2014-06-24 23:56:29','2014-07-01',NULL,'待审核','','on',NULL),
	(59,'rrrrrr温热委屈12222',1,NULL,'asl;dkfhjaskldjfklasdjfls;dfj',NULL,'2014-05-30','2014-06-24 23:59:35','2014-06-01',NULL,'已关闭','','on',NULL),
	(60,'88888mod 7',1,NULL,'asl;dkfhjaskldjfklasdjfls;dfj',NULL,'2014-05-30','2014-06-25 00:00:25','2014-06-01',NULL,'待审核','','on',NULL),
	(61,'客观和恐惧感和健康更健康',1,NULL,'<span style=\"color:#ffff66;background-color: rgb(51, 102, 255);\">客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和恐惧感和健康更健康客观和',NULL,'2014-06-02','2014-06-25 09:30:47','2014-06-17',NULL,'待审核','','on',NULL),
	(62,'rrrrrr温热委屈12222',1,NULL,'asl;dkfhjaskldjfklasdjfls;dfj',NULL,'2014-05-30','2014-06-25 09:31:03','2014-06-01',NULL,'已审核','','off',NULL),
	(63,'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',1,NULL,'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',NULL,'2014-06-11','2014-06-25 09:36:48','2014-06-24',NULL,'待审核','','off',NULL),
	(64,'sa',1,NULL,'dafadfsd',NULL,'2014-06-13','2014-06-26 14:47:55','2014-07-02',NULL,'待审核','','off',NULL),
	(65,'nihao',1,NULL,'test dwz<br />',NULL,'2014-06-28','2014-06-26 14:49:29','2014-06-30',NULL,'待审核','','off',NULL),
	(66,'温热委屈12222',1,NULL,'asl;dkfhjaskldjfklasdjfls;dfj',NULL,'2014-05-31','2014-06-26 15:31:18','2014-06-01',NULL,'已审核','','off',NULL),
	(67,'mod 7',1,NULL,'摩电灯',NULL,'2014-05-31','2014-06-26 15:34:29','2014-06-28',NULL,'待审核','','off',NULL),
	(68,'nihao',0,NULL,'this is 我的第一个任务哈哈哈哈哈',NULL,'2014-06-27','2014-06-27 16:42:36','2014-07-31',NULL,'已关闭','','off',NULL),
	(69,'nihao',0,NULL,'this is 我的第一个任务哈哈哈哈哈',NULL,'2014-06-11','2014-06-27 16:54:46','2014-07-31',NULL,'已关闭','','on',NULL),
	(70,'nihao',0,NULL,'<p>this is 我的第一个任务哈哈哈哈哈</p><p>modify 1</p>',NULL,'2014-06-11','2014-06-27 16:55:17','2014-08-02',NULL,'已关闭','','off',NULL),
	(71,'nihao',0,NULL,'<p>this is 我的第一个任务哈哈哈哈哈</p><p>modify 1</p><p>mod 2</p>',NULL,'2014-08-01','2014-06-27 16:56:12','2014-08-02',NULL,'已审核','','on',NULL),
	(72,'rrrrrr温热委屈12222',1,NULL,'<p>asl;dkfhjaskldjfklasdjfls;dfj</p><p><br /></p><p>modi</p>',NULL,'2014-07-18','2014-06-27 16:57:21','2014-07-20',NULL,'已关闭','','on',NULL),
	(73,'momo',1,NULL,'mod1 test DWZ',NULL,'2014-06-05','2014-06-27 16:57:54','2014-06-27',NULL,'待审核','','on',NULL),
	(74,'nihao',0,NULL,'<p>this is 我的第一个任务哈哈哈哈哈</p><p>modify 1</p><p>mod 2</p><p><br /></p><p>mod3<br /></p>',NULL,'2014-08-01','2014-06-27 21:26:03','2014-08-02',NULL,'已关闭','','off',NULL),
	(75,'nihao mod3',0,NULL,'<p>this is 我的第一个任务哈哈哈哈哈</p><p>modify 1</p><p>mod 2</p><p><br /></p><p>mod3 <br /></p>',NULL,'2014-08-01','2014-06-27 21:26:50','2014-08-02',NULL,'已关闭','','off',NULL),
	(76,'nihao mod3',0,NULL,'<p>this is 我的第一个任务哈哈哈哈哈</p><p>modify 1</p><p>mod 2</p><p><br /></p><p>mod3&nbsp;</p><p><br /></p><p>mod4<br /></p>',NULL,'2014-08-01','2014-06-27 21:33:24','2014-08-02',NULL,'已关闭','','off',NULL),
	(77,'rrrrrr温热委屈12222  mod3',1,NULL,'<p>asl;dkfhjaskldjfklasdjfls;dfj</p><p>mod3</p>',NULL,'2014-05-30','2014-06-27 21:54:00','2014-06-21',NULL,'待审核','','off',NULL),
	(78,'rrrrrr温热委屈12222',1,NULL,'<p><span style=\"color:#ff0000;\">asl;dkfhjaskldjfklasdjfls;dfj</span></p><p><span style=\"color:#ff0000;\"><br /></span></p><p><span style=\"color:#ff0000;\">modi</span></p>',NULL,'2014-07-18','2014-06-27 22:16:00','2014-07-20',NULL,'待审核','','off',NULL),
	(79,'nihao mod3',0,NULL,'<p>this is 我的第一个任务哈哈哈哈哈</p><p>modify 1</p><p>mod 2</p><p>ss</p><p>mod3&nbsp;</p><p><br /></p><p>mod4<br /></p>',NULL,'2014-08-01','2014-06-27 22:16:56','2014-08-02',NULL,'已关闭','','off',NULL),
	(80,'nihao mod3',0,NULL,'<p>this is 我的第一个任务哈哈哈哈哈</p><p>modify 1</p><p>mod 2</p><p>ss</p><p>mod3 ssss</p><p><br /></p><p>mod4<br /></p>',NULL,'2014-08-01','2014-06-27 22:17:28','2014-08-02',NULL,'已关闭','','off',NULL),
	(81,'nihao mod3',0,NULL,'<p>this is 我的第一个任务哈哈哈哈哈</p><p>modify 1</p><p>mod 2</p><p>ss</p><p>mod3 ssss</p><p>sflsjflsflsjflsf</p><p>mod4<br /></p>',NULL,'2014-08-01','2014-06-27 22:17:48','2014-08-02',NULL,'已审核','','off',NULL),
	(82,'dasdfsdfsd ',0,NULL,'<p>this is 我的第一个任务哈哈哈哈哈</p><p>modify 1</p><p>mod 2</p><p><br /></p><p>mod3<br /></p>',NULL,'2014-08-01','2014-06-27 22:49:14','2014-08-02',NULL,'已审核','','off',NULL),
	(83,'s',0,NULL,'s',NULL,'2014-06-28','2014-06-28 00:08:01','2014-06-28',NULL,'待审核','','off',NULL),
	(84,'快乐就会立刻就会立刻回家看了',1,NULL,'快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会立刻就会立刻回家看了快乐就会',NULL,'2014-06-23','2014-07-01 13:56:40','2014-07-02',NULL,'待审核','','off',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;

INSERT INTO `USER` (`user_id`, `user_name`, `user_tel`, `user_email`)
VALUES
	(1,'test','15005173785','ijry@qq.com'),
	(3,'test2','3','liurusi_101@163.com');

/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
