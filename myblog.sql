/*
SQLyog v10.2 
MySQL - 5.1.32-community : Database - myblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myblog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `myblog`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `articleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志自增Id',
  `articleName` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT '文章名称',
  `articleTime` date NOT NULL COMMENT '发布时间',
  `articleContent` text CHARACTER SET latin1 NOT NULL COMMENT '文章内容',
  `articleClick` int(11) DEFAULT NULL COMMENT '查看人数',
  `articleSupport` int(11) DEFAULT NULL COMMENT '是否博主推荐。0为否；1为是',
  `articleUp` int(11) DEFAULT NULL COMMENT '是否置顶。0为；1为是',
  `articleType` int(11) NOT NULL COMMENT '文章类别。0为私有，1为公开，2为仅好友查看',
  `typeId` int(11) NOT NULL COMMENT '栏目Id',
  `userId` int(11) NOT NULL COMMENT '博主Id',
  PRIMARY KEY (`articleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `article` */

/*Table structure for table `article_comment` */

DROP TABLE IF EXISTS `article_comment`;

CREATE TABLE `article_comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论Id',
  `postId` int(11) NOT NULL COMMENT '评论者Id',
  `userId` int(11) NOT NULL COMMENT '博主Id',
  `articleId` int(11) NOT NULL COMMENT '文章Id',
  `content` varchar(1000) CHARACTER SET latin1 NOT NULL COMMENT '评论内容',
  `responseId` int(11) NOT NULL COMMENT '回复Id',
  `time` date NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `article_comment` */

/*Table structure for table `article_response` */

DROP TABLE IF EXISTS `article_response`;

CREATE TABLE `article_response` (
  `responseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复Id',
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `content` varchar(1000) CHARACTER SET latin1 NOT NULL COMMENT '回复内容',
  `time` date NOT NULL COMMENT '回复时间',
  PRIMARY KEY (`responseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `article_response` */

/*Table structure for table `article_sort` */

DROP TABLE IF EXISTS `article_sort`;

CREATE TABLE `article_sort` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客栏目Id',
  `name` varchar(100) NOT NULL COMMENT '栏目名称',
  `userId` int(11) NOT NULL COMMENT '用户Id',
  PRIMARY KEY (`typeId`,`name`,`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `article_sort` */

insert  into `article_sort`(`typeId`,`name`,`userId`) values (1,'个人博客',1),(2,'算法分析',1),(3,'WebService',1),(4,'JVM',1),(5,'JavaEE框架',1),(6,'Html5',1),(7,'JavaScript',1),(8,'Android',1),(9,'网络编程',1),(10,'Lucene',1),(11,'Shiro',1),(12,'Jquery',1),(13,'SpringMVC',1),(14,'Struts2',1),(15,'设计模式',1);

/*Table structure for table `friendly_link` */

DROP TABLE IF EXISTS `friendly_link`;

CREATE TABLE `friendly_link` (
  `linkId` int(11) NOT NULL AUTO_INCREMENT COMMENT '友情链接Id',
  `linkName` varchar(100) NOT NULL COMMENT '链接名称',
  `linkUrl` varchar(100) NOT NULL COMMENT '链接url',
  PRIMARY KEY (`linkId`,`linkName`,`linkUrl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `friendly_link` */

/*Table structure for table `secret_message` */

DROP TABLE IF EXISTS `secret_message`;

CREATE TABLE `secret_message` (
  `secretId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `sendId` int(11) NOT NULL COMMENT '发信者Id',
  `receiveId` int(11) NOT NULL COMMENT '接收者Id',
  `messageContent` varchar(100) NOT NULL COMMENT '私信内容',
  PRIMARY KEY (`secretId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `secret_message` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `identity` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `menuIcon` varchar(30) DEFAULT NULL,
  `menuUrl` varchar(100) DEFAULT NULL,
  `menuType` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`menuId`),
  UNIQUE KEY `uk` (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

/*Table structure for table `sys_operation` */

DROP TABLE IF EXISTS `sys_operation`;

CREATE TABLE `sys_operation` (
  `id` int(11) NOT NULL COMMENT '操作Id，主键',
  `desc` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `name` varchar(100) DEFAULT NULL COMMENT '操作名称',
  `operation` varchar(100) DEFAULT NULL COMMENT '操作标志',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_o_1` (`operation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_operation` */

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL COMMENT '权限Id',
  `desc` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `name` varchar(100) DEFAULT NULL COMMENT '权限名称',
  `menuId` int(11) DEFAULT NULL COMMENT '菜单Id',
  PRIMARY KEY (`id`),
  KEY `p_fk_1` (`menuId`),
  CONSTRAINT `p_fk_1` FOREIGN KEY (`menuId`) REFERENCES `sys_menu` (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission` */

/*Table structure for table `sys_permission_operation` */

DROP TABLE IF EXISTS `sys_permission_operation`;

CREATE TABLE `sys_permission_operation` (
  `permissionId` int(11) NOT NULL,
  `operationId` int(11) NOT NULL,
  PRIMARY KEY (`permissionId`,`operationId`),
  KEY `po_fk_1` (`operationId`),
  CONSTRAINT `po_fk_1` FOREIGN KEY (`operationId`) REFERENCES `sys_operation` (`id`),
  CONSTRAINT `po_fk_2` FOREIGN KEY (`permissionId`) REFERENCES `sys_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission_operation` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色Id',
  `desc` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role` varchar(100) DEFAULT NULL COMMENT '角色标志',
  PRIMARY KEY (`roleId`),
  UNIQUE KEY `uk_r_1` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `roleId` int(11) NOT NULL COMMENT '角色Id',
  `permissionId` int(11) NOT NULL COMMENT '权限Id',
  UNIQUE KEY `rp_fk_2` (`permissionId`),
  KEY `rp_fk_1` (`roleId`),
  CONSTRAINT `rp_fk_1` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`roleId`),
  CONSTRAINT `rp_fk_2` FOREIGN KEY (`permissionId`) REFERENCES `sys_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_permission` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `phone` int(12) DEFAULT NULL COMMENT '手机',
  `sex` varchar(6) DEFAULT NULL COMMENT '性别',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mark` varchar(30) DEFAULT NULL COMMENT '备注',
  `rank` varchar(10) DEFAULT NULL COMMENT '账号等级',
  `lastLogin` varchar(100) DEFAULT NULL COMMENT '最后一次登录时间',
  `loginIp` varchar(30) DEFAULT NULL COMMENT '登录ip',
  `imageUrl` varchar(100) DEFAULT NULL COMMENT '头像图片路径',
  `regTime` date NOT NULL COMMENT '注册时间',
  `accountStatus` int(11) DEFAULT NULL COMMENT '账号状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_u_1` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `userId` int(11) NOT NULL COMMENT '用户Id,联合主键',
  `roleId` int(11) NOT NULL COMMENT '角色Id，联合主键',
  PRIMARY KEY (`userId`,`roleId`),
  KEY `ur_fk_2` (`roleId`),
  CONSTRAINT `ur_fk_1` FOREIGN KEY (`userId`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `ur_fk_2` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

/*Table structure for table `user_attention` */

DROP TABLE IF EXISTS `user_attention`;

CREATE TABLE `user_attention` (
  `aId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `attentionId` int(11) NOT NULL COMMENT '关注者Id',
  PRIMARY KEY (`aId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_attention` */

/*Table structure for table `web_ad` */

DROP TABLE IF EXISTS `web_ad`;

CREATE TABLE `web_ad` (
  `adId` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告Id',
  `adTitle` varchar(100) NOT NULL COMMENT '广告标题',
  `adImage` varchar(100) NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`adId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `web_ad` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
