/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : tdoa

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2015-07-22 13:12:03
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
INSERT INTO `account` VALUES ('4', 'admin', '男', 'admin', '1', '管理员', '11111111111', 'njupt', '1111111111@qq.com', '1', '3322', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('5', 'user', '男', '郝鸿延', 'B13111429', '处长', '15380929106', '南京市栖霞区文苑路九号', 'hao-hy@hotmail.com', '1', '2222', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('6', 'user', '男', '王松', 'B13111111', '校长', '11111111111', '北京市', 'wangsong@wangsong.com', '2', '3321', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('7', 'user', '男', '李杭', 'B13111111', '处长', '11111111111', '云南省', 'lihang@lihang.com', '1', '3322', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('8', 'user', '男', '赵四', 'B14', '科员', '15951908966', '莲花乡池水沟子村', 'zhaofour@zhaofour.com', '4', '1122', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('9', 'user', '男', '张三', 'B13', '科长', '13131313131', '南京市', 'zhangsan@zhagnsan.com', '3', '2212', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `file_id` smallint(11) NOT NULL AUTO_INCREMENT,
  `file_name` text NOT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `file_uploader` text,
  `file_upload_time` datetime DEFAULT NULL,
  `mission_id` int(11) NOT NULL,
  `file_type` int(3) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('4', '02206d697261636c65e8b7afe4b88a5935.jpg', './uploads/郝鸿延/02206d697261636c65e8b7afe4b88a5935.jpg', '郝鸿延', '2015-07-20 16:45:55', '37', '2');
INSERT INTO `file` VALUES ('5', '1378898118665.gif', './uploads/郝鸿延/1378898118665.gif', '郝鸿延', '2015-07-20 19:50:23', '38', '0');
INSERT INTO `file` VALUES ('6', '1375431394845.jpeg', './uploads/郝鸿延/1375431394845.jpeg', '郝鸿延', '2015-07-20 19:51:46', '37', '2');
INSERT INTO `file` VALUES ('7', '1378898126154.gif', './uploads/郝鸿延/1378898126154.gif', '郝鸿延', '2015-07-20 20:11:16', '38', '1');
INSERT INTO `file` VALUES ('8', '1379123948457.jpg', './uploads/郝鸿延/1379123948457.jpg', '郝鸿延', '2015-07-20 20:22:53', '39', '0');
INSERT INTO `file` VALUES ('9', 'IMG_20130628_122226.jpg', './uploads/郝鸿延/IMG_20130628_122226.jpg', '郝鸿延', '2015-07-20 20:27:50', '38', '1');
INSERT INTO `file` VALUES ('10', 'IMG_20130628_122226.jpg', './uploads/郝鸿延/IMG_20130628_122226.jpg', '郝鸿延', '2015-07-20 20:37:29', '37', '1');
INSERT INTO `file` VALUES ('11', 'IMG_20130713_112328.jpg', './uploads/郝鸿延/IMG_20130713_112328.jpg', '郝鸿延', '2015-07-20 20:41:44', '40', '0');
INSERT INTO `file` VALUES ('12', 'IMG_20130710_191701.jpg', './uploads/郝鸿延/IMG_20130710_191701.jpg', '郝鸿延', '2015-07-20 21:58:16', '41', '2');
INSERT INTO `file` VALUES ('13', 'IMG_20130628_122217.jpg', './uploads/郝鸿延/IMG_20130628_122217.jpg', '郝鸿延', '2015-07-20 22:00:15', '40', '1');
INSERT INTO `file` VALUES ('14', 'panda.jpg', './uploads/郝鸿延/panda.jpg', '郝鸿延', '2015-07-20 22:11:53', '42', '0');
INSERT INTO `file` VALUES ('15', 'be.jpg', './uploads/郝鸿延/be.jpg', '郝鸿延', '2015-07-20 22:13:09', '40', '1');
INSERT INTO `file` VALUES ('16', '背面.jpg', './uploads/郝鸿延/背面.jpg', '郝鸿延', '2015-07-20 22:51:45', '42', '1');
INSERT INTO `file` VALUES ('17', 'god.jpg', './uploads/郝鸿延/god.jpg', '郝鸿延', '2015-07-20 22:53:46', '44', '0');
INSERT INTO `file` VALUES ('18', '郝鸿延.jpg', './uploads/郝鸿延/郝鸿延.jpg', '郝鸿延', '2015-07-20 22:54:21', '42', '1');
INSERT INTO `file` VALUES ('19', 'be.jpg', './uploads/郝鸿延/be.jpg', '郝鸿延', '2015-07-20 23:00:57', '42', '1');
INSERT INTO `file` VALUES ('20', '2014.7.20深圳海滨栈道.jpg', './uploads/郝鸿延/2014.7.20深圳海滨栈道.jpg', '郝鸿延', '2015-07-20 23:02:49', '42', '1');
INSERT INTO `file` VALUES ('21', '2014.7.20深圳海滨栈道.jpg', './uploads/郝鸿延/2014.7.20深圳海滨栈道.jpg', '郝鸿延', '2015-07-20 23:03:39', '42', '1');
INSERT INTO `file` VALUES ('22', 'IMG_20130718_070249.jpg', './uploads/郝鸿延/IMG_20130718_070249.jpg', '郝鸿延', '2015-07-21 08:45:31', '48', '0');
INSERT INTO `file` VALUES ('23', 'IMG_20130628_122232.jpg', './uploads/郝鸿延/IMG_20130628_122232.jpg', '郝鸿延', '2015-07-21 08:47:20', '44', '1');
INSERT INTO `file` VALUES ('24', 'IMG_20130628_122234.jpg', './uploads/郝鸿延/IMG_20130628_122234.jpg', '郝鸿延', '2015-07-21 08:47:44', '44', '1');
INSERT INTO `file` VALUES ('25', 'IMG_20130628_122226.jpg', './uploads/郝鸿延/IMG_20130628_122226.jpg', '郝鸿延', '2015-07-21 08:49:50', '45', '2');
INSERT INTO `file` VALUES ('26', '1378898122611.gif', './uploads/郝鸿延/1378898122611.gif', '郝鸿延', '2015-07-21 08:55:52', '50', '0');
INSERT INTO `file` VALUES ('27', 'IMG_20130718_070558.jpg', './uploads/郝鸿延/IMG_20130718_070558.jpg', '郝鸿延', '2015-07-21 09:16:24', '51', '0');
INSERT INTO `file` VALUES ('28', 'IMG_20130718_070728.jpg', './uploads/郝鸿延/IMG_20130718_070728.jpg', '郝鸿延', '2015-07-21 09:41:33', '52', '0');
INSERT INTO `file` VALUES ('29', 'IMG_20130725_151032.jpg', './uploads/郝鸿延/IMG_20130725_151032.jpg', '郝鸿延', '2015-07-21 11:13:06', '53', '0');
INSERT INTO `file` VALUES ('30', '数据库期末复习.doc', './uploads/郝鸿延/数据库期末复习.doc', '郝鸿延', '2015-07-21 13:26:45', '54', '2');
INSERT INTO `file` VALUES ('31', '2010全国数模竞赛A题_储油罐变位识别问题.docx', './uploads/王松/2010全国数模竞赛A题_储油罐变位识别问题.docx', '王松', '2015-07-21 13:52:31', '54', '2');
INSERT INTO `file` VALUES ('32', '大三上课表.jpg', './uploads/郝鸿延/大三上课表.jpg', '郝鸿延', '2015-07-21 20:46:34', '55', '0');
INSERT INTO `file` VALUES ('33', 'tdoa.sql', './uploads/郝鸿延/tdoa.sql', '郝鸿延', '2015-07-21 20:56:09', '56', '2');
INSERT INTO `file` VALUES ('34', 'tdoa.sql', './uploads/郝鸿延/tdoa.sql', '郝鸿延', '2015-07-21 20:57:42', '51', '1');
INSERT INTO `file` VALUES ('35', '大三上课表.jpg', './uploads/郝鸿延/大三上课表.jpg', '郝鸿延', '2015-07-21 20:59:30', '56', '2');
INSERT INTO `file` VALUES ('36', '大三上课表.jpg', './uploads/郝鸿延/大三上课表.jpg', '郝鸿延', '2015-07-21 21:46:19', '57', '2');
INSERT INTO `file` VALUES ('37', '大三上课表.jpg', './uploads/郝鸿延/大三上课表.jpg', '郝鸿延', '2015-07-21 22:16:12', '58', '2');
INSERT INTO `file` VALUES ('38', 'mysql.txt', './uploads/郝鸿延/mysql.txt', '郝鸿延', '2015-07-21 22:16:44', '58', '2');
INSERT INTO `file` VALUES ('39', 'tdoa.sql', './uploads/郝鸿延/tdoa.sql', '郝鸿延', '2015-07-21 22:21:30', '58', '2');
INSERT INTO `file` VALUES ('40', 'github-ff75c30c273e51c1619d1b3793a77a80d4864486a0df51e5cc837cb07b64dd6c.css', './uploads/郝鸿延/github-ff75c30c273e51c1619d1b3793a77a80d4864486a0df51e5cc837cb07b64dd6c.css', '郝鸿延', '2015-07-22 09:53:37', '59', '2');
INSERT INTO `file` VALUES ('41', 'frameworks-2c8ae50712a47d2b83d740cb875d55cdbbb3fdbccf303951cc6b7e63731e0c38.js', './uploads/郝鸿延/frameworks-2c8ae50712a47d2b83d740cb875d55cdbbb3fdbccf303951cc6b7e63731e0c38.js', '郝鸿延', '2015-07-22 09:54:38', '60', '2');
INSERT INTO `file` VALUES ('42', 'githubhaohy.html', './uploads/郝鸿延/githubhaohy.html', '郝鸿延', '2015-07-22 10:20:28', '61', '0');
INSERT INTO `file` VALUES ('43', 'githubhaohy.html', './uploads/郝鸿延/githubhaohy.html', '郝鸿延', '2015-07-22 10:22:41', '62', '0');
INSERT INTO `file` VALUES ('44', 'githubhaohy.html', './uploads/郝鸿延/githubhaohy.html', '郝鸿延', '2015-07-22 10:24:58', '63', '0');
INSERT INTO `file` VALUES ('45', 'dwz-team.xls', './uploads/郝鸿延/dwz-team.xls', '郝鸿延', '2015-07-22 10:29:41', '64', '0');
INSERT INTO `file` VALUES ('46', 'dwz-team.xls', './uploads/郝鸿延/dwz-team.xls', '郝鸿延', '2015-07-22 10:31:41', '65', '0');
INSERT INTO `file` VALUES ('47', 'dwz-team.xls', './uploads/郝鸿延/dwz-team.xls', '郝鸿延', '2015-07-22 10:32:52', '66', '0');
INSERT INTO `file` VALUES ('48', 'githubhaohy.html', './uploads/郝鸿延/githubhaohy.html', '郝鸿延', '2015-07-22 11:35:39', '60', '2');
INSERT INTO `file` VALUES ('49', 'dwz-team.xls', './uploads/郝鸿延/dwz-team.xls', '郝鸿延', '2015-07-22 12:03:16', '67', '0');
INSERT INTO `file` VALUES ('50', '已提交.txt', './uploads/王松/已提交.txt', '王松', '2015-07-22 12:12:22', '59', '2');
INSERT INTO `file` VALUES ('51', '已提交.txt', './uploads/王松/已提交.txt', '王松', '2015-07-22 12:13:34', '59', '2');
INSERT INTO `file` VALUES ('52', '新建任务.txt', './uploads/王松/新建任务.txt', '王松', '2015-07-22 13:08:55', '68', '0');

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
  `mission_starttime` date NOT NULL,
  `mission_pubtime` datetime NOT NULL,
  `mission_plan_end_time` date NOT NULL,
  `mission_endtime` date DEFAULT NULL,
  `mission_publisher` varchar(50) NOT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

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
INSERT INTO `mission` VALUES ('50', '整个流程走一遍', '整个流程走一遍', '2015-07-22', '2015-07-21 08:55:52', '2015-07-31', null, '郝鸿延');
INSERT INTO `mission` VALUES ('51', '测试mission_view匹配混乱', 'mission_view', '2015-07-22', '2015-07-21 09:16:24', '2015-07-31', null, '郝鸿延');
INSERT INTO `mission` VALUES ('52', '新建万松', '王松', '2015-07-22', '2015-07-21 09:41:33', '2015-07-30', null, '郝鸿延');
INSERT INTO `mission` VALUES ('53', '测试id是否混乱', 'id是否混乱', '2015-07-22', '2015-07-21 11:13:06', '2015-07-29', null, '郝鸿延');
INSERT INTO `mission` VALUES ('54', '计算机考试', '计算机考试 9月末 30个考场', '2015-09-01', '2015-07-21 13:26:45', '2015-09-10', null, '郝鸿延');
INSERT INTO `mission` VALUES ('55', '测试名字按序输出', '有序', '2015-07-22', '2015-07-21 20:46:34', '2015-07-30', null, '郝鸿延');
INSERT INTO `mission` VALUES ('56', '测试流程', '流程测试', '2015-07-22', '2015-07-21 20:56:09', '2015-07-29', null, '郝鸿延');
INSERT INTO `mission` VALUES ('57', '第一次整理', '第一次整理', '2015-07-15', '2015-07-21 21:46:18', '2015-07-30', null, '郝鸿延');
INSERT INTO `mission` VALUES ('58', '测试查看提交任务附件', '查看已提交附件', '2015-07-22', '2015-07-21 22:16:11', '2015-07-28', null, '郝鸿延');
INSERT INTO `mission` VALUES ('59', '多个文件上传', '多文件', '2015-07-22', '2015-07-22 09:53:37', '2015-07-30', null, '郝鸿延');
INSERT INTO `mission` VALUES ('60', '多个文件上传', '多文件', '2015-07-22', '2015-07-22 09:54:38', '2015-07-30', null, '郝鸿延');
INSERT INTO `mission` VALUES ('61', '测试文件', '文件', '2015-07-23', '2015-07-22 10:20:28', '2015-07-29', null, '郝鸿延');
INSERT INTO `mission` VALUES ('62', '文件2', '文件2', '2015-07-23', '2015-07-22 10:22:41', '2015-07-31', null, '郝鸿延');
INSERT INTO `mission` VALUES ('63', '文件3', '文件3', '2015-07-23', '2015-07-22 10:24:58', '2015-07-28', null, '郝鸿延');
INSERT INTO `mission` VALUES ('64', '单个文件3', '文件3', '2015-07-23', '2015-07-22 10:29:41', '2015-07-29', null, '郝鸿延');
INSERT INTO `mission` VALUES ('65', 'file_url', 'fileUrl', '2015-07-22', '2015-07-22 10:31:40', '2015-07-29', null, '郝鸿延');
INSERT INTO `mission` VALUES ('66', 'result2', 'result2', '2015-07-23', '2015-07-22 10:32:52', '2015-07-27', null, '郝鸿延');
INSERT INTO `mission` VALUES ('67', '整体测试1', '整体测试1', '2015-07-23', '2015-07-22 12:03:15', '2015-07-31', null, '郝鸿延');
INSERT INTO `mission` VALUES ('68', '测试bug', '测试bug', '2015-07-14', '2015-07-22 13:08:54', '2015-07-23', null, '王松');

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
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of missions_doers
-- ----------------------------
INSERT INTO `missions_doers` VALUES ('70', '37', 'user1', '已关闭');
INSERT INTO `missions_doers` VALUES ('71', '37', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('72', '38', 'user1', '已关闭');
INSERT INTO `missions_doers` VALUES ('73', '38', 'admin', '已关闭');
INSERT INTO `missions_doers` VALUES ('74', '38', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('75', '39', 'user1', '已关闭');
INSERT INTO `missions_doers` VALUES ('76', '39', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('77', '39', '王松', '已关闭');
INSERT INTO `missions_doers` VALUES ('78', '40', 'user3', '已关闭');
INSERT INTO `missions_doers` VALUES ('79', '40', 'user2', '已关闭');
INSERT INTO `missions_doers` VALUES ('80', '40', 'user1', '已关闭');
INSERT INTO `missions_doers` VALUES ('81', '40', 'admin', '已关闭');
INSERT INTO `missions_doers` VALUES ('82', '40', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('83', '40', '王松', '已关闭');
INSERT INTO `missions_doers` VALUES ('84', '40', '李杭', '已关闭');
INSERT INTO `missions_doers` VALUES ('85', '41', 'user3', '已关闭');
INSERT INTO `missions_doers` VALUES ('86', '41', 'user2', '已关闭');
INSERT INTO `missions_doers` VALUES ('87', '41', 'user1', '已关闭');
INSERT INTO `missions_doers` VALUES ('88', '41', 'admin', '已关闭');
INSERT INTO `missions_doers` VALUES ('89', '41', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('90', '41', '王松', '已关闭');
INSERT INTO `missions_doers` VALUES ('91', '41', '李杭', '已关闭');
INSERT INTO `missions_doers` VALUES ('92', '42', '郝鸿延', '已提交');
INSERT INTO `missions_doers` VALUES ('93', '42', '王松', '待接受');
INSERT INTO `missions_doers` VALUES ('94', '43', 'user1', '已关闭');
INSERT INTO `missions_doers` VALUES ('95', '43', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('96', '44', 'user2', '已关闭');
INSERT INTO `missions_doers` VALUES ('97', '44', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('98', '45', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('99', '45', '郝鸿延', '已完成');
INSERT INTO `missions_doers` VALUES ('100', '46', 'user1', '已关闭');
INSERT INTO `missions_doers` VALUES ('101', '46', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('102', '47', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('104', '48', 'user1', '已关闭');
INSERT INTO `missions_doers` VALUES ('109', '50', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('110', '50', '郝鸿延', '待接受');
INSERT INTO `missions_doers` VALUES ('111', '50', '王松', '待接受');
INSERT INTO `missions_doers` VALUES ('112', '51', 'user1', '已关闭');
INSERT INTO `missions_doers` VALUES ('113', '51', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('114', '51', '王松', '已关闭');
INSERT INTO `missions_doers` VALUES ('115', '52', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('116', '52', '王松', '已关闭');
INSERT INTO `missions_doers` VALUES ('117', '53', 'user3', '已关闭');
INSERT INTO `missions_doers` VALUES ('118', '53', 'user1', '已关闭');
INSERT INTO `missions_doers` VALUES ('119', '53', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('120', '54', '王松', '已关闭');
INSERT INTO `missions_doers` VALUES ('121', '54', '李杭', '已关闭');
INSERT INTO `missions_doers` VALUES ('122', '55', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('123', '55', '王松', '已关闭');
INSERT INTO `missions_doers` VALUES ('124', '56', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('125', '56', '王松', '已关闭');
INSERT INTO `missions_doers` VALUES ('126', '57', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('127', '57', '王松', '已关闭');
INSERT INTO `missions_doers` VALUES ('128', '58', '郝鸿延', '已完成');
INSERT INTO `missions_doers` VALUES ('129', '58', '王松', '待接受');
INSERT INTO `missions_doers` VALUES ('130', '59', '郝鸿延', '已完成');
INSERT INTO `missions_doers` VALUES ('131', '59', '李杭', '待接受');
INSERT INTO `missions_doers` VALUES ('132', '59', '王松', '已完成');
INSERT INTO `missions_doers` VALUES ('133', '60', '郝鸿延', '已完成');
INSERT INTO `missions_doers` VALUES ('134', '60', '李杭', '待接受');
INSERT INTO `missions_doers` VALUES ('135', '60', '王松', '已完成');
INSERT INTO `missions_doers` VALUES ('136', '61', '郝鸿延', '待接受');
INSERT INTO `missions_doers` VALUES ('137', '62', '郝鸿延', '待接受');
INSERT INTO `missions_doers` VALUES ('138', '63', '郝鸿延', '待接受');
INSERT INTO `missions_doers` VALUES ('139', '64', '郝鸿延', '待接受');
INSERT INTO `missions_doers` VALUES ('140', '65', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('141', '66', '郝鸿延', '待接受');
INSERT INTO `missions_doers` VALUES ('142', '67', '李杭', '待接受');
INSERT INTO `missions_doers` VALUES ('143', '67', '王松', '执行中');
INSERT INTO `missions_doers` VALUES ('144', '68', '郝鸿延', '待接受');
INSERT INTO `missions_doers` VALUES ('145', '68', '王松', '待接受');
