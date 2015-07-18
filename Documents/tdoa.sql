/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : tdoa

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2015-07-18 15:39:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` int(10) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(10) NOT NULL,
  `account_sex` varchar(10) NOT NULL,
  `account_username` varchar(50) NOT NULL,
  `account_work` char(64) DEFAULT NULL,
  `account_position` varchar(50) NOT NULL,
  `account_phone` varchar(12) NOT NULL,
  `account_address` varchar(100) NOT NULL,
  `account_email` varchar(50) NOT NULL,
  `account_department` varchar(50) NOT NULL,
  `account_power` int(15) DEFAULT NULL,
  `account_password` varchar(128) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'user', '男', 'user3', '1', '处长', '15380929106', 'NJUPT', 'hao-hy@hotmail.com', '1', '1', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('2', 'user', '男', 'user2', '1', '副教授', '123412423123', 'njupt', '2998336811@qq.com', '1', '3', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('3', 'user', '女', 'user1', '3', '科长', '13434534534', 'njupt', '2342343@163.com', '2', '4', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('4', 'admin', '男', 'admin', '1', '管理员', '11111111111', 'njupt', '1111111111@qq.com', '1', '3322', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('5', 'user', '男', '郝鸿延', 'B13111430', '处长', '15380929106', '南京市栖霞区文苑路九号', 'hao-hy@hotmail.com', '1', '3322', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('6', 'user', '男', '王松', 'B13111111', '校长', '11111111111', '北京市', 'wangsong@wangsong.com', '2', '3321', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('7', 'user', '男', '李杭', 'B13111111', '处长', '11111111111', '云南省', 'lihang@lihang.com', '1', '3322', 'e10adc3949ba59abbe56e057f20f883e');

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
  `mission_name` varchar(100) NOT NULL,
  `mission_content` longtext NOT NULL,
  `mission_starttime` date NOT NULL,
  `mission_plan_end_time` date NOT NULL,
  `mission_endtime` date NOT NULL,
  `mission_publisher` varchar(0) NOT NULL,
  `mission_doer` varchar(0) NOT NULL,
  `mission_message` varchar(0) DEFAULT NULL,
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
  `message_sender` varchar(50) NOT NULL,
  `message_reciever` varchar(50) NOT NULL,
  `message_content` varchar(500) DEFAULT NULL,
  `message_mission` varchar(100) NOT NULL,
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
  `mission_name` varchar(100) NOT NULL,
  `mission_content` varchar(500) NOT NULL,
  `mission_pubtime` date NOT NULL,
  `mission_starttime` date NOT NULL,
  `mission_plan_end_time` date NOT NULL,
  `mission_endtime` date DEFAULT NULL,
  `mission_publisher` varchar(50) NOT NULL,
  `mission_appendix` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mission
-- ----------------------------
INSERT INTO `mission` VALUES ('1', '1', 'secondcontent 待接受', '2015-07-17', '2015-07-21', '2015-07-29', null, '郝鸿延', null);
INSERT INTO `mission` VALUES ('2', '2', 'seventhcontent 执行中', '2015-07-18', '2015-07-18', '2015-07-23', null, '郝鸿延', null);
INSERT INTO `mission` VALUES ('3', '3', 'eightthcontent 已提交', '2015-07-16', '2015-07-18', '2015-07-23', null, '郝鸿延', null);
INSERT INTO `mission` VALUES ('4', '4', 'ninthcontent 未通过', '2015-07-17', '2015-07-17', '2015-07-19', null, '郝鸿延', null);
INSERT INTO `mission` VALUES ('5', '5', 'firstcontent 已完成', '2015-07-18', '2015-07-21', '2015-07-31', '2015-07-30', '郝鸿延', null);
INSERT INTO `mission` VALUES ('6', '6', 'fifthconteent 待接受', '2015-07-18', '2015-07-19', '2015-07-25', null, '王松', null);
INSERT INTO `mission` VALUES ('7', '7', 'tenthcontent 执行中', '2015-07-16', '2015-07-17', '2015-07-23', null, '王松', null);
INSERT INTO `mission` VALUES ('8', '8', 'fourthcontent 已提交', '2015-07-16', '2015-07-17', '2015-07-23', null, '王松', null);
INSERT INTO `mission` VALUES ('9', '9', 'sixthcontent 未通过', '2015-07-18', '2015-07-19', '2015-07-24', null, '王松', null);
INSERT INTO `mission` VALUES ('10', '10', 'thirdcontent 已完成', '2015-07-14', '2015-07-15', '2015-07-17', '2015-07-19', '王松', null);

-- ----------------------------
-- Table structure for `missions_doers`
-- ----------------------------
DROP TABLE IF EXISTS `missions_doers`;
CREATE TABLE `missions_doers` (
  `mission_do_id` int(11) NOT NULL AUTO_INCREMENT,
  `mission_id` int(11) NOT NULL,
  `mission_doer` varchar(100) NOT NULL,
  `mission_status` varchar(20) NOT NULL,
  PRIMARY KEY (`mission_do_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of missions_doers
-- ----------------------------
INSERT INTO `missions_doers` VALUES ('1', '1', '王松', '待接受');
INSERT INTO `missions_doers` VALUES ('2', '1', '李杭', '待接受');
INSERT INTO `missions_doers` VALUES ('3', '2', '王松', '执行中');
INSERT INTO `missions_doers` VALUES ('4', '2', '李杭', '执行中');
INSERT INTO `missions_doers` VALUES ('5', '3', '王松', '已提交');
INSERT INTO `missions_doers` VALUES ('6', '3', '李杭', '已提交');
INSERT INTO `missions_doers` VALUES ('7', '4', '王松', '未通过');
INSERT INTO `missions_doers` VALUES ('8', '4', '李杭', '未通过');
INSERT INTO `missions_doers` VALUES ('9', '5', '王松', '已完成');
INSERT INTO `missions_doers` VALUES ('10', '5', '李杭', '已完成');
