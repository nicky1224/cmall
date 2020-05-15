/*
SQLyog Trial v11.51 (64 bit)
MySQL - 8.0.12 : Database - cmall_uac
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cmall_uac` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `cmall_uac`;

/*Table structure for table `DATABASECHANGELOG` */

DROP TABLE IF EXISTS `DATABASECHANGELOG`;

CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `DATABASECHANGELOG` */

insert  into `DATABASECHANGELOG`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('init-schema','chilangedu','classpath:liquibase/change_log/2017-06-10-init-schema.xml','2019-12-17 16:42:13',1,'EXECUTED','7:cebd02a08a9ed3d700e360cd5d26bb72','createTable tableName=user','init schema',NULL,'3.5.3',NULL,NULL,'6572133352');

/*Table structure for table `DATABASECHANGELOGLOCK` */

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;

CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `DATABASECHANGELOGLOCK` */

insert  into `DATABASECHANGELOGLOCK`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values (1,'\0',NULL,NULL);

/*Table structure for table `pc_mq_message_data` */

DROP TABLE IF EXISTS `pc_mq_message_data`;

CREATE TABLE `pc_mq_message_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `message_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '消息key',
  `message_topic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'topic',
  `message_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'tag',
  `message_body` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '消息内容',
  `message_type` int(11) DEFAULT '10' COMMENT '消息类型: 10 - 生产者 ; 20 - 消费者',
  `delay_level` int(11) DEFAULT '0' COMMENT '延时级别 1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h',
  `order_type` int(11) DEFAULT '0' COMMENT '顺序类型 0有序 1无序',
  `status` int(11) DEFAULT '10' COMMENT '消息状态',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` int(11) DEFAULT '0' COMMENT '是否删除 -0 未删除 -1 已删除',
  PRIMARY KEY (`id`),
  KEY `idx_message_key` (`message_key`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=869546686618272769 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='消息记录表';

/*Data for the table `pc_mq_message_data` */

insert  into `pc_mq_message_data`(`id`,`version`,`message_key`,`message_topic`,`message_tag`,`message_body`,`message_type`,`delay_level`,`order_type`,`status`,`creator`,`creator_id`,`created_time`,`last_operator`,`last_operator_id`,`update_time`,`yn`) values (867532455932855296,0,'SEND_EMAIL_TOPIC_ACTIVE_USER_[1026955967@qq.com]-93711333','SEND_EMAIL_TOPIC','ACTIVE_USER','{\"subject\":\"注册用户-等待激活用户\",\"text\":\"<html>\\r\\n<body>\\r\\n<h3>尊敬的,  admin123, 您好!</h3>\\r\\n\\r\\n感谢您注册快乐学习网，点击下面按钮以验证你的电子邮箱\\r\\n\\r\\n<a href=\\\"http://dev-api.cmall.net:7978/uac/auth/activeUser/cfb061c579b64b808ac598e799b9ee9a867532017602921472\\\">验证电子邮箱</a>\\r\\n\\r\\n如果你无法通过上面按钮验证电子邮箱，请点击下面的链接或者把它复制到浏览器地址栏。\\r\\n\\r\\nhttp://dev-api.cmall.net:7978/uac/auth/activeUser/cfb061c579b64b808ac598e799b9ee9a867532017602921472\\r\\n\\r\\n\\r\\n欢迎您使用cmall快乐学习网, 祝您生活愉快.\\r\\n\\r\\n如果您有任何问题或建议, 请发送邮件到：cmall.net@gmail.com\\r\\n\\r\\ncmall.net\\r\\n2020-04-11 23:11:15\\r\\n\\r\\n</body>\\r\\n</html>\",\"to\":[\"1026955967@qq.com\"]}',10,0,0,10,NULL,NULL,'2020-04-11 23:11:44',NULL,NULL,'2020-04-11 23:11:44',0),(867536754037490688,0,'SEND_EMAIL_TOPIC_ACTIVE_USER_SUCCESS_[1026955967@qq.com]-991187694','SEND_EMAIL_TOPIC','ACTIVE_USER_SUCCESS','{\"subject\":\"注册用户-激活用户成功\",\"text\":\"<html>\\r\\n<body>\\r\\n<h3>尊敬的,  admin123, 您好!</h3>\\r\\n\\r\\n欢迎加入快乐学习网！\\r\\n\\r\\n您在快乐学习网注册用户已激活成功。\\r\\n\\r\\n欢迎您使用cmall快乐学习网, 祝您生活愉快.\\r\\n\\r\\n如果您有任何问题或建议, 请发送邮件到：cmall.net@gmail.com\\r\\n\\r\\ncmall.net\\r\\n2020-04-11 23:20:26\\r\\n\\r\\n</body>\\r\\n</html>\",\"to\":[\"1026955967@qq.com\"]}',10,0,0,10,NULL,NULL,'2020-04-11 23:20:17',NULL,NULL,'2020-04-11 23:20:17',0),(869541132017599488,0,'SEND_EMAIL_TOPIC_ACTIVE_USER_[865923857@qq.com]--519188130','SEND_EMAIL_TOPIC','ACTIVE_USER','{\"subject\":\"注册用户-等待激活用户\",\"text\":\"<html>\\r\\n<body>\\r\\n<h3>尊敬的,  abcd, 您好!</h3>\\r\\n\\r\\n感谢您注册快乐学习网，点击下面按钮以验证你的电子邮箱\\r\\n\\r\\n<a href=\\\"http://dev-api.chilangedu.com:7978/uac/auth/activeUser/74af2e30b6a44cfc870b426a7b92af3f869541131573003264\\\">验证电子邮箱</a>\\r\\n\\r\\n如果你无法通过上面按钮验证电子邮箱，请点击下面的链接或者把它复制到浏览器地址栏。\\r\\n\\r\\nhttp://dev-api.chilangedu.com:7978/uac/auth/activeUser/74af2e30b6a44cfc870b426a7b92af3f869541131573003264\\r\\n\\r\\n\\r\\n欢迎您使用cmall快乐学习网, 祝您生活愉快.\\r\\n\\r\\n如果您有任何问题或建议, 请发送邮件到：cmall.net@gmail.com\\r\\n\\r\\ncmall.net\\r\\n2020-04-14 17:43:00\\r\\n\\r\\n</body>\\r\\n</html>\",\"to\":[\"865923857@qq.com\"]}',10,0,0,10,NULL,NULL,'2020-04-14 17:42:58',NULL,NULL,'2020-04-14 17:42:58',0),(869541881975931904,0,'SEND_EMAIL_TOPIC_ACTIVE_USER_SUCCESS_[865923857@qq.com]-874585677','SEND_EMAIL_TOPIC','ACTIVE_USER_SUCCESS','{\"subject\":\"注册用户-激活用户成功\",\"text\":\"<html>\\r\\n<body>\\r\\n<h3>尊敬的,  abcd, 您好!</h3>\\r\\n\\r\\n欢迎加入快乐学习网！\\r\\n\\r\\n您在快乐学习网注册用户已激活成功。\\r\\n\\r\\n欢迎您使用cmall快乐学习网, 祝您生活愉快.\\r\\n\\r\\n如果您有任何问题或建议, 请发送邮件到：cmall.net@gmail.com\\r\\n\\r\\ncmall.net\\r\\n2020-04-14 17:44:29\\r\\n\\r\\n</body>\\r\\n</html>\",\"to\":[\"865923857@qq.com\"]}',10,0,0,10,NULL,NULL,'2020-04-14 17:44:27',NULL,NULL,'2020-04-14 17:44:27',0),(869546499686532096,0,'SEND_EMAIL_TOPIC_ACTIVE_USER_[1026955967@qq.com]--338989553','SEND_EMAIL_TOPIC','ACTIVE_USER','{\"subject\":\"注册用户-等待激活用户\",\"text\":\"<html>\\r\\n<body>\\r\\n<h3>尊敬的,  abcde, 您好!</h3>\\r\\n\\r\\n感谢您注册快乐学习网，点击下面按钮以验证你的电子邮箱\\r\\n\\r\\n<a href=\\\"http://dev-api.chilangedu.com:7978/uac/auth/activeUser/9e0f76101faa4221b9500d91d9a4fb0e869546499644589056\\\">验证电子邮箱</a>\\r\\n\\r\\n如果你无法通过上面按钮验证电子邮箱，请点击下面的链接或者把它复制到浏览器地址栏。\\r\\n\\r\\nhttp://dev-api.chilangedu.com:7978/uac/auth/activeUser/9e0f76101faa4221b9500d91d9a4fb0e869546499644589056\\r\\n\\r\\n\\r\\n欢迎您使用cmall快乐学习网, 祝您生活愉快.\\r\\n\\r\\n如果您有任何问题或建议, 请发送邮件到：cmall.net@gmail.com\\r\\n\\r\\ncmall.net\\r\\n2020-04-14 17:53:40\\r\\n\\r\\n</body>\\r\\n</html>\",\"to\":[\"1026955967@qq.com\"]}',10,0,0,10,NULL,NULL,'2020-04-14 17:53:38',NULL,NULL,'2020-04-14 17:53:38',0),(869546686618272768,0,'SEND_EMAIL_TOPIC_ACTIVE_USER_SUCCESS_[1026955967@qq.com]-1297513989','SEND_EMAIL_TOPIC','ACTIVE_USER_SUCCESS','{\"subject\":\"注册用户-激活用户成功\",\"text\":\"<html>\\r\\n<body>\\r\\n<h3>尊敬的,  abcde, 您好!</h3>\\r\\n\\r\\n欢迎加入快乐学习网！\\r\\n\\r\\n您在快乐学习网注册用户已激活成功。\\r\\n\\r\\n欢迎您使用cmall快乐学习网, 祝您生活愉快.\\r\\n\\r\\n如果您有任何问题或建议, 请发送邮件到：cmall.net@gmail.com\\r\\n\\r\\ncmall.net\\r\\n2020-04-14 17:54:02\\r\\n\\r\\n</body>\\r\\n</html>\",\"to\":[\"1026955967@qq.com\"]}',10,0,0,10,NULL,NULL,'2020-04-14 17:54:00',NULL,NULL,'2020-04-14 17:54:00',0);

/*Table structure for table `pc_uac_UserConnection` */

DROP TABLE IF EXISTS `pc_uac_UserConnection`;

CREATE TABLE `pc_uac_UserConnection` (
  `userId` varchar(255) NOT NULL,
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(11) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(512) DEFAULT NULL,
  `imageUrl` varchar(512) DEFAULT NULL,
  `accessToken` varchar(512) NOT NULL,
  `secret` varchar(512) DEFAULT NULL,
  `refreshToken` varchar(512) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userId`,`providerId`,`providerUserId`),
  UNIQUE KEY `UserConnectionRank` (`userId`,`providerId`,`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pc_uac_UserConnection` */

insert  into `pc_uac_UserConnection`(`userId`,`providerId`,`providerUserId`,`sequence`,`displayName`,`profileUrl`,`imageUrl`,`accessToken`,`secret`,`refreshToken`,`expireTime`) values ('2f53f3b7cb364202b0c4d4c43677baf5','qq','E5CD93CD5DC7CCDD327F5CC22000C496',1,'一颗奔腾的心',NULL,'http://thirdqq.qlogo.cn/g?b=oidb&k=emWQ3lWq5xxm5BuGcRPl3A&s=40&t=1526534040','F8D68BFCE558E48EC7FF8DF6C3F8CC9B',NULL,'B5C1A1BF791832B68CE251F8D3FFDC21',1594477314621),('4e6adb9b84eb4b7e80a0b4250986e540','qq','23CC8775226F0C128C5F8910741F9582',1,'小狼',NULL,'http://thirdqq.qlogo.cn/g?b=oidb&k=RfichQE8hozwMMaes4QNYwg&s=40&t=1483356515','7693D45F63854B1634F178287F0FB607',NULL,'B5389EEB19D981CA85774E6C5037C7CE',1594804062339);

/*Table structure for table `pc_uac_action` */

DROP TABLE IF EXISTS `pc_uac_action`;

CREATE TABLE `pc_uac_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '资源路径',
  `action_name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限名称',
  `action_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_id` (`action_code`) USING BTREE,
  UNIQUE KEY `system_id_2` (`action_name`) USING BTREE,
  KEY `tbl_pms_action_ibfk_2` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=387606786523402241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='权限表';

/*Data for the table `pc_uac_action` */

insert  into `pc_uac_action`(`id`,`version`,`url`,`action_name`,`action_code`,`status`,`remark`,`menu_id`,`creator`,`creator_id`,`created_time`,`last_operator`,`last_operator_id`,`update_time`) values (100001,0,'/user/save','编辑用户','uac:user:save','ENABLE',NULL,1112,'admin',1,'2017-12-05 22:45:26','超级管理员',1,'2018-03-04 22:46:50'),(100005,0,'/role/save','编辑角色','add:role','ENABLE',NULL,1111,'admin',1,'2017-12-05 22:45:26','超级管理员',1,'2018-02-26 21:13:48'),(305772209559839744,0,'/uac/role/queryList','查看角色','uca:role:view','ENABLE','',1111,'超级管理员',1,'2018-02-26 21:14:48','超级管理员',1,'2018-02-26 21:15:01'),(308015564217918464,0,'/order/createOrderDoc/*','创建订单','omc:order:createOrderDoc','ENABLE','',386619669785743360,'超级管理员',1,'2018-03-01 23:31:57','超级管理员',1,'2018-03-01 23:31:57'),(308015817025397760,0,'/order/cancelOrderDoc/*','取消订单','cancelOrderDoc','ENABLE','',386619669785743360,'超级管理员',1,'2018-03-01 23:32:27','超级管理员',1,'2018-03-01 23:32:27'),(308016353694983168,0,'/shipping/addShipping','增加收货人地址','omc:shipping:addShipping','ENABLE','',386619554962477056,'超级管理员',1,'2018-03-01 23:33:31','超级管理员',1,'2018-03-01 23:33:31'),(308016771179226112,0,'/shipping/deleteShipping/*','删除收货地址','omc:shiping:deleteShipping','ENABLE','',386619554962477056,'超级管理员',1,'2018-03-01 23:34:20','超级管理员',1,'2018-03-01 23:34:20'),(308017000884478976,0,'/shipping/updateShipping/*','更新收货地址','omc:shipping:updateShipping','ENABLE','',386619554962477056,'超级管理员',1,'2018-03-01 23:34:48','超级管理员',1,'2018-03-01 23:34:48'),(308017290090128384,0,'/shipping/setDefaultAddress/*','设置默认地址','omc:shiping:setDefaultAddress','ENABLE','',386619554962477056,'超级管理员',1,'2018-03-01 23:35:22','超级管理员',1,'2018-03-01 23:35:22'),(308017803162559488,0,'/pay/createQrCodeImage/*','生成支付二维码','omc:pay:createQrCodeImage','ENABLE','',386619669785743360,'超级管理员',1,'2018-03-01 23:36:23','超级管理员',1,'2018-03-01 23:36:23'),(308018047321383936,0,'/pay/alipayCallback','支付宝支付回调','omc:pay:callback','ENABLE','',386619669785743360,'超级管理员',1,'2018-03-01 23:36:53','超级管理员',1,'2018-03-01 23:36:53'),(308027485310690304,0,'/cart/addProduct/**','向购物车添加商品','omc:cart:addProduct','ENABLE','',386619770943967232,'超级管理员',1,'2018-03-01 23:55:38','超级管理员',1,'2018-03-01 23:55:38'),(308027702659523584,0,'/cart/updateProduct/**','更新购物车商品','omc:cart:updateProduct','ENABLE','',386619770943967232,'超级管理员',1,'2018-03-01 23:56:04','超级管理员',1,'2018-03-01 23:56:04'),(308027958889554944,0,'/cart/deleteProduct/*','删除购物车商品','omc:cart:deleteProduct','ENABLE','',386619770943967232,'超级管理员',1,'2018-03-01 23:56:34','超级管理员',1,'2018-03-01 23:56:34'),(308028183234487296,0,'/cart/selectAllProduct','勾选全部购物车商品','omc:cart:selectAllProduct','ENABLE','',386619770943967232,'超级管理员',1,'2018-03-01 23:57:01','超级管理员',1,'2018-03-01 23:57:01'),(308028362683589632,0,'/cart/unSelectAllProduct','取消勾选全部购物车商品','omc:cart:unSelectAllProduct','ENABLE','',386619770943967232,'超级管理员',1,'2018-03-01 23:57:22','超级管理员',1,'2018-03-01 23:57:22'),(308028500382589952,0,'/cart/selectProduct/*','勾选购车商品','selectProduct','ENABLE','',386619770943967232,'超级管理员',1,'2018-03-01 23:57:39','超级管理员',1,'2018-03-01 23:57:39'),(308028676685964288,0,'/cart/unSelectProduct/*','取消勾选购物车商品','omc:cart:unSelectProduct','ENABLE','',386619770943967232,'超级管理员',1,'2018-03-01 23:58:00','超级管理员',1,'2018-03-01 23:58:00'),(308029015392789504,0,'/cart/updateInformation','更新用户信息','omc:cart:updateInformation','ENABLE','',386619770943967232,'超级管理员',1,'2018-03-01 23:58:40','超级管理员',1,'2018-03-01 23:58:40'),(308699944489853952,0,'/email/sendRestEmailCode','发送邮箱验证码','omc:emal:sendRestEmailCode','ENABLE','',386619669785743360,'超级管理员',1,'2018-03-02 22:11:41','超级管理员',1,'2018-03-02 22:11:41'),(310162739551020032,0,'/role/modifyRoleStatusById','修改角色状态','uac:role:modifyRoleStatusById','ENABLE','',1111,'超级管理员',1,'2018-03-04 22:38:00','超级管理员',1,'2018-03-04 22:38:00'),(310163207442408448,0,'/role/bindUser','角色绑定用户','uac:role:','ENABLE','',1111,'超级管理员',1,'2018-03-04 22:38:56','超级管理员',1,'2018-03-04 22:38:56'),(310164279170966528,0,'/role/bindMenu','角色绑定菜单','uac:role:bindMenu','ENABLE','',1111,'超级管理员',1,'2018-03-04 22:41:03','超级管理员',1,'2018-03-04 22:41:03'),(310165004122858496,0,'/role/bindAction','角色绑定权限','uac:role:bindAction','ENABLE','',1111,'超级管理员',1,'2018-03-04 22:42:30','超级管理员',1,'2018-03-04 22:42:30'),(310165760708191232,0,'/role/deleteRoleById/*','删除角色','uac:role:delete','ENABLE','',1111,'超级管理员',1,'2018-03-04 22:44:00','超级管理员',1,'2018-03-04 22:45:33'),(310166199331726336,0,'/role/batchDeleteByIdList','批量删除角色信息','uac:role:batchDelete','ENABLE','',1111,'超级管理员',1,'2018-03-04 22:44:52','超级管理员',1,'2018-03-04 22:44:52'),(310169052272141312,0,'/user/bindRole','用户绑定角色','uac:user:bindRole','ENABLE','',1112,'超级管理员',1,'2018-03-04 22:50:32','超级管理员',1,'2018-03-04 22:50:32'),(310169425665860608,0,'/user/resetLoginPwd','重置密码','uac:role:resetLoginPwd','ENABLE','',1112,'超级管理员',1,'2018-03-04 22:51:17','超级管理员',1,'2018-03-04 22:51:17'),(310170375616996352,0,'/user/modifyUserStatusById','修改用户状态','uac:user:modifyUserStatusById','ENABLE','',1112,'超级管理员',1,'2018-03-04 22:53:10','超级管理员',1,'2018-03-04 22:53:10'),(310170756283638784,0,'/menu/save','编辑菜单','uac:menu:save','ENABLE','',1113,'超级管理员',1,'2018-03-04 22:53:55','超级管理员',1,'2018-03-04 22:53:55'),(310171036865799168,0,'/menu/deleteById/*','删除菜单','uac:menu:deleteById','ENABLE','',1113,'超级管理员',1,'2018-03-04 22:54:29','超级管理员',1,'2018-03-04 22:54:29'),(310171256882209792,0,'/menu/modifyStatus','修改菜单状态','uac:menu:modifyStatus','ENABLE','',1113,'超级管理员',1,'2018-03-04 22:54:55','超级管理员',1,'2018-03-04 22:54:55'),(310173131350221824,0,'/group/save','编辑组织','uac:group:save','ENABLE','',1115,'超级管理员',1,'2018-03-04 22:58:39','超级管理员',1,'2018-03-04 22:58:39'),(310173627720934400,0,'/group/deleteById/*','删除组织','uac:group:deleteById','ENABLE','',1115,'超级管理员',1,'2018-03-04 22:59:38','超级管理员',1,'2018-03-04 22:59:38'),(310173991090267136,0,'/group/modifyStatus','修改组织状态','uac:group:modifyStatus','ENABLE','',1115,'超级管理员',1,'2018-03-04 23:00:21','超级管理员',1,'2018-03-04 23:00:21'),(310174242538791936,0,'/group/bindUser','组织绑定用户','uac:group:bindUser','ENABLE','',1115,'超级管理员',1,'2018-03-04 23:00:51','超级管理员',1,'2018-03-04 23:00:51'),(310175462569550848,0,'/dict/modifyStatus','修改数据字典状态','mdc:dict:modifyStatus','ENABLE','',399623736623501312,'超级管理员',1,'2018-03-04 23:03:17','超级管理员',1,'2018-03-04 23:03:17'),(310175718698918912,0,'/dict/save','编辑数据字典','mdc:dict:save','ENABLE','',399623736623501312,'超级管理员',1,'2018-03-04 23:03:47','超级管理员',1,'2018-03-04 23:03:47'),(310176044730557440,0,'/dict/deleteById/*','删除数据字典','mdc:dict:deleteById','ENABLE','',399623736623501312,'超级管理员',1,'2018-03-04 23:04:26','超级管理员',1,'2018-03-04 23:04:26'),(314332667841618944,0,'/omc/product/save','编辑商品','omc:product:save','ENABLE','',386619314180067328,'超级管理员',1,'2018-03-10 16:42:54','超级管理员',1,'2018-03-10 16:42:54'),(314333003402716160,0,'/omc/product/deleteProductById/*','删除商品','omc:product:delete','ENABLE','',386619314180067328,'超级管理员',1,'2018-03-10 16:43:34','超级管理员',1,'2018-03-10 16:43:34'),(314334713135244288,0,'/omc/category/deleteById/*','删除商品分类','omc:category:deleteById','ENABLE','',310861539236127744,'超级管理员',1,'2018-03-10 16:46:58','超级管理员',1,'2018-03-10 16:47:51'),(314335013246084096,0,'/omc/category/save','编辑商品分类','omc:category:save','ENABLE','',310861539236127744,'超级管理员',1,'2018-03-10 16:47:34','超级管理员',1,'2018-03-10 16:47:34'),(387558460746764288,0,'/action/queryListWithPage','查询权限列表','uac:action:list','ENABLE','查询权限列表',1114,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26'),(387560278130298880,0,'/action/save','保存权限','uac:action:add','ENABLE','新增或者修改权限',1114,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26'),(387560564760645632,0,'/action/deleteActionById/*','删除权限','uac:action:delete','ENABLE','删除权限',1114,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26'),(387561185391808512,0,'/action/modifyStatus','修改状态','uac:action:status','ENABLE','启用/禁用权限',1114,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26'),(387561493782204416,0,'/action/batchDeleteByIdList','批量删除权限','uac:action:batch','ENABLE',NULL,1114,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26'),(387606417693085696,0,'/action/checkActionCode','检测权限编码是否已存在','uac:action:checkActionCode','ENABLE','检测权限编码是否已存在',1114,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26'),(387606786523402240,0,'/action/checkUrl','检测权限地址唯一性','uac:action:checkUrl','ENABLE','检测权限URL唯一性',1114,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26');

/*Table structure for table `pc_uac_application` */

DROP TABLE IF EXISTS `pc_uac_application`;

CREATE TABLE `pc_uac_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `application_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '角色编码',
  `application_name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '角色名称',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '状态',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='应用表';

/*Data for the table `pc_uac_application` */

insert  into `pc_uac_application`(`id`,`version`,`application_code`,`application_name`,`status`,`remark`,`creator`,`creator_id`,`created_time`,`last_operator`,`last_operator_id`,`update_time`) values (1,1,'admin','admin','ENABLE',NULL,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26');

/*Table structure for table `pc_uac_group` */

DROP TABLE IF EXISTS `pc_uac_group`;

CREATE TABLE `pc_uac_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `group_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组织编码',
  `group_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组织名称',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '组织类型 1：仓库 2：基地',
  `pid` bigint(20) DEFAULT NULL COMMENT '父ID',
  `level` int(32) DEFAULT '1' COMMENT '层级',
  `leaf` int(32) DEFAULT '0' COMMENT '是否叶子节点,1不是0是',
  `contact` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '联系人',
  `group_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '组织地址',
  `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '省名称',
  `province_id` bigint(20) DEFAULT NULL COMMENT '省编码',
  `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '城市名称',
  `city_id` bigint(20) DEFAULT NULL COMMENT '城市编码',
  `area_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区名称',
  `area_id` bigint(32) DEFAULT NULL COMMENT '区编码',
  `street_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '街道名称',
  `street_id` bigint(20) DEFAULT NULL COMMENT '街道编码',
  `detail_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '详细地址',
  `contact_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '联系人手机号',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `number` int(11) DEFAULT '0' COMMENT '预留排序字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=387731953983557633 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';

/*Data for the table `pc_uac_group` */

insert  into `pc_uac_group`(`id`,`version`,`group_code`,`group_name`,`status`,`type`,`pid`,`level`,`leaf`,`contact`,`group_address`,`province_name`,`province_id`,`city_name`,`city_id`,`area_name`,`area_id`,`street_name`,`street_id`,`detail_address`,`contact_phone`,`remark`,`creator`,`creator_id`,`created_time`,`last_operator`,`last_operator_id`,`update_time`,`number`) values (1,1,'root','cmall',0,'1',0,1,0,'刘先生','北京市北京城区西城区','北京市',368100109646176256,'北京城区',368100109679730688,'西城区',368100109767811072,NULL,NULL,NULL,'155xxxxxxxx',NULL,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26',0),(2,2,'test','测试组织',0,'1',1,2,0,'刘先生','北京市北京城区西城区','北京市',368100109646176256,'北京城区',368100109679730688,'西城区',368100109767811072,NULL,NULL,NULL,'155xxxxxxxx',NULL,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26',0),(305783697070629888,2,'123132','32132144',0,'2',387731953983557632,3,0,'321','山西省长治市长治县','山西省',368100116688412672,'长治市',368100117644713984,'长治县',368100117745377280,'',NULL,'32132144','155xxxxxxxx','32132144','超级管理员',1,'2018-02-26 21:37:37','超级管理员',1,'2018-02-26 21:37:57',0),(387731868428144640,2,'test2','测试组织2',0,'1',1,2,0,'刘先生','北京市北京城区西城区','北京市',368100109646176256,'北京城区',368100109679730688,'西城区',368100109767811072,NULL,NULL,NULL,'155xxxxxxxx',NULL,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26',0),(387731953983557632,3,'test3','测试组织3',0,'1',1,2,0,'刘先生','北京市北京城区西城区','北京市',368100109646176256,'北京城区',368100109679730688,'西城区',368100109767811072,NULL,NULL,NULL,'155xxxxxxxx',NULL,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26',0);

/*Table structure for table `pc_uac_group_user` */

DROP TABLE IF EXISTS `pc_uac_group_user`;

CREATE TABLE `pc_uac_group_user` (
  `group_id` bigint(20) NOT NULL COMMENT '角色ID',
  `user_id` bigint(20) NOT NULL COMMENT '菜单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单与角色关联表';

/*Data for the table `pc_uac_group_user` */

insert  into `pc_uac_group_user`(`group_id`,`user_id`) values (1,1),(1,719490697840821248),(1,867532016680174593),(1,868217330235081728),(1,868232311550772224),(1,869541130776085505),(1,869546498780562433),(1,870973750034564096);

/*Table structure for table `pc_uac_log` */

DROP TABLE IF EXISTS `pc_uac_log`;

CREATE TABLE `pc_uac_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` bigint(20) DEFAULT NULL COMMENT '组织流水号',
  `group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '组织名称',
  `log_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '日志类型',
  `log_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '日志类型名称',
  `action_id` bigint(20) DEFAULT NULL COMMENT '权限ID',
  `action_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '权限编码',
  `action_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '权限名称',
  `os` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '操作系统',
  `browser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '浏览器类型',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'IP地址',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录位置',
  `mac` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '物理地址',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '详细描述',
  `request_data` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '请求参数',
  `request_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '请求地址',
  `response_data` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '响应结果',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '类名',
  `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '方法名',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `excute_time` int(11) DEFAULT NULL COMMENT '耗时,秒',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=875197618878153729 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日志表';

/*Data for the table `pc_uac_log` */

insert  into `pc_uac_log`(`id`,`group_id`,`group_name`,`log_type`,`log_name`,`action_id`,`action_code`,`action_name`,`os`,`browser`,`ip`,`location`,`mac`,`description`,`request_data`,`request_url`,`response_data`,`class_name`,`method_name`,`start_time`,`end_time`,`excute_time`,`creator`,`creator_id`,`created_time`,`last_operator`,`last_operator_id`,`update_time`) values (717870529414956032,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-09-17 22:20:36','超级管理员',1,'2019-09-17 22:20:36'),(717972270856799232,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','北京市','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-09-18 01:42:44','超级管理员',1,'2019-09-18 01:42:44'),(718049079023633408,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','北京市','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-09-18 04:15:21','超级管理员',1,'2019-09-18 04:15:21'),(718051069254435840,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','北京市','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-09-18 04:19:18','超级管理员',1,'2019-09-18 04:19:18'),(718781181105013760,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','北京市','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-09-19 04:29:54','超级管理员',1,'2019-09-19 04:29:54'),(719481129886811136,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','北京市','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-09-20 03:40:34','超级管理员',1,'2019-09-20 03:40:34'),(719490700558730240,1,'cmall','10','操作日志',100001,'uac:user:save','编辑用户','Mac OS X','Chrome','127.0.0.1','北京市','','','','/user/save','','com.paascloud.provider.web.admin.UacUserMainController','addUacUser','2019-09-20 03:59:35','2019-09-20 03:59:35',131,'超级管理员',1,'2019-09-20 03:59:35','超级管理员',1,'2019-09-20 16:59:36'),(719491636962264064,1,'cmall','10','操作日志',310169052272141312,'uac:user:bindRole','用户绑定角色','Mac OS X','Chrome','127.0.0.1','北京市','','','','/user/bindRole','','com.paascloud.provider.web.admin.UacUserMainController','bindUserRoles','2019-09-20 04:01:27','2019-09-20 04:01:27',42,'超级管理员',1,'2019-09-20 04:01:27','超级管理员',1,'2019-09-20 17:01:27'),(719547759274755072,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','北京市','','','','/auth/form','','','',NULL,NULL,NULL,'潘帅',719490697840821248,'2019-09-20 05:52:57','潘帅',719490697840821248,'2019-09-20 05:52:57'),(719550906479150080,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','北京市','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-09-20 05:59:12','超级管理员',1,'2019-09-20 05:59:12'),(788358970472399872,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-12-24 03:28:33','超级管理员',1,'2019-12-24 03:28:33'),(788361869147505664,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-12-24 03:34:18','超级管理员',1,'2019-12-24 03:34:18'),(788387790592148480,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-12-24 04:25:48','超级管理员',1,'2019-12-24 04:25:48'),(788994974304699392,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-12-25 00:32:10','超级管理员',1,'2019-12-25 00:32:10'),(788995328471729152,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-12-25 00:32:53','超级管理员',1,'2019-12-25 00:32:53'),(788995741124133888,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-12-25 00:33:42','超级管理员',1,'2019-12-25 00:33:42'),(789001916800566272,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-12-25 00:45:58','超级管理员',1,'2019-12-25 00:45:58'),(789002249777972224,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-12-25 00:46:38','超级管理员',1,'2019-12-25 00:46:38'),(789002727576306688,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-12-25 00:47:35','超级管理员',1,'2019-12-25 00:47:35'),(789780406290351104,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-12-26 02:32:41','超级管理员',1,'2019-12-26 02:32:41'),(792514579333645312,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2019-12-29 21:05:00','超级管理员',1,'2019-12-29 21:05:00'),(794865389468124160,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-02 02:55:38','超级管理员',1,'2020-01-02 02:55:38'),(795528617965650944,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-03 00:53:21','超级管理员',1,'2020-01-03 00:53:21'),(795590437946524672,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-03 02:56:11','超级管理员',1,'2020-01-03 02:56:11'),(797707637503296512,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 01:02:41','超级管理员',1,'2020-01-06 01:02:41'),(797737776010232832,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 02:02:34','超级管理员',1,'2020-01-06 02:02:34'),(797769982392927232,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 03:06:33','超级管理员',1,'2020-01-06 03:06:33'),(797783239186973696,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 03:32:53','超级管理员',1,'2020-01-06 03:32:53'),(797808693931410432,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 04:23:28','超级管理员',1,'2020-01-06 04:23:28'),(797811535119385600,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 04:29:06','超级管理员',1,'2020-01-06 04:29:06'),(797812123311801344,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 04:30:16','超级管理员',1,'2020-01-06 04:30:16'),(797813454416118784,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 04:32:55','超级管理员',1,'2020-01-06 04:32:55'),(797820304201090048,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 04:46:32','超级管理员',1,'2020-01-06 04:46:32'),(797820409562006528,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 04:46:44','超级管理员',1,'2020-01-06 04:46:44'),(797821230899004416,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 04:48:22','超级管理员',1,'2020-01-06 04:48:22'),(797825595172979712,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 04:57:02','超级管理员',1,'2020-01-06 04:57:02'),(797826147059500032,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 04:58:08','超级管理员',1,'2020-01-06 04:58:08'),(797829052235777024,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 05:03:55','超级管理员',1,'2020-01-06 05:03:55'),(797831681628177408,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 05:09:08','超级管理员',1,'2020-01-06 05:09:08'),(797836964320510976,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 05:19:38','超级管理员',1,'2020-01-06 05:19:38'),(797840884493190144,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 05:27:25','超级管理员',1,'2020-01-06 05:27:25'),(797842114196014080,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-06 05:29:52','超级管理员',1,'2020-01-06 05:29:52'),(799120462138311680,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-07 23:49:43','超级管理员',1,'2020-01-07 23:49:43'),(799262920901919744,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-08 04:32:45','超级管理员',1,'2020-01-08 04:32:45'),(802655887444411392,1,'cmall','20','登录日志',NULL,'','','Mac OS X','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-01-12 20:53:58','超级管理员',1,'2020-01-12 20:53:58'),(858862317088015360,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'潘帅',719490697840821248,'2020-03-30 11:06:07','潘帅',719490697840821248,'2020-03-30 11:06:07'),(858878288888595456,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-03-30 11:37:51','超级管理员',1,'2020-03-30 11:37:51'),(858890924992758784,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'潘帅',719490697840821248,'2020-03-30 12:02:57','潘帅',719490697840821248,'2020-03-30 12:02:57'),(859379238111806464,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'潘帅',719490697840821248,'2020-03-31 04:13:08','潘帅',719490697840821248,'2020-03-31 04:13:08'),(860764679243301888,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'潘帅',719490697840821248,'2020-04-02 02:05:46','潘帅',719490697840821248,'2020-04-02 02:05:46'),(860804483381199872,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-02 03:24:51','超级管理员',1,'2020-04-02 03:24:51'),(860861648850650112,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-02 05:18:26','超级管理员',1,'2020-04-02 05:18:26'),(861598485361722368,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-03 05:42:23','超级管理员',1,'2020-04-03 05:42:23'),(861615292944483328,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-03 06:15:47','超级管理员',1,'2020-04-03 06:15:47'),(861662230318416896,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-03 07:49:02','超级管理员',1,'2020-04-03 07:49:02'),(861663896010753024,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-03 07:52:21','超级管理员',1,'2020-04-03 07:52:21'),(862302184161674240,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-04 05:00:31','超级管理员',1,'2020-04-04 05:00:31'),(865824421644862464,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-09 01:38:34','超级管理员',1,'2020-04-09 01:38:34'),(865874206305289216,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-09 03:17:29','超级管理员',1,'2020-04-09 03:17:29'),(865890974637753344,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-09 03:50:48','超级管理员',1,'2020-04-09 03:50:48'),(865952060464432128,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-09 05:52:10','超级管理员',1,'2020-04-09 05:52:10'),(865956079748514816,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-09 06:00:09','超级管理员',1,'2020-04-09 06:00:09'),(866451441982637056,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-09 22:24:21','超级管理员',1,'2020-04-09 22:24:21'),(866622326458811392,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-10 04:03:52','超级管理员',1,'2020-04-10 04:03:52'),(866652415405851648,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-10 05:03:39','超级管理员',1,'2020-04-10 05:03:39'),(866663307610686464,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-10 05:25:17','超级管理员',1,'2020-04-10 05:25:17'),(866736900902224896,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-10 07:51:30','超级管理员',1,'2020-04-10 07:51:30'),(866808231098319872,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-10 10:13:13','超级管理员',1,'2020-04-10 10:13:13'),(867174435730228224,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-10 22:20:48','超级管理员',1,'2020-04-10 22:20:48'),(867279596553241600,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-11 14:49:45','超级管理员',1,'2020-04-11 14:49:45'),(867303805597778944,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-11 15:37:50','超级管理员',1,'2020-04-11 15:37:50'),(867340684502238208,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-11 16:51:07','超级管理员',1,'2020-04-11 16:51:07'),(867376794272007168,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-11 18:02:51','超级管理员',1,'2020-04-11 18:02:51'),(867537259836998656,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'admin123',867532016680174593,'2020-04-11 23:21:40','admin123',867532016680174593,'2020-04-11 23:21:40'),(868732381010330624,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 14:56:10','一颗奔腾的心',868232311550772224,'2020-04-13 14:56:10'),(868754345699574784,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 15:39:48','一颗奔腾的心',868232311550772224,'2020-04-13 15:39:48'),(868765796661199872,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 16:02:33','一颗奔腾的心',868232311550772224,'2020-04-13 16:02:33'),(868771143333446656,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 16:13:11','一颗奔腾的心',868232311550772224,'2020-04-13 16:13:11'),(868772285559866368,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-13 16:15:27','超级管理员',1,'2020-04-13 16:15:27'),(868798480355689472,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 17:07:30','一颗奔腾的心',868232311550772224,'2020-04-13 17:07:30'),(868798633338733568,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 17:07:48','一颗奔腾的心',868232311550772224,'2020-04-13 17:07:48'),(868801147287110656,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 17:12:48','一颗奔腾的心',868232311550772224,'2020-04-13 17:12:48'),(868804090740605952,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 17:18:38','一颗奔腾的心',868232311550772224,'2020-04-13 17:18:38'),(868810361770345472,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 17:31:06','一颗奔腾的心',868232311550772224,'2020-04-13 17:31:06'),(868811386740802560,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 17:33:08','一颗奔腾的心',868232311550772224,'2020-04-13 17:33:08'),(868817850079380480,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 17:45:59','一颗奔腾的心',868232311550772224,'2020-04-13 17:45:59'),(868819227690140672,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 17:48:43','一颗奔腾的心',868232311550772224,'2020-04-13 17:48:43'),(868820793558041600,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 17:51:50','一颗奔腾的心',868232311550772224,'2020-04-13 17:51:50'),(868822066025989120,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 17:54:21','一颗奔腾的心',868232311550772224,'2020-04-13 17:54:21'),(868826411031331840,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-13 18:02:59','超级管理员',1,'2020-04-13 18:02:59'),(868834878978786304,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 18:19:49','一颗奔腾的心',868232311550772224,'2020-04-13 18:19:49'),(868836334511326208,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 18:22:42','一颗奔腾的心',868232311550772224,'2020-04-13 18:22:42'),(868837686117401600,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 18:25:23','一颗奔腾的心',868232311550772224,'2020-04-13 18:25:23'),(868843865166054400,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 18:37:40','一颗奔腾的心',868232311550772224,'2020-04-13 18:37:40'),(868848459170448384,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 18:46:48','一颗奔腾的心',868232311550772224,'2020-04-13 18:46:48'),(868868905915909120,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 19:27:25','一颗奔腾的心',868232311550772224,'2020-04-13 19:27:25'),(868871930990560256,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-13 19:33:26','超级管理员',1,'2020-04-13 19:33:26'),(868882618563691520,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 19:54:40','一颗奔腾的心',868232311550772224,'2020-04-13 19:54:40'),(868883643920024576,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-13 19:56:42','超级管理员',1,'2020-04-13 19:56:42'),(868956892389442560,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/login/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 22:22:14','一颗奔腾的心',868232311550772224,'2020-04-13 22:22:14'),(868990743778165760,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 23:29:29','一颗奔腾的心',868232311550772224,'2020-04-13 23:29:29'),(869001887381193728,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 23:51:38','一颗奔腾的心',868232311550772224,'2020-04-13 23:51:38'),(869002640820798464,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 23:53:07','一颗奔腾的心',868232311550772224,'2020-04-13 23:53:07'),(869002751718196224,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 23:53:21','一颗奔腾的心',868232311550772224,'2020-04-13 23:53:21'),(869003024314401792,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-13 23:53:53','一颗奔腾的心',868232311550772224,'2020-04-13 23:53:53'),(869005125979472896,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-13 23:58:04','超级管理员',1,'2020-04-13 23:58:04'),(869008084574405632,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-14 00:03:56','一颗奔腾的心',868232311550772224,'2020-04-14 00:03:56'),(869013510602884096,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-14 00:14:43','一颗奔腾的心',868232311550772224,'2020-04-14 00:14:43'),(869014459790656512,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-14 00:16:36','一颗奔腾的心',868232311550772224,'2020-04-14 00:16:36'),(869024124331099136,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-14 00:35:48','一颗奔腾的心',868232311550772224,'2020-04-14 00:35:48'),(869303796101022720,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-14 09:51:28','一颗奔腾的心',868232311550772224,'2020-04-14 09:51:28'),(869315265123320832,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-14 10:14:15','一颗奔腾的心',868232311550772224,'2020-04-14 10:14:15'),(869396813222773760,NULL,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-14 12:56:16','一颗奔腾的心',868232311550772224,'2020-04-14 12:56:16'),(869399145213854720,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-14 13:00:54','超级管理员',1,'2020-04-14 13:00:54'),(869414021042799616,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-14 13:30:28','超级管理员',1,'2020-04-14 13:30:28'),(869508138087220224,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-14 16:37:27','超级管理员',1,'2020-04-14 16:37:27'),(869515777894515712,NULL,'','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-14 16:52:38','一颗奔腾的心',868232311550772224,'2020-04-14 16:52:38'),(869515995788608512,NULL,'','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-14 16:53:04','一颗奔腾的心',868232311550772224,'2020-04-14 16:53:04'),(869516076713509888,NULL,'','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-14 16:53:14','一颗奔腾的心',868232311550772224,'2020-04-14 16:53:14'),(869531081827681280,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-14 17:23:03','超级管理员',1,'2020-04-14 17:23:03'),(869536399609562112,NULL,'','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-14 17:33:36','一颗奔腾的心',868232311550772224,'2020-04-14 17:33:36'),(869537702905644032,NULL,'','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-14 17:36:12','一颗奔腾的心',868232311550772224,'2020-04-14 17:36:12'),(869538931450840064,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-14 17:38:38','超级管理员',1,'2020-04-14 17:38:38'),(869546944492471296,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'abcde',869546498780562433,'2020-04-14 17:54:33','abcde',869546498780562433,'2020-04-14 17:54:33'),(869547155373687808,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-14 17:54:59','超级管理员',1,'2020-04-14 17:54:59'),(870963346315150336,NULL,'','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-16 16:48:42','一颗奔腾的心',868232311550772224,'2020-04-16 16:48:42'),(870964168759444480,NULL,'','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-16 16:50:20','一颗奔腾的心',868232311550772224,'2020-04-16 16:50:20'),(870973780216775680,NULL,'','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'小狼',870973750034564096,'2020-04-16 17:09:26','小狼',870973750034564096,'2020-04-16 17:09:26'),(870975344088187904,NULL,'','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'小狼',870973750034564096,'2020-04-16 17:12:32','小狼',870973750034564096,'2020-04-16 17:12:32'),(870975845299127296,NULL,'','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'小狼',870973750034564096,'2020-04-16 17:13:32','小狼',870973750034564096,'2020-04-16 17:13:32'),(870976014950335488,NULL,'','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-16 17:13:52','一颗奔腾的心',868232311550772224,'2020-04-16 17:13:52'),(870999249943266304,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-16 18:00:02','超级管理员',1,'2020-04-16 18:00:02'),(870999666110497792,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-16 18:00:51','超级管理员',1,'2020-04-16 18:00:51'),(870999914539123712,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-16 18:01:21','超级管理员',1,'2020-04-16 18:01:21'),(871167004680127488,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-16 23:33:20','超级管理员',1,'2020-04-16 23:33:20'),(871486347024532480,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-17 10:07:48','超级管理员',1,'2020-04-17 10:07:48'),(871753616094921728,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-17 18:58:49','超级管理员',1,'2020-04-17 18:58:49'),(873096694504358912,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-19 02:27:17','超级管理员',1,'2020-04-19 02:27:17'),(874374981797020672,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-20 20:47:00','超级管理员',1,'2020-04-20 20:47:00'),(874386404765860864,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-20 21:09:42','超级管理员',1,'2020-04-20 21:09:42'),(874416157161948160,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-20 22:08:49','超级管理员',1,'2020-04-20 22:08:49'),(874650461091660800,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-21 05:54:20','超级管理员',1,'2020-04-21 05:54:20'),(874728063701615616,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-21 08:28:31','超级管理员',1,'2020-04-21 08:28:31'),(874730458028442624,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-21 08:33:16','超级管理员',1,'2020-04-21 08:33:16'),(874792214650160128,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-21 10:35:58','超级管理员',1,'2020-04-21 10:35:58'),(875103284291961856,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-21 20:54:01','超级管理员',1,'2020-04-21 20:54:01'),(875114419648988160,NULL,'','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-21 21:16:08','一颗奔腾的心',868232311550772224,'2020-04-21 21:16:08'),(875114503979664384,NULL,'','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/qq','','','',NULL,NULL,NULL,'一颗奔腾的心',868232311550772224,'2020-04-21 21:16:18','一颗奔腾的心',868232311550772224,'2020-04-21 21:16:18'),(875115939329213440,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-21 21:19:09','超级管理员',1,'2020-04-21 21:19:09'),(875197618878153728,1,'cmall','20','登录日志',NULL,'','','Windows 7','Chrome 8','127.0.0.1','','','','','/auth/form','','','',NULL,NULL,NULL,'超级管理员',1,'2020-04-22 00:01:26','超级管理员',1,'2020-04-22 00:01:26');

/*Table structure for table `pc_uac_menu` */

DROP TABLE IF EXISTS `pc_uac_menu`;

CREATE TABLE `pc_uac_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `menu_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '菜单编码',
  `menu_name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '菜单名称',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '状态',
  `url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '菜单URL',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '图标',
  `pid` bigint(20) DEFAULT NULL COMMENT '父ID',
  `level` int(11) DEFAULT '1' COMMENT '层级(最多三级1,2,3)',
  `leaf` int(11) DEFAULT '0' COMMENT '是否叶子节点,1不是0是',
  `number` int(11) DEFAULT '0' COMMENT '序号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  `application_id` bigint(20) DEFAULT '1' COMMENT '系统编码',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=399624517099589633 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单表';

/*Data for the table `pc_uac_menu` */

insert  into `pc_uac_menu`(`id`,`version`,`menu_code`,`menu_name`,`status`,`url`,`icon`,`pid`,`level`,`leaf`,`number`,`remark`,`application_id`,`creator`,`creator_id`,`created_time`,`last_operator`,`last_operator_id`,`update_time`) values (1,1,'root','运营工作台','ENABLE',NULL,'fa fa-y-combinator',0,0,1,0,'',1,'超级管理员',1,'2017-12-05 22:45:26','超级管理员',1,'2017-12-05 22:45:26'),(11,3,'uas','用户中心','ENABLE','/uas','fa fa-bicycle',1,1,1,1,'',1,'超级管理员',1,'2017-12-05 22:45:26','admin',1,'2018-02-26 21:11:21'),(111,3,'xtsz','系统管理','ENABLE','/yxgl','fa fa-desktop',11,2,0,1,'',1,'超级管理员',1,'2017-12-05 22:45:26','admin',1,'2018-02-26 21:11:21'),(1111,2,'uas_role','角色管理','ENABLE','/uas/role/list','fa fa-hand-o-up',111,3,1,0,'',1,'超级管理员',1,'2017-12-05 22:45:26','admin',1,'2018-02-26 21:11:21'),(1112,2,'uas_user','用户管理','ENABLE','/uas/user/list','fa fa-user',111,3,1,0,'',1,'超级管理员',1,'2017-12-05 22:45:26','admin',1,'2018-02-26 21:11:21'),(1113,2,'uas_menu','菜单管理','ENABLE','/uas/menu/list','fa fa-paperclip',111,3,1,0,'',1,'超级管理员',1,'2017-12-05 22:45:26','admin',1,'2018-02-26 21:11:21'),(1114,2,'uas_action','权限管理','ENABLE','/uas/action/list','fa fa-firefox',111,3,1,0,'',1,'超级管理员',1,'2017-12-05 22:45:26','admin',1,'2018-02-26 21:11:21'),(1115,2,'uas_group','组织管理','ENABLE','/uas/group/list','fa fa-group',111,3,1,0,'',1,'超级管理员',1,'2017-12-05 22:45:26','admin',1,'2018-02-26 21:11:21'),(305766262338757632,3,'add1','服丰富发','DISABLE','/sajdsalj/asda2','aa1',1,1,0,1231,'',1,'超级管理员',1,'2018-02-26 21:02:59','admin',1,'2018-02-26 21:05:10'),(310861539236127744,0,'category','商品分类','ENABLE','/oms/category/list','fa fa-print',386619141710286848,2,0,5,'',1,'超级管理员',1,'2018-03-05 21:46:23','超级管理员',1,'2018-03-05 21:46:49'),(314345986317100032,0,'exception','异常日志监控','ENABLE','/uas/monitor/exception','fa fa-indent',389537489083305984,3,0,7,'',1,'超级管理员',1,'2018-03-10 17:09:22','超级管理员',1,'2018-03-11 19:39:01'),(314534993634272256,0,'message','消息管理','ENABLE','/message','fa fa-envelope-o',399621965209538560,2,1,2,'',1,'超级管理员',1,'2018-03-10 23:24:53','超级管理员',1,'2018-03-11 19:34:41'),(314536915506308096,0,'reliable_message','可靠消息','ENABLE','/mds/message/reliable','fa fa-envelope-o',314534993634272256,3,0,1,'',1,'超级管理员',1,'2018-03-10 23:28:42','超级管理员',1,'2018-03-11 19:37:26'),(314537372735775744,0,'rpc_message','消息记录','ENABLE','/mds/message/record','fa fa-envelope-o',314534993634272256,3,0,1,'',1,'超级管理员',1,'2018-03-10 23:29:37','超级管理员',1,'2018-03-11 19:37:40'),(386619141710286848,0,'oms','订单中心','ENABLE','/oms','fa fa-plug',1,1,1,2,'订单中心',1,'超级管理员',1,'2017-12-05 22:45:26','超级管理员',1,'2017-12-05 22:45:26'),(386619314180067328,0,'product','商品管理','ENABLE','/oms/product/list','fa fa-print',386619141710286848,2,0,0,'',1,'超级管理员',1,'2017-12-05 22:45:26','超级管理员',1,'2017-12-05 22:45:26'),(386619554962477056,0,'shipping','收货地址','ENABLE','/oms/shipping/list','fa fa-diamond',386619141710286848,2,0,0,'',1,'超级管理员',1,'2017-12-05 22:45:26','超级管理员',1,'2017-12-05 22:45:26'),(386619669785743360,0,'order','订单管理','ENABLE','/oms/order/list','fa fa-life-ring',386619141710286848,2,0,0,'',1,'超级管理员',1,'2017-12-05 22:45:26','超级管理员',1,'2017-12-05 22:45:26'),(386619770943967232,0,'cart','购物车管理','ENABLE','/oms/cart/list','',386619141710286848,2,0,6,'',1,'超级管理员',1,'2018-03-12 11:40:32','超级管理员',1,'2018-03-12 11:40:32'),(389537489083305984,2,'uac_monitor','运营监控','ENABLE','/uas/monitor','fa fa-bar-chart',11,2,1,2,'',1,'超级管理员',1,'2017-12-10 22:02:55','超级管理员',1,'2018-03-11 19:43:30'),(389537927648120832,2,'monitor_zipkin','调用链监控','ENABLE','/uas/monitor/cat','fa fa-gavel',389537489083305984,3,0,1,'',1,'超级管理员',1,'2017-12-10 22:04:39','超级管理员',1,'2018-03-11 19:40:00'),(389538226760716288,2,'monitor_swagger_uac','接口文档','ENABLE','/uas/monitor/swagger','fa fa-calculator',389537489083305984,3,0,1,'',1,'超级管理员',1,'2017-12-10 22:05:51','超级管理员',1,'2018-03-11 19:42:29'),(389538504239091712,2,'monitor_druid','数据库监控','ENABLE','/uas/monitor/druid','fa fa-bug',389537489083305984,3,0,1,'',1,'超级管理员',1,'2017-12-10 22:06:57','超级管理员',1,'2018-03-11 19:42:55'),(389538784145969152,2,'monitor_boot','监控报警','ENABLE','/uas/monitor/boot','fa fa-book',389537489083305984,3,0,1,'',1,'超级管理员',1,'2017-12-10 22:08:03','超级管理员',1,'2018-03-11 19:40:44'),(397128438818934784,2,'log','操作日志监控','ENABLE','/uas/monitor/log','fa fa-futbol-o',389537489083305984,3,0,5,'',1,'超级管理员',1,'2017-12-31 20:46:38','admin',1,'2018-02-26 21:11:21'),(397129746489675776,2,'token','登录密钥监控','ENABLE','/uas/monitor/token','fa fa-sort-amount-asc',389537489083305984,3,0,6,'',1,'超级管理员',1,'2017-12-31 20:51:50','admin',1,'2018-02-26 21:11:21'),(399621965209538560,0,'mds','数据中心','ENABLE','/mds','fa fa-tree',1,1,1,2,'',1,'超级管理员',1,'2018-01-07 17:55:01','超级管理员',1,'2018-01-07 17:55:01'),(399622376637206528,0,'config','配置管理','ENABLE','/config','fa fa-cog',399621965209538560,2,1,1,'',1,'超级管理员',1,'2018-01-07 17:56:39','超级管理员',1,'2018-01-22 16:00:40'),(399622908055523328,0,'topic','Topic管理','ENABLE','/mds/topic/list','fa fa-bars',399622376637206528,3,0,1,'',1,'超级管理员',1,'2018-01-07 17:58:46','超级管理员',1,'2018-01-07 19:17:50'),(399623029472235520,0,'tag','Tag管理','ENABLE','/mds/tag/list','fa fa-hand-rock-o',399622376637206528,3,0,2,'',1,'超级管理员',1,'2018-01-07 17:59:15','超级管理员',1,'2018-01-07 19:18:05'),(399623393500073984,0,'producer','生产者管理','ENABLE','/mds/producer/list','fa fa-hand-o-right',399622376637206528,3,0,3,'',1,'超级管理员',1,'2018-01-07 18:00:42','超级管理员',1,'2018-01-07 19:18:10'),(399623576635969536,0,'consumer','消费者管理','ENABLE','/mds/consumer/list','fa fa-hand-pointer-o',399622376637206528,3,0,4,'',1,'超级管理员',1,'2018-01-07 18:01:25','超级管理员',1,'2018-01-07 19:18:14'),(399623736623501312,0,'dist','数据字典','ENABLE','/mds/dict/list','fa fa-book',399622376637206528,3,0,0,'',1,'超级管理员',1,'2018-01-07 18:02:03','超级管理员',1,'2018-01-22 16:01:33'),(399624320957157376,0,'publish','发布管理','ENABLE','/mds/publish/list','fa fa-hourglass-end',399622376637206528,3,0,5,'',1,'超级管理员',1,'2018-01-07 18:04:23','超级管理员',1,'2018-01-07 19:18:20'),(399624517099589632,2,'subscribe','订阅管理','ENABLE','/mds/subscribe/list','fa fa-pencil',399622376637206528,3,1,6,'',1,'超级管理员',1,'2018-01-07 18:05:10','admin',1,'2018-02-26 21:08:32');

/*Table structure for table `pc_uac_role` */

DROP TABLE IF EXISTS `pc_uac_role`;

CREATE TABLE `pc_uac_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '角色编码',
  `role_name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '角色名称',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '状态',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=396741611725393921 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';

/*Data for the table `pc_uac_role` */

insert  into `pc_uac_role`(`id`,`version`,`role_code`,`role_name`,`status`,`remark`,`creator`,`creator_id`,`created_time`,`last_operator`,`last_operator_id`,`update_time`) values (1,1,'admin','超级管理员','ENABLE',NULL,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26'),(2,0,'developer','开发人员','ENABLE',NULL,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26'),(3,0,'test','测试人员','DISABLE',NULL,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26'),(4,0,'master','管理员','ENABLE',NULL,'admin',1,'2017-12-05 22:45:26','admin',1,'2017-12-05 22:45:26'),(10000,1,'visiter','普通用户','ENABLE','','admin',1,'2017-12-05 22:45:26','超级管理员',1,'2017-12-05 22:45:26'),(315998797551379456,0,'222','测试','ENABLE','222','超级管理员',1,'2017-12-05 22:45:26','超级管理员',1,'2017-12-05 22:45:26'),(396740565905051648,0,'111','发发','ENABLE','222','超级管理员',1,'2017-12-05 22:45:26','超级管理员',1,'2017-12-05 22:45:26'),(396741611725393920,0,'2222','飞洒分发','ENABLE','1145','超级管理员',1,'2017-12-05 22:45:26','xxxx',305120257926767617,'2017-12-05 22:45:26');

/*Table structure for table `pc_uac_role_action` */

DROP TABLE IF EXISTS `pc_uac_role_action`;

CREATE TABLE `pc_uac_role_action` (
  `role_id` bigint(20) NOT NULL,
  `action_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`action_id`),
  KEY `FKfe9od4909llybiub42s3ifvcl` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色权限中间表';

/*Data for the table `pc_uac_role_action` */

insert  into `pc_uac_role_action`(`role_id`,`action_id`) values (4,100001),(4,100005),(10000,305772209559839744),(10000,308015564217918464),(10000,308015817025397760),(10000,308016353694983168),(10000,308016771179226112),(10000,308017000884478976),(10000,308017290090128384),(10000,308017803162559488),(10000,308018047321383936),(10000,308699944489853952),(10000,387558460746764288),(387665279259381760,387558460746764288),(387665279259381760,387560278130298880);

/*Table structure for table `pc_uac_role_menu` */

DROP TABLE IF EXISTS `pc_uac_role_menu`;

CREATE TABLE `pc_uac_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `FK1ckt8kop21ihi6stv1j3ifr8p` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色菜单中间表';

/*Data for the table `pc_uac_role_menu` */

insert  into `pc_uac_role_menu`(`role_id`,`menu_id`) values (0,0),(1,1),(1,11),(1,111),(1,1111),(4,1111),(10000,1111),(387665279259381760,1111),(1,1112),(10000,1112),(387665279259381760,1112),(1,1113),(4,1113),(10000,1113),(1,1114),(4,1114),(10000,1114),(387665279259381760,1114),(1,1115),(10000,1115),(10000,310861539236127744),(10000,314345986317100032),(10000,314536915506308096),(10000,314537372735775744),(10000,386619314180067328),(10000,386619554962477056),(10000,386619669785743360),(10000,389537927648120832),(10000,389538226760716288),(10000,389538504239091712),(10000,389538784145969152),(10000,397128438818934784),(10000,397129746489675776),(10000,399622908055523328),(10000,399623029472235520),(10000,399623393500073984),(10000,399623576635969536),(10000,399623736623501312),(10000,399624320957157376),(10000,399624517099589632);

/*Table structure for table `pc_uac_role_user` */

DROP TABLE IF EXISTS `pc_uac_role_user`;

CREATE TABLE `pc_uac_role_user` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FKdumjqlt1wyblqtpca3ag0qhtf` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色用户中间表';

/*Data for the table `pc_uac_role_user` */

insert  into `pc_uac_role_user`(`role_id`,`user_id`) values (2,719490697840821248),(4,719490697840821248),(10000,867532016680174593),(10000,869541130776085505),(10000,869546498780562433);

/*Table structure for table `pc_uac_user` */

DROP TABLE IF EXISTS `pc_uac_user`;

CREATE TABLE `pc_uac_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录名',
  `login_pwd` varchar(300) DEFAULT '' COMMENT '登录密码',
  `salt` varchar(32) DEFAULT '' COMMENT '盐,用于shiro加密, 字段停用',
  `user_code` varchar(32) DEFAULT '' COMMENT '工号',
  `user_name` varchar(50) DEFAULT '' COMMENT '姓名',
  `mobile_no` varchar(15) DEFAULT '' COMMENT '手机号',
  `email` varchar(50) DEFAULT '' COMMENT '邮件地址',
  `status` varchar(20) DEFAULT '' COMMENT '状态',
  `user_source` varchar(32) DEFAULT '' COMMENT '用户来源',
  `type` varchar(32) DEFAULT '' COMMENT '操作员类型（2000伙伴，3000客户，1000运营）',
  `last_login_ip` varchar(20) DEFAULT '' COMMENT '最后登录IP地址',
  `last_login_location` varchar(50) DEFAULT '' COMMENT '最后登录位置',
  `remark` varchar(300) DEFAULT '' COMMENT '描述',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `is_changed_pwd` smallint(6) DEFAULT '0' COMMENT '是否更改过密码',
  `pwd_error_count` smallint(6) DEFAULT '0' COMMENT '连续输错密码次数（连续5次输错就冻结帐号）',
  `pwd_error_time` datetime DEFAULT NULL COMMENT '最后输错密码时间',
  `creator` varchar(20) DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=870973750034564097 DEFAULT CHARSET=utf8 COMMENT='操作员表';

/*Data for the table `pc_uac_user` */

insert  into `pc_uac_user`(`id`,`version`,`login_name`,`login_pwd`,`salt`,`user_code`,`user_name`,`mobile_no`,`email`,`status`,`user_source`,`type`,`last_login_ip`,`last_login_location`,`remark`,`last_login_time`,`is_changed_pwd`,`pwd_error_count`,`pwd_error_time`,`creator`,`creator_id`,`created_time`,`last_operator`,`last_operator_id`,`update_time`) values (1,1,'admin','$2a$10$LvlRXYpsKRdqahrB/AxQmuQBKyfzD9svcYWd7WLi5aPTNYx3BzvKG','380048354543013888','admin','超级管理员','15522222222','15522222222@163.com','ENABLE','','','127.0.0.1','北京市','','2020-04-22 00:01:26',1,1,'2017-06-13 18:52:54','admin',1,'2017-12-05 22:45:26','admin1',1,'2017-12-05 22:45:26'),(868217330235081728,0,'53dbfa3dde804068a982ab8a9b2d5a41','$2a$10$X1HfnXFaDZFCPziasDW0Y.HvmceL359Aek1UsRHU2wq4CW3y6woIO','53dbfa3dde804068a982ab8a9b2d5a41','53dbfa3dde804068a982ab8a9b2d5a41','一颗奔腾的心','78058654366','53dbfa3dde804068a982ab8a9b2d5a41@163.com','ENABLE','INSERT','1000','','','三方授权, 自动生成','2020-04-12 21:52:34',0,0,NULL,'超级管理员',1,'2020-04-12 21:52:51','超级管理员',1,'2020-04-12 21:52:51'),(868232311550772224,0,'2f53f3b7cb364202b0c4d4c43677baf5','$2a$10$fTBWIbzJVgXvr98g13y3E.sbz3HMOplbANqK4n5CamqXVjfuwIJ..','2f53f3b7cb364202b0c4d4c43677baf5','2f53f3b7cb364202b0c4d4c43677baf5','一颗奔腾的心','93817245081','2f53f3b7cb364202b0c4d4c43677baf5@163.com','ENABLE','INSERT','1000','127.0.0.1','','三方授权, 自动生成','2020-04-21 21:16:18',0,0,NULL,'超级管理员',1,'2020-04-12 22:22:36','超级管理员',1,'2020-04-12 22:22:36'),(869546498780562433,0,'abcde','$2a$10$nxxjQEx2Gi/DJvpt4Nh.lOZY90B4EyPN2t1jDDDNeyHTWsncGGShK','869546498780562432','','abcde','12312341234','1026955967@qq.com','ENABLE','REGISTER','','127.0.0.1','','','2020-04-14 17:54:33',0,0,NULL,'abcde',869546498780562433,'2020-04-14 17:53:40','abcde',869546498780562433,'2020-04-14 17:54:03'),(870973750034564096,0,'4e6adb9b84eb4b7e80a0b4250986e540','$2a$10$ro6L9GAiVE.xdRf2QpGP5eNb0/STcMr3T..zwm.fmEv5mr5CKLntK','4e6adb9b84eb4b7e80a0b4250986e540','4e6adb9b84eb4b7e80a0b4250986e540','小狼','82863595557','4e6adb9b84eb4b7e80a0b4250986e540@163.com','ENABLE','INSERT','1000','127.0.0.1','','三方授权, 自动生成','2020-04-16 17:13:32',0,0,NULL,'超级管理员',1,'2020-04-16 17:09:22','超级管理员',1,'2020-04-16 17:09:22');

/*Table structure for table `pc_uac_user_menu` */

DROP TABLE IF EXISTS `pc_uac_user_menu`;

CREATE TABLE `pc_uac_user_menu` (
  `user_id` bigint(32) DEFAULT NULL COMMENT '用户id',
  `menu_id` bigint(32) DEFAULT NULL COMMENT '菜单id',
  `number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户菜单中间表';

/*Data for the table `pc_uac_user_menu` */

/*Table structure for table `pc_uac_user_token` */

DROP TABLE IF EXISTS `pc_uac_user_token`;

CREATE TABLE `pc_uac_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `pid` bigint(20) DEFAULT NULL COMMENT '父ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录名',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '姓名',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `os` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '操作系统',
  `browser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '浏览器',
  `login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登陆人Ip地址',
  `login_location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录地址',
  `login_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `access_token` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '访问token',
  `refresh_token` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '刷新token',
  `token_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'token类型',
  `access_token_validity` int(11) DEFAULT NULL COMMENT '访问token的生效时间(秒)',
  `refresh_token_validity` int(11) DEFAULT NULL COMMENT '刷新token的生效时间(秒)',
  `status` int(11) DEFAULT '0' COMMENT '0 在线 10已刷新 20 离线',
  `group_id` bigint(20) DEFAULT NULL COMMENT '组织ID',
  `group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '组织名称',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=875197616344794113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户Token统计表';

/*Data for the table `pc_uac_user_token` */


/*Table structure for table `persistent_logins` */

DROP TABLE IF EXISTS `persistent_logins`;

CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `persistent_logins` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;