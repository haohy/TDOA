/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : tdoa

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2015-07-06 19:10:29
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
  `account_email` varchar(50) NOT NULL,
  `account_address` text NOT NULL,
  `account_password` varchar(100) NOT NULL,
  `account_work` int(4) DEFAULT NULL,
  `account_power1` tinyint(1) DEFAULT NULL,
  `account_power2` tinyint(1) DEFAULT NULL,
  `account_power3` tinyint(1) DEFAULT NULL,
  `account_power4` tinyint(1) DEFAULT NULL,
  `account_power5` tinyint(1) DEFAULT NULL,
  `account_power6` tinyint(1) DEFAULT NULL,
  `account_power7` tinyint(1) DEFAULT NULL,
  `account_power8` tinyint(1) DEFAULT NULL,
  `account_power9` tinyint(1) DEFAULT NULL,
  `account_power10` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'admin', '15380929106', '郝鸿延', '男', '处长', 'hao-hy@hotmail.com', 'NJUPT', 'admin', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `account` VALUES ('2', 'user', null, 'hhy', '女', '副教授', '2998336811@qq.com', 'njupt', 'o', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `file_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `file_name` text NOT NULL,
  `file_address` varchar(255) DEFAULT NULL,
  `file_uploader` text,
  `file_time` time DEFAULT NULL,
  `file_type` text,
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
  `his_mis_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `his_mis_name` text NOT NULL,
  `his_mis_doer` text,
  `his_mis_time` time DEFAULT NULL,
  PRIMARY KEY (`his_mis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history_mission
-- ----------------------------

-- ----------------------------
-- Table structure for `mission`
-- ----------------------------
DROP TABLE IF EXISTS `mission`;
CREATE TABLE `mission` (
  `mission_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `mission_name` text NOT NULL,
  `mission_content` longtext,
  `mission_start` time NOT NULL,
  `mission_end` time NOT NULL,
  `mission_publisher` text NOT NULL,
  `mission_doer` text NOT NULL,
  `mission_status` tinytext NOT NULL,
  `mission_pubtime` time DEFAULT NULL,
  `mission_year` tinyint(2) NOT NULL,
  `mission_appendix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mission
-- ----------------------------
