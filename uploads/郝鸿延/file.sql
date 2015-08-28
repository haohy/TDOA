/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : tdoa

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2015-07-21 08:53:06
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

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
