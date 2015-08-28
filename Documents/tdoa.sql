/*
Navicat MySQL Data Transfer

Source Server         : ws
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : hhy_tdoa

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2015-07-22 21:37:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` int(10) NOT NULL auto_increment,
  `account_name` varchar(10) NOT NULL,
  `account_sex` varchar(10) NOT NULL,
  `account_username` varchar(50) NOT NULL,
  `account_work` char(64) default NULL,
  `account_position` varchar(50) NOT NULL,
  `account_phone` varchar(12) NOT NULL,
  `account_address` varchar(100) NOT NULL,
  `account_email` varchar(50) NOT NULL,
  `account_department` varchar(50) NOT NULL,
  `account_power` int(15) default NULL,
  `account_password` varchar(128) NOT NULL,
  PRIMARY KEY  (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'user', '男', 'user3', '1', '处长', '15380929106', 'NJUPT', 'hao-hy@hotmail.com', '1', '1111', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('2', 'user', '男', 'user2', '1', '副教授', '123412423123', 'njupt', '2998336811@qq.com', '1', '3321', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('3', 'user', '女', 'user1', '3', '科长', '13434534534', 'njupt', '2342343@163.com', '2', '2222', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('4', 'admin', '男', 'admin', '1', '管理员', '11111111111', 'njupt', '1111111111@qq.com', '1', '3322', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('5', 'user', '男', '郝鸿延', 'B13111430', '处长', '15380929106', '南京市栖霞区文苑路九号', 'hao-hy@hotmail.com', '1', '3322', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('6', 'user', '男', '王松', 'B13070412', '局长', '18351928202', '南京市', 'fjiegie@qq.com', '考试中心', '3321', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `account` VALUES ('7', 'user', '男', '李杭', 'B13111111', '处长', '11111111111', '云南省', 'lihang@lihang.com', '1', '3322', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `file_id` smallint(11) NOT NULL auto_increment,
  `file_name` text NOT NULL,
  `file_url` varchar(255) default NULL,
  `file_uploader` text,
  `file_upload_time` datetime default NULL,
  `mission_id` int(11) NOT NULL,
  `file_type` int(3) NOT NULL,
  PRIMARY KEY  (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

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
INSERT INTO `file` VALUES ('25', 'IMG_20130628_122226.jpg', './uploads/郝鸿延/IMG_20130628_122226.jpg', '郝鸿延', '2015-07-21 08:49:50', '45', '1');
INSERT INTO `file` VALUES ('26', '创意大赛策划书.doc', './uploads/王松/创意大赛策划书.doc', '王松', '2015-07-22 16:48:12', '51', '2');
INSERT INTO `file` VALUES ('27', 'HTML5宣传单.doc', './uploads/王松/HTML5宣传单.doc', '王松', '2015-07-22 16:49:48', '53', '2');
INSERT INTO `file` VALUES ('28', 'Java学习通院科协（初稿）.docx', './uploads/王松/Java学习通院科协（初稿）.docx', '王松', '2015-07-22 16:50:23', '53', '2');
INSERT INTO `file` VALUES ('29', '0065nnOqgw1est861nja0j30m80tf105.jpg', './uploads/王松/0065nnOqgw1est861nja0j30m80tf105.jpg', '王松', '2015-07-22 17:19:29', '42', '1');
INSERT INTO `file` VALUES ('30', '0065nnOqgw1est861nja0j30m80tf105.jpg', './uploads/王松/0065nnOqgw1est861nja0j30m80tf105.jpg', '王松', '2015-07-22 18:07:18', '53', '2');
INSERT INTO `file` VALUES ('31', '4.jpg', './uploads/王松/4.jpg', '王松', '2015-07-22 18:12:45', '54', '0');
INSERT INTO `file` VALUES ('32', 'Screenshot_2015-05-13-17-58-04.png', './uploads/李杭/Screenshot_2015-05-13-17-58-04.png', '李杭', '2015-07-22 18:15:33', '54', '1');
INSERT INTO `file` VALUES ('33', 'Screenshot_2015-05-13-17-58-04.png', './uploads/李杭/Screenshot_2015-05-13-17-58-04.png', '李杭', '2015-07-22 18:15:43', '54', '1');
INSERT INTO `file` VALUES ('34', '3.jpg', './uploads/王松/3.jpg', '王松', '2015-07-22 18:59:10', '55', '0');
INSERT INTO `file` VALUES ('35', '4.jpg', './uploads/郝鸿延/4.jpg', '郝鸿延', '2015-07-22 19:01:05', '55', '1');
INSERT INTO `file` VALUES ('36', 'QQ图片20150430180535.jpg', './uploads/李杭/QQ图片20150430180535.jpg', '李杭', '2015-07-22 19:02:57', '55', '1');
INSERT INTO `file` VALUES ('37', '0065nnOqgw1est861nja0j30m80tf105.jpg', './uploads/王松/0065nnOqgw1est861nja0j30m80tf105.jpg', '王松', '2015-07-22 19:41:56', '56', '0');
INSERT INTO `file` VALUES ('38', '1.jpg', './uploads/郝鸿延/1.jpg', '郝鸿延', '2015-07-22 19:58:05', '56', '0');
INSERT INTO `file` VALUES ('39', 'bigBackgound04.png', './uploads/李杭/bigBackgound04.png', '李杭', '2015-07-22 20:01:30', '56', '1');
INSERT INTO `file` VALUES ('40', '20150430180535.jpg', './uploads/郝鸿延/20150430180535.jpg', '郝鸿延', '2015-07-22 20:18:28', '56', '2');
INSERT INTO `file` VALUES ('41', '0065nnOqgw1est861nja0j30m80tf105.jpg', './uploads/王松/0065nnOqgw1est861nja0j30m80tf105.jpg', '王松', '2015-07-22 21:03:50', '57', '2');
INSERT INTO `file` VALUES ('42', '4.jpg', './uploads/王松/4.jpg', '王松', '2015-07-22 21:04:54', '57', '2');

-- ----------------------------
-- Table structure for history_mission
-- ----------------------------
DROP TABLE IF EXISTS `history_mission`;
CREATE TABLE `history_mission` (
  `mission_id` tinyint(5) NOT NULL auto_increment,
  `mission_name` varchar(100) NOT NULL,
  `mission_content` longtext NOT NULL,
  `mission_starttime` date NOT NULL,
  `mission_plan_end_time` date NOT NULL,
  `mission_endtime` date NOT NULL,
  `mission_publisher` varchar(0) NOT NULL,
  `mission_doer` varchar(0) NOT NULL,
  `mission_message` varchar(0) default NULL,
  `mission_appendix` varchar(255) default NULL,
  PRIMARY KEY  (`mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history_mission
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL auto_increment,
  `message_time` datetime NOT NULL,
  `message_leaver` varchar(32) NOT NULL,
  `mission_id` int(11) NOT NULL,
  `message_content` text NOT NULL,
  `message_type` tinyint(4) NOT NULL COMMENT '留言人的角色，doer：0，publisher：1',
  `message_obj` varchar(32) default NULL,
  `privacy` tinyint(4) default NULL,
  PRIMARY KEY  (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '2015-07-21 22:47:19', '王松', '39', '东风恶', '0', '', '0');
INSERT INTO `message` VALUES ('2', '2015-07-21 22:51:27', '王松', '39', '份额东风恶', '0', '', '0');
INSERT INTO `message` VALUES ('3', '2015-07-21 22:53:28', '王松', '41', '留言', '0', '', '0');
INSERT INTO `message` VALUES ('4', '2015-07-21 23:39:23', '王松', '39', '说点什么吧', '0', '', '0');
INSERT INTO `message` VALUES ('5', '2015-07-21 23:45:26', '王松', '49', '这是我新建的第一个任务', '1', '', '0');
INSERT INTO `message` VALUES ('6', '2015-07-21 23:46:33', '王松', '49', '这是什么鬼', '0', '', '0');
INSERT INTO `message` VALUES ('7', '2015-07-21 23:49:36', '王松', '50', '好好做，王松', '1', '', '0');
INSERT INTO `message` VALUES ('8', '2015-07-21 23:50:03', '王松', '50', '好的，我一定好好做', '0', '', '0');
INSERT INTO `message` VALUES ('9', '2015-07-21 23:51:02', '王松', '50', '做的不行啊', '1', '', '0');
INSERT INTO `message` VALUES ('10', '2015-07-21 23:51:38', '王松', '50', '这次一定行的', '0', '', '0');
INSERT INTO `message` VALUES ('11', '2015-07-21 23:52:04', '王松', '50', '让你过吧', '1', '', '0');
INSERT INTO `message` VALUES ('12', '2015-07-21 23:53:34', '王松', '50', '谢谢啊', '0', '', '0');
INSERT INTO `message` VALUES ('13', '2015-07-21 23:56:57', '郝鸿延', '50', '我去这是因为执行任务的和发布人是同一人的关系吗', '0', '', '0');
INSERT INTO `message` VALUES ('14', '2015-07-22 09:36:09', '王松', '51', '发布任务', '1', '', '0');
INSERT INTO `message` VALUES ('15', '2015-07-22 09:37:39', '郝鸿延', '51', '接受', '0', '', '0');
INSERT INTO `message` VALUES ('16', '2015-07-22 15:30:31', '王松', '52', '大活iergg', '0', null, null);
INSERT INTO `message` VALUES ('17', '2015-07-22 15:43:52', '王松', '52', '加油吧少年', '1', null, null);
INSERT INTO `message` VALUES ('18', '2015-07-22 18:00:25', '王松', '53', '自己你妹，回去改', '1', null, null);
INSERT INTO `message` VALUES ('19', '2015-07-22 18:06:55', '王松', '53', '好吧你没', '0', null, null);
INSERT INTO `message` VALUES ('20', '2015-07-22 18:07:39', '王松', '53', '给你个妹子好了吧', '0', null, null);
INSERT INTO `message` VALUES ('21', '2015-07-22 18:08:32', '王松', '53', '已完成了', '0', null, null);
INSERT INTO `message` VALUES ('22', '2015-07-22 18:09:41', '郝鸿延', '53', '我是执行人好', '0', null, null);
INSERT INTO `message` VALUES ('23', '2015-07-22 18:10:47', '郝鸿延', '53', 'hhy', '0', null, null);
INSERT INTO `message` VALUES ('24', '2015-07-22 18:13:18', '王松', '54', '好好干', '1', null, null);
INSERT INTO `message` VALUES ('25', '2015-07-22 18:14:09', '郝鸿延', '54', '我是hhy接受', '0', null, null);
INSERT INTO `message` VALUES ('26', '2015-07-22 18:15:08', '李杭', '54', '好的，我是李杭', '0', null, null);
INSERT INTO `message` VALUES ('27', '2015-07-22 18:16:54', '李杭', '54', '我要提交了，我是李杭', '0', null, null);
INSERT INTO `message` VALUES ('28', '2015-07-22 18:17:29', '李杭', '54', '已经提交，正常', '0', null, null);
INSERT INTO `message` VALUES ('29', '2015-07-22 18:18:13', '王松', '54', '李杭做的好，hhy加油', '1', null, null);
INSERT INTO `message` VALUES ('30', '2015-07-22 18:34:53', '郝鸿延', '53', '打交道分ihg', '0', null, null);
INSERT INTO `message` VALUES ('31', '2015-07-22 18:35:11', '郝鸿延', '53', '群聊', '0', null, null);
INSERT INTO `message` VALUES ('32', '2015-07-22 18:35:27', '郝鸿延', '53', '群里鞥\r\n发动机就诶过', '0', null, null);
INSERT INTO `message` VALUES ('33', '2015-07-22 18:35:37', '郝鸿延', '53', '份额发的方法', '0', null, null);
INSERT INTO `message` VALUES ('34', '2015-07-22 18:35:48', '郝鸿延', '53', '家底恢复', '0', null, null);
INSERT INTO `message` VALUES ('35', '2015-07-22 18:36:03', '郝鸿延', '53', '那么对方您', '0', null, null);
INSERT INTO `message` VALUES ('36', '2015-07-22 18:36:14', '郝鸿延', '53', '就是', '0', null, null);
INSERT INTO `message` VALUES ('37', '2015-07-22 18:36:23', '郝鸿延', '53', '就是', '0', null, null);
INSERT INTO `message` VALUES ('38', '2015-07-22 18:36:26', '郝鸿延', '53', '就是', '0', null, null);
INSERT INTO `message` VALUES ('39', '2015-07-22 18:36:28', '郝鸿延', '53', '就是', '0', null, null);
INSERT INTO `message` VALUES ('40', '2015-07-22 18:36:31', '郝鸿延', '53', '就是', '0', null, null);
INSERT INTO `message` VALUES ('41', '2015-07-22 18:36:33', '郝鸿延', '53', '就是', '0', null, null);
INSERT INTO `message` VALUES ('42', '2015-07-22 18:36:36', '郝鸿延', '53', '就是', '0', null, null);
INSERT INTO `message` VALUES ('43', '2015-07-22 18:36:45', '郝鸿延', '53', '就是', '0', null, null);
INSERT INTO `message` VALUES ('44', '2015-07-22 18:36:48', '郝鸿延', '53', '就是', '0', null, null);
INSERT INTO `message` VALUES ('45', '2015-07-22 18:37:03', '郝鸿延', '53', '对方金额哦个', '0', null, null);
INSERT INTO `message` VALUES ('46', '2015-07-22 18:59:46', '王松', '55', '开启群聊模式，我是publisher', '1', null, null);
INSERT INTO `message` VALUES ('47', '2015-07-22 19:00:33', '郝鸿延', '55', '开始群聊，我是郝鸿延', '0', null, null);
INSERT INTO `message` VALUES ('48', '2015-07-22 19:01:32', '郝鸿延', '55', '呀，我上穿正常郝鸿延', '0', null, null);
INSERT INTO `message` VALUES ('49', '2015-07-22 19:02:35', '李杭', '55', '我是李杭，开始群聊', '0', null, null);
INSERT INTO `message` VALUES ('50', '2015-07-22 19:03:30', '李杭', '55', '我是李杭，上传成功', '0', null, null);
INSERT INTO `message` VALUES ('51', '2015-07-22 19:42:30', '王松', '56', '好好干好好zhaobug', '1', null, null);
INSERT INTO `message` VALUES ('52', '2015-07-22 19:57:39', '郝鸿延', '56', '郝鸿延接受', '0', null, null);
INSERT INTO `message` VALUES ('53', '2015-07-22 19:58:44', '郝鸿延', '56', '郝鸿延上传成功1.jpg提交', '0', null, null);
INSERT INTO `message` VALUES ('54', '2015-07-22 20:00:04', '郝鸿延', '56', '提交成功，郝鸿延 已提交之前正常', '0', null, null);
INSERT INTO `message` VALUES ('55', '2015-07-22 20:01:08', '李杭', '56', '我是李杭，我要接受', '0', null, null);
INSERT INTO `message` VALUES ('56', '2015-07-22 20:02:07', '李杭', '56', '上传图片成功，提交李杭，之前正常', '0', null, null);
INSERT INTO `message` VALUES ('57', '2015-07-22 20:03:15', '李杭', '56', '已提交之前一切正常李杭', '0', null, null);
INSERT INTO `message` VALUES ('58', '2015-07-22 20:04:44', '王松', '56', 'okpublisher郝鸿延不通过，审核之前一切正常', '1', null, null);
INSERT INTO `message` VALUES ('59', '2015-07-22 20:05:49', '王松', '56', '审核之前正常李杭 publish通过', '1', null, null);
INSERT INTO `message` VALUES ('60', '2015-07-22 20:11:40', '郝鸿延', '56', '初始参考附件巨人没了  郝鸿延差评', '0', null, null);
INSERT INTO `message` VALUES ('61', '2015-07-22 20:18:46', '郝鸿延', '56', '这次应该能过郝鸿延', '0', null, null);
INSERT INTO `message` VALUES ('62', '2015-07-22 20:19:59', '李杭', '56', '哈哈哈哈哈李杭', '0', null, null);
INSERT INTO `message` VALUES ('63', '2015-07-22 20:20:50', '王松', '56', '郝鸿延果果过', '1', null, null);
INSERT INTO `message` VALUES ('64', '2015-07-22 21:04:22', '王松', '57', '王松自己接受任务，之前没问题', '0', null, null);
INSERT INTO `message` VALUES ('65', '2015-07-22 21:05:15', '王松', '57', '我的任务执行中提交啦', '0', null, null);
INSERT INTO `message` VALUES ('66', '2015-07-22 21:05:44', '王松', '57', '王松审核不通过', '1', null, null);
INSERT INTO `message` VALUES ('67', '2015-07-22 21:06:29', '王松', '57', '竟然没通过，我是王松 。我在我的任务未通过', '0', null, null);
INSERT INTO `message` VALUES ('68', '2015-07-22 21:07:49', '王松', '57', '在提交一边，王松', '0', null, null);
INSERT INTO `message` VALUES ('69', '2015-07-22 21:08:27', '王松', '57', '再次提交还未通过，王松', '1', null, null);
INSERT INTO `message` VALUES ('70', '2015-07-22 21:09:21', '王松', '57', '这次要通过了吧  王松', '0', null, null);
INSERT INTO `message` VALUES ('71', '2015-07-22 21:09:54', '王松', '57', '有执行一遍 王松  提交', '0', null, null);
INSERT INTO `message` VALUES ('72', '2015-07-22 21:10:21', '王松', '57', '给你过', '1', null, null);

-- ----------------------------
-- Table structure for mission
-- ----------------------------
DROP TABLE IF EXISTS `mission`;
CREATE TABLE `mission` (
  `mission_id` tinyint(9) NOT NULL auto_increment,
  `mission_name` varchar(100) NOT NULL,
  `mission_content` varchar(500) NOT NULL,
  `mission_starttime` date NOT NULL,
  `mission_pubtime` datetime NOT NULL,
  `mission_plan_end_time` date NOT NULL,
  `mission_endtime` date default NULL,
  `mission_publisher` varchar(50) NOT NULL,
  PRIMARY KEY  (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

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
INSERT INTO `mission` VALUES ('49', '份额', 'regression', '2015-07-15', '2015-07-21 22:49:24', '2015-07-15', null, '王松');
INSERT INTO `mission` VALUES ('50', '我要测试一下留言逻辑', '发布给多个人，看执行人能否看到我的留言，执行者能否看到其他执行者留言', '2015-07-09', '2015-07-21 23:49:09', '2015-07-25', null, '王松');
INSERT INTO `mission` VALUES ('51', '使江风iefiwe', '解放iewjf', '2015-07-08', '2015-07-22 09:35:23', '2015-07-23', null, '王松');
INSERT INTO `mission` VALUES ('52', '分iehrgher', '结果哦哦个&nbsp;', '2015-07-06', '2015-07-22 15:19:59', '2015-07-23', null, '王松');
INSERT INTO `mission` VALUES ('53', '自己', '自己', '2015-07-22', '2015-07-22 16:49:48', '2015-07-25', null, '王松');
INSERT INTO `mission` VALUES ('54', '测试附件的问题', '给任务给别人', '2015-07-14', '2015-07-22 18:12:45', '2015-07-17', null, '王松');
INSERT INTO `mission` VALUES ('55', '检查附件', '什么鬼<span style=\"white-space:pre\">	</span>', '2015-07-15', '2015-07-22 18:59:10', '2015-07-24', null, '王松');
INSERT INTO `mission` VALUES ('56', '走一个', '走一个飞起<img alt=\"大笑\" src=\"static/dwz/xheditor/xheditor_emot/default/laugh.gif\" />', '2015-07-23', '2015-07-22 19:41:56', '2015-07-23', null, '王松');
INSERT INTO `mission` VALUES ('57', '测试已建任务动态未通过', '测试已建任务动态未通过', '2015-07-23', '2015-07-22 21:03:50', '2015-07-30', null, '王松');

-- ----------------------------
-- Table structure for missions_doers
-- ----------------------------
DROP TABLE IF EXISTS `missions_doers`;
CREATE TABLE `missions_doers` (
  `mission_do_id` int(11) NOT NULL auto_increment,
  `mission_id` int(11) NOT NULL,
  `mission_doer` varchar(100) NOT NULL,
  `mission_status` varchar(20) NOT NULL,
  PRIMARY KEY  (`mission_do_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

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
INSERT INTO `missions_doers` VALUES ('77', '39', '王松', '执行中');
INSERT INTO `missions_doers` VALUES ('78', '40', 'user3', '待接受');
INSERT INTO `missions_doers` VALUES ('79', '40', 'user2', '待接受');
INSERT INTO `missions_doers` VALUES ('80', '40', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('81', '40', 'admin', '待接受');
INSERT INTO `missions_doers` VALUES ('82', '40', '郝鸿延', '已提交');
INSERT INTO `missions_doers` VALUES ('83', '40', '王松', '执行中');
INSERT INTO `missions_doers` VALUES ('84', '40', '李杭', '待接受');
INSERT INTO `missions_doers` VALUES ('85', '41', 'user3', '待接受');
INSERT INTO `missions_doers` VALUES ('86', '41', 'user2', '待接受');
INSERT INTO `missions_doers` VALUES ('87', '41', 'user1', '待接受');
INSERT INTO `missions_doers` VALUES ('88', '41', 'admin', '待接受');
INSERT INTO `missions_doers` VALUES ('89', '41', '郝鸿延', '已完成');
INSERT INTO `missions_doers` VALUES ('90', '41', '王松', '已提交');
INSERT INTO `missions_doers` VALUES ('91', '41', '李杭', '待接受');
INSERT INTO `missions_doers` VALUES ('92', '42', '郝鸿延', '已提交');
INSERT INTO `missions_doers` VALUES ('93', '42', '王松', '已提交');
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
INSERT INTO `missions_doers` VALUES ('106', '49', '王松', '已完成');
INSERT INTO `missions_doers` VALUES ('107', '50', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('108', '50', '王松', '已关闭');
INSERT INTO `missions_doers` VALUES ('109', '50', '李杭', '已关闭');
INSERT INTO `missions_doers` VALUES ('110', '51', '郝鸿延', '待接受');
INSERT INTO `missions_doers` VALUES ('111', '51', '王松', '已完成');
INSERT INTO `missions_doers` VALUES ('112', '52', '郝鸿延', '已关闭');
INSERT INTO `missions_doers` VALUES ('113', '52', '王松', '已关闭');
INSERT INTO `missions_doers` VALUES ('114', '53', '郝鸿延', '未通过');
INSERT INTO `missions_doers` VALUES ('115', '53', '王松', '已完成');
INSERT INTO `missions_doers` VALUES ('116', '54', '郝鸿延', '执行中');
INSERT INTO `missions_doers` VALUES ('117', '54', '李杭', '已提交');
INSERT INTO `missions_doers` VALUES ('118', '55', '郝鸿延', '已提交');
INSERT INTO `missions_doers` VALUES ('119', '55', '李杭', '已提交');
INSERT INTO `missions_doers` VALUES ('120', '56', '郝鸿延', '已完成');
INSERT INTO `missions_doers` VALUES ('121', '56', '李杭', '已完成');
INSERT INTO `missions_doers` VALUES ('122', '57', '郝鸿延', '待接受');
INSERT INTO `missions_doers` VALUES ('123', '57', '王松', '已完成');
