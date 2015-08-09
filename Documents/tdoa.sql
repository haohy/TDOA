/*
Navicat MySQL Data Transfer

Source Server         : tdoa
Source Server Version : 50544
Source Host           : localhost:3306
Source Database       : tdoa

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2015-08-10 00:07:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ACCOUNT`
-- ----------------------------
DROP TABLE IF EXISTS `ACCOUNT`;
CREATE TABLE `ACCOUNT` (
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ACCOUNT
-- ----------------------------
INSERT INTO `ACCOUNT` VALUES ('1', 'admin', '男', 'admin', '0', '管理员', '11111111111', '南邮', 'admin@admin.com', '管理员', '2222', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `ACCOUNT` VALUES ('2', 'user', '女', '李老师', '0', '处长', '11111111111', '南邮', 'admin@admin.com', '考试中心', '2211', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `ACCOUNT` VALUES ('3', 'user', '女', '洪老师', '0', '处长', '11111111111', '南邮', 'admin@admin.com', '考试中心', '2212', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `ACCOUNT` VALUES ('4', 'user', '男', '李杭', '0', '科长', '11111111111', '南邮', 'admin@admin.com', '实践教学科', '1112', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `ACCOUNT` VALUES ('5', 'user', '男', '王松', '0', '管理员', '11111111111', '南邮', 'admin@admin.com', '管理员', '2222', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `ACCOUNT` VALUES ('7', 'admin', '男', 'admin', '0', '管理员', '11111111111', '南邮', 'admin@admin.com', '管理员', '2222', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `ACCOUNT` VALUES ('8', 'user', '男', '郝鸿延', 'B13111430', '处长', '15380929106', '南京邮电大学', 'hao-hy@hotmail.com', '综合管理科', '2211', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for `FILE`
-- ----------------------------
DROP TABLE IF EXISTS `FILE`;
CREATE TABLE `FILE` (
  `file_id` smallint(11) NOT NULL AUTO_INCREMENT,
  `file_name` text NOT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `file_uploader` text,
  `file_upload_time` datetime DEFAULT NULL,
  `mission_id` int(11) NOT NULL,
  `file_type` int(3) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FILE
-- ----------------------------
INSERT INTO `FILE` VALUES ('23', 'god.jpg', './uploads/郝鸿延/god.jpg', '郝鸿延', '2015-08-05 21:22:49', '19', '0');
INSERT INTO `FILE` VALUES ('24', 'octave.png', './uploads/李老师/octave.png', '李老师', '2015-08-05 22:13:55', '19', '2');
INSERT INTO `FILE` VALUES ('25', '高级检索界面.png', './uploads/郝鸿延/高级检索界面.png', '郝鸿延', '2015-08-07 01:22:59', '22', '0');
INSERT INTO `FILE` VALUES ('26', '审核未通过弹出界面.png', './uploads/郝鸿延/审核未通过弹出界面.png', '郝鸿延', '2015-08-07 01:23:18', '22', '2');
INSERT INTO `FILE` VALUES ('27', '各栏位信息详情.txt', './uploads/郝鸿延/各栏位信息详情.txt', '郝鸿延', '2015-08-07 01:48:29', '23', '0');
INSERT INTO `FILE` VALUES ('28', '高级检索界面.png', './uploads/洪老师/高级检索界面.png', '洪老师', '2015-08-07 01:55:56', '23', '1');
INSERT INTO `FILE` VALUES ('29', '执行人查看审核未通过的任务.png', './uploads/郝鸿延/执行人查看审核未通过的任务.png', '郝鸿延', '2015-08-07 10:26:43', '24', '0');
INSERT INTO `FILE` VALUES ('30', '审核未通过弹出界面.png', './uploads/李杭/审核未通过弹出界面.png', '李杭', '2015-08-07 10:28:24', '24', '1');
INSERT INTO `FILE` VALUES ('31', '大三上课表.jpg', './uploads/李杭/大三上课表.jpg', '李杭', '2015-08-07 10:38:12', '25', '0');
INSERT INTO `FILE` VALUES ('32', '2009B眼科病床.doc', './uploads/洪老师/2009B眼科病床.doc', '洪老师', '2015-08-07 10:40:16', '26', '0');
INSERT INTO `FILE` VALUES ('33', '我的任务点开后任务详情-修改版（添加建任务人部门，清除任务状态）.png', './uploads/郝鸿延/我的任务点开后任务详情-修改版（添加建任务人部门，清除任务状态）.png', '郝鸿延', '2015-08-07 10:40:42', '26', '1');
INSERT INTO `FILE` VALUES ('34', '0065nnOqgw1est861nja0j30m80tf105.jpg', './uploads/王松/0065nnOqgw1est861nja0j30m80tf105.jpg', '王松', '2015-08-09 18:19:18', '28', '0');
INSERT INTO `FILE` VALUES ('35', '4.jpg', './uploads/王松/4.jpg', '王松', '2015-08-09 18:20:01', '28', '2');

-- ----------------------------
-- Table structure for `HISTORY_MISSION`
-- ----------------------------
DROP TABLE IF EXISTS `HISTORY_MISSION`;
CREATE TABLE `HISTORY_MISSION` (
  `mission_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `mission_name` varchar(100) NOT NULL,
  `mission_content` longtext NOT NULL,
  `mission_starttime` date NOT NULL,
  `mission_plan_end_time` date NOT NULL,
  `mission_endtime` date NOT NULL,
  `mission_publisher` varchar(20) NOT NULL,
  `mission_doer` varchar(100) NOT NULL,
  `mission_message` varchar(500) DEFAULT NULL,
  `mission_appendix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of HISTORY_MISSION
-- ----------------------------
INSERT INTO `HISTORY_MISSION` VALUES ('19', '测试新数据库速度', '测试新数据库速度', '2015-08-05', '2015-08-11', '2015-08-05', '郝鸿延', '郝鸿延,李老师', null, null);

-- ----------------------------
-- Table structure for `MESSAGE`
-- ----------------------------
DROP TABLE IF EXISTS `MESSAGE`;
CREATE TABLE `MESSAGE` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_time` datetime NOT NULL,
  `message_leaver` varchar(32) NOT NULL,
  `mission_id` int(11) NOT NULL,
  `message_content` text NOT NULL,
  `message_type` tinyint(4) NOT NULL COMMENT '留言人的角色，doer：0，publisher：1',
  `message_obj` varchar(32) DEFAULT NULL,
  `privacy` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of MESSAGE
-- ----------------------------
INSERT INTO `MESSAGE` VALUES ('37', '2015-08-05 22:13:05', '李老师', '19', '李老师正在执行任务,接受任务-执行中任务,正常', '0', null, null);
INSERT INTO `MESSAGE` VALUES ('38', '2015-08-05 22:13:18', '李老师', '19', '上传了一个附件', '0', null, null);
INSERT INTO `MESSAGE` VALUES ('39', '2015-08-05 22:16:06', '郝鸿延', '19', '接受李老师提交的任务,发布任务-已提交任务一切正常', '1', null, null);
INSERT INTO `MESSAGE` VALUES ('40', '2015-08-05 22:16:19', '郝鸿延', '19', '但是为了测试,不能给你过', '1', null, null);
INSERT INTO `MESSAGE` VALUES ('41', '2015-08-05 22:16:55', '郝鸿延', '19', '发布任务-未通过任务 正常', '1', null, null);
INSERT INTO `MESSAGE` VALUES ('42', '2015-08-05 22:44:13', '李老师', '19', '李老师接受的任务-未通过任务正常', '0', null, null);
INSERT INTO `MESSAGE` VALUES ('43', '2015-08-05 22:45:03', '郝鸿延', '19', '发布人任务-已提交任务,正常', '1', null, null);
INSERT INTO `MESSAGE` VALUES ('44', '2015-08-05 22:45:12', '郝鸿延', '19', '李老师通过', '1', null, null);
INSERT INTO `MESSAGE` VALUES ('45', '2015-08-05 23:26:38', '郝鸿延', '19', '测试:高级检索-查看已完成任务详情', '0', null, null);
INSERT INTO `MESSAGE` VALUES ('46', '2015-08-05 23:26:59', '郝鸿延', '19', '给通过', '1', null, null);
INSERT INTO `MESSAGE` VALUES ('47', '2015-08-07 01:26:31', '郝鸿延', '22', '接受的任务-执行中任务-“初始参考”和“任务完成提交附件”正常', '0', null, null);
INSERT INTO `MESSAGE` VALUES ('48', '2015-08-07 01:27:44', '郝鸿延', '22', '发布的任务-已提交任务中“初始参考附件”和“任务完成提交附件”正常', '1', null, null);
INSERT INTO `MESSAGE` VALUES ('49', '2015-08-07 01:55:49', '洪老师', '23', '“洪老师”端提交任务，并上传一个附件', '0', null, null);
INSERT INTO `MESSAGE` VALUES ('50', '2015-08-07 01:58:03', '郝鸿延', '23', '“郝鸿延”端“发布的任务”中“已提交任务”显示 执行者完成“执行中任务”并提交', '1', null, null);
INSERT INTO `MESSAGE` VALUES ('51', '2015-08-07 10:28:14', '李杭', '24', '我作为执行者，将做好的任务提交给发布者，此任务用于测试“未通过任务”', '0', null, null);
INSERT INTO `MESSAGE` VALUES ('52', '2015-08-07 10:29:29', '郝鸿延', '24', '我作为任务发布者，和现在的任务审核者，给 李杭  的任务，“不通过”', '1', null, null);
INSERT INTO `MESSAGE` VALUES ('53', '2015-08-07 10:41:03', '郝鸿延', '26', '执行任务时提交一个附件', '0', null, null);
INSERT INTO `MESSAGE` VALUES ('54', '2015-08-09 18:19:48', '王松', '28', '看到说话啊', '0', null, null);
INSERT INTO `MESSAGE` VALUES ('55', '2015-08-09 18:20:31', '王松', '28', '哦哦哦哦哦哦哦', '1', null, null);
INSERT INTO `MESSAGE` VALUES ('56', '2015-08-09 18:20:46', '王松', '28', '为毛', '0', null, null);
INSERT INTO `MESSAGE` VALUES ('57', '2015-08-09 18:21:46', '王松', '28', '为什么在接受的任务下未通过任务没有提交附件的按钮。。。。', '0', null, null);
INSERT INTO `MESSAGE` VALUES ('58', '2015-08-09 18:22:12', '王松', '28', '应该是需要的吧', '1', null, null);
INSERT INTO `MESSAGE` VALUES ('59', '2015-08-09 18:23:40', '王松', '28', '在发布的任务下，执行中任务怎么有上传附件。。', '1', null, null);
INSERT INTO `MESSAGE` VALUES ('60', '2015-08-09 23:55:19', '郝鸿延', '28', '看到图片我就回复你了', '0', null, null);

-- ----------------------------
-- Table structure for `MISSION`
-- ----------------------------
DROP TABLE IF EXISTS `MISSION`;
CREATE TABLE `MISSION` (
  `mission_id` tinyint(9) NOT NULL AUTO_INCREMENT,
  `mission_name` varchar(100) NOT NULL,
  `mission_content` varchar(500) NOT NULL,
  `mission_starttime` date NOT NULL,
  `mission_pubtime` datetime NOT NULL,
  `mission_plan_end_time` date NOT NULL,
  `mission_endtime` date DEFAULT NULL,
  `mission_publisher` varchar(50) NOT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of MISSION
-- ----------------------------
INSERT INTO `MISSION` VALUES ('20', '开学辅导', '新生开学辅导<span style=\"white-space:pre\">		</span>', '2015-08-07', '2015-08-06 14:52:26', '2015-08-09', null, '洪老师');
INSERT INTO `MISSION` VALUES ('21', '开学辅导', '新生开学辅导<span style=\"white-space:pre\">		</span>', '2015-08-07', '2015-08-06 14:52:27', '2015-08-09', null, '洪老师');
INSERT INTO `MISSION` VALUES ('22', '测试高级检索查看历史提交文件', '测试高级检索查看历史提交文件', '2015-08-07', '2015-08-07 01:22:59', '2015-08-08', null, '郝鸿延');
INSERT INTO `MISSION` VALUES ('23', '执行中任务', '“发布任务的人”在“新建任务”后，任务出现在“任务执行者”的“执行中任务”菜单栏和“我的主页”的日历中', '2015-08-08', '2015-08-07 01:48:29', '2015-08-12', null, '郝鸿延');
INSERT INTO `MISSION` VALUES ('24', '未通过任务', '我作为任务的发布者，对于执行者提交的任务进行审核，有两种结果：审核通过，审核不通过。', '2015-08-08', '2015-08-07 10:26:43', '2015-08-17', null, '郝鸿延');
INSERT INTO `MISSION` VALUES ('25', '发给郝鸿延的执行中任务', '发布者将任务新建之后直接出现在执行者的“执行中任务”和“我的主页”中', '2015-08-08', '2015-08-07 10:38:12', '2015-08-12', null, '李杭');
INSERT INTO `MISSION` VALUES ('26', '发布给郝鸿延，用于提交', '执行者提交任务后，任务出现在“已提交任务”中', '2015-08-11', '2015-08-07 10:40:16', '2015-08-13', null, '洪老师');
INSERT INTO `MISSION` VALUES ('27', '未通过任务', '执行者将任务提交后发布者审核任务，审核结果为“未通过”则任务出现在“未通过任务“中', '2015-08-07', '2015-08-07 10:42:39', '2015-08-14', null, '洪老师');
INSERT INTO `MISSION` VALUES ('28', '系统怎么样了', '还有没有bug<span style=\"white-space:pre\">	</span>', '2015-08-09', '2015-08-09 18:19:18', '2015-08-10', null, '王松');

-- ----------------------------
-- Table structure for `MISSIONS_DOERS`
-- ----------------------------
DROP TABLE IF EXISTS `MISSIONS_DOERS`;
CREATE TABLE `MISSIONS_DOERS` (
  `mission_do_id` int(11) NOT NULL AUTO_INCREMENT,
  `mission_id` int(11) NOT NULL,
  `mission_doer` varchar(100) NOT NULL,
  `mission_status` varchar(20) NOT NULL,
  PRIMARY KEY (`mission_do_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of MISSIONS_DOERS
-- ----------------------------
INSERT INTO `MISSIONS_DOERS` VALUES ('35', '20', '洪老师', '已提交');
INSERT INTO `MISSIONS_DOERS` VALUES ('36', '21', '洪老师', '已提交');
INSERT INTO `MISSIONS_DOERS` VALUES ('37', '22', '郝鸿延', '已删除');
INSERT INTO `MISSIONS_DOERS` VALUES ('38', '22', '李老师', '已删除');
INSERT INTO `MISSIONS_DOERS` VALUES ('39', '23', '洪老师', '已提交');
INSERT INTO `MISSIONS_DOERS` VALUES ('40', '23', '李杭', '执行中');
INSERT INTO `MISSIONS_DOERS` VALUES ('41', '24', '洪老师', '执行中');
INSERT INTO `MISSIONS_DOERS` VALUES ('42', '24', '李杭', '未通过');
INSERT INTO `MISSIONS_DOERS` VALUES ('43', '25', '郝鸿延', '执行中');
INSERT INTO `MISSIONS_DOERS` VALUES ('44', '26', '郝鸿延', '已提交');
INSERT INTO `MISSIONS_DOERS` VALUES ('45', '27', '郝鸿延', '未通过');
INSERT INTO `MISSIONS_DOERS` VALUES ('46', '28', '郝鸿延', '执行中');
INSERT INTO `MISSIONS_DOERS` VALUES ('47', '28', '李杭', '执行中');
INSERT INTO `MISSIONS_DOERS` VALUES ('48', '28', '王松', '已完成');
