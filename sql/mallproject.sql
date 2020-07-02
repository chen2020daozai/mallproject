/*
 Navicat Premium Data Transfer

 Source Server         : localmysql
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : mallproject

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 25/06/2020 16:39:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_cart
-- ----------------------------
DROP TABLE IF EXISTS `sys_cart`;
CREATE TABLE `sys_cart`  (
  `cart_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `product_id` int(20) NULL DEFAULT NULL COMMENT '商品id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `cart_time` datetime(0) NULL DEFAULT NULL COMMENT '加入购物车时间',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_cart
-- ----------------------------
INSERT INTO `sys_cart` VALUES (5, 12, 3, '2020-05-02 15:31:44');
INSERT INTO `sys_cart` VALUES (6, 12, 1, '2020-06-15 13:29:42');
INSERT INTO `sys_cart` VALUES (7, 16, 1, '2020-06-15 20:33:13');
INSERT INTO `sys_cart` VALUES (8, 17, 1, '2020-06-15 20:34:38');
INSERT INTO `sys_cart` VALUES (9, 19, 1, '2020-06-15 20:34:41');
INSERT INTO `sys_cart` VALUES (10, 15, 1, '2020-06-15 20:35:48');
INSERT INTO `sys_cart` VALUES (11, 14, 1, '2020-06-15 20:36:21');
INSERT INTO `sys_cart` VALUES (12, 13, 1, '2020-06-15 20:36:22');
INSERT INTO `sys_cart` VALUES (13, 23, 1, '2020-06-15 21:11:53');
INSERT INTO `sys_cart` VALUES (14, 16, 6, '2020-06-25 11:08:20');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-16 15:50:31', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '公司', 0, '陈', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 100, '0,100', '研发部门', 1, '陈', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 100, '0,100', '市场部门', 2, '陈', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 100, '0,100', '测试部门', 3, '陈', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 100, '0,100', '财务部门', 4, '陈', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 100, '0,100', '运维部门', 5, '陈', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1067 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (3, '业务模块', 0, 3, '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '订单管理', 3, 1, '/system/order', '', 'C', '0', 'system:order:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '订单管理菜单');
INSERT INTO `sys_menu` VALUES (1046, '订单管理查询', 1045, 1, '#', '', 'F', '0', 'system:order:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1047, '订单管理新增', 1045, 2, '#', '', 'F', '0', 'system:order:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1048, '订单管理修改', 1045, 3, '#', '', 'F', '0', 'system:order:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1049, '订单管理删除', 1045, 4, '#', '', 'F', '0', 'system:order:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1051, '商品管理', 3, 1, '/system/product', '', 'C', '0', 'system:product:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '商品管理菜单');
INSERT INTO `sys_menu` VALUES (1052, '商品管理查询', 1051, 1, '#', '', 'F', '0', 'system:product:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1053, '商品管理新增', 1051, 2, '#', '', 'F', '0', 'system:product:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1054, '商品管理修改', 1051, 3, '#', '', 'F', '0', 'system:product:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1055, '商品管理删除', 1051, 4, '#', '', 'F', '0', 'system:product:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1057, '种类管理', 3, 1, '/system/type', '', 'C', '0', 'system:type:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '种类管理菜单');
INSERT INTO `sys_menu` VALUES (1058, '种类管理查询', 1057, 1, '#', '', 'F', '0', 'system:type:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1059, '种类管理新增', 1057, 2, '#', '', 'F', '0', 'system:type:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1060, '种类管理修改', 1057, 3, '#', '', 'F', '0', 'system:type:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1061, '种类管理删除', 1057, 4, '#', '', 'F', '0', 'system:type:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1062, '购物车', 3, 1, '/system/cart', '', 'C', '0', 'system:cart:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '购物车菜单');
INSERT INTO `sys_menu` VALUES (1063, '购物车查询', 1062, 1, '#', '', 'F', '0', 'system:cart:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1064, '购物车新增', 1062, 2, '#', '', 'F', '0', 'system:cart:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1065, '购物车修改', 1062, 3, '#', '', 'F', '0', 'system:cart:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1066, '购物车删除', 1062, 4, '#', '', 'F', '0', 'system:cart:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `message_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '留言内容',
  `message_content_time` datetime(0) NULL DEFAULT NULL COMMENT '留言时间',
  `message_reply` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '回复内容',
  `message_reply_time` datetime(0) NULL DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 288 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (221, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.createorder()', 'GET', 1, 'admin', '研发部门', '/system/order/createorder/12', '127.0.0.1', '内网IP', '{}', '\"front/createorder\"', 0, NULL, '2020-06-13 11:01:47');
INSERT INTO `sys_oper_log` VALUES (222, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"12\"],\"userId\":[\"1\"],\"productName\":[\"管理思维\"],\"typeId\":[\"1\"],\"productPicture\":[\"/profile/upload/2020/06/14/b1941e3277eb371241574e36322097ec.png\"],\"productPrice\":[\"15.0\"],\"productDescription\":[\"管理思维图书\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 11:33:54');
INSERT INTO `sys_oper_log` VALUES (223, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"13\"],\"userId\":[\"1\"],\"productName\":[\"管理赋能\"],\"typeId\":[\"1\"],\"productPicture\":[\"/profile/upload/2020/06/14/ea42bb5006486141d8056db12ebdfdc4.png\"],\"productPrice\":[\"25.0\"],\"productDescription\":[\"管理赋能赋能\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 11:34:02');
INSERT INTO `sys_oper_log` VALUES (224, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"14\"],\"userId\":[\"1\"],\"productName\":[\"马伯庸笑翻中国简史\"],\"typeId\":[\"2\"],\"productPicture\":[\"/profile/upload/2020/06/14/48e4bef1ae6532968688e891d5c39398.png\"],\"productPrice\":[\"26.0\"],\"productDescription\":[\"111111111\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 11:34:07');
INSERT INTO `sys_oper_log` VALUES (225, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"15\"],\"userId\":[\"1\"],\"productName\":[\"希腊史：详注修订本\"],\"typeId\":[\"2\"],\"productPicture\":[\"/profile/upload/2020/06/14/73d4005d3fae7a251b040111aa2f103b.png\"],\"productPrice\":[\"56.0\"],\"productDescription\":[\"希腊历史\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 11:34:12');
INSERT INTO `sys_oper_log` VALUES (226, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"14\"],\"userId\":[\"1\"],\"productName\":[\"马伯庸笑翻中国简史\"],\"typeId\":[\"1\"],\"productPicture\":[\"/profile/upload/2020/06/14/48e4bef1ae6532968688e891d5c39398.png\"],\"productPrice\":[\"26.0\"],\"productDescription\":[\"111111111\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 11:56:04');
INSERT INTO `sys_oper_log` VALUES (227, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"15\"],\"userId\":[\"1\"],\"productName\":[\"希腊史：详注修订本\"],\"typeId\":[\"1\"],\"productPicture\":[\"/profile/upload/2020/06/14/73d4005d3fae7a251b040111aa2f103b.png\"],\"productPrice\":[\"56.0\"],\"productDescription\":[\"希腊历史\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 11:56:10');
INSERT INTO `sys_oper_log` VALUES (228, '种类管理', 2, 'com.ruoyi.project.system.type.controller.TypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/type/edit', '127.0.0.1', '内网IP', '{\"typeId\":[\"1\"],\"typeName\":[\"教辅图书\"],\"typeSort\":[\"1\"],\"typeStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 11:56:50');
INSERT INTO `sys_oper_log` VALUES (229, '种类管理', 2, 'com.ruoyi.project.system.type.controller.TypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/type/edit', '127.0.0.1', '内网IP', '{\"typeId\":[\"2\"],\"typeName\":[\"手机通讯\"],\"typeSort\":[\"2\"],\"typeStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 11:57:23');
INSERT INTO `sys_oper_log` VALUES (230, '种类管理', 2, 'com.ruoyi.project.system.type.controller.TypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/type/edit', '127.0.0.1', '内网IP', '{\"typeId\":[\"3\"],\"typeName\":[\"数码电子\"],\"typeSort\":[\"3\"],\"typeStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 11:57:30');
INSERT INTO `sys_oper_log` VALUES (231, '种类管理', 2, 'com.ruoyi.project.system.type.controller.TypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/type/edit', '127.0.0.1', '内网IP', '{\"typeId\":[\"4\"],\"typeName\":[\"生活日用\"],\"typeSort\":[\"4\"],\"typeStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 11:59:10');
INSERT INTO `sys_oper_log` VALUES (232, '商品管理', 1, 'com.ruoyi.project.system.product.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/product/add', '127.0.0.1', '内网IP', '{\"productName\":[\"iPhone11 \"],\"typeId\":[\"2\"],\"productPicture\":[\"/profile/upload/2020/06/14/d6d0eed51be1014388f674d1c8bc1b01.png\"],\"productPrice\":[\"5999\"],\"productDescription\":[\"品牌： Apple 商品名称：AppleiPhone 11商品编号：100008348542商品毛重：470.00g商品产地：中国大陆CPU型号：其他运行内存：其它内存机身存储：128GB存储卡：不支持存储卡摄像头数量：后置双摄后摄主摄像素：1200万像素前摄主摄像素：1200万像素主屏幕尺寸（英寸）：6.1英寸分辨率：其它分辨率屏幕比例：其它屏幕比例屏幕前摄组合：刘海屏充电器：其他热点：人脸识别特殊功能：语音命令操作系统：iOS(Apple)\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 12:12:36');
INSERT INTO `sys_oper_log` VALUES (233, '商品管理', 1, 'com.ruoyi.project.system.product.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/product/add', '127.0.0.1', '内网IP', '{\"productName\":[\"华为P30 PRO\"],\"typeId\":[\"1\"],\"productPicture\":[\"/profile/upload/2020/06/14/7d59716398aa4f732770bcf1dca49d16.png\"],\"productPrice\":[\"3488\"],\"productDescription\":[\"品牌： 华为（HUAWEI） 商品名称：华为P30 Pro商品编号：100004323294商品毛重：0.54kg商品产地：中国大陆CPU型号：麒麟980运行内存：8GB机身存储：128GB存储卡：NM存储卡摄像头数量：后置四摄后摄主摄像素：4000万像素前摄主摄像素：3200万像素主屏幕尺寸（英寸）：6.47英寸分辨率：全高清FHD+屏幕比例：其它屏幕比例屏幕前摄组合：水滴屏电池容量（mAh）：4200mAh（典型值）充电器：10V/4A机身颜色：天空之境热点：人脸识别，快速充电，无线充电，液冷散热，高倍率变焦，屏幕指纹，防水防尘，NFC，曲面屏充电功率：40-49W屏占比：≥90%操作系统：Android(安卓)\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 12:14:09');
INSERT INTO `sys_oper_log` VALUES (234, '商品管理', 1, 'com.ruoyi.project.system.product.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/product/add', '127.0.0.1', '内网IP', '{\"productName\":[\"vivo iQOO Neo3\"],\"typeId\":[\"2\"],\"productPicture\":[\"/profile/upload/2020/06/14/5cab3bc4ca69ffffbc98c9b04cbcbd41.png\"],\"productPrice\":[\"2998\"],\"productDescription\":[\"商品名称：vivoiQOO Neo3商品编号：100012820028商品毛重：0.54kg商品产地：中国大陆CPU型号：骁龙865运行内存：8GB机身存储：128GB存储卡：不支持存储卡摄像头数量：后置三摄后摄主摄像素：4800万像素前摄主摄像素：1600万像素主屏幕尺寸（英寸）：6.57英寸分辨率：其它分辨率屏幕比例：19.6~20:9屏幕前摄组合：极点屏充电器：11V/4A热点：快速充电，5G，超高屏占比，屏幕高刷新率屏占比：≥90%操作系统：Android(安卓)游戏配置：游戏深度优化\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 12:15:06');
INSERT INTO `sys_oper_log` VALUES (235, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"17\"],\"userId\":[\"1\"],\"productName\":[\"华为P30 PRO\"],\"typeId\":[\"2\"],\"productPicture\":[\"/profile/upload/2020/06/14/7d59716398aa4f732770bcf1dca49d16.png\"],\"productPrice\":[\"3488.0\"],\"productDescription\":[\"品牌： 华为（HUAWEI） 商品名称：华为P30 Pro商品编号：100004323294商品毛重：0.54kg商品产地：中国大陆CPU型号：麒麟980运行内存：8GB机身存储：128GB存储卡：NM存储卡摄像头数量：后置四摄后摄主摄像素：4000万像素前摄主摄像素：3200万像素主屏幕尺寸（英寸）：6.47英寸分辨率：全高清FHD+屏幕比例：其它屏幕比例屏幕前摄组合：水滴屏电池容量（mAh）：4200mAh（典型值）充电器：10V/4A机身颜色：天空之境热点：人脸识别，快速充电，无线充电，液冷散热，高倍率变焦，屏幕指纹，防水防尘，NFC，曲面屏充电功率：40-49W屏占比：≥90%操作系统：Android(安卓)\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 12:15:21');
INSERT INTO `sys_oper_log` VALUES (236, '商品管理', 1, 'com.ruoyi.project.system.product.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/product/add', '127.0.0.1', '内网IP', '{\"productName\":[\"小米10\"],\"typeId\":[\"2\"],\"productPicture\":[\"/profile/upload/2020/06/14/c7ac4b65b292745d0ef9c86264084c0b.png\"],\"productPrice\":[\"3999\"],\"productDescription\":[\"品牌： 小米（MI） 商品名称：小米10商品编号：100011336064商品毛重：0.6kg商品产地：中国大陆CPU型号：骁龙865运行内存：8GB机身存储：128GB存储卡：不支持存储卡摄像头数量：后置四摄后摄主摄像素：1亿像素前摄主摄像素：2000万像素主屏幕尺寸（英寸）：6.67英寸分辨率：全高清FHD+屏幕比例：19.1~19.5:9屏幕前摄组合：其他充电器：其他热点：人脸识别，曲面屏操作系统：Android(安卓)游戏性能：发烧级\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 12:16:07');
INSERT INTO `sys_oper_log` VALUES (237, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"16\"],\"userId\":[\"1\"],\"productName\":[\"iPhone11\"],\"typeId\":[\"2\"],\"productPicture\":[\"/profile/upload/2020/06/14/330cea1f70b7f83f0f120479bb96d117.png\"],\"productPrice\":[\"5999.0\"],\"productDescription\":[\"品牌： Apple 商品名称：AppleiPhone 11商品编号：100008348542商品毛重：470.00g商品产地：中国大陆CPU型号：其他运行内存：其它内存机身存储：128GB存储卡：不支持存储卡摄像头数量：后置双摄后摄主摄像素：1200万像素前摄主摄像素：1200万像素主屏幕尺寸（英寸）：6.1英寸分辨率：其它分辨率屏幕比例：其它屏幕比例屏幕前摄组合：刘海屏充电器：其他热点：人脸识别特殊功能：语音命令操作系统：iOS(Apple)\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 13:49:08');
INSERT INTO `sys_oper_log` VALUES (238, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"17\"],\"userId\":[\"1\"],\"productName\":[\"华为P30 PRO\"],\"typeId\":[\"2\"],\"productPicture\":[\"/profile/upload/2020/06/14/694a6d710d9f8fbfc6ed8a89667d4fc3.png\"],\"productPrice\":[\"3488.0\"],\"productDescription\":[\"品牌： 华为（HUAWEI） 商品名称：华为P30 Pro商品编号：100004323294商品毛重：0.54kg商品产地：中国大陆CPU型号：麒麟980运行内存：8GB机身存储：128GB存储卡：NM存储卡摄像头数量：后置四摄后摄主摄像素：4000万像素前摄主摄像素：3200万像素主屏幕尺寸（英寸）：6.47英寸分辨率：全高清FHD+屏幕比例：其它屏幕比例屏幕前摄组合：水滴屏电池容量（mAh）：4200mAh（典型值）充电器：10V/4A机身颜色：天空之境热点：人脸识别，快速充电，无线充电，液冷散热，高倍率变焦，屏幕指纹，防水防尘，NFC，曲面屏充电功率：40-49W屏占比：≥90%操作系统：Android(安卓)\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 13:50:04');
INSERT INTO `sys_oper_log` VALUES (239, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"14\"],\"userId\":[\"1\"],\"productName\":[\"马伯庸笑翻中国简史\"],\"typeId\":[\"1\"],\"productPicture\":[\"\"],\"productPrice\":[\"26.0\"],\"productDescription\":[\"111111111\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 14:01:06');
INSERT INTO `sys_oper_log` VALUES (240, '商品管理', 1, 'com.ruoyi.project.system.product.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/product/add', '127.0.0.1', '内网IP', '{\"productName\":[\"test\"],\"typeId\":[\"3\"],\"productPicture\":[\"\"],\"productPrice\":[\"45646\"],\"productDescription\":[\"间接简洁军\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 14:06:19');
INSERT INTO `sys_oper_log` VALUES (241, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"20\"],\"userId\":[\"1\"],\"productName\":[\"test\"],\"typeId\":[\"3\"],\"productPicture\":[\"/profile/0627/mallproject/ruoyi/uploadPath/upload/2020/06/14/d03fba2715650e30891b6e71415edcf0.png\"],\"productPrice\":[\"45646.0\"],\"productDescription\":[\"间接简洁军\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 14:38:16');
INSERT INTO `sys_oper_log` VALUES (242, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"20\"],\"userId\":[\"1\"],\"productName\":[\"test\"],\"typeId\":[\"3\"],\"productPicture\":[\"/profile/D:/codetb/0610mall0627/mallproject/ruoyi/uploadPath/upload/2020/06/14/55d82fd49fcd67b6e30516cf9b2272ba.png\"],\"productPrice\":[\"45646.0\"],\"productDescription\":[\"间接简洁军\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 17:11:04');
INSERT INTO `sys_oper_log` VALUES (243, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"20\"],\"userId\":[\"1\"],\"productName\":[\"test\"],\"typeId\":[\"3\"],\"productPicture\":[\"/profile/ruoyi/uploadPath/upload/2020/06/14/23d3661bf280b53aa8577360bfde8a67.png\"],\"productPrice\":[\"45646.0\"],\"productDescription\":[\"间接简洁军\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 17:11:37');
INSERT INTO `sys_oper_log` VALUES (244, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"20\"],\"userId\":[\"1\"],\"productName\":[\"test\"],\"typeId\":[\"3\"],\"productPicture\":[\"/profile/Path/upload/2020/06/14/a1f2f02952f42f0afe6efdb5aef23b55.png\"],\"productPrice\":[\"45646.0\"],\"productDescription\":[\"间接简洁军\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 17:12:22');
INSERT INTO `sys_oper_log` VALUES (245, '商品管理', 2, 'com.ruoyi.project.system.product.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"20\"],\"userId\":[\"1\"],\"productName\":[\"test\"],\"typeId\":[\"3\"],\"productPicture\":[\"/profile//upload/2020/06/14/00b2a6926d82f365e1e1d71f3146e835.png\"],\"productPrice\":[\"45646.0\"],\"productDescription\":[\"间接简洁军\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 17:13:09');
INSERT INTO `sys_oper_log` VALUES (246, '商品管理', 1, 'com.ruoyi.project.system.product.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/product/add', '127.0.0.1', '内网IP', '{\"productName\":[\"111\"],\"typeId\":[\"1\"],\"productPicture\":[\"/profile//upload/2020/06/14/13b63f062c117cfae6d47001108e7739.png\"],\"productPrice\":[\"222\"],\"productDescription\":[\"222\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 17:14:10');
INSERT INTO `sys_oper_log` VALUES (247, '商品管理', 3, 'com.ruoyi.project.system.product.controller.ProductController.remove()', 'POST', 1, 'admin', '研发部门', '/system/product/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"21,20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 17:14:34');
INSERT INTO `sys_oper_log` VALUES (248, '商品管理', 1, 'com.ruoyi.project.system.product.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/product/add', '127.0.0.1', '内网IP', '{\"productName\":[\"TP-LINK双千兆路由器\"],\"typeId\":[\"3\"],\"productPicture\":[\"/profile//upload/2020/06/14/8640c2b0bd069f62a6f8b1cc6dc0a5d3.png\"],\"productPrice\":[\"189\"],\"productDescription\":[\"品牌： 普联（TP-LINK） 商品名称：普联TL-WDR7660千兆版商品编号：100002287620商品毛重：0.9kg商品产地：中国大陆APP端控制：支持天线数量：6根网口盲插：不支持固件切换：不支持5G MIMO技术：3x3 MIMO防火墙：支持无线速率：1900M质保期：12个月适用面积：大户型（90-120㎡）WAN接入口：千兆网口无线协议：WiFi 5LAN输出口：千兆网口2.4G MIMO技术：3x3 MIMO天线：外置天线是否有USB接口：否LAN口数量：3\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 17:22:50');
INSERT INTO `sys_oper_log` VALUES (249, '商品管理', 1, 'com.ruoyi.project.system.product.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/product/add', '127.0.0.1', '内网IP', '{\"productName\":[\"惠普136w打印机\"],\"typeId\":[\"3\"],\"productPicture\":[\"/profile//upload/2020/06/14/5ad4baa6272903cd4b0bb0d3732823ac.png\"],\"productPrice\":[\"1599\"],\"productDescription\":[\"主体\\r\\n品牌\\r\\nHP\\r\\n功能\\r\\n打印；复印；扫描\\r\\n型号\\r\\n136w\\r\\n认证型号\\r\\n136w\\r\\n打印机类型\\r\\n黑白打印机\\r\\n打印功能\\r\\n分辨率\\r\\n黑白(最佳模式)：高达1,200x1,200dpi；黑白(正常模式)：600x600dpi\\r\\n打印速度\\r\\n黑白(正常模式，A4)：高达20页/分钟\\r\\n首次打印时间\\r\\n黑白(A4，就绪模式)：仅8.3秒；黑白(A4，睡眠模式)：最快18秒\\r\\n复印功能\\r\\n最大复印页数\\r\\n最多99份\\r\\n复印比例\\r\\n25%～400%\\r\\n首次复印时间\\r\\n黑白(A4)：仅8.9秒；黑白(A4，睡眠模式)：最快17秒\\r\\n复印速度\\r\\n黑白(正常模式，A4)：高达20份/分钟\\r\\n规格\\r\\n重量\\r\\n7.46 kg\\r\\n接口\\r\\n高速USB 2.0端口、无线802.11 b/g/n\\r\\n系统参数\\r\\nWindows®：7(32/64位), 2008 Server R2,8(32/64位)，8.1(32/64位),10(32/64位),2012 Server,2016 Server\\r\\n电源\\r\\n电源类型：内置电源；电源要求：220伏输入电压：220～240伏交流电，50/60赫兹。功耗7：打印：300瓦，就绪：38瓦，睡眠：1.9瓦；手动关机：0.2瓦； 自动关机/手动开机：0.2瓦；典型用电量(TEC)8：0.876千瓦时/周(BA)，0.924千瓦时/周(ES\\r\\n尺寸\\r\\n406x359.6x253毫米\\r\\n纸张输入容量\\r\\n进纸盒：150页\\r\\n噪音水平\\r\\n无声；声能排放(打印)：6.5B(A)(打印速度为20页/分钟)；声能排放(扫描)：6.25B(A)(ADF扫描速度仅20面/分钟)\\r\\n内存\\r\\n标配/最大：128 MB\\r\\n纸张输出容量\\r\\n出纸盒：100页\\r\\n扫描功能\\r\\n分辨率\\r\\n光学分辨率：高达600x600dpi；增强：高达4,800x4,800dpi\\r\\n灰阶\\r\\n256\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 17:23:27');
INSERT INTO `sys_oper_log` VALUES (250, '商品管理', 1, 'com.ruoyi.project.system.product.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/product/add', '127.0.0.1', '内网IP', '{\"productName\":[\"小米手环5\"],\"typeId\":[\"3\"],\"productPicture\":[\"/profile//upload/2020/06/14/6dbfddfb12c7378c3238f6da8dd36f51.png\"],\"productPrice\":[\"189\"],\"productDescription\":[\"品牌： 小米（MI）\\r\\n商品名称：小米小米手环 5商品编号：100007508245商品毛重：55.00g商品产地：中国大陆支付功能：扫码支付APP共享账号：支持一个账号蓝牙版本：5血压：不支持血压测量续航时间：7-14天健康功能：睡眠监测，久坐提醒通讯功能：来电提醒，消息提醒附加服务：无附加服务心率监测：实时监测AI语音功能：不支持AI语音功能NFC功能：无NFC功能运动模式：11种-20种防水等级：50米防水充电方式：磁吸充电线触控模式：单点触控腕带颜色：黑色运动功能：自动识别运动模式，泳姿识别屏幕显示：彩色屏幕类型：AMOLED腕带材质：硅胶亮度自动调节：亮度自动调节\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 17:24:14');
INSERT INTO `sys_oper_log` VALUES (251, '商品管理', 1, 'com.ruoyi.project.system.product.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/product/add', '127.0.0.1', '内网IP', '{\"productName\":[\"360智能摄像头\"],\"typeId\":[\"3\"],\"productPicture\":[\"/profile//upload/2020/06/14/edbce0ad88ab1cb9cd7fa452d5bf20ab.png\"],\"productPrice\":[\"199\"],\"productDescription\":[\"品牌： 360\\r\\n商品名称：360AP5C商品编号：100013117544商品毛重：350.00g商品产地：中国大陆存储编码：H.265像素：200W焦距：4mm分类：智能摄像头变倍变焦：不支持变倍变焦供电方式：电源供电夜视类型：红外夜视探头个数：1个智能识别：人脸识别监控类型：家用云台语音类型：语音通话防水等级：无防水等级追踪方式：智能追踪供网方式：无线红外夜视距离：10m警戒方式：手机推送存储方式：云存+内存卡\"],\"productStatus\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-14 17:24:42');
INSERT INTO `sys_oper_log` VALUES (252, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.createorder()', 'GET', 1, 'admin', '研发部门', '/system/order/createorder/12', '127.0.0.1', '内网IP', '{}', '\"front/createorder\"', 0, NULL, '2020-06-15 13:29:39');
INSERT INTO `sys_oper_log` VALUES (253, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 13:29:41');
INSERT INTO `sys_oper_log` VALUES (254, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.createorder()', 'GET', 1, 'admin', '研发部门', '/system/order/createorder/12', '127.0.0.1', '内网IP', '{}', '\"front/createorder\"', 0, NULL, '2020-06-15 13:30:35');
INSERT INTO `sys_oper_log` VALUES (255, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 13:30:44');
INSERT INTO `sys_oper_log` VALUES (256, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.createorder()', 'GET', 1, 'admin', '研发部门', '/system/order/createorder/12', '127.0.0.1', '内网IP', '{}', '\"front/createorder\"', 0, NULL, '2020-06-15 13:30:53');
INSERT INTO `sys_oper_log` VALUES (257, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.create()', 'POST', 1, 'admin', '研发部门', '/system/order/create', '127.0.0.1', '内网IP', '{\"productId\":[\"12\"],\"orderPrice\":[\"15.0\"],\"orderPhone\":[\"11111\"],\"orderAddress\":[\"11111111111111111\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":50}', 0, NULL, '2020-06-15 13:30:56');
INSERT INTO `sys_oper_log` VALUES (258, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.createorder()', 'GET', 1, 'zhangsan', '研发部门', '/system/order/createorder/13', '127.0.0.1', '内网IP', '{}', '\"front/createorder\"', 0, NULL, '2020-06-15 13:32:10');
INSERT INTO `sys_oper_log` VALUES (259, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.create()', 'POST', 1, 'zhangsan', '研发部门', '/system/order/create', '127.0.0.1', '内网IP', '{\"productId\":[\"13\"],\"orderPrice\":[\"25.0\"],\"orderPhone\":[\"12\"],\"orderAddress\":[\"212\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":51}', 0, NULL, '2020-06-15 13:32:14');
INSERT INTO `sys_oper_log` VALUES (260, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.createorder()', 'GET', 1, 'zhangsan', '研发部门', '/system/order/createorder/14', '127.0.0.1', '内网IP', '{}', '\"front/createorder\"', 0, NULL, '2020-06-15 13:35:05');
INSERT INTO `sys_oper_log` VALUES (261, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.create()', 'POST', 1, 'zhangsan', '研发部门', '/system/order/create', '127.0.0.1', '内网IP', '{\"productId\":[\"14\"],\"orderPrice\":[\"26.0\"],\"orderPhone\":[\"11111\"],\"orderAddress\":[\"122222222\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":52}', 0, NULL, '2020-06-15 13:35:08');
INSERT INTO `sys_oper_log` VALUES (262, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 20:30:08');
INSERT INTO `sys_oper_log` VALUES (263, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.createorder()', 'GET', 1, 'admin', '研发部门', '/system/order/createorder/12', '127.0.0.1', '内网IP', '{}', '\"front/createorder\"', 0, NULL, '2020-06-15 20:30:10');
INSERT INTO `sys_oper_log` VALUES (264, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 20:31:29');
INSERT INTO `sys_oper_log` VALUES (265, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/16', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 20:33:13');
INSERT INTO `sys_oper_log` VALUES (266, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/17', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 20:34:38');
INSERT INTO `sys_oper_log` VALUES (267, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.createorder()', 'GET', 1, 'admin', '研发部门', '/system/order/createorder/17', '127.0.0.1', '内网IP', '{}', '\"front/createorder\"', 0, NULL, '2020-06-15 20:34:39');
INSERT INTO `sys_oper_log` VALUES (268, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/19', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 20:34:41');
INSERT INTO `sys_oper_log` VALUES (269, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/15', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 20:35:47');
INSERT INTO `sys_oper_log` VALUES (270, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/15', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 20:36:20');
INSERT INTO `sys_oper_log` VALUES (271, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/14', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 20:36:21');
INSERT INTO `sys_oper_log` VALUES (272, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/13', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 20:36:22');
INSERT INTO `sys_oper_log` VALUES (273, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 20:36:23');
INSERT INTO `sys_oper_log` VALUES (274, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/23', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 21:11:53');
INSERT INTO `sys_oper_log` VALUES (275, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.createorder()', 'GET', 1, 'admin', '研发部门', '/system/order/createorder/23', '127.0.0.1', '内网IP', '{}', '\"front/createorder\"', 0, NULL, '2020-06-15 21:11:55');
INSERT INTO `sys_oper_log` VALUES (276, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/23', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-15 21:12:27');
INSERT INTO `sys_oper_log` VALUES (277, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'admin', '研发部门', '/system/cart/addcart/13', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-24 22:38:53');
INSERT INTO `sys_oper_log` VALUES (278, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.createorder()', 'GET', 1, 'admin', '研发部门', '/system/order/createorder/13', '127.0.0.1', '内网IP', '{}', '\"front/createorder\"', 0, NULL, '2020-06-24 22:38:54');
INSERT INTO `sys_oper_log` VALUES (279, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.create()', 'POST', 1, 'admin', '研发部门', '/system/order/create', '127.0.0.1', '内网IP', '{\"productId\":[\"13\"],\"orderPrice\":[\"25.0\"],\"orderPhone\":[\"13888887777\"],\"orderAddress\":[\"河北省石家庄市人民路111号\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":53}', 0, NULL, '2020-06-24 22:39:22');
INSERT INTO `sys_oper_log` VALUES (280, '订单管理', 3, 'com.ruoyi.project.system.order.controller.OrderController.remove()', 'POST', 1, 'admin', '研发部门', '/system/order/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"50\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-24 22:40:30');
INSERT INTO `sys_oper_log` VALUES (281, '订单管理', 3, 'com.ruoyi.project.system.order.controller.OrderController.remove()', 'POST', 1, 'admin', '研发部门', '/system/order/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"53\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-24 22:40:32');
INSERT INTO `sys_oper_log` VALUES (282, '订单管理', 2, 'com.ruoyi.project.system.order.controller.OrderController.commentSave()', 'POST', 1, 'zhangsan', '研发部门', '/system/order/comment', '127.0.0.1', '内网IP', '{\"orderId\":[\"48\"],\"orderComment\":[\"很不错\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-24 22:43:22');
INSERT INTO `sys_oper_log` VALUES (283, '购物车', 3, 'com.ruoyi.project.system.cart.controller.CartController.remove()', 'POST', 1, 'zhangsan', '研发部门', '/system/cart/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3,4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-25 11:08:13');
INSERT INTO `sys_oper_log` VALUES (284, '购物车', 1, 'com.ruoyi.project.system.cart.controller.CartController.addcart()', 'GET', 1, 'zhangsan', '研发部门', '/system/cart/addcart/16', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"加入购物车成功！\",\"code\":0}', 0, NULL, '2020-06-25 11:08:20');
INSERT INTO `sys_oper_log` VALUES (285, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.createorder()', 'GET', 1, 'zhangsan', '研发部门', '/system/order/createorder/16', '127.0.0.1', '内网IP', '{}', '\"front/createorder\"', 0, NULL, '2020-06-25 11:08:34');
INSERT INTO `sys_oper_log` VALUES (286, '订单管理', 1, 'com.ruoyi.project.system.order.controller.OrderController.create()', 'POST', 1, 'zhangsan', '研发部门', '/system/order/create', '127.0.0.1', '内网IP', '{\"productId\":[\"16\"],\"orderPrice\":[\"5999.0\"],\"orderPhone\":[\"12377877788\"],\"orderAddress\":[\"beijing\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":53}', 0, NULL, '2020-06-25 11:08:44');
INSERT INTO `sys_oper_log` VALUES (287, '订单管理', 2, 'com.ruoyi.project.system.order.controller.OrderController.commentSave()', 'POST', 1, 'zhangsan', '研发部门', '/system/order/comment', '127.0.0.1', '内网IP', '{\"orderId\":[\"53\"],\"orderComment\":[\"运行速度很快，很流畅！\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-06-25 11:10:36');

-- ----------------------------
-- Table structure for sys_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_order`;
CREATE TABLE `sys_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `order_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总额',
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '订单时间',
  `order_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单电话',
  `order_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '送货地址',
  `order_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单状态',
  `order_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品评论',
  `order_comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  `pay_way` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '支付方式：0微信支付，1支付宝支付，2银行卡支付',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_order
-- ----------------------------
INSERT INTO `sys_order` VALUES (48, 6, 13, 25.00, '2020-04-24 15:16:44', '13945676567', '北京市朝阳区', '5', '很不错', '2020-06-24 22:43:22', '1');
INSERT INTO `sys_order` VALUES (49, 6, 14, 26.00, '2020-04-28 20:52:34', '222222222', '2222333333333333333333', '1', NULL, NULL, '2');
INSERT INTO `sys_order` VALUES (51, 6, 13, 25.00, '2020-06-15 13:32:14', '12', '212', '1', NULL, NULL, '0');
INSERT INTO `sys_order` VALUES (52, 6, 14, 26.00, '2020-06-15 13:35:08', '11111', '122222222', '1', NULL, NULL, '0');
INSERT INTO `sys_order` VALUES (53, 6, 16, 5999.00, '2020-06-25 11:08:44', '12377877788', 'beijing', '5', '运行速度很快，很流畅！', '2020-06-25 11:10:37', '1');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_product
-- ----------------------------
DROP TABLE IF EXISTS `sys_product`;
CREATE TABLE `sys_product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '卖家ID',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品名称',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '种类id',
  `product_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品照片',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `product_description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品描述',
  `product_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品状态',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_product
-- ----------------------------
INSERT INTO `sys_product` VALUES (12, 4, '管理思维', 1, '/profile/upload/2020/06/14/b1941e3277eb371241574e36322097ec.png', 15.00, '管理思维图书', '0');
INSERT INTO `sys_product` VALUES (13, 4, '管理赋能', 1, '/profile/upload/2020/06/14/ea42bb5006486141d8056db12ebdfdc4.png', 25.00, '管理赋能赋能', NULL);
INSERT INTO `sys_product` VALUES (14, 4, '马伯庸笑翻中国简史', 1, '/profile/upload/2020/06/14/48e4bef1ae6532968688e891d5c39398.png', 26.00, '111111111', NULL);
INSERT INTO `sys_product` VALUES (15, 4, '希腊史：详注修订本', 1, '/profile/upload/2020/06/14/73d4005d3fae7a251b040111aa2f103b.png', 56.00, '希腊历史', '0');
INSERT INTO `sys_product` VALUES (16, 4, 'iPhone11', 2, '/profile/upload/2020/06/14/330cea1f70b7f83f0f120479bb96d117.png', 5999.00, '品牌： Apple 商品名称：AppleiPhone 11商品编号：100008348542商品毛重：470.00g商品产地：中国大陆CPU型号：其他运行内存：其它内存机身存储：128GB存储卡：不支持存储卡摄像头数量：后置双摄后摄主摄像素：1200万像素前摄主摄像素：1200万像素主屏幕尺寸（英寸）：6.1英寸分辨率：其它分辨率屏幕比例：其它屏幕比例屏幕前摄组合：刘海屏充电器：其他热点：人脸识别特殊功能：语音命令操作系统：iOS(Apple)', '0');
INSERT INTO `sys_product` VALUES (17, 4, '华为P30 PRO', 2, '/profile/upload/2020/06/14/694a6d710d9f8fbfc6ed8a89667d4fc3.png', 3488.00, '品牌： 华为（HUAWEI） 商品名称：华为P30 Pro商品编号：100004323294商品毛重：0.54kg商品产地：中国大陆CPU型号：麒麟980运行内存：8GB机身存储：128GB存储卡：NM存储卡摄像头数量：后置四摄后摄主摄像素：4000万像素前摄主摄像素：3200万像素主屏幕尺寸（英寸）：6.47英寸分辨率：全高清FHD+屏幕比例：其它屏幕比例屏幕前摄组合：水滴屏电池容量（mAh）：4200mAh（典型值）充电器：10V/4A机身颜色：天空之境热点：人脸识别，快速充电，无线充电，液冷散热，高倍率变焦，屏幕指纹，防水防尘，NFC，曲面屏充电功率：40-49W屏占比：≥90%操作系统：Android(安卓)', '0');
INSERT INTO `sys_product` VALUES (18, 4, 'vivo iQOO Neo3', 2, '/profile/upload/2020/06/14/5cab3bc4ca69ffffbc98c9b04cbcbd41.png', 2998.00, '商品名称：vivoiQOO Neo3商品编号：100012820028商品毛重：0.54kg商品产地：中国大陆CPU型号：骁龙865运行内存：8GB机身存储：128GB存储卡：不支持存储卡摄像头数量：后置三摄后摄主摄像素：4800万像素前摄主摄像素：1600万像素主屏幕尺寸（英寸）：6.57英寸分辨率：其它分辨率屏幕比例：19.6~20:9屏幕前摄组合：极点屏充电器：11V/4A热点：快速充电，5G，超高屏占比，屏幕高刷新率屏占比：≥90%操作系统：Android(安卓)游戏配置：游戏深度优化', '0');
INSERT INTO `sys_product` VALUES (19, 4, '小米10', 2, '/profile/upload/2020/06/14/c7ac4b65b292745d0ef9c86264084c0b.png', 3999.00, '品牌： 小米（MI） 商品名称：小米10商品编号：100011336064商品毛重：0.6kg商品产地：中国大陆CPU型号：骁龙865运行内存：8GB机身存储：128GB存储卡：不支持存储卡摄像头数量：后置四摄后摄主摄像素：1亿像素前摄主摄像素：2000万像素主屏幕尺寸（英寸）：6.67英寸分辨率：全高清FHD+屏幕比例：19.1~19.5:9屏幕前摄组合：其他充电器：其他热点：人脸识别，曲面屏操作系统：Android(安卓)游戏性能：发烧级', '0');
INSERT INTO `sys_product` VALUES (22, 4, 'TP-LINK双千兆路由器', 3, '/profile//upload/2020/06/14/8640c2b0bd069f62a6f8b1cc6dc0a5d3.png', 189.00, '品牌： 普联（TP-LINK） 商品名称：普联TL-WDR7660千兆版商品编号：100002287620商品毛重：0.9kg商品产地：中国大陆APP端控制：支持天线数量：6根网口盲插：不支持固件切换：不支持5G MIMO技术：3x3 MIMO防火墙：支持无线速率：1900M质保期：12个月适用面积：大户型（90-120㎡）WAN接入口：千兆网口无线协议：WiFi 5LAN输出口：千兆网口2.4G MIMO技术：3x3 MIMO天线：外置天线是否有USB接口：否LAN口数量：3', '0');
INSERT INTO `sys_product` VALUES (23, 4, '惠普136w打印机', 3, '/profile//upload/2020/06/14/5ad4baa6272903cd4b0bb0d3732823ac.png', 1599.00, '主体\r\n品牌\r\nHP\r\n功能\r\n打印；复印；扫描\r\n型号\r\n136w\r\n认证型号\r\n136w\r\n打印机类型\r\n黑白打印机\r\n打印功能\r\n分辨率\r\n黑白(最佳模式)：高达1,200x1,200dpi；黑白(正常模式)：600x600dpi\r\n打印速度\r\n黑白(正常模式，A4)：高达20页/分钟\r\n首次打印时间\r\n黑白(A4，就绪模式)：仅8.3秒；黑白(A4，睡眠模式)：最快18秒\r\n复印功能\r\n最大复印页数\r\n最多99份\r\n复印比例\r\n25%～400%\r\n首次复印时间\r\n黑白(A4)：仅8.9秒；黑白(A4，睡眠模式)：最快17秒\r\n复印速度\r\n黑白(正常模式，A4)：高达20份/分钟\r\n规格\r\n重量\r\n7.46 kg\r\n接口\r\n高速USB 2.0端口、无线802.11 b/g/n\r\n系统参数\r\nWindows®：7(32/64位), 2008 Server R2,8(32/64位)，8.1(32/64位),10(32/64位),2012 Server,2016 Server\r\n电源\r\n电源类型：内置电源；电源要求：220伏输入电压：220～240伏交流电，50/60赫兹。功耗7：打印：300瓦，就绪：38瓦，睡眠：1.9瓦；手动关机：0.2瓦； 自动关机/手动开机：0.2瓦；典型用电量(TEC)8：0.876千瓦时/周(BA)，0.924千瓦时/周(ES\r\n尺寸\r\n406x359.6x253毫米\r\n纸张输入容量\r\n进纸盒：150页\r\n噪音水平\r\n无声；声能排放(打印)：6.5B(A)(打印速度为20页/分钟)；声能排放(扫描)：6.25B(A)(ADF扫描速度仅20面/分钟)\r\n内存\r\n标配/最大：128 MB\r\n纸张输出容量\r\n出纸盒：100页\r\n扫描功能\r\n分辨率\r\n光学分辨率：高达600x600dpi；增强：高达4,800x4,800dpi\r\n灰阶\r\n256', '0');
INSERT INTO `sys_product` VALUES (24, 4, '小米手环5', 3, '/profile//upload/2020/06/14/6dbfddfb12c7378c3238f6da8dd36f51.png', 189.00, '品牌： 小米（MI）\r\n商品名称：小米小米手环 5商品编号：100007508245商品毛重：55.00g商品产地：中国大陆支付功能：扫码支付APP共享账号：支持一个账号蓝牙版本：5血压：不支持血压测量续航时间：7-14天健康功能：睡眠监测，久坐提醒通讯功能：来电提醒，消息提醒附加服务：无附加服务心率监测：实时监测AI语音功能：不支持AI语音功能NFC功能：无NFC功能运动模式：11种-20种防水等级：50米防水充电方式：磁吸充电线触控模式：单点触控腕带颜色：黑色运动功能：自动识别运动模式，泳姿识别屏幕显示：彩色屏幕类型：AMOLED腕带材质：硅胶亮度自动调节：亮度自动调节', '0');
INSERT INTO `sys_product` VALUES (25, 4, '360智能摄像头', 3, '/profile//upload/2020/06/14/edbce0ad88ab1cb9cd7fa452d5bf20ab.png', 199.00, '品牌： 360\r\n商品名称：360AP5C商品编号：100013117544商品毛重：350.00g商品产地：中国大陆存储编码：H.265像素：200W焦距：4mm分类：智能摄像头变倍变焦：不支持变倍变焦供电方式：电源供电夜视类型：红外夜视探头个数：1个智能识别：人脸识别监控类型：家用云台语音类型：语音通话防水等级：无防水等级追踪方式：智能追踪供网方式：无线红外夜视距离：10m警戒方式：手机推送存储方式：云存+内存卡', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '买家', 'buyer', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-24 15:46:28', '普通角色');
INSERT INTO `sys_role` VALUES (3, '卖家', 'seller', 1, '1', '0', '0', 'admin', '2020-04-08 15:59:41', 'admin', '2020-04-09 09:41:51', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1062);
INSERT INTO `sys_role_menu` VALUES (2, 1063);
INSERT INTO `sys_role_menu` VALUES (2, 1066);
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (3, 1046);
INSERT INTO `sys_role_menu` VALUES (3, 1048);
INSERT INTO `sys_role_menu` VALUES (3, 1049);
INSERT INTO `sys_role_menu` VALUES (3, 1051);
INSERT INTO `sys_role_menu` VALUES (3, 1052);
INSERT INTO `sys_role_menu` VALUES (3, 1053);
INSERT INTO `sys_role_menu` VALUES (3, 1054);
INSERT INTO `sys_role_menu` VALUES (3, 1055);
INSERT INTO `sys_role_menu` VALUES (3, 1057);
INSERT INTO `sys_role_menu` VALUES (3, 1058);
INSERT INTO `sys_role_menu` VALUES (3, 1059);
INSERT INTO `sys_role_menu` VALUES (3, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 1061);

-- ----------------------------
-- Table structure for sys_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_type`;
CREATE TABLE `sys_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品种类ID',
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '种类名称',
  `type_sort` int(20) NULL DEFAULT NULL COMMENT '种类排序',
  `type_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '种类状态',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_type
-- ----------------------------
INSERT INTO `sys_type` VALUES (1, '教辅图书', 1, '0');
INSERT INTO `sys_type` VALUES (2, '手机通讯', 2, '0');
INSERT INTO `sys_type` VALUES (3, '数码电子', 3, '0');
INSERT INTO `sys_type` VALUES (4, '生活日用', 4, '0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '系统管理员', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2020-06-25 11:07:15', 'admin', '2018-03-16 11:33:00', 'ry', '2020-06-25 11:07:15', '管理员');
INSERT INTO `sys_user` VALUES (3, 103, 'test', '测试买家', '00', 'test@test.com', '13588930023', '0', '', 'ff817cbb100e129295ae99a9e3181847', '4d1b02', '0', '0', '127.0.0.1', '2020-05-02 15:31:37', 'regist', '2020-03-16 15:40:28', 'admin', '2020-05-02 15:31:36', '');
INSERT INTO `sys_user` VALUES (4, 103, 'tests', '测试卖家', '00', '1424424@11.com', '13466555555', '0', '', '8012e2d6f7c6b122e17f886fdf35cda3', 'ea2f64', '0', '0', '127.0.0.1', '2020-06-25 11:11:16', 'admin', '2020-04-08 16:04:45', '', '2020-06-25 11:11:16', NULL);
INSERT INTO `sys_user` VALUES (6, 103, 'zhangsan', '张三', '00', 'zhangsan@test.com', '13877777777', '0', '', '6dad35cedc471206443808527bee88e2', '35f422', '0', '0', '127.0.0.1', '2020-06-25 11:10:08', 'regist', '2020-04-09 11:39:05', 'admin', '2020-06-25 11:10:07', '1111111111111111');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('26b1adca-c8ce-474b-a802-d03d581e5555', 'tests', '研发部门', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', 'on_line', '2020-06-25 11:11:06', '2020-06-25 11:11:16', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (4, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (4, 3);
INSERT INTO `sys_user_role` VALUES (6, 2);

SET FOREIGN_KEY_CHECKS = 1;
