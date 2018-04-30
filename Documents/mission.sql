<<<<<<< HEAD
/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : tdoa

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2015-07-21 08:52:58
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
  `mission_starttime` date NOT NULL,
  `mission_pubtime` datetime NOT NULL,
  `mission_plan_end_time` date NOT NULL,
  `mission_endtime` date DEFAULT NULL,
  `mission_publisher` varchar(50) NOT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mission
-- ----------------------------
INSERT INTO `mission` VALUES ('37', '新建任务', '新建任务', '2015-07-20', '2015-07-20 16:45:54', '2015-07-22', null, '郝鸿延');
INSERT INTO `mission` VALUES ('38', '测试提交任务', '提交任务', '2015-07-21', '2015-07-20 19:50:23', '2015-07-24', null, '郝鸿延');
INSERT INTO `mission` VALUES ('39', '测试提交附件', '附件<span style=\"white-space:pre\">	</span>', '2015-07-21', '2015-07-20 20:22:53', '2015-07-24', null, '郝鸿延');
INSERT INTO `mission` VALUES ('40', 'element=0', 'element=0', '2015-07-21', '2015-07-20 20:41:43', '2015-08-22', null, '郝鸿延');
INSERT INTO `mission` VALUES ('41', '测试多个执行人不同状态', '测试多个执行人不同状态', '2015-07-15', '2015-07-20 21:58:15', '2015-07-31', null, '郝鸿延');
INSERT INTO `mission` VALUES ('42', '对文件测试', '测试上传文件', '2015-07-21', '2015-07-20 22:11:53', '2015-07-25', null, '郝鸿延');
INSERT INTO `mission` VALUES ('43', '测试查看已提交文件', '测试查看已提交文件<br />', '2015-07-21', '2015-07-20 22:51:16', '2015-07-28', null, '郝鸿延');
INSERT INTO `mission` VALUES ('44', '第二次测试已提交附件', '第二次测试已提交附件', '2015-07-21', '2015-07-20 22:53:46', '2015-07-30', null, '郝鸿延');
INSERT INTO `mission` VALUES ('45', '测试我的任务动态', '测试我的任务动态', '2015-07-22', '2015-07-21 08:44:47', '2015-07-31', null, '郝鸿延');
INSERT INTO `mission` VALUES ('46', '测试我的任务动态', '测试我的任务动态', '2015-07-22', '2015-07-21 08:44:51', '2015-07-31', null, '郝鸿延');
INSERT INTO `mission` VALUES ('47', '测试我的任务动态', '测试我的任务动态', '2015-07-22', '2015-07-21 08:45:07', '2015-07-31', null, '郝鸿延');
INSERT INTO `mission` VALUES ('48', '测试我的任务动态', '测试我的任务动态', '2015-07-22', '2015-07-21 08:45:31', '2015-07-31', null, '郝鸿延');
=======
/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : tdoa

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2015-07-21 08:52:58
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
  `mission_starttime` date NOT NULL,
  `mission_pubtime` datetime NOT NULL,
  `mission_plan_end_time` date NOT NULL,
  `mission_endtime` date DEFAULT NULL,
  `mission_publisher` varchar(50) NOT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mission
-- ----------------------------
INSERT INTO `mission` VALUES ('37', '新建任务', '新建任务', '2015-07-20', '2015-07-20 16:45:54', '2015-07-22', null, '郝鸿延');
INSERT INTO `mission` VALUES ('38', '测试提交任务', '提交任务', '2015-07-21', '2015-07-20 19:50:23', '2015-07-24', null, '郝鸿延');
INSERT INTO `mission` VALUES ('39', '测试提交附件', '附件<span style=\"white-space:pre\">	</span>', '2015-07-21', '2015-07-20 20:22:53', '2015-07-24', null, '郝鸿延');
INSERT INTO `mission` VALUES ('40', 'element=0', 'element=0', '2015-07-21', '2015-07-20 20:41:43', '2015-08-22', null, '郝鸿延');
INSERT INTO `mission` VALUES ('41', '测试多个执行人不同状态', '测试多个执行人不同状态', '2015-07-15', '2015-07-20 21:58:15', '2015-07-31', null, '郝鸿延');
INSERT INTO `mission` VALUES ('42', '对文件测试', '测试上传文件', '2015-07-21', '2015-07-20 22:11:53', '2015-07-25', null, '郝鸿延');
INSERT INTO `mission` VALUES ('43', '测试查看已提交文件', '测试查看已提交文件<br />', '2015-07-21', '2015-07-20 22:51:16', '2015-07-28', null, '郝鸿延');
INSERT INTO `mission` VALUES ('44', '第二次测试已提交附件', '第二次测试已提交附件', '2015-07-21', '2015-07-20 22:53:46', '2015-07-30', null, '郝鸿延');
INSERT INTO `mission` VALUES ('45', '测试我的任务动态', '测试我的任务动态', '2015-07-22', '2015-07-21 08:44:47', '2015-07-31', null, '郝鸿延');
INSERT INTO `mission` VALUES ('46', '测试我的任务动态', '测试我的任务动态', '2015-07-22', '2015-07-21 08:44:51', '2015-07-31', null, '郝鸿延');
INSERT INTO `mission` VALUES ('47', '测试我的任务动态', '测试我的任务动态', '2015-07-22', '2015-07-21 08:45:07', '2015-07-31', null, '郝鸿延');
INSERT INTO `mission` VALUES ('48', '测试我的任务动态', '测试我的任务动态', '2015-07-22', '2015-07-21 08:45:31', '2015-07-31', null, '郝鸿延');
>>>>>>> f41086b3477dec126aff19d257158dc3d3221e97
