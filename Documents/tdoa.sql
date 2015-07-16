/*
Navicat MySQL Data Transfer

Source Server         : ws
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : tdoa

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2015-07-15 10:51:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` int(3) NOT NULL auto_increment,
  `account_name` varchar(10) NOT NULL default '',
  `account_phone` varchar(12) default '',
  `account_username` varchar(30) NOT NULL default '',
  `account_sex` varchar(8) default '',
  `account_position` varchar(64) NOT NULL,
  `account_department` varchar(8) NOT NULL default '',
  `account_email` varchar(50) NOT NULL default '',
  `account_address` varchar(50) NOT NULL default '',
  `account_password` varchar(128) NOT NULL default '',
  `account_work` varchar(64) default '',
  `account_power` int(8) default NULL,
  PRIMARY KEY  (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('2', 'user', '123412423123', 'lh', '男', '副教授', '1', '2998336811@qq.com', 'njupt', '098f6bcd4621d373cade4e832627b4f6', '1', '2222');
INSERT INTO `account` VALUES ('3', 'user', '13434534534', 'hh', '女', '科长', '2', '2342343@163.com', 'njupt', '098f6bcd4621d373cade4e832627b4f6', '3', '1212');
INSERT INTO `account` VALUES ('4', 'admin', '23123423423', 'admin', 'admin', 'admin', '3', '3523453@qq.com', 'njupt', '098f6bcd4621d373cade4e832627b4f6', '0', '0');
INSERT INTO `account` VALUES ('16', 'admin', '18351928202', '杨大大', '', '校长', '6', '319827688@qq.com', '', '', '1234', '3322');
INSERT INTO `account` VALUES ('21', 'user', '12345678910', '教务管理', '', '处长', '1', '1234567@qq.com', '', '', '2', '2221');
INSERT INTO `account` VALUES ('22', 'user', '18351928202', '王松', '', '学生', '2', '319827688@qq.com', '', 'e10adc3949ba59abbe56e057f20f883e', 'B13070412', '1121');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `file_id` smallint(5) NOT NULL auto_increment,
  `file_name` text NOT NULL,
  `file_address` varchar(255) default NULL,
  `file_uploader` text,
  `file_time` date default NULL,
  `file_type` text,
  PRIMARY KEY  (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------

-- ----------------------------
-- Table structure for history_mission
-- ----------------------------
DROP TABLE IF EXISTS `history_mission`;
CREATE TABLE `history_mission` (
  `mission_id` tinyint(5) NOT NULL auto_increment,
  `mission_name` text NOT NULL,
  `mission_content` longtext,
  `mission_start` date NOT NULL,
  `mission_plan_end` date NOT NULL,
  `mission_end` date NOT NULL,
  `mission_publisher` text NOT NULL,
  `mission_doer` text NOT NULL,
  `mission_status` tinytext NOT NULL,
  `mission_pubtime` datetime default NULL,
  `mission_year` tinyint(2) NOT NULL,
  `mission_appendix` varchar(255) default NULL,
  PRIMARY KEY  (`mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history_mission
-- ----------------------------

-- ----------------------------
-- Table structure for mission
-- ----------------------------
DROP TABLE IF EXISTS `mission`;
CREATE TABLE `mission` (
  `mission_id` tinyint(5) NOT NULL auto_increment,
  `mission_name` varchar(45) NOT NULL default '',
  `mission_content` varchar(200) NOT NULL default '',
  `mission_starttime` date NOT NULL default '0000-00-00',
  `mission_plan_end_time` date NOT NULL default '0000-00-00',
  `mission_publisher` varchar(30) NOT NULL default '',
  `mission_doer` varchar(30) NOT NULL default '',
  `mission_status` tinytext NOT NULL,
  `mission_pubtime` datetime default NULL,
  `mission_appendix` varchar(255) default NULL,
  `mission_duplicate` varchar(3) NOT NULL,
  PRIMARY KEY  (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mission
-- ----------------------------
INSERT INTO `mission` VALUES ('1', 'helloworld', 'show the truth', '2013-12-03', '2014-05-06', 'hhy', 'lh', '已审核', '2014-12-23 00:00:00', '是', '');
INSERT INTO `mission` VALUES ('2', 'hello', 'show the truth', '2014-05-06', '2015-06-06', 'lh', 'hhy', '已关闭', '2014-05-06 13:05:06', '否', '');
INSERT INTO `mission` VALUES ('3', '开始战斗', '怎么办呢呢，那边数据库还是有问题', '2015-07-13', '2015-07-19', 'hhy', 'hhy', '已关闭', '2015-07-13 09:46:27', null, 'off');
INSERT INTO `mission` VALUES ('4', '什么叫他人账号', '测试一下，什么叫他人账号', '2015-07-13', '2015-07-20', 'hhy', 'hh', '已关闭', '2015-07-13 09:49:14', null, 'off');
INSERT INTO `mission` VALUES ('5', 'woshishabi', '<p>nizhidaoma&nbsp;</p><p>zhehsiyigekaixin dshi qing</p>', '2015-07-06', '2015-07-16', 'hh', 'hh', '已关闭', '2015-07-13 15:29:40', null, 'off');
INSERT INTO `mission` VALUES ('6', '开始战斗', '怎么办呢呢，那边数据库还是有问题,怎么会这样呢', '2015-07-13', '2015-07-19', 'hhy', '', '已关闭', '2015-07-13 15:36:03', null, 'off');
INSERT INTO `mission` VALUES ('7', '开始战斗', '怎么办呢呢，那边数据库还是有问题,怎么会这样呢，呵呵呵大，是不是bug', '2015-07-13', '2015-07-19', 'hhy', '', '待审核', '2015-07-13 15:36:49', null, 'off');
INSERT INTO `mission` VALUES ('8', 'hello', '<p>show the truth</p><p>and you will more happy</p>', '2014-05-06', '2015-06-06', 'hhy', 'hhy', '待审核', '2015-07-13 18:00:36', null, 'off');
INSERT INTO `mission` VALUES ('9', 'fheioh', 'dfioewgireoigniehfnioe', '2015-07-13', '2015-07-15', 'hh', '', '待审核', '2015-07-13 18:58:52', null, 'off');
INSERT INTO `mission` VALUES ('10', 'wobushishabi', '<p>nizhidaoma&nbsp;</p><p>zhehsiyigekaixin dshi qing</p>', '2015-07-06', '2015-07-16', 'hh', 'hh', '待审核', '2015-07-14 11:54:02', null, 'off');
INSERT INTO `mission` VALUES ('11', '什么叫他人账号goubi', '测试一下，什么叫他人账号', '2015-07-13', '2015-07-20', 'hh', '', '待审核', '2015-07-14 11:56:47', null, 'off');
INSERT INTO `mission` VALUES ('12', 'dfheighoif', '<p>dfiewgiearg</p><p>nsiegeogjrig</p>', '2015-07-13', '2015-07-18', 'hhy', 'hhy', '待审核', '2015-07-14 17:02:36', null, 'off');
INSERT INTO `mission` VALUES ('13', 'hhy', 'hhy', '2015-07-15', '2015-07-25', 'hh', 'hh', '待审核', '2015-07-14 17:29:01', null, 'on');
INSERT INTO `mission` VALUES ('14', '测试日历功能', '<p>怎么会这样</p><p>还是尝试一下</p>', '2015-07-14', '2015-07-15', 'hh', 'hh', '待审核', '2015-07-14 18:23:18', null, 'off');
INSERT INTO `mission` VALUES ('15', '我的任务', '这次必须要完成任务，我觉的课余时间还得继续学习新知识', '2015-07-15', '2015-07-18', '王松', '王松', '待审核', '2015-07-14 19:07:05', null, 'off');
