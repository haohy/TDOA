/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : tdoa

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2015-07-21 08:52:49
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of missions_doers
-- ----------------------------
INSERT INTO `missions_doers` VALUES ('70', '37', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('71', '37', '郝鸿延', '已完成');
INSERT INTO `missions_doers` VALUES ('72', '38', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('73', '38', 'admin', '待接受');
INSERT INTO `missions_doers` VALUES ('74', '38', '郝鸿延', '已提交');
INSERT INTO `missions_doers` VALUES ('75', '39', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('76', '39', '郝鸿延', '未通过');
INSERT INTO `missions_doers` VALUES ('77', '39', '王松', '待接受');
INSERT INTO `missions_doers` VALUES ('78', '40', 'user3', '待接受');
INSERT INTO `missions_doers` VALUES ('79', '40', 'user2', '待接受');
INSERT INTO `missions_doers` VALUES ('80', '40', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('81', '40', 'admin', '待接受');
INSERT INTO `missions_doers` VALUES ('82', '40', '郝鸿延', '已提交');
INSERT INTO `missions_doers` VALUES ('83', '40', '王松', '待接受');
INSERT INTO `missions_doers` VALUES ('84', '40', '李杭', '待接受');
INSERT INTO `missions_doers` VALUES ('85', '41', 'user3', '待接受');
INSERT INTO `missions_doers` VALUES ('86', '41', 'user2', '待接受');
INSERT INTO `missions_doers` VALUES ('87', '41', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('88', '41', 'admin', '待接受');
INSERT INTO `missions_doers` VALUES ('89', '41', '郝鸿延', '已完成');
INSERT INTO `missions_doers` VALUES ('90', '41', '王松', '待接受');
INSERT INTO `missions_doers` VALUES ('91', '41', '李杭', '待接受');
INSERT INTO `missions_doers` VALUES ('92', '42', '郝鸿延', '已提交');
INSERT INTO `missions_doers` VALUES ('93', '42', '王松', '待接受');
INSERT INTO `missions_doers` VALUES ('94', '43', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('95', '43', '郝鸿延', '已提交');
INSERT INTO `missions_doers` VALUES ('96', '44', 'user2', '待接受');
INSERT INTO `missions_doers` VALUES ('97', '44', '郝鸿延', '已提交');
INSERT INTO `missions_doers` VALUES ('98', '45', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('99', '45', '郝鸿延', '已提交');
INSERT INTO `missions_doers` VALUES ('100', '46', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('101', '46', '郝鸿延', '执行中');
INSERT INTO `missions_doers` VALUES ('102', '47', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('103', '47', '郝鸿延', '待接受');
INSERT INTO `missions_doers` VALUES ('104', '48', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('105', '48', '郝鸿延', '待接受');
