/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : tdoa

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2015-07-16 15:36:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` int(3) NOT NULL,
  `account_name` varchar(10) NOT NULL,
  `account_phone` varchar(12) DEFAULT NULL,
  `account_username` text NOT NULL,
  `account_sex` text,
  `account_position` text NOT NULL,
  `account_department` text NOT NULL,
  `account_email` varchar(50) NOT NULL,
  `account_address` text NOT NULL,
  `account_password` varchar(100) NOT NULL,
  `account_work` int(4) DEFAULT NULL,
  `account_power` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'user', '15380929106', 'hhy', '男', '处长', '教务管理', 'hao-hy@hotmail.com', 'NJUPT', '098f6bcd4621d373cade4e832627b4f6', '1', '1');
INSERT INTO `account` VALUES ('2', 'user', '123412423123', 'lh', '男', '副教授', '考试科', '2998336811@qq.com', 'njupt', '098f6bcd4621d373cade4e832627b4f6', '1', '3');
INSERT INTO `account` VALUES ('3', 'user', '13434534534', 'hh', '女', '科长', '考试科', '2342343@163.com', 'njupt', '098f6bcd4621d373cade4e832627b4f6', '3', '4');
INSERT INTO `account` VALUES ('4', 'admin', '23123423423', 'admin', 'admin', 'admin', 'admin', '3523453@qq.com', 'njupt', '098f6bcd4621d373cade4e832627b4f6', '0', '0');

-- ----------------------------
-- Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `file_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `file_name` text NOT NULL,
  `file_address` varchar(255) NOT NULL,
  `file_uploader` text NOT NULL,
  `file_time` date NOT NULL,
  `file_linkmission` text NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------

-- ----------------------------
-- Table structure for `history_mission`
-- ----------------------------
DROP TABLE IF EXISTS `history_mission`;
CREATE TABLE `history_mission` (
  `mission_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `mission_name` text NOT NULL,
  `mission_content` longtext NOT NULL,
  `mission_starttime` date NOT NULL,
  `mission_plan_end_time` date NOT NULL,
  `mission_endtime` date NOT NULL,
  `mission_publisher` text NOT NULL,
  `mission_doer` text NOT NULL,
  `mission_message` text,
  `mission_appendix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history_mission
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(100) NOT NULL AUTO_INCREMENT,
  `message_sender` text NOT NULL,
  `message_reciever` text NOT NULL,
  `message_content` text,
  `message_mission` text NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `mission`
-- ----------------------------
DROP TABLE IF EXISTS `mission`;
CREATE TABLE `mission` (
  `mission_id` tinyint(9) NOT NULL AUTO_INCREMENT,
  `mission_name` text NOT NULL,
  `mission_content` longtext NOT NULL,
  `mission_pubtime` date NOT NULL,
  `mission_starttime` date NOT NULL,
  `mission_plan_end_time` date NOT NULL,
  `mission_endtime` date NOT NULL,
  `mission_publisher` text NOT NULL,
  `mission_doer` text NOT NULL,
  `mission_status` tinytext NOT NULL,
  `mission_appendix` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mission
-- ----------------------------
INSERT INTO `mission` VALUES ('1', 'helloworld', 'show the truth', '0000-00-00', '2013-12-03', '2014-05-06', '0000-00-00', 'hhy', 'lh', '审核中', '是');
INSERT INTO `mission` VALUES ('2', 'hello', 'show the truth', '0000-00-00', '2014-05-06', '2015-06-06', '0000-00-00', 'lh', 'hhy', '进行中', '否');
INSERT INTO `mission` VALUES ('3', 'hh', 'hh', '0000-00-00', '2015-07-10', '2015-07-18', '0000-00-00', 'hhy', 'hhy', 'hh', 'hh');
INSERT INTO `mission` VALUES ('4', 'new1', 'new1', '0000-00-00', '2015-07-17', '2015-07-21', '0000-00-00', 'hhy', 'lh', '执行中', '是');

-- ----------------------------
-- Table structure for `missions_doers`
-- ----------------------------
DROP TABLE IF EXISTS `missions_doers`;
CREATE TABLE `missions_doers` (
  `mission_do_id` int(11) NOT NULL AUTO_INCREMENT,
  `mission_doer` text NOT NULL,
  `mission_name` text NOT NULL,
  PRIMARY KEY (`mission_do_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of missions_doers
-- ----------------------------
