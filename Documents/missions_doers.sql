/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : tdoa

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2015-07-19 15:09:45
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of missions_doers
-- ----------------------------
INSERT INTO `missions_doers` VALUES ('1', '1', '王松', '待接受');
INSERT INTO `missions_doers` VALUES ('2', '1', '李杭', '待接受');
INSERT INTO `missions_doers` VALUES ('3', '2', '王松', '执行中');
INSERT INTO `missions_doers` VALUES ('4', '2', '李杭', '执行中');
INSERT INTO `missions_doers` VALUES ('5', '3', '王松', '执行中');
INSERT INTO `missions_doers` VALUES ('6', '3', '李杭', '已提交');
INSERT INTO `missions_doers` VALUES ('7', '4', '王松', '未通过');
INSERT INTO `missions_doers` VALUES ('8', '4', '李杭', '未通过');
INSERT INTO `missions_doers` VALUES ('9', '5', '王松', '已完成');
INSERT INTO `missions_doers` VALUES ('10', '5', '李杭', '已完成');
INSERT INTO `missions_doers` VALUES ('13', '17', '郝鸿延', '待接受');
INSERT INTO `missions_doers` VALUES ('14', '17', '李杭', '待接受');
INSERT INTO `missions_doers` VALUES ('15', '18', 'user2', '执行中');
INSERT INTO `missions_doers` VALUES ('16', '18', '郝鸿延', '执行中');
INSERT INTO `missions_doers` VALUES ('17', '18', '王松', '执行中');
INSERT INTO `missions_doers` VALUES ('18', '19', 'user3', '待接受');
INSERT INTO `missions_doers` VALUES ('19', '19', '郝鸿延', '待接受');
INSERT INTO `missions_doers` VALUES ('20', '19', '王松', '待接受');
INSERT INTO `missions_doers` VALUES ('21', '19', '李杭', '待接受');
INSERT INTO `missions_doers` VALUES ('22', '20', '郝鸿延', '未通过');
INSERT INTO `missions_doers` VALUES ('23', '20', 'user2', '待接受');
INSERT INTO `missions_doers` VALUES ('24', '20', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('25', '20', '王松', '待接受');
INSERT INTO `missions_doers` VALUES ('26', '20', '李杭', '待接受');
INSERT INTO `missions_doers` VALUES ('27', '21', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('28', '21', 'admin', '待接受');
INSERT INTO `missions_doers` VALUES ('29', '21', '郝鸿延', '已提交');
INSERT INTO `missions_doers` VALUES ('30', '21', '王松', '待接受');
