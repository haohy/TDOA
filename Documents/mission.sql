/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : tdoa

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2015-07-19 15:09:39
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

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
INSERT INTO `mission` VALUES ('11', '11', '测试m_list_id会输出什么', '2015-07-18', '2015-07-22', '2015-07-30', null, '郝鸿延', null);
INSERT INTO `mission` VALUES ('17', '测试my_mission', 'my_mission', '2015-07-18', '2015-07-18', '2015-07-21', null, '王松', null);
INSERT INTO `mission` VALUES ('18', 'my_mission2', 'my_mission2', '2015-07-18', '2015-07-20', '2015-07-23', null, '郝鸿延', null);
INSERT INTO `mission` VALUES ('19', '1:19测试', '测试更改后的mission_list好使不', '2015-07-19', '2015-07-20', '2015-07-22', null, '郝鸿延', null);
INSERT INTO `mission` VALUES ('20', '测试1', '测试1', '2015-07-19', '2015-07-20', '2015-07-22', null, '郝鸿延', null);
INSERT INTO `mission` VALUES ('21', 'mission_pubtime', 'mission_pubtime<span style=\"white-space:pre\">	</span>', '2015-07-19', '2015-07-21', '2015-07-28', null, '郝鸿延', null);
