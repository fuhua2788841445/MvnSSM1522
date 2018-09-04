/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 5.5.53 : Database - mybatis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mybatis` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mybatis`;

/*Table structure for table `tb_admin` */

DROP TABLE IF EXISTS `tb_admin`;

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_account` varchar(25) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tb_admin` */

insert  into `tb_admin`(`admin_id`,`admin_account`,`admin_password`) values 
(1,'qianduoduo','qianduoduo'),
(2,'admin','admin'),
(3,'qiantaiduo','qiantaiduo'),
(4,'qianmeimei','qianmeimei');

/*Table structure for table `tb_comp_collection` */

DROP TABLE IF EXISTS `tb_comp_collection`;

CREATE TABLE `tb_comp_collection` (
  `comp_id` int(11) NOT NULL,
  `hunt_id` int(11) NOT NULL COMMENT '求职id',
  PRIMARY KEY (`comp_id`,`hunt_id`),
  KEY `fk_comp_id` (`comp_id`),
  KEY `fk_hunt_id` (`hunt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tb_comp_collection` */

insert  into `tb_comp_collection`(`comp_id`,`hunt_id`) values 
(1,1),
(1,2),
(1,3),
(1,12),
(2,4),
(2,5),
(2,6),
(3,7),
(3,8),
(3,9),
(4,10),
(4,11);

/*Table structure for table `tb_company` */

DROP TABLE IF EXISTS `tb_company`;

CREATE TABLE `tb_company` (
  `comp_id` int(11) NOT NULL AUTO_INCREMENT,
  `comp_email` varchar(30) NOT NULL,
  `comp_password` varchar(50) NOT NULL,
  `comp_name` varchar(50) DEFAULT NULL,
  `comp_info` varchar(255) DEFAULT NULL,
  `comp_logo` varchar(50) DEFAULT 'logo/DeLogo.jpg',
  `comp_address` varchar(255) DEFAULT NULL,
  `comp_focus` varchar(10) DEFAULT NULL,
  `comp_license` varchar(50) DEFAULT NULL,
  `comp_phone` varchar(15) DEFAULT NULL,
  `comp_state` int(11) NOT NULL DEFAULT '0' COMMENT '0是待认证，1是已认证，2是冻结，默认是0',
  PRIMARY KEY (`comp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tb_company` */

insert  into `tb_company`(`comp_id`,`comp_email`,`comp_password`,`comp_name`,`comp_info`,`comp_logo`,`comp_address`,`comp_focus`,`comp_license`,`comp_phone`,`comp_state`) values 
(1,'ali@qq.com','e10adc3949ba59abbe56e057f20f883e','阿狸科学技术有限公司','阿狸科技','logo/cf53e359c07c4e60ab5d59f2badf20f3.jpeg','浙江杭州','IT','logo/51bb0fdffa464b1b82193303f4cadeef.gif','15545555566',0),
(2,'baidu@qq.com','e10adc3949ba59abbe56e057f20f883e','百毒科学技术有限公司','百毒科技','logo/DeLogo.jpg','北京中关村','IT','logo/bfb9e4ef2a044c2c9dcdd1c66926c21b.jpeg','15545555555',0),
(3,'wangyi@qq.com','e10adc3949ba59abbe56e057f20f883e','万一科学技术有限公司','万一科技','logo/DeLogo.jpg','广东广州','IT','logo/bfb9e4ef2a044c2c9dcdd1c66926c21b.jpeg','15545555555',0),
(4,'tengxun@qq.com','e10adc3949ba59abbe56e057f20f883e','疼逊科学技术有限公司','疼逊科技','logo/DeLogo.jpg','广东深圳','IT','logo/bfb9e4ef2a044c2c9dcdd1c66926c21b.jpeg','15545555555',0);

/*Table structure for table `tb_hunt` */

DROP TABLE IF EXISTS `tb_hunt`;

CREATE TABLE `tb_hunt` (
  `hunt_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(25) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hunt_job` varchar(20) NOT NULL,
  `hunt_place` varchar(50) NOT NULL,
  `hunt_degree` varchar(10) NOT NULL,
  `hunt_skill` varchar(500) NOT NULL,
  `hunt_experience` varchar(500) NOT NULL,
  `hunt_salary` varchar(20) NOT NULL,
  `hunt_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hunt_state` int(11) NOT NULL DEFAULT '0' COMMENT '0是未审核，1是已审核，默认是0',
  PRIMARY KEY (`hunt_id`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `tb_hunt` */

insert  into `tb_hunt`(`hunt_id`,`user_name`,`user_id`,`hunt_job`,`hunt_place`,`hunt_degree`,`hunt_skill`,`hunt_experience`,`hunt_salary`,`hunt_date`,`hunt_state`) values 
(1,'小蓝',1,'软件工程师','广州','本科','会吃','很会吃','1000-2000','2018-01-01 19:03:06',0),
(2,'小蓝',1,'UI设计师','深圳','本科','会玩','很会玩','2000-3000','2018-02-02 19:03:22',0),
(3,'小蓝',1,'搬砖工人','汕头','本科','会吃','会吃','3000-4000','2018-06-02 19:03:41',0),
(4,'小红',2,'前端设计师','福建','本科','会吃','很会玩','4000-5000','2018-07-26 19:03:52',0),
(5,'小红',2,'Java工程师','北京','本科','会吃','很会玩','7000-8000','2018-03-16 19:04:06',0),
(6,'小红',2,'杂志编辑','上海','本科','会吃','很会玩','4000-6000','2017-12-30 19:04:14',0),
(7,'小明',3,'清洁工','重庆','本科','会吃','很会玩','1000-2000','2018-06-26 19:04:24',0),
(8,'小明',3,'厨师','广州','本科','会煮饭','煮过很多饭','3000-4000','2015-06-27 20:28:59',0),
(9,'小明',3,'安卓开发工程师','肇庆','本科','会打代码','打过很多代码','5000-6000','2016-06-27 20:30:15',0),
(10,'小白',4,'软件工程师','汕头','本科','会吃','很会吃','4000-5000','2017-06-27 20:30:35',0),
(11,'小白',4,'UI设计师','苏州','本科','能吃','能谁','1000-5000','2018-06-28 12:13:14',0),
(12,'小白',4,'软件工程师','广州','硕士研究生','能吃','很能吃','1000-3000','2012-06-30 11:54:55',0),
(13,'小白',4,'软件设计师','广州','本科','会打代码','很会打代码','1000-2000','2014-07-02 01:32:54',0);

/*Table structure for table `tb_hunt_company` */

DROP TABLE IF EXISTS `tb_hunt_company`;

CREATE TABLE `tb_hunt_company` (
  `want_id` int(11) NOT NULL COMMENT '公司预备聘用id',
  `comp_id` int(11) NOT NULL,
  `hunt_id` int(11) NOT NULL COMMENT '求职id',
  `want_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`want_id`),
  KEY `fk_comp_id` (`comp_id`),
  KEY `fk_hunt_id` (`hunt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tb_hunt_company` */

insert  into `tb_hunt_company`(`want_id`,`comp_id`,`hunt_id`,`want_date`) values 
(1,1,1,'2016-06-30 12:33:16'),
(0,1,2,'2016-07-02 02:35:32'),
(2,1,3,'2016-07-02 02:35:49'),
(4,2,4,'2016-07-02 02:37:08'),
(5,2,5,'2016-07-02 02:37:15'),
(9,2,6,'2016-07-02 02:37:21'),
(6,3,7,'2016-07-02 02:37:30'),
(7,3,8,'2016-07-02 02:37:37'),
(8,3,9,'2016-07-02 02:37:46'),
(10,4,10,'2016-07-02 02:37:55'),
(11,4,11,'2016-07-02 02:38:07'),
(12,4,12,'2016-07-02 02:38:13');

/*Table structure for table `tb_keyword` */

DROP TABLE IF EXISTS `tb_keyword`;

CREATE TABLE `tb_keyword` (
  `keyword_id` int(11) NOT NULL,
  `keyword` varchar(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comp_id` int(11) DEFAULT NULL,
  `heat` int(11) NOT NULL DEFAULT '0' COMMENT '热度',
  PRIMARY KEY (`keyword_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_comp_id` (`comp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tb_keyword` */

/*Table structure for table `tb_message` */

DROP TABLE IF EXISTS `tb_message`;

CREATE TABLE `tb_message` (
  `mess_id` int(11) NOT NULL AUTO_INCREMENT,
  `mess_topic` varchar(50) NOT NULL,
  `resource` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comp_id` int(11) DEFAULT NULL,
  `mess_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mess_type` varchar(10) NOT NULL,
  `send_role` varchar(20) NOT NULL COMMENT 'person代表发给个人，company代表发给公司的，all代表发给所有人的，only代表发给单独一个人的。',
  PRIMARY KEY (`mess_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_comp_id` (`comp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `tb_message` */

insert  into `tb_message`(`mess_id`,`mess_topic`,`resource`,`content`,`user_id`,`comp_id`,`mess_date`,`mess_type`,`send_role`) values 
(11,'欢迎来到万才网','系统管理员','欢迎来的万才网',NULL,NULL,'2018-03-23 23:53:48','system','all'),
(30,'招聘信息标题','百毒科技','欢迎来到百毒科技',1,NULL,'2018-07-02 04:12:23','recruit','only'),
(31,'招聘信息标题','阿狸科技','欢迎来到阿狸科技',NULL,1,'2018-07-02 08:03:01','recruit','only'),
(28,'疼逊科技发布了一条招聘信息，你可能感兴趣哦！','系统推荐员','疼逊科技发布了一条招聘信息，你可能感兴趣哦！你可以搜索公司名字找到哦！',1,NULL,'2018-07-02 01:22:36','recommend','only'),
(29,'万一科技发布了一条求职信息，你可能感兴趣哦！','系统推荐员','万一科技发布了一条求职信息，你可能感兴趣哦！你可以搜索名字找到哦！',NULL,1,'2018-07-02 01:32:54','recommend','only');

/*Table structure for table `tb_recruit` */

DROP TABLE IF EXISTS `tb_recruit`;

CREATE TABLE `tb_recruit` (
  `recr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '招聘id',
  `comp_name` varchar(50) NOT NULL,
  `comp_id` int(11) NOT NULL,
  `recr_job` varchar(20) NOT NULL DEFAULT '' COMMENT '招聘岗位',
  `recr_place` varchar(50) NOT NULL,
  `recr_salary` varchar(11) NOT NULL,
  `recr_degree` varchar(20) NOT NULL,
  `recr_duty` varchar(500) NOT NULL COMMENT '岗位职责',
  `recr_demand` varchar(500) NOT NULL COMMENT '岗位要求',
  `recr_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `recr_state` int(11) NOT NULL DEFAULT '0' COMMENT '0是未审核，1是已审核，默认是0',
  PRIMARY KEY (`recr_id`),
  KEY `fk_comp_id` (`comp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `tb_recruit` */

insert  into `tb_recruit`(`recr_id`,`comp_name`,`comp_id`,`recr_job`,`recr_place`,`recr_salary`,`recr_degree`,`recr_duty`,`recr_demand`,`recr_date`,`recr_state`) values 
(1,'阿狸科学技术有限公司',1,'软件工程师','广州','1000-2000','本科','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-06-26 19:00:13',0),
(2,'阿狸科学技术有限公司',1,'Java工程师','汕头','2000-3000','小学','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-06-26 19:00:56',0),
(3,'阿狸科学技术有限公司',1,'UI设计师','深圳','4000-5000','初中','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-06-26 19:02:26',0),
(4,'百毒科学技术有限公司',2,'砖头搬广州','珠海','5000-6000','幼儿园','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-06-26 19:04:36',0),
(5,'百毒科学技术有限公司',2,'挖掘机工人','香港','6000-7000','高中','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-06-26 19:04:48',0),
(6,'百毒科学技术有限公司',2,'前端设计师','澳门','7000-8000','专科以上','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-06-26 19:05:05',0),
(7,'百毒科学技术有限公司',2,'电脑维修人员','惠州','5000-6000','本科','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-06-27 17:03:45',0),
(8,'万一科学技术有限公司',3,'代码搬运工','广州','10000-20000','硕士以上','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-06-27 17:04:45',0),
(9,'万一科学技术有限公司',3,'环保检测员','苏州','5000-6000','高中以上','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-06-27 20:17:44',0),
(10,'万一科学技术有限公司',3,'软件工程师','深圳','5000-6000','本科','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-06-27 20:24:34',0),
(11,'疼逊科学技术有限公司',4,'软件工程师','广州','1000-2000','硕士研究生','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-06-28 11:47:10',0),
(12,'疼逊科学技术有限公司',4,'软件工程师','广州','1000-3000','硕士研究生','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-07-02 01:16:28',0),
(13,'疼逊科学技术有限公司',4,'软件架构师','广州','1000-2000','博士研究生','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-07-02 01:20:05',0),
(14,'疼逊科学技术有限公司',4,'软件设计师','广州','1000-2000','硕士研究生','1、根据项目要求完成系统需求分析，技术可行性分析，完成模块详细设计和编程实现；\r\n2、负责应用软件模块的系统联调，解决开发过程中的技术问题，并配合测试和验收工作；\r\n3、负责向项目经理及时反馈软件开发中的情况，并根据实际情况提出改进建议。\r\n4、负责软件相关技术文档的编写。\r\n5、负责对自己开发的项目模块进行清晰、易懂的培训。','1、计算机相关专业，大专以上学历，二年以上软件开发经验；\r\n2、精通Java编程，了解tomcat，对MySql数据库熟悉(能独立编写存储过程、触发器)；\r\n3、有电商网站项目开发经验，熟悉Web前端技术者优先；\r\n4、有良好的沟通能力和团队合作精神，具有责任心、学习能力强，工作热情、积极，思维敏捷。','2016-07-02 01:22:36',0);

/*Table structure for table `tb_recruit_resume` */

DROP TABLE IF EXISTS `tb_recruit_resume`;

CREATE TABLE `tb_recruit_resume` (
  `deliver_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投递id',
  `user_id` int(11) NOT NULL,
  `resu_id` int(11) NOT NULL COMMENT '简历id',
  `recr_id` int(11) NOT NULL COMMENT '招聘id',
  `deliver_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deliver_state` int(11) NOT NULL DEFAULT '0' COMMENT '0是未处理，1是录用，2是不录用',
  PRIMARY KEY (`deliver_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_resu_id` (`resu_id`),
  KEY `fk_recr_id` (`recr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `tb_recruit_resume` */

insert  into `tb_recruit_resume`(`deliver_id`,`user_id`,`resu_id`,`recr_id`,`deliver_date`,`deliver_state`) values 
(1,1,21,1,'2016-06-28 20:33:33',0),
(2,1,20,2,'2016-06-28 20:58:06',0),
(3,1,19,3,'2016-06-28 20:58:12',0),
(4,2,18,4,'2016-06-28 20:58:17',0),
(5,2,17,5,'2016-06-28 20:58:21',0),
(6,2,16,6,'2016-06-28 20:58:26',0),
(7,4,10,7,'2016-06-28 20:58:30',0),
(8,4,9,2,'2016-07-02 02:30:08',0),
(9,4,7,2,'2016-07-02 02:30:12',0),
(10,3,11,1,'2016-07-02 02:30:15',0),
(11,3,12,1,'2016-07-02 02:30:18',0),
(12,3,13,1,'2016-07-02 02:30:27',0);

/*Table structure for table `tb_resume` */

DROP TABLE IF EXISTS `tb_resume`;

CREATE TABLE `tb_resume` (
  `resu_id` int(11) NOT NULL AUTO_INCREMENT,
  `resu_name` varchar(50) NOT NULL,
  `resu_job` varchar(20) NOT NULL,
  `education` varchar(255) NOT NULL COMMENT '教育背景',
  `job_experience` varchar(255) NOT NULL,
  `project_experience` varchar(255) DEFAULT NULL,
  `self_evaluate` varchar(255) DEFAULT NULL COMMENT '自我评价',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`resu_id`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `tb_resume` */

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(30) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_name` varchar(25) DEFAULT NULL,
  `user_sex` varchar(10) DEFAULT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `user_photo` varchar(100) DEFAULT 'logo/DeLogo.jpg',
  `user_birthday` varchar(20) DEFAULT NULL,
  `user_work_date` varchar(20) DEFAULT NULL,
  `user_born_city` varchar(10) DEFAULT NULL,
  `user_living_city` varchar(10) DEFAULT NULL,
  `user_state` int(1) NOT NULL DEFAULT '1' COMMENT '1是启用，0是冻结，默认值1',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`user_email`,`user_password`,`user_name`,`user_sex`,`user_phone`,`user_photo`,`user_birthday`,`user_work_date`,`user_born_city`,`user_living_city`,`user_state`) values 
(2,'xiaolan@163.com','e10adc3949ba59abbe56e057f20f883e','小蓝','女','18825044514','logo/fe964b77b9074f72b93ecc74e0fef42c.jpeg','2017/06/25','2017/06/25','汕头','广州',1),
(1,'xiaohong@163.com','e10adc3949ba59abbe56e057f20f883e','小红','男','15555555566','logo/39a1a2040fd14e7c9e69409227f36a7c.gif','2018/01/01','2019/02/02','深圳','珠海',1),
(3,'xiaoming@163.com','e10adc3949ba59abbe56e057f20f883e','小明','男','15511155444','logo/DeLogo.jpg','2000/05/06','2017/06/25','香港','珠海',1),
(4,'xiaobai@163.com','e10adc3949ba59abbe56e057f20f883e','小白','女','15544488444','logo/DeLogo.jpg','2000/05/06','2017/06/25','珠海','深圳',1),
(19,'xiaohei@qq.com','e10adc3949ba59abbe56e057f20f883e','小黑','男','13229416511','logo/2049367697f64f18911372b2691a0e9b.jpeg','1991/01/01','2011/01/01',NULL,'官渡古镇',1),
(20,'xiaozi@qq.com','e10adc3949ba59abbe56e057f20f883e','小梓',NULL,NULL,'logo/DeLogo.jpg',NULL,NULL,NULL,NULL,1);

/*Table structure for table `tb_user_collection` */

DROP TABLE IF EXISTS `tb_user_collection`;

CREATE TABLE `tb_user_collection` (
  `user_id` int(11) NOT NULL,
  `recr_id` int(11) NOT NULL COMMENT '招聘id',
  PRIMARY KEY (`user_id`,`recr_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_recr_id` (`recr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tb_user_collection` */

insert  into `tb_user_collection`(`user_id`,`recr_id`) values 
(1,1),
(1,2),
(1,3),
(2,4),
(2,5),
(2,6),
(3,7),
(3,8),
(3,9),
(4,10),
(4,11),
(4,12);

/* Procedure structure for procedure `recommendRecruit` */

/*!50003 DROP PROCEDURE IF EXISTS  `recommendRecruit` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `recommendRecruit`(IN searchStr varchar(50))
    MODIFIES SQL DATA
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS tmpStr(v VARCHAR(50));
	DELETE FROM tmpStr;
	
	#INSERT INTO tmpStr values(searchStr);
	CALL stringToRows(searchStr);
	#select * FROM tmpStr;
	SELECT * FROM tb_recruit a
	INNER JOIN tmpStr b
	ON INSTR(a.recr_job,b.v)>0
	#OR INSTR(a.recr_place,b.v)>0
	#WHERE recr_job like '%%'
	WHERE b.v<>'' 
	GROUP BY comp_id
	ORDER BY COUNT(DISTINCT v) DESC
	LIMIT 0,10;
END */$$
DELIMITER ;

/* Procedure structure for procedure `recommenHunt` */

/*!50003 DROP PROCEDURE IF EXISTS  `recommenHunt` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `recommenHunt`(IN searchStr varchar(50))
    MODIFIES SQL DATA
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS tmpStr(v VARCHAR(50));
	DELETE FROM tmpStr;
	#INSERT INTO tmpStr values(searchStr);
	CALL stringToRows(searchStr);
	#select * FROM tmpStr;
	SELECT * FROM tb_hunt a
	INNER JOIN tmpStr b
	ON INSTR(a.hunt_job,b.v)>0
	#OR INSTR(a.hunt_place,b.v)>0
	#OR INSTR(a.recr_place,b.v)>0
	#WHERE recr_job like '%%'
	WHERE b.v<>'' 
	GROUP BY user_id
	ORDER BY COUNT(DISTINCT v) DESC
	LIMIT 0,10;
END */$$
DELIMITER ;

/* Procedure structure for procedure `searchHunt` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchHunt` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchHunt`(IN searchStr varchar(50))
    MODIFIES SQL DATA
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS tmpStr(v VARCHAR(50));
	DELETE FROM tmpStr;
	#INSERT INTO tmpStr values(searchStr);
	CALL stringToRows(searchStr);
	#select * FROM tmpStr;
	SELECT * FROM tb_hunt a
	INNER JOIN tmpStr b
	ON INSTR(a.hunt_job,b.v)>0
	OR INSTR(a.hunt_place,b.v)>0
	OR INSTR(a.user_name,b.v)>0
	
	#OR INSTR(a.recr_place,b.v)>0
	#WHERE recr_job like '%%'
	WHERE b.v<>'' 
	GROUP BY hunt_id,hunt_job
	ORDER BY COUNT(DISTINCT v) DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `searchRecruit` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchRecruit` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchRecruit`(IN searchStr varchar(50))
    MODIFIES SQL DATA
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS tmpStr(v VARCHAR(50));
	DELETE FROM tmpStr;
	#INSERT INTO tmpStr values(searchStr);
	CALL stringToRows(searchStr);
	#select * FROM tmpStr;
	SELECT * FROM tb_recruit a
	INNER JOIN tmpStr b
	ON INSTR(a.recr_job,b.v)>0
	OR INSTR(a.recr_place,b.v)>0
	OR INSTR(a.comp_name,b.v)>0
	#OR INSTR(a.recr_place,b.v)>0
	#WHERE recr_job like '%%'
	WHERE b.v<>'' 
	GROUP BY recr_id,recr_job
	ORDER BY COUNT(DISTINCT v) DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `stringToRows` */

/*!50003 DROP PROCEDURE IF EXISTS  `stringToRows` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `stringToRows`(IN str varchar(100))
    MODIFIES SQL DATA
BEGIN
 
DECLARE i INT;
SET i=1;
	WHILE i<=LENGTH(str) DO
		INSERT INTO tmpStr SELECT SUBSTRING(str,i,1);
		SET i=i+1;
	END WHILE;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
