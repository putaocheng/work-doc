/*
 Navicat Premium Dump SQL

 Source Server         : 交易所（重构）
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44-log)
 Source Host           : 45.135.237.37:3306
 Source Schema         : gear_finance

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44-log)
 File Encoding         : 65001

 Date: 19/08/2025 02:21:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-10-23 07:43:25', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-10-23 07:43:25', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-10-23 07:43:25', '', NULL, '');
INSERT INTO `sys_job` VALUES (4, '同步现价', 'DEFAULT', 'SyncFinanceTask.syncCurrentInfo', '* * * * * ?', '1', '0', '1', 'admin', '2023-11-18 22:57:49', 'admin', '2025-07-29 00:16:43', '');
INSERT INTO `sys_job` VALUES (5, '同步每分钟k线', 'SYSTEM', 'SyncFinanceTask.syncKvalueby1', '1 * * * * ?', '1', '1', '1', 'admin', '2023-11-23 14:34:58', 'admin', '2025-07-27 17:26:47', '');
INSERT INTO `sys_job` VALUES (6, '同步5分钟k线', 'DEFAULT', 'SyncFinanceTask.syncKvalueby5', '6 0/5 * * * ?', '1', '1', '1', 'admin', '2023-11-23 14:49:25', '', '2025-07-27 17:26:49', '');
INSERT INTO `sys_job` VALUES (7, '同步15分钟k线', 'DEFAULT', 'SyncFinanceTask.syncKvalueby15', '12 0/15 * * * ?', '1', '1', '1', 'admin', '2023-11-23 14:51:25', 'admin', '2025-07-27 17:26:50', '');
INSERT INTO `sys_job` VALUES (8, '同步每30分钟', 'DEFAULT', 'SyncFinanceTask.syncKvalueby30', '18 0/30 * * * ?', '1', '0', '1', 'admin', '2023-11-23 14:52:59', 'admin', '2025-07-27 17:26:52', '');
INSERT INTO `sys_job` VALUES (9, '同步每60分钟k线', 'DEFAULT', 'SyncFinanceTask.syncKvalueby60', '31 0 * * * ?', '1', '1', '1', 'admin', '2023-11-23 14:53:46', 'admin', '2025-07-27 17:26:53', '');
INSERT INTO `sys_job` VALUES (10, '同步每日k线', 'DEFAULT', 'SyncFinanceTask.syncKvaluebyD', '42 0 0 * * ?', '1', '0', '1', 'admin', '2023-11-23 14:55:35', 'admin', '2025-07-27 17:26:55', '');
INSERT INTO `sys_job` VALUES (11, '同步每周k线', 'DEFAULT', 'SyncFinanceTask.syncKvaluebyW', '56 0 0 ? * 7-7', '1', '1', '1', 'admin', '2023-11-23 14:58:13', 'admin', '2025-07-27 17:26:56', '');
INSERT INTO `sys_job` VALUES (12, '同步每月k线', 'DEFAULT', 'SyncFinanceTask.syncKvaluebyM', '0 0 0 1 * ?', '1', '1', '1', 'admin', '2023-11-23 14:59:52', '', '2025-07-27 17:26:59', '');
INSERT INTO `sys_job` VALUES (13, '分润和贷款', 'DEFAULT', 'BearingTask.BearingTask', '9,47 * * * * ?', '1', '1', '0', 'admin', '2023-12-04 18:15:49', 'admin', '2024-04-02 22:48:31', '9,47 * * * * ?');
INSERT INTO `sys_job` VALUES (14, '分润补偿机制', 'DEFAULT', 'BearingTask.profitCompensate', '6 1 1/3 * * ?', '1', '1', '0', 'admin', '2024-04-22 10:39:40', '', '2024-04-22 10:39:45', '6 1 1/3 * * ?');
INSERT INTO `sys_job` VALUES (16, '同步1分钟k线（新版）', 'DEFAULT', 'refactoredSyncFinanceTask.syncKvalueby1', '1 * * * * ?', '1', '0', '0', 'admin', '2025-07-27 17:17:23', 'admin', '2025-07-27 17:27:04', '');
INSERT INTO `sys_job` VALUES (17, '同步5分钟k线（新版）', 'DEFAULT', 'refactoredSyncFinanceTask.syncKvalueby5', '6 0/5 * * * ?', '1', '0', '0', 'admin', '2025-07-27 17:18:13', 'admin', '2025-07-27 17:27:05', '');
INSERT INTO `sys_job` VALUES (18, '同步15分钟k线（新版）', 'DEFAULT', 'refactoredSyncFinanceTask.syncKvalueby15', '12 0/15 * * * ?', '1', '0', '0', 'admin', '2025-07-27 17:18:53', 'admin', '2025-07-27 17:27:07', '');
INSERT INTO `sys_job` VALUES (19, '同步30分钟k线（新版）', 'DEFAULT', 'refactoredSyncFinanceTask.syncKvalueby30', '18 0/30 * * * ?', '1', '1', '0', 'admin', '2025-07-27 17:19:26', 'admin', '2025-07-27 17:27:08', '');
INSERT INTO `sys_job` VALUES (20, '同步60分钟k线（新版）', 'DEFAULT', 'refactoredSyncFinanceTask.syncKvalueby60', '31 0 * * * ?', '1', '0', '0', 'admin', '2025-07-27 17:20:39', 'admin', '2025-07-27 17:27:10', '');
INSERT INTO `sys_job` VALUES (21, '同步日k线（新版）', 'DEFAULT', 'refactoredSyncFinanceTask.syncKvaluebyDay', '42 * 0/1 * * ?', '1', '0', '0', 'admin', '2025-07-27 17:22:20', 'admin', '2025-08-05 02:12:31', '');
INSERT INTO `sys_job` VALUES (22, '同步周k线（新版）', 'DEFAULT', 'refactoredSyncFinanceTask.syncKvaluebyWeek', '56 0 0 ? * 7-7', '1', '0', '0', 'admin', '2025-07-27 17:23:41', 'admin', '2025-08-02 12:38:16', '');
INSERT INTO `sys_job` VALUES (23, '同步月k线（新版）', 'DEFAULT', 'refactoredSyncFinanceTask.syncKvaluebyMonth', '0 0 0 1 * ?', '1', '1', '0', 'admin', '2025-07-27 17:24:53', 'admin', '2025-08-02 12:38:24', '');
INSERT INTO `sys_job` VALUES (24, '加密货币的tick数据（新版）', 'DEFAULT', 'refactoredSyncFinanceTask.syncCryptoTickData', '* * * * * ?', '1', '1', '0', 'admin', '2025-07-29 00:16:39', '', '2025-07-29 00:16:47', '');
INSERT INTO `sys_job` VALUES (26, '同步实时数据', 'DEFAULT', 'refactoredSyncFinanceTask.syncCurrentInfo', '0/2 * * * * ?', '1', '1', '0', 'admin', '2025-08-01 00:01:03', '', '2025-08-01 00:01:08', '');
INSERT INTO `sys_job` VALUES (27, '期权订单定时结算', 'DEFAULT', 'optionsSettlementTask.processExpiredOptions', '0/1 * * * * ?', '1', '1', '0', 'admin', '2025-08-15 10:03:26', '', '2025-08-15 10:03:32', '');

SET FOREIGN_KEY_CHECKS = 1;
