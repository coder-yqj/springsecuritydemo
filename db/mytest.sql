/*
Navicat MySQL Data Transfer

Source Server         : jj
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : mytest

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-04-18 21:46:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_resources`
-- ----------------------------
DROP TABLE IF EXISTS `t_resources`;
CREATE TABLE `t_resources` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `resUrl` varchar(100) default NULL,
  `type` int(11) default NULL,
  `parentId` int(11) default NULL,
  `sort` int(11) default NULL,
  `resKey` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resources
-- ----------------------------
INSERT INTO `t_resources` VALUES ('1', '基本设置', 'base', '0', '0', '1', 'base');
INSERT INTO `t_resources` VALUES ('2', '用户管理', '/index.do', '1', '1', '2', 'sys_user_manage');
INSERT INTO `t_resources` VALUES ('3', '角色管理', '/roles.do', '1', '1', '3', 'sys_role_manage');
INSERT INTO `t_resources` VALUES ('4', '资源管理', '/resources.do', '1', '1', '4', 'sys_res_manage');
INSERT INTO `t_resources` VALUES ('5', '添加用户', '/user/addUser.do', '2', '2', '5', 'sys_user_add');
INSERT INTO `t_resources` VALUES ('6', '删除用户', '/user/delUser.do', '2', '2', '6', 'sys_use_del');
INSERT INTO `t_resources` VALUES ('7', '添加角色', '/role/addRole.do', '2', '3', '7', 'sys_role_add');
INSERT INTO `t_resources` VALUES ('8', '删除角色', '/role/delRole.do', '2', '3', '8', 'sys_role_del');
INSERT INTO `t_resources` VALUES ('9', '添加资源', '/resources/addResources.do', '2', '4', '9', 'sys_res_add');
INSERT INTO `t_resources` VALUES ('10', '删除资源', '/resources/delResources.do', '2', '4', '10', 'sys_res_del');
INSERT INTO `t_resources` VALUES ('11', '分配角色', '/user/saveUserRoles.do', '2', '2', '9', 'sys_role_allot');
INSERT INTO `t_resources` VALUES ('12', '分配权限', '/role/saveRoleResources.do', '2', '3', '10', 'sys_res_allot');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL auto_increment,
  `roleKey` varchar(50) NOT NULL,
  `roleDesc` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'ADMIN', '管理员');
INSERT INTO `t_role` VALUES ('2', 'MEMBER', '普通用户');
INSERT INTO `t_role` VALUES ('3', 'SUPER', '超级管理员');
INSERT INTO `t_role` VALUES ('4', 'ROLE1', '角色1');

-- ----------------------------
-- Table structure for `t_role_resources`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_resources`;
CREATE TABLE `t_role_resources` (
  `roleId` int(11) NOT NULL,
  `resourcesId` int(11) NOT NULL,
  PRIMARY KEY  (`roleId`,`resourcesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_resources
-- ----------------------------
INSERT INTO `t_role_resources` VALUES ('1', '2');
INSERT INTO `t_role_resources` VALUES ('1', '3');
INSERT INTO `t_role_resources` VALUES ('1', '4');
INSERT INTO `t_role_resources` VALUES ('1', '5');
INSERT INTO `t_role_resources` VALUES ('1', '6');
INSERT INTO `t_role_resources` VALUES ('1', '7');
INSERT INTO `t_role_resources` VALUES ('1', '8');
INSERT INTO `t_role_resources` VALUES ('1', '9');
INSERT INTO `t_role_resources` VALUES ('1', '10');
INSERT INTO `t_role_resources` VALUES ('1', '11');
INSERT INTO `t_role_resources` VALUES ('1', '12');
INSERT INTO `t_role_resources` VALUES ('2', '2');
INSERT INTO `t_role_resources` VALUES ('2', '5');
INSERT INTO `t_role_resources` VALUES ('3', '2');
INSERT INTO `t_role_resources` VALUES ('3', '6');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(33) default NULL,
  `password` varchar(33) default NULL,
  `enable` int(10) default NULL COMMENT '是否启用',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1');
INSERT INTO `t_user` VALUES ('3', 'user2', 'user2', '0');
INSERT INTO `t_user` VALUES ('4', 'user3', 'user3', '1');
INSERT INTO `t_user` VALUES ('5', 'user4', 'user4', '1');
INSERT INTO `t_user` VALUES ('6', 'user5', 'user5', '1');
INSERT INTO `t_user` VALUES ('7', 'user6', 'user6', '1');
INSERT INTO `t_user` VALUES ('8', 'user7', 'user7', '1');
INSERT INTO `t_user` VALUES ('9', 'user8', 'user8', '1');
INSERT INTO `t_user` VALUES ('14', 'user13', 'user13', '1');
INSERT INTO `t_user` VALUES ('15', 'user14', 'user15', '1');
INSERT INTO `t_user` VALUES ('16', 'user15', 'user15', '1');
INSERT INTO `t_user` VALUES ('17', 'teste', '123456', '1');
INSERT INTO `t_user` VALUES ('18', 'user1', 'e10adc3949ba59abbe56e057f20f883e', '1');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY  (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1');
INSERT INTO `t_user_role` VALUES ('2', '2');
