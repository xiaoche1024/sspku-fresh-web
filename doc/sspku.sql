/*
 Navicat MySQL Data Transfer

 Source Server         : king
 Source Server Version : 50638
 Source Host           : 39.106.111.60
 Source Database       : sspku

 Target Server Version : 50638
 File Encoding         : utf-8

 Date: 08/18/2019 21:54:31 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `nick_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
--  Records of `tb_user`
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES ('1', 'admin', '123456', '13918891675', 'mmc@163.com', '男', '管理员'), ('2', 'lisi2', '123456', '13918891675', 'mmc@163.com', 'm', 'lisi1'), ('3', 'lisi3', '123456', '13918891675', 'mmc@163.com', 'm', 'lisi1'), ('4', 'lisi4', '123456', '13918891675', 'mmc@163.com', 'm', 'lisi1'), ('5', 'lisi5', '123456', '13918891675', 'mmc@163.com', 'm', 'lisi1'), ('6', 'lisi6', '123456', '13918891675', 'mmc@163.com', 'm', 'lisi1'), ('7', 'lisi7', '123456', '13918891675', 'mmc@163.com', 'm', 'lisi1'), ('8', 'lisi8', '123456', '13918891675', 'mmc@163.com', 'm', 'lisi1'), ('9', 'lisi9', '123456', '13918891675', 'mmc@163.com', 'm', 'lisi1'), ('10', 'lisi10', '123456', '13918891675', 'mmc@163.com', 'm', 'lisi1'), ('11', 'lisi11', '123456', '13918891675', 'mmc@163.com', 'm', 'lisi1'), ('12', 'lisi12', '123456', '13918891675', 'mmc@163.com', 'm', 'lisi1'), ('13', 'lisi13', '123456', '13918891675', 'mmc@163.com', 'm', 'lisi1'), ('14', 'lisi14', '123456', '13918891675', 'mmc@163.com', 'm', 'lisi1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
