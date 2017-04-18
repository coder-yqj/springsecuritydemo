/*
Navicat MySQL Data Transfer

Source Server         : my
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : mytest

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2017-04-18 16:40:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_resources
-- ----------------------------
DROP TABLE IF EXISTS `t_resources`;
CREATE TABLE `t_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resKey` varchar(255) DEFAULT NULL,
  `resUrl` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resources
-- ----------------------------
INSERT INTO `t_resources` VALUES ('1', '系统设置', 'system', '/system', '0', '0', '1');
INSERT INTO `t_resources` VALUES ('2', '用户管理', 'sys_user_list', '/index.do', '1', '1', '2');
INSERT INTO `t_resources` VALUES ('3', '角色管理', 'sys_role_list', '/roles.do', '1', '1', '3');
INSERT INTO `t_resources` VALUES ('4', '资源管理', 'sys_res_list', '/resources.do', '1', '1', '4');
INSERT INTO `t_resources` VALUES ('5', '添加用户', 'sys_user_add', '/user/addUser.do', '2', '2', '5');
INSERT INTO `t_resources` VALUES ('6', '删除用户', 'sys_user_del', '/user/delUser.do', '2', '2', '6');
INSERT INTO `t_resources` VALUES ('7', '添加角色', 'sys_role_add', '/role/addRole.do', '2', '3', '7');
INSERT INTO `t_resources` VALUES ('8', '删除角色', 'sys_role_del', '/role/delRole.do', '2', '3', '8');
INSERT INTO `t_resources` VALUES ('9', '添加资源', 'sys_res_add', '/resources/addResources.do', '2', '4', '9');
INSERT INTO `t_resources` VALUES ('10', '删除资源', 'sys_res_del', '/resources/delResources.do', '2', '4', '10');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleKey` varchar(50) NOT NULL,
  `roleDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'ADMIN', '管理员');
INSERT INTO `t_role` VALUES ('2', 'MEMBER', '普通用户');
INSERT INTO `t_role` VALUES ('3', 'SUPER', '超级管理员');

-- ----------------------------
-- Table structure for t_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `t_role_resources`;
CREATE TABLE `t_role_resources` (
  `roleId` int(11) NOT NULL,
  `resourcesId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`resourcesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_resources
-- ----------------------------
INSERT INTO `t_role_resources` VALUES ('1', '2');
INSERT INTO `t_role_resources` VALUES ('1', '3');
INSERT INTO `t_role_resources` VALUES ('1', '4');
INSERT INTO `t_role_resources` VALUES ('1', '5');
INSERT INTO `t_role_resources` VALUES ('1', '6');
INSERT INTO `t_role_resources` VALUES ('1', '9');
INSERT INTO `t_role_resources` VALUES ('1', '10');
INSERT INTO `t_role_resources` VALUES ('3', '2');
INSERT INTO `t_role_resources` VALUES ('3', '3');
INSERT INTO `t_role_resources` VALUES ('3', '5');
INSERT INTO `t_role_resources` VALUES ('3', '10');
INSERT INTO `t_role_resources` VALUES ('9', '9');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(33) DEFAULT NULL,
  `password` varchar(33) DEFAULT NULL,
  `enable` int(10) DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1');
INSERT INTO `t_user` VALUES ('2', 'user1', 'user1', '1');
INSERT INTO `t_user` VALUES ('3', 'user2', '121', '0');
INSERT INTO `t_user` VALUES ('4', 'user3', 'user3', '1');
INSERT INTO `t_user` VALUES ('5', 'user4', 'user4', '1');
INSERT INTO `t_user` VALUES ('6', 'user5', 'user5', '1');
INSERT INTO `t_user` VALUES ('7', 'user6', 'user6', '1');
INSERT INTO `t_user` VALUES ('8', 'user7', 'user7', '1');
INSERT INTO `t_user` VALUES ('9', 'user8', 'user8', '1');
INSERT INTO `t_user` VALUES ('10', 'user9', 'user9', '1');
INSERT INTO `t_user` VALUES ('11', 'user10', 'user10', '1');
INSERT INTO `t_user` VALUES ('12', 'user11', 'user11', '1');
INSERT INTO `t_user` VALUES ('13', 'user12', 'user12', '1');
INSERT INTO `t_user` VALUES ('14', 'user13', 'user13', '1');
INSERT INTO `t_user` VALUES ('15', 'user14', 'user14', '1');
INSERT INTO `t_user` VALUES ('16', 'user15', 'user15', '1');
INSERT INTO `t_user` VALUES ('17', 'user16', 'user16', '1');
INSERT INTO `t_user` VALUES ('18', 'user17', 'user17', '1');
INSERT INTO `t_user` VALUES ('19', 'user18', 'user18', '1');
INSERT INTO `t_user` VALUES ('20', 'user19', 'user19', '1');
INSERT INTO `t_user` VALUES ('21', 'user20', 'user20', '1');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `userId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1');
INSERT INTO `t_user_role` VALUES ('2', '3');
