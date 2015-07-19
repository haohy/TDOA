/*
Navicat MySQL Data Transfer

Source Server         : ws
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : tdoa

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2015-07-18 22:53:32
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('2', 'user', '123412423123', 'lh', '男', '副教授', '1', '2998336811@qq.com', 'njupt', '098f6bcd4621d373cade4e832627b4f6', '1', '2222');
INSERT INTO `account` VALUES ('3', 'user', '13434534534', 'hh', '女', '科长', '2', '2342343@163.com', 'njupt', '098f6bcd4621d373cade4e832627b4f6', '3', '1212');
INSERT INTO `account` VALUES ('4', 'admin', '23123423423', 'admin', 'admin', 'admin', '3', '3523453@qq.com', 'njupt', '098f6bcd4621d373cade4e832627b4f6', '0', '0');
INSERT INTO `account` VALUES ('16', 'admin', '18351928202', '杨大大', '', '校长', '6', '319827688@qq.com', '', '', '1234', '3322');
INSERT INTO `account` VALUES ('21', 'user', '12345678910', '教务管理', '', '处长', '1', '1234567@qq.com', '', '', '2', '2221');
INSERT INTO `account` VALUES ('22', 'user', '18351928202', '王松', '', '学生', '2', '319827688@qq.com', '', 'e10adc3949ba59abbe56e057f20f883e', 'B13070412', '1121');
INSERT INTO `account` VALUES ('23', 'user', '12345678901', 'hhy', '', '学生', '3', '324r4dnf@qq.com', '', 'e10adc3949ba59abbe56e057f20f883e', 'B12012', '1121');
INSERT INTO `account` VALUES ('24', 'user', '12345678910', 'ws', '', '学生', '4', 'ngegie@qq.com', '', 'e10adc3949ba59abbe56e057f20f883e', 'B13', '1121');
INSERT INTO `account` VALUES ('25', 'user', '12345678901', '王松松', '', '处长', '3', 'fkeei@qq.com', '', 'e10adc3949ba59abbe56e057f20f883e', '123211', '2212');
INSERT INTO `account` VALUES ('26', 'user', '12345678910', '朱王松', '', '科长', '5', '3234248@qq.com', '', 'e10adc3949ba59abbe56e057f20f883e', '912', '2211');

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
  `mission_pubtime` datetime NOT NULL,
  `mission_appendix` varchar(255) default NULL,
  `mission_endtime` datetime default NULL,
  PRIMARY KEY  (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mission
-- ----------------------------
INSERT INTO `mission` VALUES ('1', 'helloworld', 'show the truth', '2013-12-03', '2014-05-06', 'hhy', 'lh', '已发布', '2014-12-23 00:00:00', '是', '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('2', 'hello', 'show the truth', '2014-05-06', '2015-06-06', 'lh', 'hhy', '已发布', '2014-05-06 13:05:06', '否', '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('3', '开始战斗', '怎么办呢呢，那边数据库还是有问题', '2015-07-13', '2015-07-19', 'hhy', 'hhy', '已发布', '2015-07-13 09:46:27', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('4', '什么叫他人账号', '测试一下，什么叫他人账号', '2015-07-13', '2015-07-20', 'hhy', 'hh', '已提交', '2015-07-13 09:49:14', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('5', 'woshishabi', '<p>nizhidaoma&nbsp;</p><p>zhehsiyigekaixin dshi qing</p>', '2015-07-06', '2015-07-16', 'hh', 'hh', '已提交', '2015-07-13 15:29:40', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('6', '开始战斗', '怎么办呢呢，那边数据库还是有问题,怎么会这样呢', '2015-07-13', '2015-07-19', 'hhy', '', '已发布', '2015-07-13 15:36:03', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('7', '开始战斗', '怎么办呢呢，那边数据库还是有问题,怎么会这样呢，呵呵呵大，是不是bug', '2015-07-13', '2015-07-19', 'hhy', '', '已发布', '2015-07-13 15:36:49', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('8', 'hello', '<p>show the truth</p><p>and you will more happy</p>', '2014-05-06', '2015-06-06', 'hhy', 'hhy', '已发布', '2015-07-13 18:00:36', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('9', 'fheioh', 'dfioewgireoigniehfnioe', '2015-07-13', '2015-07-15', 'hh', '', '已发布', '2015-07-13 18:58:52', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('10', 'wobushishabi', '<p>nizhidaoma&nbsp;</p><p>zhehsiyigekaixin dshi qing</p>', '2015-07-06', '2015-07-16', 'hh', 'hh', '已发布', '2015-07-14 11:54:02', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('11', '什么叫他人账号goubi', '测试一下，什么叫他人账号', '2015-07-13', '2015-07-20', 'hh', '', '已发布', '2015-07-14 11:56:47', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('12', 'dfheighoif', '<p>dfiewgiearg</p><p>nsiegeogjrig</p>', '2015-07-13', '2015-07-18', 'hhy', 'hhy', '已发布', '2015-07-14 17:02:36', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('13', 'hhy', 'hhy', '2015-07-15', '2015-07-25', 'hh', 'hh', '已发布', '2015-07-14 17:29:01', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('14', '测试日历功能', '<p>怎么会这样</p><p>还是尝试一下</p>', '2015-07-14', '2015-07-15', 'hh', 'hh', '已发布', '2015-07-14 18:23:18', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('15', '我的任务', '这次必须要完成任务，我觉的课余时间还得继续学习新知识', '2015-07-15', '2015-07-18', '王松', '王松', '已关闭', '2015-07-14 19:07:05', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('16', '这是我新建的第二个任务', '执行人不能是自己，还有新建任务的那个执行人还在修改中，我必须自己手动添加', '2015-07-15', '2015-07-18', '王松', '王松', '已提交', '2015-07-16 09:54:06', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('17', '我新建的第三个任务', '<p>测试任务状态的改变能否成功，包括“已发布”，“已提交”，“已完成”，“未通过”</p><p>还有“执行中”未添加，将在任务动态中显示已发布的，提供接受，修改成“执行中”</p>', '2015-07-16', '2015-07-18', '王松', '王松', '未通过', '2015-07-16 10:56:24', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('18', '我新建的第四个任务', '之前的不知道什么原因没有反应 ，应该是返回的值不对，而且没有报错，很怪异的事情，这次提交看提交之后出来的页面', '2015-07-16', '2015-07-18', '王松', '王松', '已完成', '2015-07-16 11:00:59', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('19', '我的第一个任务', '这次必须要完成任务，我觉的课余时间还得继续学习新知识', '2015-07-15', '2015-07-18', '王松', 'hhy', '已发布', '2015-07-16 12:19:17', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('20', '这是我新建的第五个任务', '这是我新建的第五个任务，看看效果如何', '2015-07-09', '2015-07-25', '王松', '王松', '已发布', '2015-07-16 13:20:54', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('21', '这是ws新建的第一个任务', '测试新建帐户的动态是否可以正常', '2015-07-17', '2015-07-17', 'ws', 'ws', '已发布', '2015-07-16 15:30:48', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('22', 'ehfiewhf', 'efihewih<span style=\"white-space:pre\">	</span>', '2015-07-08', '2015-07-24', '王松', '', '已发布', '2015-07-17 14:44:05', null, '0000-00-00 00:00:00');
INSERT INTO `mission` VALUES ('24', '这是我新建的第六个任务', '测试执行人能不能用，记住现在是单个执行人', '2015-07-17', '2015-07-18', '王松,', '王松,', '已发布', '2015-07-17 16:30:44', null, null);
INSERT INTO `mission` VALUES ('25', '这是我新建的第七个任务', '测试rstrip(,)能不能起作用<img alt=\"微笑\" src=\"static/dwz/xheditor/xheditor_emot/default/smile.gif\" />', '2015-07-18', '2015-07-25', '王松,', '王松,', '已提交', '2015-07-17 16:37:55', null, null);
INSERT INTO `mission` VALUES ('26', '这是第八个任务', '演示<img alt=\"生气\" src=\"static/dwz/xheditor/xheditor_emot/default/mad.gif\" />', '2015-07-16', '2015-07-18', '王松,', '王松,', '执行中', '2015-07-17 16:39:04', null, null);
INSERT INTO `mission` VALUES ('27', '这是我新建的第二份任务', '让我看看这是哪个版本<img alt=\"生气\" src=\"static/dwz/xheditor/xheditor_emot/default/mad.gif\" />', '2015-07-03', '2015-07-18', 'ws', '王松', '已发布', '2015-07-17 20:18:39', null, null);
INSERT INTO `mission` VALUES ('28', '这是我新建的第三个任务', '测试多个人可不可以', '2015-07-18', '2015-07-24', 'ws', '王松,ws', '已发布', '2015-07-17 20:20:40', null, null);
INSERT INTO `mission` VALUES ('29', '这是我新建的第九个任务', '这项任务目的是测试任务的所有流程是否正确', '2015-07-19', '2015-07-24', '王松', '王松,', '已完成', '2015-07-18 12:35:25', null, null);
INSERT INTO `mission` VALUES ('30', '这是我发布的第十个任务，测试名字长的弊端', '<p>这是我发布的第十个任务，</p><p>看看任务名称长时是什么效果<img alt=\"大笑\" src=\"static/dwz/xheditor/xheditor_emot/default/laugh.gif\" /></p>', '2015-07-16', '2015-07-17', '王松', '王松', '执行中', '2015-07-18 12:49:17', null, null);
INSERT INTO `mission` VALUES ('31', '第十一个任务', '测试mission_list', '2015-07-15', '2015-07-25', '王松', '王松', '已发布', '2015-07-18 16:08:15', null, null);
INSERT INTO `mission` VALUES ('32', '第十二个任务', '测试日期格式<span style=\"white-space:pre\">	</span>', '2015-07-17', '2015-07-19', '王松,', '王松', '已发布', '2015-07-18 16:58:28', null, null);
INSERT INTO `mission` VALUES ('33', '这是第十三个任务', '测试一下多个执行人的执行语句', '2015-07-17', '2015-07-24', '王松', '王松,hhy,ws', '已发布', '2015-07-18 20:20:38', null, null);
INSERT INTO `mission` VALUES ('34', '第十三个怎么不见了，这是什么鬼', '什么鬼啊', '2015-07-17', '2015-07-17', '王松', '教务管理,王松', '已发布', '2015-07-18 20:22:33', null, null);
INSERT INTO `mission` VALUES ('35', '第十四个任务，解决之前执行人后面没加，的bug', '现在应该可以运行了', '2015-07-17', '2015-07-18', '王松,', '教务管理,王松,hhy', '执行中', '2015-07-18 20:26:18', null, null);
INSERT INTO `mission` VALUES ('36', '这是第十五个任务', '测试会不会因为名字相似而产生问题', '2015-07-17', '2015-07-24', '王松,', '王松,王松松,朱王松,', '已完成', '2015-07-18 20:33:44', null, null);
INSERT INTO `mission` VALUES ('37', '是第十六个任务', '测试给王松松的任务，会不会出现在王松里', '2015-07-16', '2015-07-24', '王松,', '王松松,朱王松,', '已发布', '2015-07-18 20:35:25', null, null);
INSERT INTO `mission` VALUES ('38', '这是王松松的第一个任务', '发给王松吧，看我自己会不会收到', '2015-07-18', '2015-07-18', '王松松,', '王松,', '已发布', '2015-07-18 20:37:12', null, null);
INSERT INTO `mission` VALUES ('39', '十七个任务', '测试放在最后的自己会不会收到', '2015-07-11', '2015-07-18', '王松,', '王松,', '已发布', '2015-07-18 20:40:44', null, null);

-- ----------------------------
-- Table structure for missions_doers
-- ----------------------------
DROP TABLE IF EXISTS `missions_doers`;
CREATE TABLE `missions_doers` (
  `mission_do_id` int(11) NOT NULL auto_increment,
  `mission_doer` varchar(32) NOT NULL default '',
  `mission_id` int(11) NOT NULL,
  PRIMARY KEY  (`mission_do_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of missions_doers
-- ----------------------------
