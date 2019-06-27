/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : loop_admin_v1

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-06-27 17:09:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base_element
-- ----------------------------
DROP TABLE IF EXISTS `base_element`;
CREATE TABLE `base_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '资源编码',
  `type` varchar(255) DEFAULT NULL COMMENT '资源类型',
  `name` varchar(255) DEFAULT NULL COMMENT '资源名称',
  `uri` varchar(255) DEFAULT NULL COMMENT '资源路径',
  `menu_id` varchar(255) DEFAULT NULL COMMENT '资源关联菜单',
  `parent_id` varchar(255) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL COMMENT '资源树状检索路径',
  `method` varchar(10) DEFAULT NULL COMMENT '资源请求类型',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_element
-- ----------------------------
INSERT INTO `base_element` VALUES ('3', 'userManager:btn_add', 'button', '新增', '22222222', '1', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('4', 'userManager:btn_edit', 'button', '编辑', '/user/{*}', '1', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('5', 'userManager:btn_del', 'button', '删除', '/user/{*}', '1', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('9', 'menuManager:element', 'uri', '按钮页面', '/element', '6', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('10', 'menuManager:btn_add', 'button', '新增', '/menu/{*}', '6', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('11', 'menuManager:btn_edit', 'button', '编辑', '/menu/{*}', '6', '', '', 'PUT', '', '2017-06-24 00:00:00', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `base_element` VALUES ('12', 'menuManager:btn_del', 'button', '删除', '/menu/{*}', '6', '', '', 'DELETE', '', '2017-06-24 00:00:00', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `base_element` VALUES ('13', 'menuManager:btn_element_add', 'button', '新增元素', '/element', '6', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('14', 'menuManager:btn_element_edit', 'button', '编辑元素', '/element/{*}', '6', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('15', 'menuManager:btn_element_del', 'button', '删除元素', '/element/{*}', '6', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('16', 'groupManager:btn_add', 'button', '新增', '/group', '7', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('17', 'groupManager:btn_edit', 'button', '编辑', '/group/{*}', '7', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('18', 'groupManager:btn_del', 'button', '删除', '/group/{*}', '7', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('19', 'groupManager:btn_userManager', 'button', '分配用户', '/group/{*}/user', '7', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('20', 'groupManager:btn_resourceManager', 'button', '分配权限', '/group/{*}/authority', '7', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('21', 'groupManager:menu', 'uri', '分配菜单', '{*}/authority/menu', '7', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('22', 'groupManager:element', 'uri', '分配资源', '/group/{*}/authority/element', '7', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('23', 'userManager:view', 'uri', '查看', '/user/{*}', '1', '', '', 'GET', '', '2017-06-26 00:00:00', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `base_element` VALUES ('24', 'menuManager:view', 'uri', '查看', '/menu/{*}', '6', '', '', 'GET', '', '2017-06-26 00:00:00', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `base_element` VALUES ('27', 'menuManager:element_view', 'uri', '查看', '/element/{*}', '6', null, null, 'GET', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('28', 'groupManager:view', 'uri', '查看', '/group/{*}', '7', null, null, 'GET', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('32', 'groupTypeManager:view', 'uri', '查看', '/groupType/{*}', '8', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('33', 'groupTypeManager:btn_add', 'button', '新增', '/groupType', '8', null, null, 'POST', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('34', 'groupTypeManager:btn_edit', 'button', '编辑', '/groupType/{*}', '8', null, null, 'PUT', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('35', 'groupTypeManager:btn_del', 'button', '删除', '/groupType/{*}', '8', null, null, 'DELETE', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('41', 'gateLogManager:view', 'button', '查看', '/gateLog', '27', null, null, 'GET', '', '2017-07-01 00:00:00', '1', 'admin', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('42', 'serviceManager:view', 'URI', '查看', '/auth/service/{*}', '30', null, null, 'GET', null, '2017-12-26 20:17:42', '1', 'Mr.AG', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('43', 'serviceManager:btn_add', 'button', '新增', '/auth/service', '30', null, null, 'POST', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('44', 'serviceManager:btn_edit', 'button', '编辑', '/auth/service/{*}', '30', null, null, 'PUT', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('45', 'serviceManager:btn_del', 'button', '删除', '/auth/service/{*}', '30', null, null, 'DELETE', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('46', 'serviceManager:btn_clientManager', 'button', '服务授权', '/auth/service/{*}/client', '30', null, null, 'POST', null, '2017-12-30 16:32:48', '1', 'Mr.AG', '127.0.0.1', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_group
-- ----------------------------
DROP TABLE IF EXISTS `base_group`;
CREATE TABLE `base_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '角色编码',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `parent_id` int(11) NOT NULL COMMENT '上级节点',
  `path` varchar(2000) DEFAULT NULL COMMENT '树状关系',
  `type` char(1) DEFAULT NULL COMMENT '类型',
  `group_type` int(11) NOT NULL COMMENT '角色组类型',
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_group
-- ----------------------------
INSERT INTO `base_group` VALUES ('1', 'adminRole', '管理员', '-1', '/adminRole', null, '1', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('4', 'visitorRole', '游客', '3', '/testGroup/visitorRole', null, '1', '', null, null, null, null, '2019-01-23 18:28:04', null, null, '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('6', 'company', 'AG集团', '-1', '/company', null, '2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('7', 'financeDepart', '财务部', '6', '/company/financeDepart', null, '2', '', null, null, null, null, '2019-02-27 15:23:33', null, null, '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('8', 'hrDepart', '人力资源部', '6', '/company/hrDepart', null, '2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('9', 'blogAdmin', '博客管理员', '-1', '/blogAdmin', null, '1', '', '2017-07-16 16:59:30', '1', 'Mr.AG', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('10', '222', '22', '3', '/testGroup/222', null, '1', '22', '2019-01-23 18:33:44', null, null, '127.0.0.1', '2019-01-23 18:33:49', null, null, '127.0.0.1', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_group_leader
-- ----------------------------
DROP TABLE IF EXISTS `base_group_leader`;
CREATE TABLE `base_group_leader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_group_leader
-- ----------------------------
INSERT INTO `base_group_leader` VALUES ('14', '4', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group_leader` VALUES ('16', '3', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group_leader` VALUES ('20', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_group_member
-- ----------------------------
DROP TABLE IF EXISTS `base_group_member`;
CREATE TABLE `base_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_group_member
-- ----------------------------
INSERT INTO `base_group_member` VALUES ('11', '4', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group_member` VALUES ('13', '3', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group_member` VALUES ('19', '9', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_group_type
-- ----------------------------
DROP TABLE IF EXISTS `base_group_type`;
CREATE TABLE `base_group_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '编码',
  `name` varchar(255) DEFAULT NULL COMMENT '类型名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `crt_time` datetime DEFAULT NULL COMMENT '创建时间',
  `crt_user` varchar(255) DEFAULT NULL COMMENT '创建人ID',
  `crt_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `crt_host` varchar(255) DEFAULT NULL COMMENT '创建主机',
  `upd_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `upd_user` varchar(255) DEFAULT NULL COMMENT '最后更新人ID',
  `upd_name` varchar(255) DEFAULT NULL COMMENT '最后更新人',
  `upd_host` varchar(255) DEFAULT NULL COMMENT '最后更新主机',
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_group_type
-- ----------------------------
INSERT INTO `base_group_type` VALUES ('1', 'role', '角色类型', 'role', null, null, null, null, '2017-08-25 17:52:37', '1', 'Mr.AG', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_group_type` VALUES ('2', 'depart', '部门类型', '222', null, null, null, null, '2019-06-23 19:27:46', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_group_type` VALUES ('3', 'free', '自定义类型', 'sadf', null, null, null, null, '2019-06-23 19:31:24', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_menu
-- ----------------------------
DROP TABLE IF EXISTS `base_menu`;
CREATE TABLE `base_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '路径编码',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `parent_id` int(11) NOT NULL COMMENT '父级节点',
  `href` varchar(255) DEFAULT NULL COMMENT '资源路径',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `type` char(10) DEFAULT NULL,
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `path` varchar(500) DEFAULT NULL COMMENT '菜单上下级关系',
  `enabled` char(1) DEFAULT NULL COMMENT '启用禁用',
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_menu
-- ----------------------------
INSERT INTO `base_menu` VALUES ('1', 'userManager', '用户管理', '5', '222222222222', 'fa-user', 'menu', '0', '333', '/adminSys/baseManager/userManager', null, null, null, null, null, '2019-06-23 20:56:38', '1', 'admin', '127.0.0.1', '_import(\'admin/user/index\')', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('5', 'baseManager', '基础配置管理', '13', '/admin', 'setting', 'dirt', '0', '', '/adminSys/baseManager', null, null, null, null, null, '2017-09-05 21:46:11', '1', 'Mr.AG', '127.0.0.1', 'Layout', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('6', 'menuManager', '菜单管理', '5', '/admin/menu', 'category', 'menu', '0', '', '/adminSys/baseManager/menuManager', null, null, null, null, null, '2017-09-05 21:10:25', '1', 'Mr.AG', '127.0.0.1', '_import(\'admin/menu/index\')', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('7', 'groupManager', '角色权限管理', '5', '/admin/group', 'group_fill', 'menu', '0', '', '/adminSys/baseManager/groupManager', null, null, null, null, null, '2017-09-05 21:11:34', '1', 'Mr.AG', '127.0.0.1', 'import(\'admin/group/index\')', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('8', 'groupTypeManager', '角色类型管理', '5', '/admin/groupType', 'fa-users', 'menu', '0', '', '/adminSys/baseManager/groupTypeManager', null, null, null, null, null, '2017-09-05 21:12:28', '1', 'Mr.AG', '127.0.0.1', '_import(\'admin/groupType/index\')', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('13', 'adminSys', '权限管理系统', '-1', '/', 'setting', 'menu', '0', '', '/adminSys', null, null, null, null, null, '2019-06-23 22:49:13', '1', 'admin', '127.0.0.1', '22', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('21', 'dictManager', '数据字典', '5', '', 'viewlist', null, '0', '', '/adminSys/baseManager/dictManager', null, null, null, null, null, '2019-01-16 20:12:46', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('27', 'gateLogManager', '操作日志', '5', '/admin/gateLog', 'viewlist', 'menu', '0', '', '/adminSys/baseManager/gateLogManager', null, '2017-07-01 00:00:00', '1', 'admin', '0:0:0:0:0:0:0:1', '2019-01-23 18:23:38', '1', 'Mr.AG', '127.0.0.1', '_import(\'admin/gateLog/index\')', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('30', 'serviceManager', '服务管理', '29', '/auth/service', 'client', null, '0', '服务管理', '/adminSys/authManager/serviceManager', null, '2017-12-26 19:56:06', '1', 'Mr.AG', '127.0.0.1', '2017-12-26 19:56:06', '1', 'Mr.AG', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('31', 'monitorManager', '监控模块管理', '13', null, 'service', null, '0', null, '/adminSys/monitorManager', null, '2018-02-25 09:36:35', '1', 'Mr.AG', '127.0.0.1', '2019-01-22 15:51:01', '1', 'Mr.AG', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('32', 'servicedocManager', '数据库监控', '31', null, 'client', 'menu', '0', null, '/adminSys/monitorManager/servicedocManager', null, '2018-02-25 09:37:04', '1', 'Mr.AG', '127.0.0.1', '2019-02-27 17:24:39', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('33', 'serviceMonitorManager', '接口文档', '31', null, 'client', null, '0', null, '/adminSys/monitorManager/servicedocManager', null, '2018-02-25 09:37:05', '1', 'Mr.AG', '127.0.0.1', '2019-02-27 17:24:55', '1', 'Mr.AG', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('39', null, null, '-1', null, null, null, '0', null, '/null', null, '2019-02-27 15:31:46', null, null, '127.0.0.1', '2019-02-27 15:31:46', null, null, '127.0.0.1', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_resource_authority
-- ----------------------------
DROP TABLE IF EXISTS `base_resource_authority`;
CREATE TABLE `base_resource_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authority_id` varchar(255) DEFAULT NULL COMMENT '角色ID',
  `authority_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `resource_id` varchar(255) DEFAULT NULL COMMENT '资源ID',
  `resource_type` varchar(255) DEFAULT NULL COMMENT '资源类型',
  `parent_id` varchar(255) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1176 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_resource_authority
-- ----------------------------
INSERT INTO `base_resource_authority` VALUES ('288', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('289', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('290', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('291', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('295', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('296', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('297', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('298', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('299', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('300', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('301', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('302', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('303', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('304', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('305', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('306', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('307', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('308', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('309', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('310', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('311', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('312', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('313', '1', 'group', '16', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('314', '1', 'group', '17', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('315', '1', 'group', '18', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('317', '1', 'group', '20', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('318', '1', 'group', '21', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('319', '1', 'group', '22', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('349', '4', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('371', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('372', '1', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('373', '1', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('374', '1', 'group', '28', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('375', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('379', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('380', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('381', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('382', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('383', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('384', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('385', '1', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('386', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('387', '1', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('388', '1', 'group', '16', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('389', '1', 'group', '18', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('390', '1', 'group', '17', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('392', '1', 'group', '20', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('393', '1', 'group', '28', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('394', '1', 'group', '22', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('395', '1', 'group', '21', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('397', '4', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('398', '4', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('399', '4', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('400', '4', 'group', '28', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('401', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('402', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('403', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('421', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('422', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('423', '4', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('424', '4', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('436', '1', 'group', '32', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('437', '1', 'group', '33', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('438', '1', 'group', '34', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('439', '1', 'group', '35', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('464', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('465', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('466', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('467', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('468', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('469', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('470', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('471', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('472', '1', 'group', '40', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('492', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('493', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('494', '1', 'group', '40', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('516', '4', 'group', '41', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('517', '4', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('518', '4', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('519', '4', 'group', '40', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('612', '4', 'group', '36', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('666', '1', 'group', '41', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('689', '1', 'group', '43', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('691', '1', 'group', '44', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('710', '9', 'group', '42', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('711', '9', 'group', '43', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('712', '9', 'group', '44', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('713', '9', 'group', '45', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('718', '9', 'group', '42', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('719', '9', 'group', '44', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('720', '9', 'group', '45', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('721', '9', 'group', '43', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('722', '1', 'group', '41', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('774', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('775', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('812', '1', 'group', '19', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('924', '1', 'group', '42', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('945', '1', 'group', '45', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('956', '1', 'group', '46', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('990', '4', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1027', '10', 'group', '1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1028', '10', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1029', '10', 'group', '-1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1030', '10', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1031', '10', 'group', '29', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1032', '10', 'group', '30', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1033', '3', 'group', '33', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1034', '3', 'group', '1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1035', '3', 'group', '34', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1036', '3', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1037', '3', 'group', '-1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1038', '3', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1039', '3', 'group', '31', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1040', '3', 'group', '32', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1041', '4', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1042', '4', 'group', '-1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1043', '6', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1044', '6', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1045', '6', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1046', '6', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1047', '6', 'group', '1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1048', '6', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1049', '6', 'group', '-1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1050', '6', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1097', '9', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1115', '7', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1120', '7', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1121', '7', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1122', '7', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1123', '7', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1124', '7', 'group', '-1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1125', '7', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1126', '7', 'group', '21', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1158', '9', 'group', '1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1159', '9', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1160', '9', 'group', '-1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1161', '9', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1162', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1163', '1', 'group', '33', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1164', '1', 'group', '34', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1165', '1', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1166', '1', 'group', '-1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1167', '1', 'group', '27', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1168', '1', 'group', '1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1169', '1', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1170', '1', 'group', '6', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1171', '1', 'group', '7', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1172', '1', 'group', '8', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1173', '1', 'group', '31', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1174', '1', 'group', '21', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1175', '1', 'group', '32', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_user
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `tel_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_user
-- ----------------------------
INSERT INTO `base_user` VALUES ('1', 'admin', '$2a$12$S/yLlj9kzi5Dgsz97H4rAekxrPlk/10eXp1lUJcAVAx.2M9tOpWie', '5555', '', null, '', null, '', '男', null, null, '22', null, null, null, null, '2019-06-23 19:00:28', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('4', 'blog', '$2a$12$S/yLlj9kzi5Dgsz97H4rAekxrPlk/10eXp1lUJcAVAx.2M9tOpWie', '55555', '', null, '', null, '', '女', null, null, '32323232', null, null, null, null, '2019-06-26 15:17:01', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('5', 'hyh', '$2a$12$KARXhT/RbINWYuoRgqeOj.RE43XGnIdeN0k3VTbRZ3GHiiYhgv1K.', 'hyh', null, null, null, null, null, '男', null, null, '222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222', '2019-01-23 18:26:48', null, null, '127.0.0.1', '2019-06-23 18:56:41', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('8', '32323', '$2a$12$uqgWZqXHAt/WK9/lw/Oqvuwl8n6srUSxmMvdabLLhOmPwbGhZ4uU2', '23232', null, null, null, null, null, '男', null, null, '3222222222222222232', '2019-03-02 17:58:27', null, null, '127.0.0.1', '2019-06-23 18:56:46', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('9', '2323232', '$2a$12$HrAZpBxZWBd7gvs.3D.oVOxUycmdNa11yJyTNTMlZ8ty/8VSXGJiC', '233232', null, null, null, null, null, '男', null, null, '323232', '2019-03-02 19:03:18', null, null, '127.0.0.1', '2019-06-23 19:00:37', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('13', '3232', '$2a$12$ZdmvTQM5qoTqkA5Jw6QPuOhw9rHWoYKF9VfXEQul4JhMBVKkmLar.', '2332', null, null, null, null, null, '男', null, null, null, '2019-03-02 23:38:40', null, null, '127.0.0.1', '2019-06-23 19:00:42', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('14', '3232', '$2a$12$nTpjkUPyh/3dOcxFKa1ITuFv3FoL.Q6KlLXm26boJyXIsyIBSjDqi', '2332', null, null, null, null, null, '男', null, null, '343434', '2019-03-02 23:38:40', null, null, '127.0.0.1', '2019-06-23 19:00:45', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('15', '3232', '$2a$12$SctJ2ECf9jLTI1WF73pp7.HwT6M1X2chjPpfKwW4.CA1ZoC/.XMtW', '2332', null, null, null, null, null, '男', null, null, null, '2019-03-02 23:38:40', null, null, '127.0.0.1', '2019-06-23 19:00:41', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('16', '3232', '$2a$12$91AODUkP6HY5EP8LFvTYv.jn3UgN64Jomj/h.nLAknH5.UwFkmKUS', '2332', null, null, null, null, null, '男', null, null, '43434343', '2019-03-02 23:38:42', null, null, '127.0.0.1', '2019-06-24 11:04:12', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('17', '3232', '$2a$12$6RtgkkRs6JoPW9GSKag.Zu6O4JJ1EjtgGeqibWgbGdNwFUrgAJ21C', '2332', null, null, null, null, null, '男', null, null, '3434343', '2019-03-02 23:38:42', null, null, '127.0.0.1', '2019-06-23 19:00:50', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('18', '3232', '$2a$12$LJzskphsiElNKXWOsnAoluA9K2HjhEQKLxoXjiuLIUJM/uE9Te8qe', '2332', null, null, null, null, null, '男', null, null, '4343434', '2019-03-02 23:38:42', null, null, '127.0.0.1', '2019-06-23 19:00:48', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('19', '343434', '$2a$12$Ik9bTGeEC.oOfkYe08h2m.2dwENGJgbUsz6jJEOaZpy5VEO3nYFmq', '334343', null, null, null, null, null, '男', null, null, '434434343', '2019-03-05 19:52:27', null, null, '127.0.0.1', '2019-06-23 19:00:53', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('20', '232323232323', '$2a$12$g01xbshQ8h96mITGhfKrYeLwSTUdxUHG8UC0.ZDXBWlaS.hQCOpKO', '232', null, null, null, null, null, '男', null, null, '323232', '2019-06-23 22:48:32', '1', 'admin', '127.0.0.1', '2019-06-23 22:48:32', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for gate_log
-- ----------------------------
DROP TABLE IF EXISTS `gate_log`;
CREATE TABLE `gate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `menu` varchar(255) DEFAULT NULL COMMENT '菜单',
  `opt` varchar(255) DEFAULT NULL COMMENT '操作',
  `uri` varchar(255) DEFAULT NULL COMMENT '资源路径',
  `crt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `crt_user` varchar(255) DEFAULT NULL COMMENT '操作人ID',
  `crt_name` varchar(255) DEFAULT NULL COMMENT '操作人',
  `crt_host` varchar(255) DEFAULT NULL COMMENT '操作主机',
  `request` varchar(5000) DEFAULT NULL,
  `respone` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of gate_log
-- ----------------------------
INSERT INTO `gate_log` VALUES ('414', 'page', 'GET', '/element/list', '2019-06-23 19:31:11', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('415', 'tree', 'GET', '/group/tree', '2019-06-23 19:31:27', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('416', 'getTree', 'GET', '/menu/tree', '2019-06-23 19:31:30', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('417', 'page', 'GET', '/element/list', '2019-06-23 19:31:30', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('418', 'page', 'GET', '/element/list', '2019-06-23 19:31:31', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('419', 'page', 'GET', '/element/list', '2019-06-23 19:31:31', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('420', 'tree', 'GET', '/group/tree', '2019-06-23 19:31:34', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('421', 'getTree', 'GET', '/menu/tree', '2019-06-23 19:31:36', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('422', 'page', 'GET', '/element/list', '2019-06-23 19:31:36', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('423', 'tree', 'GET', '/group/tree', '2019-06-23 19:34:50', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('424', 'page', 'GET', '/element/list', '2019-06-23 19:35:23', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('425', 'getTree', 'GET', '/menu/tree', '2019-06-23 19:35:23', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('426', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:26:33', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('427', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:26:33', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('428', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:26:37', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('429', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-23 20:26:49', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('430', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:26:50', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('431', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:26:50', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('432', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:26:50', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('433', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:36:24', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('434', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:36:24', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('435', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:36:24', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('436', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-23 20:36:30', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('437', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:36:31', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('438', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:36:31', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('439', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:36:31', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('440', 'tree', 'GET', '/group/tree', '2019-06-23 20:36:46', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('441', 'getTree', 'GET', '/menu/tree', '2019-06-23 20:37:11', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('442', 'page', 'GET', '/element/list', '2019-06-23 20:37:11', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('443', 'tree', 'GET', '/group/tree', '2019-06-23 20:37:18', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('444', 'getTree', 'GET', '/menu/tree', '2019-06-23 20:37:24', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('445', 'page', 'GET', '/element/list', '2019-06-23 20:37:24', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('446', 'page', 'GET', '/element/list', '2019-06-23 20:37:25', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('447', 'getTree', 'GET', '/menu/tree', '2019-06-23 20:37:30', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('448', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:37:35', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('449', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:37:35', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('450', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:37:36', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('451', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:44:21', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('452', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:44:21', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('453', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:44:21', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('454', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:44:25', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('455', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:44:25', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('456', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:44:26', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('457', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:45:22', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('458', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:45:22', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('459', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:45:23', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('460', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:47:01', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('461', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:47:01', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('462', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:47:02', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('463', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:47:36', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('464', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:47:36', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('465', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:47:36', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('466', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:49:07', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('467', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:49:07', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('468', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:49:07', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('469', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:49:17', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('470', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:49:17', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('471', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:49:17', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('472', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-23 20:50:36', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('473', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:50:37', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('474', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:50:37', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('475', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:50:37', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('476', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-23 20:56:01', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('477', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:56:01', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('478', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:56:01', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('479', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:56:01', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('480', 'getTree', 'GET', '/menu/tree', '2019-06-23 20:56:15', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('481', 'page', 'GET', '/element/list', '2019-06-23 20:56:15', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('482', 'page', 'GET', '/element/list', '2019-06-23 20:56:16', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('483', 'getTree', 'GET', '/menu/tree', '2019-06-23 20:56:38', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('484', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 20:56:40', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('485', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 20:56:40', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('486', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 20:56:40', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('487', 'getTree', 'GET', '/menu/tree', '2019-06-23 20:56:41', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('488', 'page', 'GET', '/element/list', '2019-06-23 20:56:41', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('489', 'page', 'GET', '/element/list', '2019-06-23 20:56:45', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('490', 'getTree', 'GET', '/menu/tree', '2019-06-23 20:56:45', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('491', 'tree', 'GET', '/group/tree', '2019-06-23 20:56:47', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('492', 'page', 'GET', '/element/list', '2019-06-23 20:57:07', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('493', 'getTree', 'GET', '/menu/tree', '2019-06-23 20:57:07', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('494', 'page', 'GET', '/element/list', '2019-06-23 20:57:08', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('495', 'page', 'GET', '/element/list', '2019-06-23 20:57:09', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('496', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 21:24:06', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('497', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 21:24:06', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('498', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 21:24:06', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('499', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-23 22:48:07', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('500', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-23 22:48:11', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('501', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-23 22:48:11', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('502', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-23 22:48:12', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('503', 'getTree', 'GET', '/menu/tree', '2019-06-23 22:48:17', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('504', 'page', 'GET', '/element/list', '2019-06-23 22:48:17', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('505', 'getTree', 'GET', '/menu/tree', '2019-06-23 22:48:35', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('506', 'page', 'GET', '/element/list', '2019-06-23 22:48:35', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('507', 'page', 'GET', '/element/list', '2019-06-23 22:48:36', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('508', 'page', 'GET', '/element/list', '2019-06-23 22:48:36', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('509', 'page', 'GET', '/element/list', '2019-06-23 22:48:37', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('510', 'page', 'GET', '/element/list', '2019-06-23 22:48:37', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('511', 'page', 'GET', '/element/list', '2019-06-23 22:48:39', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('512', 'page', 'GET', '/element/list', '2019-06-23 22:48:39', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('513', 'page', 'GET', '/element/list', '2019-06-23 22:48:40', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('514', 'page', 'GET', '/element/list', '2019-06-23 22:48:40', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('515', 'page', 'GET', '/element/list', '2019-06-23 22:48:40', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('516', 'page', 'GET', '/element/list', '2019-06-23 22:48:41', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('517', 'page', 'GET', '/element/list', '2019-06-23 22:48:42', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('518', 'page', 'GET', '/element/list', '2019-06-23 22:48:43', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('519', 'page', 'GET', '/element/list', '2019-06-23 22:48:44', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('520', 'page', 'GET', '/element/list', '2019-06-23 22:48:44', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('521', 'page', 'GET', '/element/list', '2019-06-23 22:48:45', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('522', 'page', 'GET', '/element/list', '2019-06-23 22:48:45', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('523', 'page', 'GET', '/element/list', '2019-06-23 22:48:46', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('524', 'page', 'GET', '/element/list', '2019-06-23 22:48:47', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('525', 'page', 'GET', '/element/list', '2019-06-23 22:48:47', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('526', 'page', 'GET', '/element/list', '2019-06-23 22:48:47', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('527', 'page', 'GET', '/element/list', '2019-06-23 22:48:47', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('528', 'page', 'GET', '/element/list', '2019-06-23 22:48:48', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('529', 'page', 'GET', '/element/list', '2019-06-23 22:48:48', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('530', 'page', 'GET', '/element/list', '2019-06-23 22:48:48', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('531', 'page', 'GET', '/element/list', '2019-06-23 22:48:49', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('532', 'page', 'GET', '/element/list', '2019-06-23 22:48:49', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('533', 'page', 'GET', '/element/list', '2019-06-23 22:48:50', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('534', 'page', 'GET', '/element/list', '2019-06-23 22:48:51', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('535', 'page', 'GET', '/element/list', '2019-06-23 22:48:57', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('536', 'page', 'GET', '/element/list', '2019-06-23 22:48:59', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('537', 'page', 'GET', '/element/list', '2019-06-23 22:49:00', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('538', 'page', 'GET', '/element/list', '2019-06-23 22:49:00', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('539', 'getTree', 'GET', '/menu/tree', '2019-06-23 22:49:11', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('540', 'getTree', 'GET', '/menu/tree', '2019-06-23 22:49:13', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('541', 'page', 'GET', '/element/list', '2019-06-23 22:49:14', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('542', 'page', 'GET', '/element/list', '2019-06-23 22:49:14', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('543', 'page', 'GET', '/element/list', '2019-06-23 22:49:15', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('544', 'page', 'GET', '/element/list', '2019-06-23 22:49:15', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('545', 'page', 'GET', '/element/list', '2019-06-23 22:49:16', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('546', 'page', 'GET', '/element/list', '2019-06-23 22:49:16', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('547', 'page', 'GET', '/element/list', '2019-06-23 22:49:17', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('548', 'page', 'GET', '/element/list', '2019-06-23 22:49:17', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('549', 'page', 'GET', '/element/list', '2019-06-23 22:49:17', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('550', 'page', 'GET', '/element/list', '2019-06-23 22:49:18', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('551', 'page', 'GET', '/element/list', '2019-06-23 22:49:18', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('552', 'page', 'GET', '/element/list', '2019-06-23 22:49:18', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('553', 'page', 'GET', '/element/list', '2019-06-23 22:49:19', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('554', 'page', 'GET', '/element/list', '2019-06-23 22:49:20', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('555', 'page', 'GET', '/element/list', '2019-06-23 22:49:20', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('556', 'page', 'GET', '/element/list', '2019-06-23 22:49:20', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('557', 'page', 'GET', '/element/list', '2019-06-23 22:49:21', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('558', 'page', 'GET', '/element/list', '2019-06-23 22:49:22', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('559', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-24 11:03:02', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('560', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-24 11:03:06', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('561', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-24 11:03:06', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('562', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-24 11:03:08', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('563', 'page', 'GET', '/element/list', '2019-06-24 11:03:21', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('564', 'getTree', 'GET', '/menu/tree', '2019-06-24 11:03:21', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('565', 'getTree', 'GET', '/menu/tree', '2019-06-24 11:03:40', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('566', 'page', 'GET', '/element/list', '2019-06-24 11:03:40', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('567', 'tree', 'GET', '/group/tree', '2019-06-24 11:04:03', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('568', 'tree', 'GET', '/group/tree', '2019-06-24 11:04:07', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('569', 'tree', 'GET', '/group/tree', '2019-06-24 11:27:46', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('570', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-24 16:53:35', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('571', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-24 16:53:36', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('572', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-24 16:53:36', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('573', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-24 16:53:36', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('574', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-26 15:16:33', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('575', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-26 15:16:33', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('576', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-26 15:16:33', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('577', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-26 15:16:34', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('578', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-26 15:21:09', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('579', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-26 15:21:09', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('580', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-26 15:21:09', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('581', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-26 15:21:10', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('582', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-26 15:21:59', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('583', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-26 15:21:59', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('584', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-26 15:21:59', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('585', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-26 15:21:59', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('586', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-26 15:22:09', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('587', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-26 15:22:10', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('588', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-26 15:22:10', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('589', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-26 15:22:10', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('590', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-26 15:22:22', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('591', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-26 15:22:22', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('592', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-26 15:22:22', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('593', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-26 15:22:22', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('594', 'getTree', 'GET', '/menu/tree', '2019-06-26 15:22:25', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('595', 'page', 'GET', '/element/list', '2019-06-26 15:22:25', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('596', 'page', 'GET', '/element/list', '2019-06-26 15:22:28', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('597', 'getTree', 'GET', '/menu/tree', '2019-06-26 15:22:28', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('598', 'page', 'GET', '/element/list', '2019-06-26 15:22:29', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('599', 'page', 'GET', '/element/list', '2019-06-26 15:22:30', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('600', 'page', 'GET', '/element/list', '2019-06-26 15:22:31', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('601', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-26 15:23:05', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('602', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-26 15:23:06', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('603', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-26 15:23:06', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('604', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-26 15:23:06', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('605', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-26 15:23:40', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('606', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-26 15:23:41', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('607', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-26 15:23:41', '1', 'admin', '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('608', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-26 15:23:41', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('609', 'createAuthenticationToken', 'POST', '/jwt/token', '2019-06-26 15:26:03', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('610', 'getMenusByUsername', 'GET', '/user/front/menus', '2019-06-26 15:26:04', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('611', 'getUserInfoAndOther', 'GET', '/user/front/info', '2019-06-26 15:26:04', null, null, '127.0.0.1', null, null);
INSERT INTO `gate_log` VALUES ('612', 'getAllMenus', 'GET', '/user/front/menu/all', '2019-06-26 15:26:04', '1', 'admin', '127.0.0.1', null, null);
