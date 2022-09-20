/*
 Navicat Premium Data Transfer

 Source Server         : user
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : xinguan

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 27/06/2022 15:44:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_consumer
-- ----------------------------
DROP TABLE IF EXISTS `biz_consumer`;
CREATE TABLE `biz_consumer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物资消费方',
  `address` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `sort` int(11) NULL DEFAULT NULL,
  `contact` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_consumer
-- ----------------------------
INSERT INTO `biz_consumer` VALUES (8, '43535345', '江西省/九江市/共青城市', '2020-04-25 20:12:43', '2020-04-25 20:12:43', '15079437282', 2, '11');
INSERT INTO `biz_consumer` VALUES (9, '3424243424', '山西省/大同市/矿区', '2020-04-25 20:13:20', '2020-05-10 09:21:33', '15079437282', 1, '小李');
INSERT INTO `biz_consumer` VALUES (10, '465646', '天津市/市辖区/和平区', '2020-04-25 20:21:28', '2020-04-25 20:21:28', '15079437282', 2, '33');
INSERT INTO `biz_consumer` VALUES (11, '3424', '江西省/抚州市/黎川县', '2020-04-25 20:28:26', '2020-05-10 09:21:47', '15079437282', 1, '44');
INSERT INTO `biz_consumer` VALUES (13, '32424', '天津市/市辖区/和平区', '2020-04-25 21:38:42', '2020-04-25 21:38:42', '15079437282', 2, '22');
INSERT INTO `biz_consumer` VALUES (14, '34242', '江西省/抚州市/黎川县', '2020-04-25 21:38:59', '2020-04-25 21:38:59', '15079437282', 3, '444');
INSERT INTO `biz_consumer` VALUES (15, '5他', '河北省/石家庄市/长安区', '2020-04-25 21:39:25', '2020-04-25 21:39:25', '15079437282', 2, '555');
INSERT INTO `biz_consumer` VALUES (16, '3243242', '山东省/青岛市/历下区', '2020-04-25 21:40:43', '2020-04-25 21:40:43', '15079437282', 1, '555');
INSERT INTO `biz_consumer` VALUES (17, '一栋705宿舍', '江西省/九江市/共青城市', '2020-04-25 21:56:04', '2020-04-25 21:56:04', '15079437282', 3, '章宇康');
INSERT INTO `biz_consumer` VALUES (18, '反反复复', '内蒙古自治区/赤峰市/阿鲁科尔沁旗', '2020-04-25 22:05:47', '2020-04-25 22:05:47', '15079437282', 2, '反反复复');
INSERT INTO `biz_consumer` VALUES (19, 'test224444', '江西省/九江市/共青城市', '2020-04-26 09:47:37', '2020-04-26 09:47:50', '15079437282', 3, 'test');
INSERT INTO `biz_consumer` VALUES (20, '324234', '天津市/市辖区/和平区', '2020-05-25 11:00:23', '2020-05-25 11:00:23', '15079437282', 1, '32424');
INSERT INTO `biz_consumer` VALUES (21, 'test111', '福建省/莆田市/秀屿区', '2020-05-25 11:01:18', '2020-05-25 11:01:55', '15079437282', 2, 'testman');
INSERT INTO `biz_consumer` VALUES (22, '6666666', '天津市/市辖区/和平区', '2020-05-25 11:16:12', '2020-05-25 11:16:12', '15079437282', 1, '23423424');
INSERT INTO `biz_consumer` VALUES (23, '6666666', '天津市/市辖区/和平区', '2020-05-25 11:17:15', '2020-05-25 11:17:15', '15079437282', 1, '23423424');
INSERT INTO `biz_consumer` VALUES (24, 'hemei', '河北省/唐山市/古冶区', '2020-05-25 11:27:42', '2020-05-25 11:27:42', '15079437282', 1, 'hemei');
INSERT INTO `biz_consumer` VALUES (25, 'hemei', '河北省/唐山市/古冶区', '2020-05-25 11:32:39', '2020-05-25 11:32:39', '15079437282', 1, 'hemei');
INSERT INTO `biz_consumer` VALUES (26, '武汉汉口校医院', '天津市/市辖区/和平区', '2020-05-25 15:46:07', '2020-05-25 15:46:07', '15079437282', 1, '李大牛');
INSERT INTO `biz_consumer` VALUES (27, '具体去向', '北京市/市辖区/东城区', '2021-12-05 17:47:58', '2021-12-05 17:47:58', '17001100482', 4, '于景波');
INSERT INTO `biz_consumer` VALUES (28, '具体去向2', '北京市/市辖区/东城区', '2021-12-05 17:53:16', '2021-12-05 17:53:16', '18009922997', 1, '于景波2');

-- ----------------------------
-- Table structure for biz_health
-- ----------------------------
DROP TABLE IF EXISTS `biz_health`;
CREATE TABLE `biz_health`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `situation` int(11) NOT NULL,
  `touch` int(11) NOT NULL,
  `passby` int(11) NOT NULL,
  `reception` int(11) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_health
-- ----------------------------
INSERT INTO `biz_health` VALUES (24, '湖北省/武汉市/汉南区', 5, 0, 0, 0, 0, '2020-05-07 15:23:40');
INSERT INTO `biz_health` VALUES (25, '河北省/秦皇岛市/北戴河区', 5, 0, 1, 1, 1, '2020-05-10 11:26:27');
INSERT INTO `biz_health` VALUES (28, '天津市/市辖区/和平区', 5, 0, 1, 1, 1, '2020-05-13 22:43:09');
INSERT INTO `biz_health` VALUES (29, '天津市/市辖区/南开区', 5, 0, 1, 1, 1, '2020-05-14 20:10:12');
INSERT INTO `biz_health` VALUES (30, '天津市/市辖区/和平区', 5, 1, 0, 0, 0, '2020-05-14 20:23:07');
INSERT INTO `biz_health` VALUES (31, '天津市/市辖区/和平区', 184, 2, 1, 1, 1, '2020-05-14 21:06:47');
INSERT INTO `biz_health` VALUES (35, '天津市/市辖区/和平区', 5, 0, 1, 1, 1, '2020-05-18 09:33:33');
INSERT INTO `biz_health` VALUES (36, '北京市/市辖区/东城区', 5, 0, 0, 0, 0, '2021-09-18 08:52:19');
INSERT INTO `biz_health` VALUES (37, '河南省/郑州市/中原区', 5, 0, 0, 0, 0, '2022-03-07 09:13:45');
INSERT INTO `biz_health` VALUES (38, '河南省/郑州市/中原区', 5, 0, 0, 0, 0, '2022-03-11 16:15:28');

-- ----------------------------
-- Table structure for biz_in_stock
-- ----------------------------
DROP TABLE IF EXISTS `biz_in_stock`;
CREATE TABLE `biz_in_stock`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `in_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库单编号',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型：1：捐赠，2：下拨，3：采购,4:退货入库',
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '入库单创建时间',
  `modified` datetime(0) NULL DEFAULT NULL COMMENT '入库单修改时间',
  `product_number` int(11) NULL DEFAULT NULL COMMENT '物资总数',
  `supplier_id` bigint(20) NULL DEFAULT NULL COMMENT '来源',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述信息',
  `status` int(11) NULL DEFAULT 2 COMMENT '0:正常入库单,1:已进入回收,2:等待审核',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operator_id`(`operator`) USING BTREE,
  INDEX `supplier_id`(`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_in_stock
-- ----------------------------
INSERT INTO `biz_in_stock` VALUES (84, 'a2ea9b97-ad12-4d85-a9b4-1a644d86', 2, 'zhangyukang', '2020-05-09 20:01:48', '2020-05-09 20:01:48', 13, 15, '333333', 0);
INSERT INTO `biz_in_stock` VALUES (85, '78473f1a-405a-4f5e-b08c-42a7b2e8', 2, 'zhangyukang', '2020-05-10 09:27:45', '2020-05-10 09:27:45', 48, 14, '324324242424', 0);
INSERT INTO `biz_in_stock` VALUES (86, '31ff3701-c44f-4b98-91e0-1d41d8b2', 1, 'zhangyukang', '2020-05-11 09:59:30', '2020-05-11 09:59:30', 51, 15, '32424', 0);
INSERT INTO `biz_in_stock` VALUES (87, '38ed0881-20ed-4cec-a321-eb8f4c3b', 1, 'zhangyukang', '2020-05-11 10:04:05', '2020-05-11 10:04:05', 30, 15, '232323232', 0);
INSERT INTO `biz_in_stock` VALUES (90, 'db1c2afe-8117-43fd-adf7-866ef7e4', 1, '系统测试人员', '2020-05-18 10:11:11', '2020-05-16 17:37:12', 4, 15, '2222222', 0);
INSERT INTO `biz_in_stock` VALUES (91, 'df793f2b-ea13-4d93-b22c-60454f32', 2, '系统测试人员', '2020-05-18 10:11:09', '2020-05-18 10:11:00', 25, 15, '2342424', 0);
INSERT INTO `biz_in_stock` VALUES (92, 'c2054c39-a88b-4f47-9f9e-5c57f9e6', 1, '系统测试人员', '2020-05-18 10:42:04', '2020-05-18 10:41:55', 3, 15, '222222', 0);
INSERT INTO `biz_in_stock` VALUES (93, '08a51486-49e9-402e-a10e-3e6a45df', 1, '系统测试人员', '2020-05-18 11:01:16', '2020-05-18 11:01:09', 4, 15, '2222222', 0);
INSERT INTO `biz_in_stock` VALUES (99, 'bb5de246-bd56-4987-b027-8fbcf3c3', 2, '系统测试人员', '2020-05-18 12:21:41', '2020-05-18 11:43:49', 6, 19, '33333', 0);
INSERT INTO `biz_in_stock` VALUES (100, '7657f747-ab27-49d7-b1ce-d6d47ecf', 1, '系统测试人员', '2020-05-18 12:21:40', '2020-05-18 12:21:29', 2, 20, '23432424', 0);
INSERT INTO `biz_in_stock` VALUES (101, '03fbc3b3-e28b-418c-a457-87c376c3', 1, '系统测试人员', '2020-05-18 13:16:38', '2020-05-18 13:16:28', 12, 21, '454545454545', 0);
INSERT INTO `biz_in_stock` VALUES (102, 'd83621b8-b5c7-4499-a8a0-56af2849', 1, '系统测试人员', '2020-05-18 13:18:51', '2020-05-18 13:18:41', 18, 17, '33333', 0);
INSERT INTO `biz_in_stock` VALUES (103, '51fa7a04-535f-43b5-8972-23d0e55a', 1, '系统测试人员', '2020-05-18 13:42:41', '2020-05-18 13:42:29', 6, 22, '222222', 0);
INSERT INTO `biz_in_stock` VALUES (104, 'c96eaa3e-22ee-4f6b-98bd-87d34372', 1, 'zhangyukang', '2020-05-24 21:46:16', '2020-05-24 21:46:06', 6, 15, '432424', 0);
INSERT INTO `biz_in_stock` VALUES (105, '5ad278ed-ce30-4f0d-bb67-7f9070fc', 1, 'zhangyukang', '2020-05-25 11:45:10', '2020-05-25 10:27:06', 6, 15, '32432424', 0);
INSERT INTO `biz_in_stock` VALUES (106, 'efeef1d2-b8c9-4eb5-8ea2-b0695fb9', 1, 'zhangyukang', '2020-05-26 09:35:23', '2020-05-26 09:35:17', 10, 17, '2342424', 0);
INSERT INTO `biz_in_stock` VALUES (107, '29220726-960b-4e67-8cfe-b28d459e', 2, 'admin', '2022-03-27 14:41:37', '2021-09-18 08:51:48', 20, 23, '1111111', 0);
INSERT INTO `biz_in_stock` VALUES (108, '521b6115-07e4-4667-9df8-6e99789f', 1, 'admin', '2021-12-05 17:41:36', '2021-12-05 16:42:28', 1, 24, '123456', 0);
INSERT INTO `biz_in_stock` VALUES (109, '200ff8ca-7f44-4d5c-9be7-c7af7f09', 1, 'admin', '2021-12-05 18:00:59', '2021-12-05 18:00:59', 2, 24, '描述信息\n描述信息\n描述信息\n描述信息\n', 0);

-- ----------------------------
-- Table structure for biz_in_stock_info
-- ----------------------------
DROP TABLE IF EXISTS `biz_in_stock_info`;
CREATE TABLE `biz_in_stock_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `in_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库单编号',
  `p_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `product_number` int(11) NULL DEFAULT NULL COMMENT '数量',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 364 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_in_stock_info
-- ----------------------------
INSERT INTO `biz_in_stock_info` VALUES (282, 'a2ea9b97-ad12-4d85-a9b4-1a644d86', '3DFC8EA0-6', 2, '2020-05-09 20:01:49', '2020-05-09 20:01:49');
INSERT INTO `biz_in_stock_info` VALUES (283, 'a2ea9b97-ad12-4d85-a9b4-1a644d86', '2C15F1B6-1', 2, '2020-05-09 20:01:49', '2020-05-09 20:01:49');
INSERT INTO `biz_in_stock_info` VALUES (284, 'a2ea9b97-ad12-4d85-a9b4-1a644d86', '6976D3B4-A', 3, '2020-05-09 20:01:49', '2020-05-09 20:01:49');
INSERT INTO `biz_in_stock_info` VALUES (285, 'a2ea9b97-ad12-4d85-a9b4-1a644d86', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 3, '2020-05-09 20:01:49', '2020-05-09 20:01:49');
INSERT INTO `biz_in_stock_info` VALUES (286, 'a2ea9b97-ad12-4d85-a9b4-1a644d86', 'beb944c4-01ae-497b-bfdd-2132032f', 3, '2020-05-09 20:01:49', '2020-05-09 20:01:49');
INSERT INTO `biz_in_stock_info` VALUES (287, '78473f1a-405a-4f5e-b08c-42a7b2e8', '3DFC8EA0-6', 2, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `biz_in_stock_info` VALUES (288, '78473f1a-405a-4f5e-b08c-42a7b2e8', '2C15F1B6-1', 1, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `biz_in_stock_info` VALUES (289, '78473f1a-405a-4f5e-b08c-42a7b2e8', '6976D3B4-A', 2, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `biz_in_stock_info` VALUES (290, '78473f1a-405a-4f5e-b08c-42a7b2e8', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 2, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `biz_in_stock_info` VALUES (291, '78473f1a-405a-4f5e-b08c-42a7b2e8', 'beb944c4-01ae-497b-bfdd-2132032f', 3, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `biz_in_stock_info` VALUES (292, '78473f1a-405a-4f5e-b08c-42a7b2e8', '24573d5b-0c9b-403b-9a88-c214702e', 3, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `biz_in_stock_info` VALUES (293, '78473f1a-405a-4f5e-b08c-42a7b2e8', 'c98183c8-bc47-4505-abbb-1dc219b5', 2, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `biz_in_stock_info` VALUES (294, '78473f1a-405a-4f5e-b08c-42a7b2e8', 'de16b9e6-bb49-4547-ab91-db7ae7b6', 3, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `biz_in_stock_info` VALUES (295, '78473f1a-405a-4f5e-b08c-42a7b2e8', '6AF405A1-C', 10, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `biz_in_stock_info` VALUES (296, '78473f1a-405a-4f5e-b08c-42a7b2e8', '0b9e9176-f996-4384-bb6c-209f55d0', 10, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `biz_in_stock_info` VALUES (297, '78473f1a-405a-4f5e-b08c-42a7b2e8', '894b8218-36ee-4a0d-9ad1-d9c5e455', 10, '2020-05-10 09:27:45', '2020-05-10 09:27:45');
INSERT INTO `biz_in_stock_info` VALUES (298, '31ff3701-c44f-4b98-91e0-1d41d8b2', '3DFC8EA0-6', 10, '2020-05-11 09:59:31', '2020-05-11 09:59:31');
INSERT INTO `biz_in_stock_info` VALUES (299, '31ff3701-c44f-4b98-91e0-1d41d8b2', '2C15F1B6-1', 10, '2020-05-11 09:59:32', '2020-05-11 09:59:32');
INSERT INTO `biz_in_stock_info` VALUES (300, '31ff3701-c44f-4b98-91e0-1d41d8b2', '15bc064e-991d-40e3-bcd6-f6aff0e3', 10, '2020-05-11 09:59:32', '2020-05-11 09:59:32');
INSERT INTO `biz_in_stock_info` VALUES (301, '31ff3701-c44f-4b98-91e0-1d41d8b2', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 10, '2020-05-11 09:59:32', '2020-05-11 09:59:32');
INSERT INTO `biz_in_stock_info` VALUES (302, '31ff3701-c44f-4b98-91e0-1d41d8b2', 'beb944c4-01ae-497b-bfdd-2132032f', 10, '2020-05-11 09:59:32', '2020-05-11 09:59:32');
INSERT INTO `biz_in_stock_info` VALUES (303, '31ff3701-c44f-4b98-91e0-1d41d8b2', '0e17f606-9aaa-48a7-b4e9-ef18462e', 1, '2020-05-11 09:59:32', '2020-05-11 09:59:32');
INSERT INTO `biz_in_stock_info` VALUES (304, '38ed0881-20ed-4cec-a321-eb8f4c3b', '3DFC8EA0-6', 10, '2020-05-11 10:04:05', '2020-05-11 10:04:05');
INSERT INTO `biz_in_stock_info` VALUES (305, '38ed0881-20ed-4cec-a321-eb8f4c3b', '24573d5b-0c9b-403b-9a88-c214702e', 10, '2020-05-11 10:04:06', '2020-05-11 10:04:06');
INSERT INTO `biz_in_stock_info` VALUES (306, '38ed0881-20ed-4cec-a321-eb8f4c3b', '6EF5F2C0-9', 10, '2020-05-11 10:04:06', '2020-05-11 10:04:06');
INSERT INTO `biz_in_stock_info` VALUES (315, 'db1c2afe-8117-43fd-adf7-866ef7e4', '3DFC8EA0-6', 2, '2020-05-16 17:37:12', '2020-05-16 17:37:12');
INSERT INTO `biz_in_stock_info` VALUES (316, 'db1c2afe-8117-43fd-adf7-866ef7e4', '2C15F1B6-1', 2, '2020-05-16 17:37:13', '2020-05-16 17:37:13');
INSERT INTO `biz_in_stock_info` VALUES (317, 'df793f2b-ea13-4d93-b22c-60454f32', '3DFC8EA0-6', 3, '2020-05-18 10:11:00', '2020-05-18 10:11:00');
INSERT INTO `biz_in_stock_info` VALUES (318, 'df793f2b-ea13-4d93-b22c-60454f32', '2C15F1B6-1', 3, '2020-05-18 10:11:00', '2020-05-18 10:11:00');
INSERT INTO `biz_in_stock_info` VALUES (319, 'df793f2b-ea13-4d93-b22c-60454f32', '15bc064e-991d-40e3-bcd6-f6aff0e3', 3, '2020-05-18 10:11:00', '2020-05-18 10:11:00');
INSERT INTO `biz_in_stock_info` VALUES (320, 'df793f2b-ea13-4d93-b22c-60454f32', '6976D3B4-A', 3, '2020-05-18 10:11:00', '2020-05-18 10:11:00');
INSERT INTO `biz_in_stock_info` VALUES (321, 'df793f2b-ea13-4d93-b22c-60454f32', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 10, '2020-05-18 10:11:00', '2020-05-18 10:11:00');
INSERT INTO `biz_in_stock_info` VALUES (322, 'df793f2b-ea13-4d93-b22c-60454f32', 'beb944c4-01ae-497b-bfdd-2132032f', 3, '2020-05-18 10:11:00', '2020-05-18 10:11:00');
INSERT INTO `biz_in_stock_info` VALUES (323, 'c2054c39-a88b-4f47-9f9e-5c57f9e6', '3DFC8EA0-6', 3, '2020-05-18 10:41:55', '2020-05-18 10:41:55');
INSERT INTO `biz_in_stock_info` VALUES (324, '08a51486-49e9-402e-a10e-3e6a45df', '3DFC8EA0-6', 2, '2020-05-18 11:01:09', '2020-05-18 11:01:09');
INSERT INTO `biz_in_stock_info` VALUES (325, '08a51486-49e9-402e-a10e-3e6a45df', '2C15F1B6-1', 2, '2020-05-18 11:01:09', '2020-05-18 11:01:09');
INSERT INTO `biz_in_stock_info` VALUES (335, 'bb5de246-bd56-4987-b027-8fbcf3c3', '2C15F1B6-1', 3, '2020-05-18 11:43:50', '2020-05-18 11:43:50');
INSERT INTO `biz_in_stock_info` VALUES (336, 'bb5de246-bd56-4987-b027-8fbcf3c3', '15bc064e-991d-40e3-bcd6-f6aff0e3', 3, '2020-05-18 11:43:50', '2020-05-18 11:43:50');
INSERT INTO `biz_in_stock_info` VALUES (337, '7657f747-ab27-49d7-b1ce-d6d47ecf', '3DFC8EA0-6', 1, '2020-05-18 12:21:29', '2020-05-18 12:21:29');
INSERT INTO `biz_in_stock_info` VALUES (338, '7657f747-ab27-49d7-b1ce-d6d47ecf', '2C15F1B6-1', 1, '2020-05-18 12:21:29', '2020-05-18 12:21:29');
INSERT INTO `biz_in_stock_info` VALUES (339, '03fbc3b3-e28b-418c-a457-87c376c3', '3DFC8EA0-6', 4, '2020-05-18 13:16:28', '2020-05-18 13:16:28');
INSERT INTO `biz_in_stock_info` VALUES (340, '03fbc3b3-e28b-418c-a457-87c376c3', '2C15F1B6-1', 4, '2020-05-18 13:16:28', '2020-05-18 13:16:28');
INSERT INTO `biz_in_stock_info` VALUES (341, '03fbc3b3-e28b-418c-a457-87c376c3', '15bc064e-991d-40e3-bcd6-f6aff0e3', 4, '2020-05-18 13:16:28', '2020-05-18 13:16:28');
INSERT INTO `biz_in_stock_info` VALUES (342, 'd83621b8-b5c7-4499-a8a0-56af2849', '3DFC8EA0-6', 3, '2020-05-18 13:18:41', '2020-05-18 13:18:41');
INSERT INTO `biz_in_stock_info` VALUES (343, 'd83621b8-b5c7-4499-a8a0-56af2849', '2C15F1B6-1', 3, '2020-05-18 13:18:42', '2020-05-18 13:18:42');
INSERT INTO `biz_in_stock_info` VALUES (344, 'd83621b8-b5c7-4499-a8a0-56af2849', '15bc064e-991d-40e3-bcd6-f6aff0e3', 3, '2020-05-18 13:18:42', '2020-05-18 13:18:42');
INSERT INTO `biz_in_stock_info` VALUES (345, 'd83621b8-b5c7-4499-a8a0-56af2849', '6976D3B4-A', 3, '2020-05-18 13:18:42', '2020-05-18 13:18:42');
INSERT INTO `biz_in_stock_info` VALUES (346, 'd83621b8-b5c7-4499-a8a0-56af2849', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 3, '2020-05-18 13:18:42', '2020-05-18 13:18:42');
INSERT INTO `biz_in_stock_info` VALUES (347, 'd83621b8-b5c7-4499-a8a0-56af2849', 'beb944c4-01ae-497b-bfdd-2132032f', 3, '2020-05-18 13:18:42', '2020-05-18 13:18:42');
INSERT INTO `biz_in_stock_info` VALUES (348, '51fa7a04-535f-43b5-8972-23d0e55a', '3DFC8EA0-6', 2, '2020-05-18 13:42:29', '2020-05-18 13:42:29');
INSERT INTO `biz_in_stock_info` VALUES (349, '51fa7a04-535f-43b5-8972-23d0e55a', '2C15F1B6-1', 2, '2020-05-18 13:42:29', '2020-05-18 13:42:29');
INSERT INTO `biz_in_stock_info` VALUES (350, '51fa7a04-535f-43b5-8972-23d0e55a', '15bc064e-991d-40e3-bcd6-f6aff0e3', 2, '2020-05-18 13:42:29', '2020-05-18 13:42:29');
INSERT INTO `biz_in_stock_info` VALUES (351, 'c96eaa3e-22ee-4f6b-98bd-87d34372', '3DFC8EA0-6', 3, '2020-05-24 21:46:06', '2020-05-24 21:46:06');
INSERT INTO `biz_in_stock_info` VALUES (352, 'c96eaa3e-22ee-4f6b-98bd-87d34372', '2C15F1B6-1', 3, '2020-05-24 21:46:06', '2020-05-24 21:46:06');
INSERT INTO `biz_in_stock_info` VALUES (353, '5ad278ed-ce30-4f0d-bb67-7f9070fc', '3DFC8EA0-6', 1, '2020-05-25 10:27:07', '2020-05-25 10:27:07');
INSERT INTO `biz_in_stock_info` VALUES (354, '5ad278ed-ce30-4f0d-bb67-7f9070fc', '2C15F1B6-1', 1, '2020-05-25 10:27:07', '2020-05-25 10:27:07');
INSERT INTO `biz_in_stock_info` VALUES (355, '5ad278ed-ce30-4f0d-bb67-7f9070fc', '15bc064e-991d-40e3-bcd6-f6aff0e3', 1, '2020-05-25 10:27:07', '2020-05-25 10:27:07');
INSERT INTO `biz_in_stock_info` VALUES (356, '5ad278ed-ce30-4f0d-bb67-7f9070fc', '6976D3B4-A', 1, '2020-05-25 10:27:07', '2020-05-25 10:27:07');
INSERT INTO `biz_in_stock_info` VALUES (357, '5ad278ed-ce30-4f0d-bb67-7f9070fc', 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 1, '2020-05-25 10:27:07', '2020-05-25 10:27:07');
INSERT INTO `biz_in_stock_info` VALUES (358, '5ad278ed-ce30-4f0d-bb67-7f9070fc', 'beb944c4-01ae-497b-bfdd-2132032f', 1, '2020-05-25 10:27:07', '2020-05-25 10:27:07');
INSERT INTO `biz_in_stock_info` VALUES (359, 'efeef1d2-b8c9-4eb5-8ea2-b0695fb9', '6EF5F2C0-9', 10, '2020-05-26 09:35:17', '2020-05-26 09:35:17');
INSERT INTO `biz_in_stock_info` VALUES (360, '29220726-960b-4e67-8cfe-b28d459e', '3DFC8EA0-6', 10, '2021-09-18 08:51:48', '2021-09-18 08:51:48');
INSERT INTO `biz_in_stock_info` VALUES (361, '29220726-960b-4e67-8cfe-b28d459e', '2C15F1B6-1', 10, '2021-09-18 08:51:48', '2021-09-18 08:51:48');
INSERT INTO `biz_in_stock_info` VALUES (362, '521b6115-07e4-4667-9df8-6e99789f', '3DFC8EA0-6', 1, '2021-12-05 16:42:28', '2021-12-05 16:42:28');
INSERT INTO `biz_in_stock_info` VALUES (363, '200ff8ca-7f44-4d5c-9be7-c7af7f09', '3DFC8EA0-6', 2, '2021-12-05 18:00:59', '2021-12-05 18:00:59');

-- ----------------------------
-- Table structure for biz_out_stock
-- ----------------------------
DROP TABLE IF EXISTS `biz_out_stock`;
CREATE TABLE `biz_out_stock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `out_num` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出库单',
  `type` int(11) NOT NULL COMMENT '出库类型:0:直接出库,1:审核出库',
  `operator` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '出库时间',
  `product_number` int(11) NULL DEFAULT NULL COMMENT '出库总数',
  `consumer_id` bigint(20) NOT NULL COMMENT '消费者id',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态:0:正常入库,1:已进入回收,2:等待审核',
  `priority` int(11) NOT NULL COMMENT '紧急程度:1:不急,2:常规,3:紧急4:特急',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_out_stock
-- ----------------------------
INSERT INTO `biz_out_stock` VALUES (1, 'fdasfsfsaf', 1, '1', '2020-05-10 14:42:04', 111, 7, '1', 0, 1);
INSERT INTO `biz_out_stock` VALUES (2, '11fdsafsafasf', 0, '324', '2020-05-10 15:16:03', 3, 8, '3', 0, 4);
INSERT INTO `biz_out_stock` VALUES (4, '8d468e4b-0c45-4807-9e0e-6c2c65d6', 0, 'zhangyukang', '2020-05-26 09:38:02', 7, 25, '2342424', 0, 1);
INSERT INTO `biz_out_stock` VALUES (5, '2d7158d3-2b15-473e-8cbe-6f6bd45a', 0, 'zhangyukang', '2020-05-26 09:37:49', 10, 24, '4545454545', 0, 4);
INSERT INTO `biz_out_stock` VALUES (6, 'bd5032d0-c84a-4413-a72d-ba80d33f', 0, 'zhangyukang', '2020-05-25 12:08:07', 93, 9, '23424234324', 2, 1);
INSERT INTO `biz_out_stock` VALUES (7, 'c23e95d0-0607-4e00-9041-cc97d299', 0, 'zhangyukang', '2020-05-25 15:46:07', 6, 26, 'testtest', 0, 2);
INSERT INTO `biz_out_stock` VALUES (9, '982e449e-1ab0-4456-8e9a-5403a685', 0, 'zhangyukang', '2020-05-26 09:32:43', 30, 9, '3434343', 0, 1);
INSERT INTO `biz_out_stock` VALUES (10, '622e8b6d-924a-4dfe-bc51-2143cf3c', 0, 'zhangyukang', '2020-05-26 09:34:30', 13, 8, '23232323', 0, 1);
INSERT INTO `biz_out_stock` VALUES (11, '55e4942f-3c0a-4bc2-85f7-2f2a7bff', 0, 'zhangyukang', '2022-03-27 14:45:10', 2, 9, '34243424', 0, 3);
INSERT INTO `biz_out_stock` VALUES (12, '453544fd-53ec-430f-9899-73f2edf5', 0, 'zhangyukang', '2020-05-26 10:00:04', 4, 8, '11111111', 0, 1);
INSERT INTO `biz_out_stock` VALUES (13, '4d7e5874-7d9c-4fca-ac08-ee4f4975', 3, 'zhangyukang', '2020-05-26 10:02:11', 3, 8, '123213', 0, 1);
INSERT INTO `biz_out_stock` VALUES (14, 'b149c672-7cf1-4aef-8da0-bba766d6', 3, 'admin', '2021-12-05 17:47:58', 5, 27, '描述信息描述信息', 0, 5);
INSERT INTO `biz_out_stock` VALUES (15, '78ad5bcd-f261-40ea-80f4-0b08f4b7', 3, 'admin', '2021-12-05 17:53:16', 1, 28, '描述信息描述信息', 0, 5);

-- ----------------------------
-- Table structure for biz_out_stock_info
-- ----------------------------
DROP TABLE IF EXISTS `biz_out_stock_info`;
CREATE TABLE `biz_out_stock_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `out_num` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `p_num` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `product_number` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_out_stock_info
-- ----------------------------
INSERT INTO `biz_out_stock_info` VALUES (1, '8d468e4b-0c45-4807-9e0e-6c2c65d6', '3DFC8EA0-6', 1, '2020-05-25 11:32:39', '2020-05-25 11:32:39');
INSERT INTO `biz_out_stock_info` VALUES (2, '8d468e4b-0c45-4807-9e0e-6c2c65d6', '6EF5F2C0-9', 2, '2020-05-25 11:32:39', '2020-05-25 11:32:39');
INSERT INTO `biz_out_stock_info` VALUES (3, '8d468e4b-0c45-4807-9e0e-6c2c65d6', '6976D3B4-A', 4, '2020-05-25 11:32:39', '2020-05-25 11:32:39');
INSERT INTO `biz_out_stock_info` VALUES (4, '2d7158d3-2b15-473e-8cbe-6f6bd45a', '3DFC8EA0-6', 1, '2020-05-25 11:41:02', '2020-05-25 11:41:02');
INSERT INTO `biz_out_stock_info` VALUES (5, '2d7158d3-2b15-473e-8cbe-6f6bd45a', '6EF5F2C0-9', 1, '2020-05-25 11:41:02', '2020-05-25 11:41:02');
INSERT INTO `biz_out_stock_info` VALUES (6, '2d7158d3-2b15-473e-8cbe-6f6bd45a', '6976D3B4-A', 1, '2020-05-25 11:41:02', '2020-05-25 11:41:02');
INSERT INTO `biz_out_stock_info` VALUES (7, '2d7158d3-2b15-473e-8cbe-6f6bd45a', 'AB0E206E-A', 3, '2020-05-25 11:41:02', '2020-05-25 11:41:02');
INSERT INTO `biz_out_stock_info` VALUES (8, '2d7158d3-2b15-473e-8cbe-6f6bd45a', '6AF405A1-C', 1, '2020-05-25 11:41:02', '2020-05-25 11:41:02');
INSERT INTO `biz_out_stock_info` VALUES (9, '2d7158d3-2b15-473e-8cbe-6f6bd45a', '2C15F1B6-1', 3, '2020-05-25 11:41:02', '2020-05-25 11:41:02');
INSERT INTO `biz_out_stock_info` VALUES (10, 'bd5032d0-c84a-4413-a72d-ba80d33f', '3DFC8EA0-6', 80, '2020-05-25 12:08:07', '2020-05-25 12:08:07');
INSERT INTO `biz_out_stock_info` VALUES (11, 'bd5032d0-c84a-4413-a72d-ba80d33f', '6EF5F2C0-9', 13, '2020-05-25 12:08:07', '2020-05-25 12:08:07');
INSERT INTO `biz_out_stock_info` VALUES (12, 'c23e95d0-0607-4e00-9041-cc97d299', '3DFC8EA0-6', 1, '2020-05-25 15:46:07', '2020-05-25 15:46:07');
INSERT INTO `biz_out_stock_info` VALUES (13, 'c23e95d0-0607-4e00-9041-cc97d299', '6EF5F2C0-9', 1, '2020-05-25 15:46:07', '2020-05-25 15:46:07');
INSERT INTO `biz_out_stock_info` VALUES (14, 'c23e95d0-0607-4e00-9041-cc97d299', '6976D3B4-A', 1, '2020-05-25 15:46:07', '2020-05-25 15:46:07');
INSERT INTO `biz_out_stock_info` VALUES (15, 'c23e95d0-0607-4e00-9041-cc97d299', 'AB0E206E-A', 1, '2020-05-25 15:46:07', '2020-05-25 15:46:07');
INSERT INTO `biz_out_stock_info` VALUES (16, 'c23e95d0-0607-4e00-9041-cc97d299', '6AF405A1-C', 1, '2020-05-25 15:46:07', '2020-05-25 15:46:07');
INSERT INTO `biz_out_stock_info` VALUES (17, 'c23e95d0-0607-4e00-9041-cc97d299', '2C15F1B6-1', 1, '2020-05-25 15:46:07', '2020-05-25 15:46:07');
INSERT INTO `biz_out_stock_info` VALUES (21, '982e449e-1ab0-4456-8e9a-5403a685', '3DFC8EA0-6', 30, '2020-05-26 09:32:25', '2020-05-26 09:32:25');
INSERT INTO `biz_out_stock_info` VALUES (22, '622e8b6d-924a-4dfe-bc51-2143cf3c', '6EF5F2C0-9', 13, '2020-05-26 09:34:23', '2020-05-26 09:34:23');
INSERT INTO `biz_out_stock_info` VALUES (23, '55e4942f-3c0a-4bc2-85f7-2f2a7bff', '3DFC8EA0-6', 1, '2020-05-26 09:52:09', '2020-05-26 09:52:09');
INSERT INTO `biz_out_stock_info` VALUES (24, '55e4942f-3c0a-4bc2-85f7-2f2a7bff', '6EF5F2C0-9', 1, '2020-05-26 09:52:09', '2020-05-26 09:52:09');
INSERT INTO `biz_out_stock_info` VALUES (25, '453544fd-53ec-430f-9899-73f2edf5', '6AF405A1-C', 1, '2020-05-26 09:59:57', '2020-05-26 09:59:57');
INSERT INTO `biz_out_stock_info` VALUES (26, '453544fd-53ec-430f-9899-73f2edf5', '2C15F1B6-1', 1, '2020-05-26 09:59:57', '2020-05-26 09:59:57');
INSERT INTO `biz_out_stock_info` VALUES (27, '453544fd-53ec-430f-9899-73f2edf5', '6976D3B4-A', 1, '2020-05-26 09:59:57', '2020-05-26 09:59:57');
INSERT INTO `biz_out_stock_info` VALUES (28, '453544fd-53ec-430f-9899-73f2edf5', '6EF5F2C0-9', 1, '2020-05-26 09:59:57', '2020-05-26 09:59:57');
INSERT INTO `biz_out_stock_info` VALUES (29, '4d7e5874-7d9c-4fca-ac08-ee4f4975', '3DFC8EA0-6', 1, '2020-05-26 10:02:01', '2020-05-26 10:02:01');
INSERT INTO `biz_out_stock_info` VALUES (30, '4d7e5874-7d9c-4fca-ac08-ee4f4975', '6EF5F2C0-9', 1, '2020-05-26 10:02:03', '2020-05-26 10:02:03');
INSERT INTO `biz_out_stock_info` VALUES (31, '4d7e5874-7d9c-4fca-ac08-ee4f4975', '6976D3B4-A', 1, '2020-05-26 10:02:03', '2020-05-26 10:02:03');
INSERT INTO `biz_out_stock_info` VALUES (32, 'b149c672-7cf1-4aef-8da0-bba766d6', '3DFC8EA0-6', 5, '2021-12-05 17:47:58', '2021-12-05 17:47:58');
INSERT INTO `biz_out_stock_info` VALUES (33, '78ad5bcd-f261-40ea-80f4-0b08f4b7', '3DFC8EA0-6', 1, '2021-12-05 17:53:16', '2021-12-05 17:53:16');

-- ----------------------------
-- Table structure for biz_product
-- ----------------------------
DROP TABLE IF EXISTS `biz_product`;
CREATE TABLE `biz_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `p_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `image_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计算单位',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `one_category_id` bigint(20) NULL DEFAULT NULL COMMENT '1级分类',
  `two_category_id` bigint(20) NULL DEFAULT NULL COMMENT '2级分类',
  `three_category_id` bigint(20) NULL DEFAULT NULL COMMENT '3级分类',
  `status` int(11) NULL DEFAULT 0 COMMENT '是否删除:1物资正常,0:物资回收,2:物资审核中',
  INDEX `id`(`id`) USING BTREE,
  INDEX `category_id`(`one_category_id`) USING BTREE,
  INDEX `two_category_id`(`two_category_id`) USING BTREE,
  INDEX `three_category_id`(`three_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_product
-- ----------------------------
INSERT INTO `biz_product` VALUES (17, '3DFC8EA0-6', 'N95口罩1', '1648364736585.jpg', '10个/包', '包', '救命的口罩', 1, '2020-03-18 00:00:00', '2022-03-27 15:05:45', 33, 34, 37, 0);
INSERT INTO `biz_product` VALUES (18, '6EF5F2C0-9', '普通医用口罩', '1648365413825.jpg', '5个/包', '包', '医用口罩也不错哦', 3, '2020-03-18 00:00:00', '2022-03-27 15:16:55', 20, 23, 25, 0);
INSERT INTO `biz_product` VALUES (19, '6976D3B4-A', '普通温度计', '1648365224581.jpg', '10只/盒', '盒', '温度计', 2, '2020-03-18 00:00:00', '2022-03-27 15:13:46', 20, 21, 38, 0);
INSERT INTO `biz_product` VALUES (20, 'AB0E206E-A', '生理盐水', '1648365424184.jpg', '500ml', '瓶', '生理盐水', 3, '2020-03-18 00:00:00', '2022-03-27 15:17:05', 20, 43, 44, 0);
INSERT INTO `biz_product` VALUES (23, '6AF405A1-C', '东北大米', '1648365456374.jpg', '1斤/袋', '袋', '老鼠爱大米', 4, '2020-03-18 00:00:00', '2022-03-27 15:17:37', 24, 30, 41, 0);
INSERT INTO `biz_product` VALUES (25, '2C15F1B6-1', '防毒面具', '1648365206973.jpg', '舒适版', '个', '防毒气的', 1, '2020-03-18 00:00:00', '2022-03-27 15:13:28', 20, 23, 39, 0);
INSERT INTO `biz_product` VALUES (28, '894b8218-36ee-4a0d-9ad1-d9c5e455', '霸王洗发水', '1648365481290.jpg', '10ml', '瓶', '洗发水挺好的', 7, '2020-03-20 00:00:00', '2022-03-27 15:18:02', 24, 31, 52, 0);
INSERT INTO `biz_product` VALUES (29, '0b9e9176-f996-4384-bb6c-209f55d0', '卫龙辣条', '1648365465625.jpg', '大包', '包', '好吃', 4, '2020-03-21 00:00:00', '2022-03-27 15:17:47', 24, 30, 41, 0);
INSERT INTO `biz_product` VALUES (30, '24573d5b-0c9b-403b-9a88-c214702e', '医用酒精', '1648365432150.jpg', '100ml/75%', '瓶', '100ml/75%', 3, '2020-03-22 00:00:00', '2022-03-27 15:17:13', 20, 43, 57, 0);
INSERT INTO `biz_product` VALUES (31, 'c98183c8-bc47-4505-abbb-1dc219b5', '碘伏', '1648365439620.jpg', '500ml', '瓶', '碘伏', 3, '2020-03-22 00:00:00', '2022-03-27 15:17:21', 20, 43, 57, 0);
INSERT INTO `biz_product` VALUES (32, 'f248ee7a-c30c-447c-ae9c-0a1c09e9', '呼吸机', '1648365232970.jpg', '100伏特', '台', 'test', 2, '2020-03-22 00:00:00', '2022-03-27 15:13:54', 20, 21, 32, 0);
INSERT INTO `biz_product` VALUES (34, 'beb944c4-01ae-497b-bfdd-2132032f', '帅气男装', '1648365372854.jpg', '175cm', '件', '帅气男装', 2, '2020-03-25 00:00:00', '2022-03-27 15:16:14', 24, 27, 40, 0);
INSERT INTO `biz_product` VALUES (37, 'cf5a5f37-b299-4d96-bcb2-c4a46737', '脑白金', '1648365382489.jpg', '600ml', '包', '脑白金', 2, '2020-03-25 00:00:00', '2022-03-27 15:16:23', 20, 43, 44, 0);
INSERT INTO `biz_product` VALUES (38, '3fa0d5c1-4922-4078-8c7c-8d1cfeb5', '金鸡胶囊', '1648365395522.jpg', '10个/包', '包', '金鸡胶囊', 2, '2020-03-25 00:00:00', '2022-03-27 15:16:37', 20, 43, 53, 0);
INSERT INTO `biz_product` VALUES (39, 'de16b9e6-bb49-4547-ab91-db7ae7b6', '感冒康胶囊', '1648365448135.jpg', '10片/包', '包', '感冒康胶囊', 3, '2020-03-25 00:00:00', '2022-03-27 15:17:29', 20, 43, 53, 0);
INSERT INTO `biz_product` VALUES (40, '0e17f606-9aaa-48a7-b4e9-ef18462e', '康师傅矿泉水', '1648365404832.jpg', '10瓶/箱', '箱', '矿泉水', 2, '2020-03-25 00:00:00', '2022-03-27 15:16:46', 24, 30, 62, 0);
INSERT INTO `biz_product` VALUES (46, '15bc064e-991d-40e3-bcd6-f6aff0e3', '小鸟伏特加', '1648365216048.jpg', '500ml', '瓶', 'ZBC', 1, '2020-05-10 00:00:00', '2022-03-27 15:13:37', 20, 43, 44, 0);
INSERT INTO `biz_product` VALUES (51, '35be7cd8-d2e4-4dd8-8601-ae295588', '334334', '1648365473607.jpg', '34', '34', '44535', 4, '2020-08-19 00:00:00', '2022-03-27 15:17:54', 33, 34, 37, 0);
INSERT INTO `biz_product` VALUES (52, '4f0a14b5-f24c-4a0b-8a35-c0b2086f', '1111', '1648364865721.jpg', '22', '1', '11', 1, '2022-03-27 15:08:11', '2022-03-27 15:08:11', 33, 34, 37, 2);

-- ----------------------------
-- Table structure for biz_product_category
-- ----------------------------
DROP TABLE IF EXISTS `biz_product_category`;
CREATE TABLE `biz_product_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父级分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_product_category
-- ----------------------------
INSERT INTO `biz_product_category` VALUES (20, '医疗物资', '11111122', 2, '2020-03-17 00:00:00', '2020-03-22 23:00:38', 0);
INSERT INTO `biz_product_category` VALUES (21, '仪器', '仪器', 1, '2020-03-17 00:00:00', '2020-08-19 17:37:27', 20);
INSERT INTO `biz_product_category` VALUES (23, '防护品', '防护品', 2, '2020-03-17 11:33:48', '2020-03-17 11:33:48', 20);
INSERT INTO `biz_product_category` VALUES (24, '生活用品', '生活用品', 3, '2020-03-17 00:00:00', '2020-03-22 23:00:43', 0);
INSERT INTO `biz_product_category` VALUES (27, '衣服用品', '衣服用品', 2, '2020-03-17 11:38:50', '2020-03-17 11:38:50', 24);
INSERT INTO `biz_product_category` VALUES (28, '防护服', '防护服', 3, '2020-03-17 11:44:38', '2020-03-17 11:44:38', 23);
INSERT INTO `biz_product_category` VALUES (30, '粮油类', '粮油类', 2, '2020-03-17 11:51:29', '2020-03-17 11:51:29', 24);
INSERT INTO `biz_product_category` VALUES (31, '洗化用品', '洗化用品', 3, '2020-03-17 11:51:50', '2020-03-17 11:51:50', 24);
INSERT INTO `biz_product_category` VALUES (32, '呼吸机', '呼吸机', 1, '2020-03-17 00:00:00', '2020-03-17 13:43:01', 21);
INSERT INTO `biz_product_category` VALUES (33, '交通运输', '交通运输。。。2323。7', 1, '2020-03-17 00:00:00', '2021-09-20 10:35:37', 0);
INSERT INTO `biz_product_category` VALUES (34, '车辆', '小车车', 2, '2020-03-17 11:56:51', '2020-03-17 11:56:51', 33);
INSERT INTO `biz_product_category` VALUES (37, '运输车', '运输车', 1, '2020-03-17 00:00:00', '2020-03-23 10:46:10', 34);
INSERT INTO `biz_product_category` VALUES (38, '温度器', '温度器', 1, '2020-03-18 01:43:52', '2020-03-18 01:43:52', 21);
INSERT INTO `biz_product_category` VALUES (39, '防毒面具', '防毒面具', 5, '2020-03-18 01:44:27', '2020-03-18 01:44:27', 23);
INSERT INTO `biz_product_category` VALUES (40, '衣服', '衣服', 1, '2020-03-18 01:50:33', '2020-03-18 01:50:33', 27);
INSERT INTO `biz_product_category` VALUES (41, '大米', '大米', 2, '2020-03-18 01:50:49', '2020-03-18 01:50:49', 30);
INSERT INTO `biz_product_category` VALUES (43, '药品', '药品', 2, '2020-03-18 01:57:42', '2020-03-18 01:57:42', 20);
INSERT INTO `biz_product_category` VALUES (44, '输液', '输液', 2, '2020-03-18 01:58:31', '2020-03-18 01:58:31', 43);
INSERT INTO `biz_product_category` VALUES (45, '消毒液', '消毒液', 2, '2020-03-18 01:59:03', '2020-03-18 01:59:03', 43);
INSERT INTO `biz_product_category` VALUES (46, '血压仪', '血压仪', 2, '2020-03-18 01:59:30', '2020-03-18 01:59:30', 21);
INSERT INTO `biz_product_category` VALUES (50, 'test', 'test', 1, '2020-03-19 01:05:24', '2020-03-19 01:05:24', 49);
INSERT INTO `biz_product_category` VALUES (51, 'test3', 'test3', 3, '2020-03-19 01:05:45', '2020-03-19 01:05:45', 50);
INSERT INTO `biz_product_category` VALUES (52, '洗发水', '洗发的', 1, '2020-03-20 08:15:45', '2020-03-20 08:15:45', 31);
INSERT INTO `biz_product_category` VALUES (53, '解热镇痛药', '解热镇痛药', 1, '2020-03-21 03:37:18', '2020-03-21 03:37:18', 43);
INSERT INTO `biz_product_category` VALUES (54, '外用及器具', '外用及器具', 1, '2020-03-21 03:38:13', '2020-03-21 03:38:13', 20);
INSERT INTO `biz_product_category` VALUES (55, '导尿管', '导尿管', 2, '2020-03-21 03:38:30', '2020-03-21 03:38:30', 54);
INSERT INTO `biz_product_category` VALUES (56, '三角巾急救包', '三角巾急救包', 2, '2020-03-21 03:38:51', '2020-03-21 03:38:51', 54);
INSERT INTO `biz_product_category` VALUES (57, '消毒药品类', '消毒药品类', 2, '2020-03-21 03:40:09', '2020-03-21 03:40:09', 43);
INSERT INTO `biz_product_category` VALUES (58, '外科手术服', '外科手术服', 2, '2020-03-21 03:41:20', '2020-03-21 03:41:20', 23);
INSERT INTO `biz_product_category` VALUES (62, '食用油', '实用油', 2, '2020-03-25 11:13:39', '2020-03-25 11:13:39', 30);
INSERT INTO `biz_product_category` VALUES (75, '333', '333', 3, '2020-08-19 17:10:54', '2020-08-19 17:10:54', 74);
INSERT INTO `biz_product_category` VALUES (79, '2313', '232323', 2, '2020-08-19 17:37:10', '2020-08-19 17:37:10', 21);
INSERT INTO `biz_product_category` VALUES (80, '2313', '12313', 3, '2020-08-19 17:37:32', '2020-08-19 17:37:32', 0);

-- ----------------------------
-- Table structure for biz_product_stock
-- ----------------------------
DROP TABLE IF EXISTS `biz_product_stock`;
CREATE TABLE `biz_product_stock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `p_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stock` bigint(20) NULL DEFAULT NULL COMMENT '商品库存结余',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_product_stock
-- ----------------------------
INSERT INTO `biz_product_stock` VALUES (43, '3DFC8EA0-6', 57);
INSERT INTO `biz_product_stock` VALUES (44, '2C15F1B6-1', 74);
INSERT INTO `biz_product_stock` VALUES (45, '6976D3B4-A', 37);
INSERT INTO `biz_product_stock` VALUES (46, '967CE098-3', 4);
INSERT INTO `biz_product_stock` VALUES (47, '79f01380-43c7-4506-9e0c-e2640288', 5);
INSERT INTO `biz_product_stock` VALUES (48, 'f248ee7a-c30c-447c-ae9c-0a1c09e9', 49);
INSERT INTO `biz_product_stock` VALUES (49, '6AF405A1-C', 18);
INSERT INTO `biz_product_stock` VALUES (50, '0b9e9176-f996-4384-bb6c-209f55d0', 16);
INSERT INTO `biz_product_stock` VALUES (51, '894b8218-36ee-4a0d-9ad1-d9c5e455', 14);
INSERT INTO `biz_product_stock` VALUES (52, 'beb944c4-01ae-497b-bfdd-2132032f', 31);
INSERT INTO `biz_product_stock` VALUES (53, 'cf5a5f37-b299-4d96-bcb2-c4a46737', 5);
INSERT INTO `biz_product_stock` VALUES (54, '3fa0d5c1-4922-4078-8c7c-8d1cfeb5', 2);
INSERT INTO `biz_product_stock` VALUES (55, '0e17f606-9aaa-48a7-b4e9-ef18462e', 2);
INSERT INTO `biz_product_stock` VALUES (56, 'd9155553-fe5c-4d35-bb9a-1e1ab8d4', 2);
INSERT INTO `biz_product_stock` VALUES (57, '6EF5F2C0-9', 4);
INSERT INTO `biz_product_stock` VALUES (58, 'AB0E206E-A', 6);
INSERT INTO `biz_product_stock` VALUES (59, '24573d5b-0c9b-403b-9a88-c214702e', 31);
INSERT INTO `biz_product_stock` VALUES (60, 'c98183c8-bc47-4505-abbb-1dc219b5', 7);
INSERT INTO `biz_product_stock` VALUES (61, 'de16b9e6-bb49-4547-ab91-db7ae7b6', 9);
INSERT INTO `biz_product_stock` VALUES (62, '15bc064e-991d-40e3-bcd6-f6aff0e3', 28);

-- ----------------------------
-- Table structure for biz_supplier
-- ----------------------------
DROP TABLE IF EXISTS `biz_supplier`;
CREATE TABLE `biz_supplier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商地址',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商邮箱',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商电话',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_supplier
-- ----------------------------
INSERT INTO `biz_supplier` VALUES (14, '324234', '河北省/秦皇岛市/长安区', '424324@qq.com', '15079437282', '2020-04-26 10:00:05', '2020-04-26 10:00:05', 2, '324324');
INSERT INTO `biz_supplier` VALUES (15, '大街', '河北省/邯郸市/峰峰矿区', '3424324@qq.com', '15079437282', '2020-05-09 19:37:46', '2020-05-10 11:25:01', 1, '324324');
INSERT INTO `biz_supplier` VALUES (16, '2342424', '内蒙古自治区/鄂尔多斯市/鄂托克前旗', '432423424@qq.com', '15079437282', '2020-05-09 19:42:07', '2020-05-09 19:42:07', 1, '3242423');
INSERT INTO `biz_supplier` VALUES (17, '北京人民大会堂', '北京市/市辖区/朝阳区', 'xiong@qq.com', '15079437282', '2020-05-18 11:38:04', '2020-05-18 11:38:04', 1, '熊老板');
INSERT INTO `biz_supplier` VALUES (18, 'xixiixxxxi', '河北省/秦皇岛市/北戴河区', 'chrome@qq.com', '15079437282', '2020-05-18 11:41:09', '2020-05-18 11:41:09', 1, 'perterchro');
INSERT INTO `biz_supplier` VALUES (19, 'xixiixxxxi', '河北省/秦皇岛市/北戴河区', 'chrome@qq.com', '15079437282', '2020-05-18 11:43:49', '2020-05-18 11:43:49', 1, 'perterchro');
INSERT INTO `biz_supplier` VALUES (20, 'aloooodf', '山西省/晋城市/陵川县', 'justiner@qq.com', '15245745454', '2020-05-18 12:21:29', '2020-05-18 12:21:29', 1, 'justiner');
INSERT INTO `biz_supplier` VALUES (21, 'HHH', '河北省/秦皇岛市/长安区', 'HHH@qq.com', '15079437282', '2020-05-18 13:16:28', '2020-05-18 13:16:28', 1, 'HHH');
INSERT INTO `biz_supplier` VALUES (22, 'PuPuPu34', '山西省/阳泉市/平定县', '124545454@qq.com', '15254541241', '2020-05-18 13:42:29', '2020-05-18 13:43:05', 1, '封小新');
INSERT INTO `biz_supplier` VALUES (23, '111', '北京市/市辖区/东城区', '1111@qq.com', '18570429670', '2021-09-18 08:51:48', '2021-09-18 08:51:48', 1, '1111');
INSERT INTO `biz_supplier` VALUES (24, '来源 名称', '河南省/郑州市/中原区', '12345678@qq.com', '17001100784', '2021-12-05 16:36:32', '2021-12-05 16:36:32', 4, '110');

-- ----------------------------
-- Table structure for tb_department
-- ----------------------------
DROP TABLE IF EXISTS `tb_department`;
CREATE TABLE `tb_department`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系办公电话',
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公室地点',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_department
-- ----------------------------
INSERT INTO `tb_department` VALUES (1, '物资管理部', '15045741241', '负责系统物资的管理。', '2020-03-16 00:00:00', '2020-08-19 16:48:16');
INSERT INTO `tb_department` VALUES (12, '采购部', '15079451241', '采购中心', '2020-03-16 00:00:00', '2020-08-19 16:48:20');
INSERT INTO `tb_department` VALUES (14, '信息技术部', '18214521412', '3楼405房间', '2020-03-19 00:00:00', '2020-08-19 16:48:23');
INSERT INTO `tb_department` VALUES (15, '行政部', '15079457458', '3栋504房间', '2020-03-19 00:00:00', '2020-03-25 11:27:35');

-- ----------------------------
-- Table structure for tb_image
-- ----------------------------
DROP TABLE IF EXISTS `tb_image`;
CREATE TABLE `tb_image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `size` bigint(20) NULL DEFAULT NULL COMMENT '图片大小',
  `media_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片类型',
  `suffix` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片后缀',
  `height` int(11) NULL DEFAULT NULL COMMENT '图片高度',
  `width` int(11) NULL DEFAULT NULL COMMENT '图片宽度',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_image
-- ----------------------------
INSERT INTO `tb_image` VALUES (43, '1637746744207.jpg', NULL, 'image/jpeg', NULL, 447, 371, '2021-11-24 17:39:04');
INSERT INTO `tb_image` VALUES (45, '1638690507130.jpg', NULL, 'image/jpeg', NULL, 506, 558, '2021-12-05 15:48:28');
INSERT INTO `tb_image` VALUES (47, '1648363715262.jpg', NULL, 'image/jpeg', NULL, 300, 379, '2022-03-27 14:48:35');
INSERT INTO `tb_image` VALUES (48, '1648363715265.jpg', NULL, 'image/jpeg', NULL, 300, 450, '2022-03-27 14:48:35');
INSERT INTO `tb_image` VALUES (49, '1648363715291.jpg', NULL, 'image/jpeg', NULL, 282, 450, '2022-03-27 14:48:35');
INSERT INTO `tb_image` VALUES (50, '1648363715277.jpg', NULL, 'image/jpeg', NULL, 604, 970, '2022-03-27 14:48:35');
INSERT INTO `tb_image` VALUES (51, '1648363715311.jpg', NULL, 'image/jpeg', NULL, 654, 1014, '2022-03-27 14:48:35');
INSERT INTO `tb_image` VALUES (52, '1648363715322.jpg', NULL, 'image/jpeg', NULL, 960, 1280, '2022-03-27 14:48:35');
INSERT INTO `tb_image` VALUES (53, '1648363715334.jpg', NULL, 'image/jpeg', NULL, 672, 1002, '2022-03-27 14:48:35');
INSERT INTO `tb_image` VALUES (54, '1648363715344.jpg', NULL, 'image/jpeg', NULL, 724, 970, '2022-03-27 14:48:35');
INSERT INTO `tb_image` VALUES (55, '1648363715371.jpg', NULL, 'image/jpeg', NULL, 1200, 1600, '2022-03-27 14:48:35');
INSERT INTO `tb_image` VALUES (56, '1648363800973.jpg', NULL, 'image/jpeg', NULL, 724, 970, '2022-03-27 14:50:01');

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `operation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `time` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时',
  `method` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作方法',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方法参数',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者IP',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2061 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log` VALUES (2061, 'admin', '删除用户', 160, 'com.coderman.api.system.controller.UserController.delete()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}', 'paramName:[id],args:[2]', '127.0.0.1', '2022-06-27 15:39:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (2062, 'admin', '添加用户', 32, 'com.coderman.api.system.controller.UserController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}', 'paramName:[userVO],args:[UserVO(id=null, username=use2, nickname=name2, email=185369@qq.com, phoneNumber=18569325478, status=null, createTime=null, sex=1, birth=Wed Jun 01 00:00:00 CST 2022, password=123456, departmentName=null, departmentId=1)]', '127.0.0.1', '2022-06-27 15:40:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (2063, 'admin', '分配角色', 48, 'com.coderman.api.system.controller.UserController.assignRoles()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}', 'paramName:[id, rids],args:[199, [Ljava.lang.Long;@105e7c86]', '127.0.0.1', '2022-06-27 15:41:20', '内网IP|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for tb_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_login_log`;
CREATE TABLE `tb_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `login_time` datetime(0) NOT NULL COMMENT '登录时间',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `user_system` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `user_browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1615 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_login_log
-- ----------------------------
INSERT INTO `tb_login_log` VALUES (1617, 'admin', '2022-06-27 15:38:08', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 10');
INSERT INTO `tb_login_log` VALUES (1618, 'admin', '2022-06-27 15:41:50', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 10');

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单/按钮名称',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限标识',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型 0菜单 1按钮',
  `order_num` bigint(20) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `available` int(11) NULL DEFAULT 1 COMMENT '0：不可用，1：可用',
  `open` int(11) NULL DEFAULT 1 COMMENT '0:不展开，1：展开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 344 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES (1, 0, '系统管理', '', NULL, 'el-icon-setting', '0', 1, '2022-06-01 17:41:30', '2020-08-19 17:57:20', 1, 0);
INSERT INTO `tb_menu` VALUES (4, 1, '菜单权限', '/menus', NULL, 'el-icon-help', '0', 3, '2022-06-01 18:57:42', '2020-03-20 11:50:46', 1, 0);
INSERT INTO `tb_menu` VALUES (5, 0, '日志管理', '/logs', NULL, 'el-icon-camera', '0', 6, '2022-06-01 18:58:18', '2020-05-07 19:35:19', 1, 0);
INSERT INTO `tb_menu` VALUES (226, 1, '用户管理', '/users', 'users', 'el-icon-user', '0', 2, '2022-06-01 05:27:54', '2020-04-23 20:04:36', 1, 0);
INSERT INTO `tb_menu` VALUES (229, 312, '物资管理', '', 'el-icon-date', 'el-icon-date', '0', 1, '2022-06-01 05:34:08', '2020-04-30 18:29:20', 1, 1);
INSERT INTO `tb_menu` VALUES (230, 229, '物资入库', '/inStocks', 'el-icon-date', 'el-icon-date', '0', 1, '2022-06-01 05:34:28', '2020-08-19 18:40:25', 1, 0);
INSERT INTO `tb_menu` VALUES (234, 226, '用户添加', '', 'user:add', 'el-icon-plus', '1', 1, '2020-03-10 05:50:44', '2020-03-10 07:51:56', 1, 0);
INSERT INTO `tb_menu` VALUES (235, 1, '角色管理', '/roles', '', 'el-icon-postcard', '0', 3, '2020-03-10 05:51:28', '2020-05-16 16:37:58', 1, 0);
INSERT INTO `tb_menu` VALUES (239, 226, '用户删除', '', 'user:delete', 'el-icon-picture', '1', 1, '2020-03-10 06:05:30', '2020-03-10 08:10:19', 1, 0);
INSERT INTO `tb_menu` VALUES (240, 226, '用户编辑', '', 'user:edit', 'el-icon-video-camera-solid', '1', 1, '2020-03-10 06:06:30', '2020-03-10 07:52:28', 1, 0);
INSERT INTO `tb_menu` VALUES (241, 235, '角色编辑', '', 'role:edit', 'el-icon-s-promotion', '1', 2, '2020-03-10 06:11:03', '2020-03-11 11:40:19', 1, 0);
INSERT INTO `tb_menu` VALUES (242, 235, '角色删除', '', 'role:delete', 'el-icon-s-marketing', '1', 3, '2020-03-10 06:15:29', '2020-03-11 11:43:36', 1, 0);
INSERT INTO `tb_menu` VALUES (247, 4, '添加菜单', '', 'menu:add', 'el-icon-s-opportunity', '1', 1, '2020-03-10 07:55:10', '2020-04-27 09:59:43', 1, 0);
INSERT INTO `tb_menu` VALUES (249, 4, '修改菜单', '', 'menu:update', 'el-icon-share', '1', 2, '2020-03-10 07:56:55', '2020-03-15 13:29:29', 1, 0);
INSERT INTO `tb_menu` VALUES (250, 4, '删除菜单', '', 'menu:delete', 'el-icon-folder-opened', '1', 3, '2020-03-10 07:57:38', '2020-03-15 13:29:41', 1, 0);
INSERT INTO `tb_menu` VALUES (251, 235, '分配权限', '', 'role:authority', 'el-icon-document-add', '1', 1, '2020-03-10 08:13:22', '2020-03-11 11:39:30', 1, 0);
INSERT INTO `tb_menu` VALUES (253, 1, '系统首页', '/welcome', 'welcome:view', 'el-icon-star-off', '0', 1, '2020-03-10 08:46:44', '2020-05-29 20:43:12', 1, 0);
INSERT INTO `tb_menu` VALUES (254, 226, '分配角色', '', 'user:assign', 'el-icon-s-tools', '1', 3, '2020-03-11 01:32:29', '2020-04-27 10:58:30', 1, 0);
INSERT INTO `tb_menu` VALUES (255, 235, '添加角色', '', 'role:add', 'el-icon-help', '1', 1, '2020-03-11 01:34:18', '2020-03-11 01:34:18', 1, 0);
INSERT INTO `tb_menu` VALUES (256, 226, '禁用用户', '', 'user:status', 'el-icon-circle-close', '1', 1, '2020-03-11 06:50:04', '2020-03-14 05:05:49', 1, 0);
INSERT INTO `tb_menu` VALUES (258, 226, '用户更新', '', 'user:update', 'el-icon-refresh', '1', 1, '2020-03-11 08:26:54', '2020-03-11 08:26:54', 1, 0);
INSERT INTO `tb_menu` VALUES (259, 235, '角色更新', '', 'role:update', 'el-icon-refresh-left', '1', 1, '2020-03-11 11:45:20', '2020-03-11 11:45:20', 1, 0);
INSERT INTO `tb_menu` VALUES (260, 235, '状态更新', '', 'role:status', 'el-icon-refresh', '1', 1, '2020-03-14 05:07:02', '2020-03-14 05:07:24', 1, 0);
INSERT INTO `tb_menu` VALUES (261, 1, '部门管理', '/departments', '', 'el-icon-s-home', '0', 3, '2020-03-15 06:05:48', '2020-03-22 22:53:42', 1, 0);
INSERT INTO `tb_menu` VALUES (262, 261, '添加部门', '', 'department:add', 'el-icon-plus', '1', 1, '2020-03-15 11:57:42', '2020-03-21 12:37:21', 1, 0);
INSERT INTO `tb_menu` VALUES (263, 261, '编辑院系', '', 'department:edit', 'el-icon-edit', '1', 1, '2020-03-15 11:59:52', '2020-03-15 12:16:36', 1, 0);
INSERT INTO `tb_menu` VALUES (264, 261, '更新院系', '', 'department:update', 'el-icon-refresh', '1', 1, '2020-03-15 12:02:34', '2020-03-15 12:16:32', 1, 0);
INSERT INTO `tb_menu` VALUES (265, 261, '删除院系', NULL, 'department:delete', 'el-icon-delete', '1', 1, '2020-03-15 12:03:21', '2020-03-15 12:03:21', 1, 0);
INSERT INTO `tb_menu` VALUES (267, 229, '物资资料', '/products', '', 'el-icon-goods', '0', 2, '2020-03-16 09:01:02', '2020-04-30 19:11:56', 1, 0);
INSERT INTO `tb_menu` VALUES (268, 229, '物资类别', '/productCategorys', '', 'el-icon-star-off', '0', 2, '2020-03-16 09:01:48', '2020-03-22 22:45:40', 1, 0);
INSERT INTO `tb_menu` VALUES (269, 311, '物资来源', '/suppliers', '', 'el-icon-coordinate', '0', 5, '2020-03-16 12:35:10', '2020-04-11 13:56:16', 1, 0);
INSERT INTO `tb_menu` VALUES (270, 229, '物资发放', '/outStocks', '', 'el-icon-goods', '0', 5, '2020-03-16 13:55:49', '2020-05-10 14:46:53', 1, 1);
INSERT INTO `tb_menu` VALUES (271, 5, '登入日志', '/loginLog', 'login:log', 'el-icon-date', '0', 1, '2020-03-20 10:31:12', '2020-04-04 20:01:02', 1, 0);
INSERT INTO `tb_menu` VALUES (273, 303, '全国疫情', '/map', 'map:view', 'el-icon-s-opportunity', '0', 1, '2020-03-20 11:32:02', '2020-03-20 11:32:02', 1, 1);
INSERT INTO `tb_menu` VALUES (274, 267, '添加物资', '', 'product:add', 'el-icon-s-opportunity', '1', 1, '2020-03-21 02:04:24', '2020-03-21 02:04:24', 1, 0);
INSERT INTO `tb_menu` VALUES (276, 267, '上传图片', NULL, 'upload:image', 'el-icon-finished', '1', 2, '2020-03-21 02:05:21', '2020-03-21 02:05:21', 1, 0);
INSERT INTO `tb_menu` VALUES (277, 267, '更新物资', NULL, 'product:update', 'el-icon-folder', '1', 3, '2020-03-21 02:05:56', '2020-03-21 02:05:56', 1, 0);
INSERT INTO `tb_menu` VALUES (278, 267, '编辑物资', NULL, 'product:edit', 'el-icon-edit', '1', 1, '2020-03-21 02:06:23', '2020-03-21 02:06:23', 1, 0);
INSERT INTO `tb_menu` VALUES (279, 269, '删除来源', '', 'supplier:delete', 'el-icon-document-delete', '1', 1, '2020-03-21 02:17:29', '2020-03-21 12:32:22', 1, 0);
INSERT INTO `tb_menu` VALUES (280, 269, '更新来源', '', 'supplier:update', 'el-icon-paperclip', '1', 1, '2020-03-21 02:18:34', '2020-03-21 12:36:41', 1, 0);
INSERT INTO `tb_menu` VALUES (281, 269, '添加来源', NULL, 'supplier:add', 'el-icon-document-add', '1', 1, '2020-03-21 02:19:02', '2020-03-21 02:19:02', 1, 1);
INSERT INTO `tb_menu` VALUES (282, 269, '编辑来源', NULL, 'supplier:edit', 'el-icon-scissors', '1', 2, '2020-03-21 02:19:36', '2020-03-21 02:19:36', 1, 1);
INSERT INTO `tb_menu` VALUES (283, 268, '添加类别', '', 'productCategory:add', ' el-icon-folder-add', '1', 1, '2020-03-21 02:26:12', '2020-03-21 02:44:22', 1, 0);
INSERT INTO `tb_menu` VALUES (284, 268, '删除类别', NULL, 'productCategory:delete', 'el-icon-delete', '1', 1, '2020-03-21 02:27:05', '2020-03-21 02:28:49', 1, 0);
INSERT INTO `tb_menu` VALUES (285, 268, '编辑类别', NULL, 'productCategory:edit', 'el-icon-scissors', '1', 2, '2020-03-21 02:27:42', '2020-03-21 02:27:42', 1, 0);
INSERT INTO `tb_menu` VALUES (286, 268, '更新类别', NULL, 'productCategory:update', ' el-icon-coordinate', '1', 1, '2020-03-21 02:28:17', '2020-03-21 02:28:17', 1, 0);
INSERT INTO `tb_menu` VALUES (296, 295, 'swagger文档', '/swagger', NULL, 'el-icon-document', '0', 2, '2020-03-22 01:22:48', '2020-05-07 19:43:42', 1, 0);
INSERT INTO `tb_menu` VALUES (297, 295, '监控管理', '', '', 'el-icon-warning', '0', 1, '2020-03-22 02:47:10', '2020-05-16 16:54:39', 1, 0);
INSERT INTO `tb_menu` VALUES (298, 297, 'SQL监控', '/druid', NULL, 'el-icon-view', '0', 1, '2020-03-22 02:48:05', '2020-03-22 02:49:50', 1, 0);
INSERT INTO `tb_menu` VALUES (299, 271, '删除日志', '', 'loginLog:delete', 'el-icon-delete', '1', 1, '2020-03-22 21:55:44', '2020-03-22 21:55:44', 1, 0);
INSERT INTO `tb_menu` VALUES (300, 271, '批量删除', '', 'loginLog:batchDelete', 'el-icon-delete-solid', '1', 1, '2020-03-22 22:19:26', '2020-03-22 22:19:26', 1, 0);
INSERT INTO `tb_menu` VALUES (301, 4, '编辑菜单', '', 'menu:edit', 'el-icon-edit', '1', 1, '2020-03-22 23:12:25', '2020-03-22 23:12:25', 1, 0);
INSERT INTO `tb_menu` VALUES (303, 0, '健康报备', '', '', 'el-icon-platform-eleme', '0', 3, '2020-03-24 10:11:53', '2020-05-16 11:53:36', 1, 0);
INSERT INTO `tb_menu` VALUES (304, 303, '健康打卡', '/health', '', 'el-icon-s-cooperation', '0', 1, '2020-03-24 10:12:57', '2020-05-06 09:37:51', 1, 0);
INSERT INTO `tb_menu` VALUES (307, 5, '操作日志', '/logs', '', 'el-icon-edit', '0', 1, '2020-04-04 19:04:53', '2020-05-16 16:39:18', 1, 1);
INSERT INTO `tb_menu` VALUES (308, 307, '删除日志', '', 'log:delete', 'el-icon-circle-close', '1', 1, '2020-04-04 19:59:20', '2020-04-04 19:59:20', 1, 1);
INSERT INTO `tb_menu` VALUES (309, 307, '批量删除', NULL, 'log:batchDelete', 'el-icon-document-delete', '1', 2, '2020-04-04 19:59:59', '2020-04-04 19:59:59', 1, 0);
INSERT INTO `tb_menu` VALUES (310, 311, '物资去处', '/consumers', '', 'el-icon-edit', '0', 1, '2020-04-05 10:08:21', '2020-04-05 10:08:21', 1, 0);
INSERT INTO `tb_menu` VALUES (311, 312, '物资流向', NULL, NULL, 'el-icon-edit', '0', 3, '2020-04-05 10:16:59', '2020-04-30 18:40:43', 1, 0);
INSERT INTO `tb_menu` VALUES (312, 0, '业务管理', NULL, NULL, 'el-icon-s-goods', '0', 2, '2020-04-05 10:19:07', '2020-08-19 17:57:27', 1, 1);
INSERT INTO `tb_menu` VALUES (316, 229, '物资库存', '/stocks', '', 'el-icon-tickets', '0', 5, '2020-04-16 08:45:08', '2020-05-16 16:56:53', 1, 0);
INSERT INTO `tb_menu` VALUES (317, 226, '导出表格', '', 'user:export', 'el-icon-edit', '1', 1, '2020-04-17 18:02:05', '2020-04-17 18:02:05', 1, 0);
INSERT INTO `tb_menu` VALUES (318, 295, '图标管理', '/icons', '', 'el-icon-star-off', '0', 2, '2020-04-21 12:06:33', '2020-05-16 17:07:35', 1, 1);
INSERT INTO `tb_menu` VALUES (320, 319, '公告发布', '/notices/add', '', 'el-icon-edit', '1', 1, '2020-04-21 12:26:56', '2020-04-21 12:26:56', 1, 1);
INSERT INTO `tb_menu` VALUES (321, 1, '附件管理', '/attachments', '', 'el-icon-picture-outline', '0', 2, '2020-04-25 10:52:17', '2020-04-25 10:52:17', 1, 1);
INSERT INTO `tb_menu` VALUES (322, 310, '添加去处', '', 'consumer:add', 'el-icon-plus', '1', 2, '2020-04-27 16:57:04', '2020-04-27 16:58:21', 1, 1);
INSERT INTO `tb_menu` VALUES (323, 310, '删除去处', NULL, 'consumer:delete', 'el-icon-delete', '1', 1, '2020-04-27 16:57:42', '2020-04-27 16:57:42', 1, 0);
INSERT INTO `tb_menu` VALUES (324, 310, '编辑去处', '', 'consumer:edit', 'el-icon-edit', '1', 1, '2020-04-27 16:59:17', '2020-04-27 16:59:17', 1, 0);
INSERT INTO `tb_menu` VALUES (325, 310, '更新去处', NULL, 'consumer:update', 'el-icon-star-off', '1', 1, '2020-04-27 17:00:18', '2020-04-27 17:00:18', 1, 1);
INSERT INTO `tb_menu` VALUES (326, 230, '添加入库', '', 'inStock:in', 'el-icon-plus', '1', 3, '2020-04-27 17:07:04', '2020-08-19 17:57:15', 1, 1);
INSERT INTO `tb_menu` VALUES (328, 230, '入库明细', NULL, 'inStock:detail', 'el-icon-zoom-in', '1', 2, '2020-04-27 17:08:25', '2020-04-27 17:08:25', 1, 0);
INSERT INTO `tb_menu` VALUES (329, 4, '导出菜单', NULL, 'menu:export', 'el-icon-edit', '1', 1, '2020-04-27 17:26:40', '2020-04-27 17:26:40', 1, 0);
INSERT INTO `tb_menu` VALUES (331, 267, '删除物资', NULL, 'product:delete', 'el-icon-delete', '1', 1, '2020-04-30 18:27:02', '2020-04-30 19:05:31', 1, 0);
INSERT INTO `tb_menu` VALUES (332, 267, '回收物资', '', 'product:remove', 'el-icon-remove', '1', 1, '2020-04-30 18:56:48', '2020-04-30 18:56:48', 1, 1);
INSERT INTO `tb_menu` VALUES (333, 267, '物资审核', NULL, 'product:publish', 'el-icon-edit', '1', 1, '2020-04-30 18:58:38', '2020-04-30 19:05:42', 1, 0);
INSERT INTO `tb_menu` VALUES (336, 267, '物资还原', NULL, 'product:back', 'el-icon-top-left', '1', 1, '2020-04-30 19:06:22', '2020-04-30 19:06:22', 1, 0);
INSERT INTO `tb_menu` VALUES (337, 230, '入库回收', '', 'inStock:remove', 'el-icon-remove', '1', 3, '2020-04-30 19:12:56', '2020-08-19 17:57:55', 1, 1);
INSERT INTO `tb_menu` VALUES (338, 230, '入库审核', NULL, 'inStock:publish', 'el-icon-edit', '1', 2, '2020-04-30 19:13:32', '2020-08-19 17:57:32', 1, 0);
INSERT INTO `tb_menu` VALUES (339, 230, '删除记录', NULL, 'inStock:delete', 'el-icon-delete', '1', 4, '2020-04-30 19:14:03', '2020-08-19 17:57:42', 1, 0);
INSERT INTO `tb_menu` VALUES (340, 230, '入库还原', '', 'inStock:back', 'el-icon-d-arrow-left', '1', 3, '2020-04-30 19:17:27', '2020-08-19 17:57:49', 1, 0);
INSERT INTO `tb_menu` VALUES (341, 295, '个人博客', '/blog', '', 'el-icon-view', '0', 1, '2020-05-07 19:34:31', '2020-05-07 19:34:31', 1, 0);
INSERT INTO `tb_menu` VALUES (343, 304, '健康上报', '', 'health:report', 'el-icon-edit', '1', 1, '2020-05-14 20:21:09', '2020-05-14 20:21:09', 1, 0);

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NULL DEFAULT 1 COMMENT '是否可用,0:不可用，1：可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (77, 'Redis监控员', '负责Redis模块', '2019-06-14 20:49:22', '2019-11-11 16:46:57', 1);
INSERT INTO `tb_role` VALUES (78, '系统监控员', '负责整个系统监控模块', '2019-06-14 00:00:00', '2020-05-29 17:14:02', 1);
INSERT INTO `tb_role` VALUES (79, '跑批人员', '负责任务调度跑批模块', '2019-06-14 20:51:02', '2019-11-16 10:42:54', 1);
INSERT INTO `tb_role` VALUES (80, '开发人员', '拥有代码生成模块的权限', '2019-06-14 20:51:26', '2019-11-11 16:47:05', 1);
INSERT INTO `tb_role` VALUES (125, '测试用户', '测试用户', '2019-11-15 18:59:19', '2019-11-15 18:59:19', 1);
INSERT INTO `tb_role` VALUES (126, 'admin333', '美国校队队长', '2019-11-22 00:00:00', '2020-05-29 17:04:38', 1);
INSERT INTO `tb_role` VALUES (135, '用户添加人员', '只拥有用户添加的权限', '2020-03-11 02:39:57', '2020-03-11 02:39:57', 1);
INSERT INTO `tb_role` VALUES (136, '进货员', '采购口罩的帅哥，拥有采购商品的权限', '2020-03-11 00:00:00', '2020-03-11 03:12:38', 1);
INSERT INTO `tb_role` VALUES (137, 'linux运维人员', '负责产品的运维。', '2020-03-11 03:13:29', '2020-03-11 03:13:29', 1);
INSERT INTO `tb_role` VALUES (138, '测试员工', '登入测试系统的员工，无删除，无修改权限', '2020-03-14 04:57:52', '2020-03-14 04:57:52', 1);
INSERT INTO `tb_role` VALUES (139, '辅导员老师', '可以查看学生健康报备的详细情况', '2020-03-15 05:15:31', '2020-03-15 05:15:31', 1);
INSERT INTO `tb_role` VALUES (140, '部门主任', '系主任，管理院系。', '2020-03-15 00:00:00', '2020-05-16 18:33:28', 1);
INSERT INTO `tb_role` VALUES (141, '物资入库操作员', '角色拥有物资管理入库的权限', '2020-03-24 00:00:00', '2020-03-24 10:23:36', 1);
INSERT INTO `tb_role` VALUES (143, '超级管理员', '拥有系统的最高权限', '2020-04-21 10:34:12', '2020-04-21 10:34:12', 1);

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单/按钮ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES (125, 253);
INSERT INTO `tb_role_menu` VALUES (125, 226);
INSERT INTO `tb_role_menu` VALUES (125, 234);
INSERT INTO `tb_role_menu` VALUES (125, 239);
INSERT INTO `tb_role_menu` VALUES (125, 240);
INSERT INTO `tb_role_menu` VALUES (125, 256);
INSERT INTO `tb_role_menu` VALUES (125, 258);
INSERT INTO `tb_role_menu` VALUES (125, 317);
INSERT INTO `tb_role_menu` VALUES (125, 254);
INSERT INTO `tb_role_menu` VALUES (125, 321);
INSERT INTO `tb_role_menu` VALUES (125, 4);
INSERT INTO `tb_role_menu` VALUES (125, 247);
INSERT INTO `tb_role_menu` VALUES (125, 301);
INSERT INTO `tb_role_menu` VALUES (125, 329);
INSERT INTO `tb_role_menu` VALUES (125, 249);
INSERT INTO `tb_role_menu` VALUES (125, 250);
INSERT INTO `tb_role_menu` VALUES (125, 235);
INSERT INTO `tb_role_menu` VALUES (125, 251);
INSERT INTO `tb_role_menu` VALUES (125, 255);
INSERT INTO `tb_role_menu` VALUES (125, 259);
INSERT INTO `tb_role_menu` VALUES (125, 260);
INSERT INTO `tb_role_menu` VALUES (125, 241);
INSERT INTO `tb_role_menu` VALUES (125, 242);
INSERT INTO `tb_role_menu` VALUES (125, 261);
INSERT INTO `tb_role_menu` VALUES (125, 262);
INSERT INTO `tb_role_menu` VALUES (125, 263);
INSERT INTO `tb_role_menu` VALUES (125, 264);
INSERT INTO `tb_role_menu` VALUES (125, 265);
INSERT INTO `tb_role_menu` VALUES (125, 320);
INSERT INTO `tb_role_menu` VALUES (125, 312);
INSERT INTO `tb_role_menu` VALUES (125, 229);
INSERT INTO `tb_role_menu` VALUES (125, 230);
INSERT INTO `tb_role_menu` VALUES (125, 326);
INSERT INTO `tb_role_menu` VALUES (125, 337);
INSERT INTO `tb_role_menu` VALUES (125, 338);
INSERT INTO `tb_role_menu` VALUES (125, 339);
INSERT INTO `tb_role_menu` VALUES (125, 340);
INSERT INTO `tb_role_menu` VALUES (125, 328);
INSERT INTO `tb_role_menu` VALUES (125, 267);
INSERT INTO `tb_role_menu` VALUES (125, 274);
INSERT INTO `tb_role_menu` VALUES (125, 278);
INSERT INTO `tb_role_menu` VALUES (125, 331);
INSERT INTO `tb_role_menu` VALUES (125, 332);
INSERT INTO `tb_role_menu` VALUES (125, 333);
INSERT INTO `tb_role_menu` VALUES (125, 336);
INSERT INTO `tb_role_menu` VALUES (125, 276);
INSERT INTO `tb_role_menu` VALUES (125, 277);
INSERT INTO `tb_role_menu` VALUES (125, 268);
INSERT INTO `tb_role_menu` VALUES (125, 283);
INSERT INTO `tb_role_menu` VALUES (125, 284);
INSERT INTO `tb_role_menu` VALUES (125, 286);
INSERT INTO `tb_role_menu` VALUES (125, 285);
INSERT INTO `tb_role_menu` VALUES (125, 270);
INSERT INTO `tb_role_menu` VALUES (125, 316);
INSERT INTO `tb_role_menu` VALUES (125, 311);
INSERT INTO `tb_role_menu` VALUES (125, 310);
INSERT INTO `tb_role_menu` VALUES (125, 323);
INSERT INTO `tb_role_menu` VALUES (125, 324);
INSERT INTO `tb_role_menu` VALUES (125, 325);
INSERT INTO `tb_role_menu` VALUES (125, 322);
INSERT INTO `tb_role_menu` VALUES (125, 269);
INSERT INTO `tb_role_menu` VALUES (125, 279);
INSERT INTO `tb_role_menu` VALUES (125, 280);
INSERT INTO `tb_role_menu` VALUES (125, 281);
INSERT INTO `tb_role_menu` VALUES (125, 282);
INSERT INTO `tb_role_menu` VALUES (125, 303);
INSERT INTO `tb_role_menu` VALUES (125, 273);
INSERT INTO `tb_role_menu` VALUES (125, 304);
INSERT INTO `tb_role_menu` VALUES (125, 343);
INSERT INTO `tb_role_menu` VALUES (125, 305);
INSERT INTO `tb_role_menu` VALUES (125, 272);
INSERT INTO `tb_role_menu` VALUES (125, 295);
INSERT INTO `tb_role_menu` VALUES (125, 297);
INSERT INTO `tb_role_menu` VALUES (125, 298);
INSERT INTO `tb_role_menu` VALUES (125, 341);
INSERT INTO `tb_role_menu` VALUES (125, 296);
INSERT INTO `tb_role_menu` VALUES (125, 318);
INSERT INTO `tb_role_menu` VALUES (125, 5);
INSERT INTO `tb_role_menu` VALUES (125, 271);
INSERT INTO `tb_role_menu` VALUES (125, 299);
INSERT INTO `tb_role_menu` VALUES (125, 300);
INSERT INTO `tb_role_menu` VALUES (125, 307);
INSERT INTO `tb_role_menu` VALUES (125, 308);
INSERT INTO `tb_role_menu` VALUES (125, 309);
INSERT INTO `tb_role_menu` VALUES (125, 1);
INSERT INTO `tb_role_menu` VALUES (77, 321);
INSERT INTO `tb_role_menu` VALUES (77, 1);
INSERT INTO `tb_role_menu` VALUES (0, 253);
INSERT INTO `tb_role_menu` VALUES (0, 234);
INSERT INTO `tb_role_menu` VALUES (0, 240);
INSERT INTO `tb_role_menu` VALUES (0, 256);
INSERT INTO `tb_role_menu` VALUES (0, 258);
INSERT INTO `tb_role_menu` VALUES (0, 317);
INSERT INTO `tb_role_menu` VALUES (0, 254);
INSERT INTO `tb_role_menu` VALUES (0, 321);
INSERT INTO `tb_role_menu` VALUES (0, 4);
INSERT INTO `tb_role_menu` VALUES (0, 247);
INSERT INTO `tb_role_menu` VALUES (0, 301);
INSERT INTO `tb_role_menu` VALUES (0, 329);
INSERT INTO `tb_role_menu` VALUES (0, 249);
INSERT INTO `tb_role_menu` VALUES (0, 250);
INSERT INTO `tb_role_menu` VALUES (0, 235);
INSERT INTO `tb_role_menu` VALUES (0, 251);
INSERT INTO `tb_role_menu` VALUES (0, 255);
INSERT INTO `tb_role_menu` VALUES (0, 259);
INSERT INTO `tb_role_menu` VALUES (0, 260);
INSERT INTO `tb_role_menu` VALUES (0, 241);
INSERT INTO `tb_role_menu` VALUES (0, 242);
INSERT INTO `tb_role_menu` VALUES (0, 261);
INSERT INTO `tb_role_menu` VALUES (0, 262);
INSERT INTO `tb_role_menu` VALUES (0, 263);
INSERT INTO `tb_role_menu` VALUES (0, 264);
INSERT INTO `tb_role_menu` VALUES (0, 265);
INSERT INTO `tb_role_menu` VALUES (0, 320);
INSERT INTO `tb_role_menu` VALUES (0, 312);
INSERT INTO `tb_role_menu` VALUES (0, 229);
INSERT INTO `tb_role_menu` VALUES (0, 230);
INSERT INTO `tb_role_menu` VALUES (0, 326);
INSERT INTO `tb_role_menu` VALUES (0, 337);
INSERT INTO `tb_role_menu` VALUES (0, 338);
INSERT INTO `tb_role_menu` VALUES (0, 339);
INSERT INTO `tb_role_menu` VALUES (0, 340);
INSERT INTO `tb_role_menu` VALUES (0, 328);
INSERT INTO `tb_role_menu` VALUES (0, 267);
INSERT INTO `tb_role_menu` VALUES (0, 274);
INSERT INTO `tb_role_menu` VALUES (0, 278);
INSERT INTO `tb_role_menu` VALUES (0, 331);
INSERT INTO `tb_role_menu` VALUES (0, 332);
INSERT INTO `tb_role_menu` VALUES (0, 333);
INSERT INTO `tb_role_menu` VALUES (0, 336);
INSERT INTO `tb_role_menu` VALUES (0, 276);
INSERT INTO `tb_role_menu` VALUES (0, 277);
INSERT INTO `tb_role_menu` VALUES (0, 268);
INSERT INTO `tb_role_menu` VALUES (0, 283);
INSERT INTO `tb_role_menu` VALUES (0, 284);
INSERT INTO `tb_role_menu` VALUES (0, 286);
INSERT INTO `tb_role_menu` VALUES (0, 285);
INSERT INTO `tb_role_menu` VALUES (0, 270);
INSERT INTO `tb_role_menu` VALUES (0, 316);
INSERT INTO `tb_role_menu` VALUES (0, 311);
INSERT INTO `tb_role_menu` VALUES (0, 310);
INSERT INTO `tb_role_menu` VALUES (0, 323);
INSERT INTO `tb_role_menu` VALUES (0, 324);
INSERT INTO `tb_role_menu` VALUES (0, 325);
INSERT INTO `tb_role_menu` VALUES (0, 322);
INSERT INTO `tb_role_menu` VALUES (0, 269);
INSERT INTO `tb_role_menu` VALUES (0, 279);
INSERT INTO `tb_role_menu` VALUES (0, 280);
INSERT INTO `tb_role_menu` VALUES (0, 281);
INSERT INTO `tb_role_menu` VALUES (0, 282);
INSERT INTO `tb_role_menu` VALUES (0, 303);
INSERT INTO `tb_role_menu` VALUES (0, 273);
INSERT INTO `tb_role_menu` VALUES (0, 304);
INSERT INTO `tb_role_menu` VALUES (0, 343);
INSERT INTO `tb_role_menu` VALUES (0, 305);
INSERT INTO `tb_role_menu` VALUES (0, 272);
INSERT INTO `tb_role_menu` VALUES (0, 295);
INSERT INTO `tb_role_menu` VALUES (0, 297);
INSERT INTO `tb_role_menu` VALUES (0, 298);
INSERT INTO `tb_role_menu` VALUES (0, 341);
INSERT INTO `tb_role_menu` VALUES (0, 296);
INSERT INTO `tb_role_menu` VALUES (0, 318);
INSERT INTO `tb_role_menu` VALUES (0, 5);
INSERT INTO `tb_role_menu` VALUES (0, 271);
INSERT INTO `tb_role_menu` VALUES (0, 299);
INSERT INTO `tb_role_menu` VALUES (0, 300);
INSERT INTO `tb_role_menu` VALUES (0, 307);
INSERT INTO `tb_role_menu` VALUES (0, 308);
INSERT INTO `tb_role_menu` VALUES (0, 309);
INSERT INTO `tb_role_menu` VALUES (0, 1);
INSERT INTO `tb_role_menu` VALUES (0, 226);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `status` int(11) NOT NULL COMMENT '状态 0锁定 1有效',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '0:超级管理员，1：系统用户',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `birth` date NULL DEFAULT NULL,
  `department_id` bigint(20) NULL DEFAULT 1 COMMENT '部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', 'nickname', '123@qq.com', '', '18530139658', 1, '2022-06-01 21:12:16', '2022-06-01 22:19:12', 0, 'cfbf6d34-d3e4-4653-86f0-e33d4595d52b', 0, 'd7b9c28cac022955cff27947eafce0ad', '2022-06-01', 1);
INSERT INTO `tb_user` VALUES (199, 'use2', 'name2', '185369@qq.com', 'http://badidol.com/uploads/images/avatars/201910/24/18_1571921832_HG9E55x9NY.jpg', '18569325478', 1, '2022-06-27 15:40:28', '2022-06-27 15:40:28', 1, 'b160e75e-589e-46c5-9f9a-ef9dd7ae', 1, '8f93ac15300924f407abbbd5c954c10e', '2022-06-01', 1);

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES (194, 125);
INSERT INTO `tb_user_role` VALUES (196, 0);
INSERT INTO `tb_user_role` VALUES (199, 135);

SET FOREIGN_KEY_CHECKS = 1;
