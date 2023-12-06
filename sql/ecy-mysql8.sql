/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.32 : Database - ecy-exam
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ecy-exam` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ecy-exam`;

/*Table structure for table `basic_department` */

DROP TABLE IF EXISTS `basic_department`;

CREATE TABLE `basic_department` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `parent_id` bigint NOT NULL COMMENT '父id',
                                    `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
                                    `leader` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
                                    `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
                                    `enabled` tinyint(1) NOT NULL COMMENT '是否启用',
                                    `create_time` datetime NOT NULL COMMENT '创建时间',
                                    `update_time` datetime NOT NULL COMMENT '修改时间',
                                    `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
                                    `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `basic_department` */

insert  into `basic_department`(`id`,`parent_id`,`name`,`leader`,`phone`,`enabled`,`create_time`,`update_time`,`create_by`,`update_by`) values
                                                                                                                                            (1,0,'学校','yongoe','10086',1,'2023-01-01 00:00:00','2023-11-30 09:47:29','yongoe','yongoe'),
                                                                                                                                            (2,1,'一年级','yongoe','10086',1,'2023-01-01 00:00:00','2023-11-30 09:47:43','yongoe','yongoe'),
                                                                                                                                            (3,1,'二年级','yongoe','10086',1,'2023-01-01 00:00:00','2023-11-30 09:47:50','yongoe','yongoe'),
                                                                                                                                            (4,1,'三年级','yongoe','10086',1,'2023-01-01 00:00:00','2023-11-30 09:47:54','yongoe','yongoe'),
                                                                                                                                            (5,2,'一班',NULL,NULL,1,'2023-11-30 10:02:50','2023-11-30 10:02:50','yongoe','yongoe'),
                                                                                                                                            (6,2,'二班',NULL,NULL,1,'2023-11-30 10:02:57','2023-11-30 10:02:57','yongoe','yongoe'),
                                                                                                                                            (7,2,'三班',NULL,NULL,1,'2023-11-30 10:03:06','2023-11-30 10:03:06','yongoe','yongoe'),
                                                                                                                                            (8,3,'一班',NULL,NULL,1,'2023-11-30 10:03:11','2023-11-30 10:03:11','yongoe','yongoe'),
                                                                                                                                            (9,4,'一班',NULL,NULL,1,'2023-11-30 10:03:16','2023-11-30 10:03:16','yongoe','yongoe'),
                                                                                                                                            (10,3,'二班',NULL,NULL,1,'2023-11-30 10:03:20','2023-11-30 10:03:20','yongoe','yongoe'),
                                                                                                                                            (11,4,'二班',NULL,NULL,1,'2023-11-30 10:03:24','2023-11-30 10:03:24','yongoe','yongoe');

/*Table structure for table `basic_dict` */

DROP TABLE IF EXISTS `basic_dict`;

CREATE TABLE `basic_dict` (
                              `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                              `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典名称',
                              `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典类型(select,radio)',
                              `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                              `create_time` datetime NOT NULL COMMENT '创建时间',
                              `update_time` datetime NOT NULL COMMENT '修改时间',
                              `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
                              `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `basic_dict` */

insert  into `basic_dict`(`id`,`name`,`type`,`remark`,`create_time`,`update_time`,`create_by`,`update_by`) values
                                                                                                               (1,'性别','select','无','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                               (2,'是否','select','无','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                               (3,'题目类型','select',NULL,'2023-11-30 19:36:21','2023-11-30 19:43:00','yongoe','yongoe'),
                                                                                                               (4,'题目难度','select',NULL,'2023-11-30 19:36:35','2023-11-30 19:43:04','yongoe','yongoe'),
                                                                                                               (5,'开放形式','select','考试开放形式','2023-11-30 20:47:17','2023-12-02 15:26:38','yongoe','yongoe'),
                                                                                                               (6,'考试发布状态','select','考试发布状态','2023-11-30 21:33:42','2023-11-30 21:33:42','yongoe','yongoe'),
                                                                                                               (7,'考生试卷状态','select',NULL,'2023-12-04 21:14:58','2023-12-04 21:14:58','yongoe','yongoe');

/*Table structure for table `basic_dict_data` */

DROP TABLE IF EXISTS `basic_dict_data`;

CREATE TABLE `basic_dict_data` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `dict_id` bigint NOT NULL COMMENT '字典id',
                                   `dict_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典键',
                                   `dict_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典值',
                                   `sort` int NOT NULL COMMENT '字典顺序',
                                   `create_time` datetime NOT NULL COMMENT '创建时间',
                                   `update_time` datetime NOT NULL COMMENT '修改时间',
                                   `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
                                   `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `basic_dict_data` */

insert  into `basic_dict_data`(`id`,`dict_id`,`dict_key`,`dict_value`,`sort`,`create_time`,`update_time`,`create_by`,`update_by`) values
                                                                                                                                      (1,1,'男','男',0,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                                                      (2,1,'女','女',0,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                                                      (3,2,'是','是',0,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                                                      (4,2,'否','否',0,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                                                      (5,3,'单选','单选',0,'2023-11-30 19:36:42','2023-11-30 19:36:42','yongoe','yongoe'),
                                                                                                                                      (6,3,'多选','多选',0,'2023-11-30 19:36:48','2023-11-30 19:36:48','yongoe','yongoe'),
                                                                                                                                      (7,3,'判断','判断',0,'2023-11-30 19:36:53','2023-11-30 19:36:53','yongoe','yongoe'),
                                                                                                                                      (8,3,'简答','简答',0,'2023-11-30 19:36:59','2023-11-30 19:36:59','yongoe','yongoe'),
                                                                                                                                      (9,4,'简单','简单',0,'2023-11-30 19:39:27','2023-11-30 19:39:27','yongoe','yongoe'),
                                                                                                                                      (10,4,'普通','普通',0,'2023-11-30 19:39:32','2023-11-30 19:39:32','yongoe','yongoe'),
                                                                                                                                      (11,4,'困难','困难',0,'2023-11-30 19:39:37','2023-11-30 19:39:37','yongoe','yongoe'),
                                                                                                                                      (12,5,'全部开放','1',0,'2023-11-30 20:47:27','2023-12-04 12:36:17','yongoe','yongoe'),
                                                                                                                                      (13,5,'部门开放','2',0,'2023-11-30 20:47:36','2023-12-04 12:36:19','yongoe','yongoe'),
                                                                                                                                      (14,5,'指定开放','3',0,'2023-11-30 20:47:49','2023-12-04 12:36:21','yongoe','yongoe'),
                                                                                                                                      (15,6,'未组卷','1',0,'2023-11-30 21:33:49','2023-12-02 15:27:52','yongoe','yongoe'),
                                                                                                                                      (17,6,'已发放试卷，未开始','2',0,'2023-11-30 21:34:43','2023-12-02 15:27:55','yongoe','yongoe'),
                                                                                                                                      (18,6,'进行中','3',0,'2023-12-01 13:47:27','2023-12-02 15:27:57','yongoe','yongoe'),
                                                                                                                                      (19,6,'已结束','4',0,'2023-12-01 13:47:31','2023-12-02 15:27:59','yongoe','yongoe'),
                                                                                                                                      (20,7,'未参加','1',0,'2023-12-04 21:18:24','2023-12-04 21:18:24','yongoe','yongoe'),
                                                                                                                                      (21,7,'考试中','2',0,'2023-12-04 21:18:32','2023-12-05 10:15:16','yongoe','yongoe'),
                                                                                                                                      (22,7,'未通过','3',0,'2023-12-04 21:18:38','2023-12-04 21:18:38','yongoe','yongoe'),
                                                                                                                                      (23,7,'通过','4',0,'2023-12-04 22:33:50','2023-12-05 10:15:25','yongoe','yongoe'),
                                                                                                                                      (24,7,'已交卷','5',0,'2023-12-05 13:17:58','2023-12-05 13:18:14','yongoe','yongoe');

/*Table structure for table `basic_letter` */

DROP TABLE IF EXISTS `basic_letter`;

CREATE TABLE `basic_letter` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `addresser_id` bigint NOT NULL COMMENT '发件人id',
                                `addresser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发件人',
                                `addressee_id` bigint NOT NULL COMMENT '收件人id',
                                `addressee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收件人',
                                `title` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
                                `content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
                                `state` tinyint(1) NOT NULL COMMENT '状态',
                                `create_time` datetime NOT NULL COMMENT '创建时间',
                                `update_time` datetime NOT NULL COMMENT '修改时间',
                                `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
                                `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `basic_letter` */

insert  into `basic_letter`(`id`,`addresser_id`,`addresser`,`addressee_id`,`addressee`,`title`,`content`,`state`,`create_time`,`update_time`,`create_by`,`update_by`) values
    (1,1,'yongoe',1,'yongoe','你好','<p>是是是撒娇胆囊结石机电技术</p>',1,'2023-12-02 22:26:48','2023-12-02 22:51:56','yongoe','yongoe');

/*Table structure for table `basic_position` */

DROP TABLE IF EXISTS `basic_position`;

CREATE TABLE `basic_position` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '职位',
                                  `enabled` tinyint(1) NOT NULL COMMENT '是否启用',
                                  `create_time` datetime NOT NULL COMMENT '创建时间',
                                  `update_time` datetime NOT NULL COMMENT '修改时间',
                                  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
                                  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `basic_position` */

insert  into `basic_position`(`id`,`name`,`enabled`,`create_time`,`update_time`,`create_by`,`update_by`) values
    (1,'管理员',1,'2023-01-01 00:00:00','2023-11-30 09:40:16','yongoe','yongoe');

/*Table structure for table `e_exam` */

DROP TABLE IF EXISTS `e_exam`;

CREATE TABLE `e_exam` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `exam_name` varchar(100) NOT NULL COMMENT '考试名称',
                          `exam_desc` varchar(100) DEFAULT NULL COMMENT '考试描述',
                          `open_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '开放形式',
                          `duration` int NOT NULL COMMENT '考试时长',
                          `start_time` datetime NOT NULL COMMENT '考试开始时间',
                          `end_time` datetime NOT NULL COMMENT '考试结束时间',
                          `total_score` int DEFAULT NULL COMMENT '考试总分',
                          `pass_score` int DEFAULT NULL COMMENT '及格分',
                          `status` varchar(10) NOT NULL COMMENT '状态',
                          `create_time` datetime NOT NULL COMMENT '创建时间',
                          `update_time` datetime NOT NULL COMMENT '修改时间',
                          `create_by` varchar(50) NOT NULL COMMENT '创建人',
                          `update_by` varchar(50) NOT NULL COMMENT '修改人',
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `e_exam` */

insert  into `e_exam`(`id`,`exam_name`,`exam_desc`,`open_type`,`duration`,`start_time`,`end_time`,`total_score`,`pass_score`,`status`,`create_time`,`update_time`,`create_by`,`update_by`) values
    (38,'sas','as','1',376,'2023-12-06 17:43:54','2023-12-07 00:00:00',11,11,'3','2023-12-06 17:43:59','2023-12-06 17:44:14','yongoe','yongoe');

/*Table structure for table `e_exam_dept` */

DROP TABLE IF EXISTS `e_exam_dept`;

CREATE TABLE `e_exam_dept` (
                               `id` bigint NOT NULL AUTO_INCREMENT,
                               `exam_id` bigint NOT NULL COMMENT '考试id',
                               `department_id` bigint NOT NULL COMMENT '部门id',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                               `create_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
                               `update_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `e_exam_dept` */

/*Table structure for table `e_exam_question` */

DROP TABLE IF EXISTS `e_exam_question`;

CREATE TABLE `e_exam_question` (
                                   `id` bigint NOT NULL AUTO_INCREMENT,
                                   `exam_id` bigint NOT NULL COMMENT '考试id',
                                   `question_id` bigint NOT NULL COMMENT '题目id',
                                   `score` int NOT NULL COMMENT '分数',
                                   `create_time` datetime NOT NULL COMMENT '创建时间',
                                   `update_time` datetime NOT NULL COMMENT '修改时间',
                                   `create_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
                                   `update_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `e_exam_question` */

insert  into `e_exam_question`(`id`,`exam_id`,`question_id`,`score`,`create_time`,`update_time`,`create_by`,`update_by`) values
                                                                                                                             (24,38,29,11,'2023-12-06 17:44:14','2023-12-06 17:44:14','yongoe','yongoe'),
                                                                                                                             (25,38,27,11,'2023-12-06 17:44:14','2023-12-06 17:44:14','yongoe','yongoe'),
                                                                                                                             (26,38,25,11,'2023-12-06 17:44:14','2023-12-06 17:44:14','yongoe','yongoe'),
                                                                                                                             (27,38,24,11,'2023-12-06 17:44:14','2023-12-06 17:44:14','yongoe','yongoe');

/*Table structure for table `e_exam_user` */

DROP TABLE IF EXISTS `e_exam_user`;

CREATE TABLE `e_exam_user` (
                               `id` bigint NOT NULL AUTO_INCREMENT,
                               `exam_id` bigint NOT NULL COMMENT '考试id',
                               `user_id` bigint NOT NULL COMMENT '用户id',
                               `create_time` datetime NOT NULL COMMENT '创建时间',
                               `update_time` datetime NOT NULL COMMENT '修改时间',
                               `create_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
                               `update_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `e_exam_user` */

/*Table structure for table `e_question` */

DROP TABLE IF EXISTS `e_question`;

CREATE TABLE `e_question` (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `question_bank_id` bigint NOT NULL COMMENT '题库id',
                              `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目',
                              `type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型',
                              `level` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目难度',
                              `answer` longtext COMMENT '正确答案',
                              `create_time` datetime NOT NULL COMMENT '创建时间',
                              `update_time` datetime NOT NULL COMMENT '修改时间',
                              `create_by` varchar(50) NOT NULL COMMENT '创建人',
                              `update_by` varchar(50) NOT NULL COMMENT '修改人',
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `e_question` */

insert  into `e_question`(`id`,`question_bank_id`,`content`,`type`,`level`,`answer`,`create_time`,`update_time`,`create_by`,`update_by`) values
                                                                                                                                             (24,1,'<p>在 Element UI 的 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 组件中，<code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">border</code> 属性用于设置边框样式，但该属性是布尔类型的，不接受值。如果你想在 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 中添加标签并且希望标签撑开按钮，可以考虑使用包裹元素，比如 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">&lt;label&gt;</code> 或者 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">&lt;div&gt;</code>，来包含 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 和标签。</p><p>以下是一个示例：</p>','单选','简单','','2023-11-30 19:58:33','2023-12-06 15:24:10','yongoe','yongoe'),
                                                                                                                                             (25,1,'<p>在 Element UI 的 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 组件中，<code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">border</code> 属性用于设置边框样式，但该属性是布尔类型的，不接受值。如果你想在 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 中添加标签并且希望标签撑开按钮，可以考虑使用包裹元素，比如 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">&lt;label&gt;</code> 或者 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">&lt;div&gt;</code>，来包含 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 和标签。</p><p>以下是一个示例：</p>','简答','普通','<p>在 Element UI 的 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 组件中，<code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">border</code> 属性用于设置边框样式，但该属性是布尔类型的，不接受值。如果你想在 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 中添加标签并且希望标签撑开按钮，可以考虑使用包裹元素，比如 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">&lt;label&gt;</code> 或者 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">&lt;div&gt;</code>，来包含 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 和标签。</p><p>以下是一个示例：</p>','2023-11-30 20:35:49','2023-12-06 20:40:48','yongoe','yongoe'),
                                                                                                                                             (27,1,'<p>在 Element UI 的 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 组件中，<code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">border</code> 属性用于设置边框样式，但该属性是布尔类型的，不接受值。如果你想在 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 中添加标签并且希望标签撑开按钮，可以考虑使用包裹元素，比如 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">&lt;label&gt;</code> 或者 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">&lt;div&gt;</code>，来包含 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 和标签。</p><p>以下是一个示例：</p>','多选','普通','','2023-12-06 14:34:23','2023-12-06 17:43:36','yongoe','yongoe'),
                                                                                                                                             (29,1,'<p>在 Element UI 的 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 组件中，<code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">border</code> 属性用于设置边框样式，但该属性是布尔类型的，不接受值。如果你想在 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 中添加标签并且希望标签撑开按钮，可以考虑使用包裹元素，比如 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">&lt;label&gt;</code> 或者 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">&lt;div&gt;</code>，来包含 <code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code> 和标签。</p><p>以下是一个示例：</p>','判断','普通',NULL,'2023-12-06 16:01:04','2023-12-06 17:43:41','yongoe','yongoe');

/*Table structure for table `e_question_bank` */

DROP TABLE IF EXISTS `e_question_bank`;

CREATE TABLE `e_question_bank` (
                                   `id` bigint NOT NULL AUTO_INCREMENT,
                                   `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
                                   `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                                   `create_time` datetime NOT NULL COMMENT '创建时间',
                                   `update_time` datetime NOT NULL COMMENT '修改时间',
                                   `create_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
                                   `update_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='题库';

/*Data for the table `e_question_bank` */

insert  into `e_question_bank`(`id`,`name`,`remark`,`create_time`,`update_time`,`create_by`,`update_by`) values
                                                                                                             (1,'一年级数学',NULL,'2023-11-30 19:16:44','2023-11-30 19:16:44','yongoe','yongoe'),
                                                                                                             (2,'二年级数学',NULL,'2023-11-30 19:34:50','2023-11-30 19:34:50','yongoe','yongoe');

/*Table structure for table `e_question_option` */

DROP TABLE IF EXISTS `e_question_option`;

CREATE TABLE `e_question_option` (
                                     `id` bigint NOT NULL AUTO_INCREMENT,
                                     `question_id` bigint NOT NULL COMMENT '题目id',
                                     `content` longtext NOT NULL COMMENT '内容',
                                     `is_true` tinyint(1) NOT NULL COMMENT '是否正确',
                                     `create_time` datetime NOT NULL COMMENT '创建时间',
                                     `update_time` datetime NOT NULL COMMENT '修改时间',
                                     `create_by` varchar(50) NOT NULL COMMENT '创建人',
                                     `update_by` varchar(50) NOT NULL COMMENT '修改人',
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='答案选项';

/*Data for the table `e_question_option` */

insert  into `e_question_option`(`id`,`question_id`,`content`,`is_true`,`create_time`,`update_time`,`create_by`,`update_by`) values
                                                                                                                                 (1,23,'12',1,'2023-11-30 20:13:30','2023-11-30 20:13:30','yongoe','yongoe'),
                                                                                                                                 (2,23,'11',0,'2023-11-30 20:13:46','2023-11-30 20:14:12','yongoe','yongoe'),
                                                                                                                                 (3,23,'18',0,'2023-11-30 20:14:03','2023-11-30 20:14:03','yongoe','yongoe'),
                                                                                                                                 (4,23,'16',0,'2023-11-30 20:14:08','2023-11-30 20:14:08','yongoe','yongoe'),
                                                                                                                                 (9,24,'<p>在 Element UI 的 <code style=\"color: var(--text-primary);\">el-radio</code> 组件中，<code style=\"color: var(--text-primary);\">border</code> 属性用于设置边框样式，但该属性是布尔类型的，不接受值。如果你想在 <code style=\"color: var(--text-primary);\">el-radio</code> 中添加标签并且希望标签撑开按钮，可以考虑使用包裹元素，比如 <code style=\"color: var(--text-primary);\">&lt;label&gt;</code> 或者 <code style=\"color: var(--text-primary);\">&lt;div&gt;</code>，来包含 <code style=\"color: var(--text-primary);\">el-radio</code> 和标签。</p><p>以下是一个示例</p>',1,'2023-12-01 13:59:44','2023-12-06 15:24:45','yongoe','yongoe'),
                                                                                                                                 (10,24,'<p><span style=\"background-color: rgb(245, 247, 250);\">在 Element UI 的&nbsp;</span><code style=\"background-color: rgb(245, 247, 250); color: var(--text-primary);\">el-radio</code><span style=\"background-color: rgb(245, 247, 250);\">&nbsp;组件中，</span><code style=\"background-color: rgb(245, 247, 250); color: var(--text-primary);\">border</code><span style=\"background-color: rgb(245, 247, 250);\">&nbsp;属性用于设置边框样式，但该属性是布尔类型的，不接受值。如果你想在&nbsp;</span><code style=\"background-color: rgb(245, 247, 250); color: var(--text-primary);\">el-radio</code><span style=\"background-color: rgb(245, 247, 250);\">&nbsp;中添加标签并且希望标签撑开按钮，可以考虑使用包裹元素，比如&nbsp;</span><code style=\"background-color: rgb(245, 247, 250); color: var(--text-primary);\">&lt;label&gt;</code><span style=\"background-color: rgb(245, 247, 250);\">&nbsp;或者&nbsp;</span><code style=\"background-color: rgb(245, 247, 250); color: var(--text-primary);\">&lt;div&gt;</code><span style=\"background-color: rgb(245, 247, 250);\">，来包含&nbsp;</span><code style=\"background-color: rgb(245, 247, 250); color: var(--text-primary);\">el-radio</code><span style=\"background-color: rgb(245, 247, 250);\">&nbsp;和标签</span></p>',0,'2023-12-01 13:59:47','2023-12-06 15:17:27','yongoe','yongoe'),
                                                                                                                                 (11,24,'<p>5</p>',0,'2023-12-01 13:59:49','2023-12-01 13:59:49','yongoe','yongoe'),
                                                                                                                                 (12,27,'<p class=\"ql-align-center\">ment UI 的&nbsp;<code style=\"background-color: rgb(240, 240, 240); color: var(--text-primary);\">el-radio</code>&nbsp;组件中，<code style=\"background-color: rgb(240, 240, 240); color: var(--text-primary);\">border</code>&nbsp;属性用于设置边框样式，但该属性是布尔类型的，不接受值。如果你想在&nbsp;<code style=\"background-color: rgb(240, 240, 240); color: var(--text-primary);\">el-radio</code>&nbsp;中添加标签并且希望标签撑开按钮，可以考虑使用包裹元素，比如&nbsp;<code style=\"background-color: rgb(240, 240, 240); color: var(--text-primary);\">&lt;label&gt;</code>&nbsp;或者&nbsp;<code style=\"background-color: rgb(240, 240, 240); color: var(--text-primary);\">&lt;div&gt;</code>，来包含&nbsp;<code style=\"background-color: rgb(240, 240, 240); color: var(--text-primary);\">el-radio</code>&nbsp;和标签。</p><p><br></p>',1,'2023-12-06 14:34:29','2023-12-06 19:37:46','yongoe','yongoe'),
                                                                                                                                 (13,27,'<p class=\"ql-align-center\">ment UI 的&nbsp;<code style=\"background-color: rgb(240, 240, 240); color: var(--text-primary);\">el-radio</code>&nbsp;组件中，<code style=\"background-color: rgb(240, 240, 240); color: var(--text-primary);\">border</code>&nbsp;属性用于设置边框样式，但该属性是布尔类型的，不接受值。如果你想在&nbsp;<code style=\"background-color: rgb(240, 240, 240); color: var(--text-primary);\">el-radio</code>&nbsp;中添加标签并且希望标签撑开按钮，可以考虑使用包裹元素，比如&nbsp;<code style=\"background-color: rgb(240, 240, 240); color: var(--text-primary);\">&lt;label&gt;</code>&nbsp;或者&nbsp;<code style=\"background-color: rgb(240, 240, 240); color: var(--text-primary);\">&lt;div&gt;</code>，来包含&nbsp;<code style=\"background-color: rgb(240, 240, 240); color: var(--text-primary);\">el-radio</code>&nbsp;和标签。</p><p><br></p>',0,'2023-12-06 14:34:31','2023-12-06 16:09:38','yongoe','yongoe'),
                                                                                                                                 (19,29,'对',1,'2023-12-06 16:01:04','2023-12-06 16:02:11','yongoe','yongoe'),
                                                                                                                                 (20,29,'错',0,'2023-12-06 16:01:04','2023-12-06 16:01:04','yongoe','yongoe'),
                                                                                                                                 (21,27,'<p class=\"ql-align-center\">于设置边框样式，但该属性是布尔类型的，不接受值。如果你想在&nbsp;<code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code>&nbsp;中添加标签并且希望标签撑开按钮，可以考虑使用包裹元素，比如&nbsp;<code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">&lt;label&gt;</code>&nbsp;或者&nbsp;<code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">&lt;div&gt;</code>，来包含&nbsp;<code style=\"color: var(--text-primary); background-color: rgb(240, 240, 240);\">el-radio</code>&nbsp;和标签。</p><p><br></p>',0,'2023-12-06 20:34:50','2023-12-06 20:34:50','yongoe','yongoe');

/*Table structure for table `e_user_paper` */

DROP TABLE IF EXISTS `e_user_paper`;

CREATE TABLE `e_user_paper` (
                                `id` bigint NOT NULL AUTO_INCREMENT,
                                `user_id` bigint NOT NULL COMMENT '用户id',
                                `exam_id` bigint NOT NULL COMMENT '考试id',
                                `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '考试状态',
                                `enter_time` datetime DEFAULT NULL COMMENT '开始时间',
                                `finish_time` datetime DEFAULT NULL COMMENT '交卷时间',
                                `score` double DEFAULT NULL COMMENT '得分',
                                `create_time` datetime NOT NULL COMMENT '创建时间',
                                `update_time` datetime NOT NULL COMMENT '修改时间',
                                `create_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
                                `update_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `e_user_paper` */

insert  into `e_user_paper`(`id`,`user_id`,`exam_id`,`status`,`enter_time`,`finish_time`,`score`,`create_time`,`update_time`,`create_by`,`update_by`) values
                                                                                                                                                          (17,1,38,'4','2023-12-06 17:44:18','2023-12-06 17:44:31',27,'2023-12-06 17:44:14','2023-12-06 20:47:10','yongoe','yongoe'),
                                                                                                                                                          (18,2,38,'1',NULL,NULL,NULL,'2023-12-06 17:44:14','2023-12-06 17:44:14','yongoe','yongoe');

/*Table structure for table `e_user_question` */

DROP TABLE IF EXISTS `e_user_question`;

CREATE TABLE `e_user_question` (
                                   `id` bigint NOT NULL AUTO_INCREMENT,
                                   `user_id` bigint NOT NULL COMMENT '用户id',
                                   `exam_id` bigint NOT NULL COMMENT '考试id',
                                   `question_id` bigint NOT NULL COMMENT '问题id',
                                   `answer` longtext COLLATE utf8mb4_unicode_ci COMMENT '答案',
                                   `score` double DEFAULT NULL COMMENT '得分',
                                   `is_true` tinyint(1) DEFAULT NULL COMMENT '是否正确',
                                   `create_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
                                   `update_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
                                   `create_time` datetime NOT NULL COMMENT '创建时间',
                                   `update_time` datetime NOT NULL COMMENT '修改时间',
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `e_user_question` */

insert  into `e_user_question`(`id`,`user_id`,`exam_id`,`question_id`,`answer`,`score`,`is_true`,`create_by`,`update_by`,`create_time`,`update_time`) values
                                                                                                                                                          (34,1,38,29,'19',11,1,'yongoe','yongoe','2023-12-06 17:44:14','2023-12-06 20:47:10'),
                                                                                                                                                          (35,1,38,27,'[\"12\",\"13\"]',5,0,'yongoe','yongoe','2023-12-06 17:44:14','2023-12-06 20:47:10'),
                                                                                                                                                          (36,1,38,25,'<p>dsvdfdbdfbdf</p>',11,1,'yongoe','yongoe','2023-12-06 17:44:14','2023-12-06 20:47:10'),
                                                                                                                                                          (37,1,38,24,'10',0,0,'yongoe','yongoe','2023-12-06 17:44:14','2023-12-06 20:47:10'),
                                                                                                                                                          (38,2,38,29,NULL,NULL,NULL,'yongoe','yongoe','2023-12-06 17:44:14','2023-12-06 17:44:14'),
                                                                                                                                                          (39,2,38,27,NULL,NULL,NULL,'yongoe','yongoe','2023-12-06 17:44:14','2023-12-06 17:44:14'),
                                                                                                                                                          (40,2,38,25,NULL,NULL,NULL,'yongoe','yongoe','2023-12-06 17:44:14','2023-12-06 17:44:14'),
                                                                                                                                                          (41,2,38,24,NULL,NULL,NULL,'yongoe','yongoe','2023-12-06 17:44:14','2023-12-06 17:44:14');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
                              `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                              `config_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '键',
                              `config_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '值',
                              `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                              `create_time` datetime NOT NULL COMMENT '创建时间',
                              `update_time` datetime NOT NULL COMMENT '修改时间',
                              `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
                              `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `key` (`config_key`) COMMENT 'key'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`config_key`,`config_value`,`remark`,`create_time`,`update_time`,`create_by`,`update_by`) values
                                                                                                                             (1,'qq-clientId','无','QQ登陆clientId(动态生效)','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                                             (2,'qq-clientSecret','无','QQ登陆Secret(动态生效)','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                                             (3,'qq-redirectUri','无','QQ登陆重定向链接(动态生效)','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                                             (4,'sms-secretId','无','腾讯云账号id(动态生效)','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                                             (5,'sms-secretKey','无','腾讯云账号key(动态生效)','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                                             (6,'sms-sdkAppId','无','创建应用的id(动态生效)','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                                             (7,'sms-signName','无','签名内容(动态生效)','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                                             (8,'sms-templateId','无','短信模板id(动态生效)','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
                                                                                                                             (9,'wxh5-clientId','无','微信H5登陆clientId(动态生效)','2023-11-06 05:33:19','2023-11-06 05:33:21','yongoe','yongoe'),
                                                                                                                             (10,'wxh5-clientSecret','无','微信H5登陆Secret(动态生效)','2023-11-06 05:33:59','2023-11-06 05:34:01','yongoe','yongoe'),
                                                                                                                             (11,'wxh5-redirectUri','无','微信H5登陆redirectUri(动态生效)','2023-11-06 05:34:24','2023-11-06 05:34:26','yongoe','yongoe'),
                                                                                                                             (12,'mail-host','smtp.qq.com','邮箱host(重启生效)','2023-11-08 13:58:06','2023-11-08 13:58:06','yongoe','yongoe'),
                                                                                                                             (13,'mail-port','25','邮箱端口(重启生效)','2023-11-08 13:58:21','2023-11-08 13:58:21','yongoe','yongoe'),
                                                                                                                             (14,'mail-username','无','邮箱账号(重启生效)','2023-11-08 13:58:42','2023-11-08 13:58:42','yongoe','yongoe'),
                                                                                                                             (15,'mail-password','无','邮箱密钥(重启生效)','2023-11-08 13:59:01','2023-11-08 13:59:01','yongoe','yongoe'),
                                                                                                                             (16,'mail-protocol','smtp','邮箱协议(重启生效)','2023-11-08 13:59:17','2023-11-08 13:59:32','yongoe','yongoe');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                           `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户',
                           `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型',
                           `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
                           `details` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详情',
                           `create_time` datetime NOT NULL COMMENT '创建时间',
                           `update_time` datetime NOT NULL COMMENT '修改时间',
                           `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
                           `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`name`,`type`,`title`,`details`,`create_time`,`update_time`,`create_by`,`update_by`) values
    (1,'yongoe','异常','在 com.yongoe.ecy.basic.controller.DepartmentController 的 add 方法中发生了异常','参数：[DepartmentReq(id=null, parentId=2, name=一班, leader=null, phone=null, enabled=true)]\norg.springframework.dao.DataIntegrityViolationException: \n### Error updating database.  Cause: java.sql.SQLException: Field \'leader\' doesn\'t have a default value\n### The error may exist in com/yongoe/ecy/basic/mapper/DepartmentMapper.java (best guess)\n### The error may involve com.yongoe.ecy.basic.mapper.DepartmentMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO basic_department  ( parent_id, name,   enabled, create_time, update_time, create_by, update_by )  VALUES  ( ?, ?,   ?, ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'leader\' doesn\'t have a default value\n; Field \'leader\' doesn\'t have a default value','2023-11-30 10:00:35','2023-11-30 10:00:35','yongoe','yongoe'),
(2,'yongoe','异常','在 com.yongoe.ecy.basic.controller.DepartmentController 的 add 方法中发生了异常','参数：[DepartmentReq(id=null, parentId=2, name=一班, leader=null, phone=null, enabled=true)]\norg.springframework.dao.DataIntegrityViolationException: \n### Error updating database.  Cause: java.sql.SQLException: Field \'leader\' doesn\'t have a default value\n### The error may exist in com/yongoe/ecy/basic/mapper/DepartmentMapper.java (best guess)\n### The error may involve com.yongoe.ecy.basic.mapper.DepartmentMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO basic_department  ( parent_id, name,   enabled, create_time, update_time, create_by, update_by )  VALUES  ( ?, ?,   ?, ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'leader\' doesn\'t have a default value\n; Field \'leader\' doesn\'t have a default value','2023-11-30 10:00:38','2023-11-30 10:00:38','yongoe','yongoe'),
(3,'yongoe','异常','在 com.yongoe.ecy.basic.controller.DepartmentController 的 add 方法中发生了异常','参数：[DepartmentReq(id=null, parentId=2, name=一班, leader=null, phone=null, enabled=true)]\norg.springframework.dao.DataIntegrityViolationException: \n### Error updating database.  Cause: java.sql.SQLException: Field \'leader\' doesn\'t have a default value\n### The error may exist in com/yongoe/ecy/basic/mapper/DepartmentMapper.java (best guess)\n### The error may involve com.yongoe.ecy.basic.mapper.DepartmentMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO basic_department  ( parent_id, name,   enabled, create_time, update_time, create_by, update_by )  VALUES  ( ?, ?,   ?, ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'leader\' doesn\'t have a default value\n; Field \'leader\' doesn\'t have a default value','2023-11-30 10:02:11','2023-11-30 10:02:11','yongoe','yongoe'),
(4,'yongoe','异常','在 com.yongoe.ecy.basic.controller.DictController 的 getDict 方法中发生了异常','参数：[]\njava.lang.NullPointerException: Cannot invoke \"com.yongoe.ecy.basic.entity.Dict.getId()\" because \"dict\" is null','2023-11-30 19:41:44','2023-11-30 19:41:44','yongoe','yongoe'),
(5,'yongoe','异常','在 com.yongoe.ecy.exam.controller.QuestionController 的 page 方法中发生了异常','参数：[1, 1, QuestionReq(id=23, questionBankName=null, questionBankId=null, content=null, type=null, level=null, answer=null, createTime=null, updateTime=null, createBy=null, updateBy=null)]\norg.springframework.dao.DataIntegrityViolationException: \n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\n### The error may exist in file [/Users/yongoe/code/github/ecy-exam/ecy-server/target/classes/mapper/exam/QuestionMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: select         e_question.*,         e_question_bank.name as question_bank_name         from e_question left join e_question_bank on e_question.question_bank_id = e_question_bank.id          WHERE  id = ? LIMIT ?\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\n; Column \'id\' in where clause is ambiguous','2023-11-30 20:16:35','2023-11-30 20:16:35','yongoe','yongoe'),
(6,'yongoe','异常','在 com.yongoe.ecy.exam.controller.QuestionController 的 page 方法中发生了异常','参数：[1, 1, QuestionReq(id=23, questionBankName=null, questionBankId=null, content=null, type=null, level=null, answer=null, createTime=null, updateTime=null, createBy=null, updateBy=null)]\norg.springframework.dao.DataIntegrityViolationException: \n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\n### The error may exist in file [/Users/yongoe/code/github/ecy-exam/ecy-server/target/classes/mapper/exam/QuestionMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: select         e_question.*,         e_question_bank.name as question_bank_name         from e_question left join e_question_bank on e_question.question_bank_id = e_question_bank.id          WHERE  id = ? LIMIT ?\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\n; Column \'id\' in where clause is ambiguous','2023-11-30 20:16:43','2023-11-30 20:16:43','yongoe','yongoe'),
(7,'yongoe','异常','在 com.yongoe.ecy.exam.controller.QuestionController 的 page 方法中发生了异常','参数：[1, 1, QuestionReq(id=23, questionBankName=null, questionBankId=null, content=null, type=null, level=null, answer=null, createTime=null, updateTime=null, createBy=null, updateBy=null)]\norg.springframework.dao.DataIntegrityViolationException: \n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\n### The error may exist in file [/Users/yongoe/code/github/ecy-exam/ecy-server/target/classes/mapper/exam/QuestionMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: select         e_question.*,         e_question_bank.name as question_bank_name         from e_question left join e_question_bank on e_question.question_bank_id = e_question_bank.id          WHERE  id = ? LIMIT ?\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\n; Column \'id\' in where clause is ambiguous','2023-11-30 20:18:28','2023-11-30 20:18:28','yongoe','yongoe'),
(8,'yongoe','异常','在 com.yongoe.ecy.exam.controller.QuestionController 的 page 方法中发生了异常','参数：[1, 1, QuestionReq(id=23, questionBankName=null, questionBankId=null, content=null, type=null, level=null, answer=null, createTime=null, updateTime=null, createBy=null, updateBy=null)]\norg.springframework.dao.DataIntegrityViolationException: \n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\n### The error may exist in file [/Users/yongoe/code/github/ecy-exam/ecy-server/target/classes/mapper/exam/QuestionMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: select         e_question.*,         e_question_bank.name as question_bank_name         from e_question left join e_question_bank on e_question.question_bank_id = e_question_bank.id          WHERE  id = ? LIMIT ?\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\n; Column \'id\' in where clause is ambiguous','2023-11-30 20:19:01','2023-11-30 20:19:01','yongoe','yongoe'),
(9,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 page 方法中发生了异常','参数：[1, 10, ExamReq(id=null, examName=null, examDesc=null, openType=null, duration=null, startTime=null, endTime=null, totalScore=null, passScore=null, status=null, createTime=null, updateTime=null, createBy=null, updateBy=null)]\njava.lang.NoSuchMethodError: \'java.time.LocalDate com.yongoe.ecy.exam.controller.vo.req.ExamReq.getStartTime()\'','2023-11-30 21:00:14','2023-11-30 21:00:14','yongoe','yongoe'),
(10,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 page 方法中发生了异常','参数：[1, 10, ExamReq(id=null, examName=null, examDesc=null, openType=null, duration=null, startTime=null, endTime=null, totalScore=null, passScore=null, status=null, createTime=null, updateTime=null, createBy=null, updateBy=null)]\njava.lang.NoSuchMethodError: \'java.time.LocalDate com.yongoe.ecy.exam.controller.vo.req.ExamReq.getStartTime()\'','2023-11-30 21:00:16','2023-11-30 21:00:16','yongoe','yongoe'),
(11,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 add 方法中发生了异常','参数：[ExamReq(id=null, examName=第一次考试, examDesc=1212198, openType=全部开放, duration=null, startTime=2023-11-30T21:01:07, endTime=2023-12-01T00:00, totalScore=null, passScore=null, status=null, createTime=null, updateTime=null, createBy=null, updateBy=null)]\norg.springframework.dao.DataIntegrityViolationException: \n### Error updating database.  Cause: java.sql.SQLException: Field \'duration\' doesn\'t have a default value\n### The error may exist in com/yongoe/ecy/exam/mapper/ExamMapper.java (best guess)\n### The error may involve com.yongoe.ecy.exam.mapper.ExamMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO e_exam  ( exam_name, exam_desc, open_type,  start_time, end_time,    create_time, update_time, create_by, update_by )  VALUES  ( ?, ?, ?,  ?, ?,    ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'duration\' doesn\'t have a default value\n; Field \'duration\' doesn\'t have a default value','2023-11-30 21:01:38','2023-11-30 21:01:38','yongoe','yongoe'),
(12,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 add 方法中发生了异常','参数：[ExamReq(id=null, examName=第一次全国数学考试, examDesc=第一次全国数学考试第一次全国数学考试, openType=全部开放, duration=null, startTime=2023-11-30T21:18:48, endTime=2023-12-01T00:05, totalScore=null, passScore=null, status=null, createTime=null, updateTime=null, createBy=null, updateBy=null)]\njava.time.temporal.UnsupportedTemporalTypeException: Unsupported unit: Minutes','2023-11-30 21:19:18','2023-11-30 21:19:18','yongoe','yongoe'),
(13,'yongoe','异常','在 com.yongoe.ecy.exam.controller.QuestionController 的 page 方法中发生了异常','参数：[1, 10, QuestionReq(id=null, questionBankId=null, content=null, type=null, level=null, answer=null, createTime=null, updateTime=null, createBy=null, updateBy=null)]\njava.lang.NoSuchMethodError: \'java.lang.String com.yongoe.ecy.exam.controller.vo.req.QuestionReq.getQuestionBankName()\'','2023-12-01 09:04:50','2023-12-01 09:04:50','yongoe','yongoe'),
(14,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 add 方法中发生了异常','参数：[ExamReq(id=null, examName=第一次考试, examDesc=第一次考试, openType=null, duration=632, startTime=2023-12-04T13:27:07, endTime=2023-12-05T00:00, totalScore=null, passScore=null, status=null, createTime=null, updateTime=null, createBy=null, updateBy=null)]\norg.springframework.dao.DataIntegrityViolationException: \n### Error updating database.  Cause: java.sql.SQLException: Field \'open_type\' doesn\'t have a default value\n### The error may exist in com/yongoe/ecy/exam/mapper/ExamMapper.java (best guess)\n### The error may involve com.yongoe.ecy.exam.mapper.ExamMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO e_exam  ( exam_name, exam_desc,  duration, start_time, end_time,   status, create_time, update_time, create_by, update_by )  VALUES  ( ?, ?,  ?, ?, ?,   ?, ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'open_type\' doesn\'t have a default value\n; Field \'open_type\' doesn\'t have a default value','2023-12-04 12:27:27','2023-12-04 12:27:27','yongoe','yongoe'),
(15,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 add 方法中发生了异常','参数：[ExamReq(id=null, examName=第一次考试, examDesc=第一次考试, openType=null, duration=632, startTime=2023-12-04T13:27:07, endTime=2023-12-05T00:00, totalScore=null, passScore=null, status=null, createTime=null, updateTime=null, createBy=null, updateBy=null)]\norg.springframework.dao.DataIntegrityViolationException: \n### Error updating database.  Cause: java.sql.SQLException: Field \'open_type\' doesn\'t have a default value\n### The error may exist in com/yongoe/ecy/exam/mapper/ExamMapper.java (best guess)\n### The error may involve com.yongoe.ecy.exam.mapper.ExamMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO e_exam  ( exam_name, exam_desc,  duration, start_time, end_time,   status, create_time, update_time, create_by, update_by )  VALUES  ( ?, ?,  ?, ?, ?,   ?, ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'open_type\' doesn\'t have a default value\n; Field \'open_type\' doesn\'t have a default value','2023-12-04 12:27:36','2023-12-04 12:27:36','yongoe','yongoe'),
(16,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 makepaper 方法中发生了异常','参数：[22, MakePaperReq(bankForm=BankForm(bankList=[BankList(bankId=1, questionIdList=[24, 25], isAutoSelect=false, singleChoice=0, multipleChoice=0, trueFalse=0, shortAnswer=0, singleChoiceScore=2, multipleChoiceScore=2, trueFalseScore=2, shortAnswerScore=2), BankList(bankId=2, questionIdList=[26], isAutoSelect=false, singleChoice=0, multipleChoice=0, trueFalse=0, shortAnswer=0, singleChoiceScore=1, multipleChoiceScore=1, trueFalseScore=1, shortAnswerScore=1)]), configForm=ConfigForm(totalScore=100, passScore=16), authForm=AuthForm(openType=指定开放, departmenIdtList=[], userIdList=[1]))]\njava.lang.RuntimeException: 开放类型错误','2023-12-04 12:45:38','2023-12-04 12:45:38','yongoe','yongoe'),
(17,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 makepaper 方法中发生了异常','参数：[22, MakePaperReq(bankForm=BankForm(bankList=[BankList(bankId=1, questionIdList=[24, 25], isAutoSelect=false, singleChoice=0, multipleChoice=0, trueFalse=0, shortAnswer=0, singleChoiceScore=2, multipleChoiceScore=2, trueFalseScore=2, shortAnswerScore=2), BankList(bankId=2, questionIdList=[26], isAutoSelect=false, singleChoice=0, multipleChoice=0, trueFalse=0, shortAnswer=0, singleChoiceScore=1, multipleChoiceScore=1, trueFalseScore=1, shortAnswerScore=1)]), configForm=ConfigForm(totalScore=100, passScore=16), authForm=AuthForm(openType=指定开放, departmenIdtList=[], userIdList=[1]))]\njava.lang.RuntimeException: 开放类型错误','2023-12-04 12:46:05','2023-12-04 12:46:05','yongoe','yongoe'),
(18,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 info 方法中发生了异常','参数：[22]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n### The error may exist in com/yongoe/ecy/basic/mapper/DepartmentMapper.java (best guess)\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT id,parent_id,name,leader,phone,enabled,create_time,update_time,create_by,update_by FROM basic_department WHERE id IN ( )\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n; bad SQL grammar []','2023-12-04 17:55:41','2023-12-04 17:55:41','yongoe','yongoe'),
(19,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 info 方法中发生了异常','参数：[22]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n### The error may exist in com/yongoe/ecy/basic/mapper/DepartmentMapper.java (best guess)\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT id,parent_id,name,leader,phone,enabled,create_time,update_time,create_by,update_by FROM basic_department WHERE id IN ( )\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n; bad SQL grammar []','2023-12-04 17:55:43','2023-12-04 17:55:43','yongoe','yongoe'),
(20,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 info 方法中发生了异常','参数：[22]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n### The error may exist in com/yongoe/ecy/basic/mapper/DepartmentMapper.java (best guess)\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT id,parent_id,name,leader,phone,enabled,create_time,update_time,create_by,update_by FROM basic_department WHERE id IN ( )\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n; bad SQL grammar []','2023-12-04 17:56:56','2023-12-04 17:56:56','yongoe','yongoe'),
(21,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 info 方法中发生了异常','参数：[22]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n### The error may exist in com/yongoe/ecy/basic/mapper/DepartmentMapper.java (best guess)\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT id,parent_id,name,leader,phone,enabled,create_time,update_time,create_by,update_by FROM basic_department WHERE id IN ( )\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n; bad SQL grammar []','2023-12-04 17:58:39','2023-12-04 17:58:39','yongoe','yongoe'),
(22,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 info 方法中发生了异常','参数：[22]\norg.springframework.dao.DataIntegrityViolationException: \n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'id\' in IN/ALL/ANY subquery is ambiguous\n### The error may exist in com/yongoe/ecy/exam/mapper/ExamQuestionMapper.java (best guess)\n### The error may involve com.yongoe.ecy.exam.mapper.ExamQuestionMapper.getQuestionByExamId-Inline\n### The error occurred while setting parameters\n### SQL: SELECT e_question.*,e_exam_question.score FROM e_question left join e_exam_question on e_question.id = e_exam_question.question_id WHERE type=? and  id IN (SELECT question_id FROM e_exam_question WHERE exam_id = ? ) ORDER BY TYPE\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'id\' in IN/ALL/ANY subquery is ambiguous\n; Column \'id\' in IN/ALL/ANY subquery is ambiguous','2023-12-04 18:08:28','2023-12-04 18:08:28','yongoe','yongoe'),
(23,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 info 方法中发生了异常','参数：[23]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n### The error may exist in com/yongoe/ecy/basic/mapper/DepartmentMapper.java (best guess)\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT id,parent_id,name,leader,phone,enabled,create_time,update_time,create_by,update_by FROM basic_department WHERE id IN ( )\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n; bad SQL grammar []','2023-12-04 18:21:53','2023-12-04 18:21:53','yongoe','yongoe'),
(24,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 info 方法中发生了异常','参数：[23]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n### The error may exist in com/yongoe/ecy/basic/mapper/DepartmentMapper.java (best guess)\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT id,parent_id,name,leader,phone,enabled,create_time,update_time,create_by,update_by FROM basic_department WHERE id IN ( )\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n; bad SQL grammar []','2023-12-04 18:22:52','2023-12-04 18:22:52','yongoe','yongoe'),
(25,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 info 方法中发生了异常','参数：[23]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n### The error may exist in com/yongoe/ecy/basic/mapper/DepartmentMapper.java (best guess)\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT id,parent_id,name,leader,phone,enabled,create_time,update_time,create_by,update_by FROM basic_department WHERE id IN ( )\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\n; bad SQL grammar []','2023-12-04 18:27:47','2023-12-04 18:27:47','yongoe','yongoe'),
(26,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 info 方法中发生了异常','参数：[23]\njava.lang.RuntimeException: 部门不应该为空','2023-12-04 18:29:12','2023-12-04 18:29:12','yongoe','yongoe'),
(27,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 info 方法中发生了异常','参数：[23]\njava.lang.RuntimeException: 部门不应该为空','2023-12-04 18:31:55','2023-12-04 18:31:55','yongoe','yongoe'),
(28,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 info 方法中发生了异常','参数：[23]\njava.lang.RuntimeException: 部门不应该为空','2023-12-04 18:32:19','2023-12-04 18:32:19','yongoe','yongoe'),
(29,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 info 方法中发生了异常','参数：[23]\njava.lang.RuntimeException: 部门不应该为空','2023-12-04 18:33:18','2023-12-04 18:33:18','yongoe','yongoe'),
(30,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 makepaper 方法中发生了异常','参数：[26, MakePaperReq(bankForm=BankForm(bankList=[BankList(bankId=1, questionIdList=[], isAutoSelect=false, singleChoice=0, multipleChoice=0, trueFalse=0, shortAnswer=0, singleChoiceScore=0, multipleChoiceScore=0, trueFalseScore=0, shortAnswerScore=0)]), configForm=ConfigForm(totalScore=11, passScore=11), authForm=AuthForm(openType=全部开放, departmenIdtList=[], userIdList=[]))]\njava.lang.RuntimeException: 开放类型错误','2023-12-04 18:36:23','2023-12-04 18:36:23','yongoe','yongoe'),
(31,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 makepaper 方法中发生了异常','参数：[26, MakePaperReq(bankForm=BankForm(bankList=[BankList(bankId=1, questionIdList=[], isAutoSelect=false, singleChoice=0, multipleChoice=0, trueFalse=0, shortAnswer=0, singleChoiceScore=0, multipleChoiceScore=0, trueFalseScore=0, shortAnswerScore=0)]), configForm=ConfigForm(totalScore=0, passScore=0), authForm=AuthForm(openType=全部开放, departmenIdtList=[], userIdList=[]))]\njava.lang.RuntimeException: 开放类型错误','2023-12-04 18:37:11','2023-12-04 18:37:11','yongoe','yongoe'),
(32,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 makepaper 方法中发生了异常','参数：[26, MakePaperReq(bankForm=BankForm(bankList=[BankList(bankId=1, questionIdList=[], isAutoSelect=false, singleChoice=0, multipleChoice=0, trueFalse=0, shortAnswer=0, singleChoiceScore=0, multipleChoiceScore=0, trueFalseScore=0, shortAnswerScore=0)]), configForm=ConfigForm(totalScore=0, passScore=0), authForm=AuthForm(openType=全部开放, departmenIdtList=[], userIdList=[]))]\njava.lang.RuntimeException: 开放类型错误','2023-12-04 18:37:47','2023-12-04 18:37:47','yongoe','yongoe'),
(33,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 page 方法中发生了异常','参数：[1, 10, UserPaperReq(examName=null, userId=null, examId=null, status=null, enterTime=null, finishTime=null, score=null)]\njava.lang.NoSuchMethodError: \'java.lang.Long com.yongoe.ecy.exam.controller.vo.req.UserPaperReq.getId()\'','2023-12-04 20:17:05','2023-12-04 20:17:05','yongoe','yongoe'),
(34,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 add 方法中发生了异常','参数：[ExamReq(id=null, examName=s, examDesc=s, openType=null, status=null)]\njava.lang.NullPointerException: Cannot invoke \"java.time.LocalDateTime.isBefore(java.time.chrono.ChronoLocalDateTime)\" because \"endTime\" is null','2023-12-04 20:23:00','2023-12-04 20:23:00','yongoe','yongoe'),
(35,'yongoe','异常','在 com.yongoe.ecy.exam.controller.ExamController 的 add 方法中发生了异常','参数：[ExamReq(id=null, examName=s, examDesc=s, openType=null, status=null)]\njava.lang.NullPointerException: Cannot invoke \"java.time.LocalDateTime.isBefore(java.time.chrono.ChronoLocalDateTime)\" because \"endTime\" is null','2023-12-04 20:23:09','2023-12-04 20:23:09','yongoe','yongoe'),
(36,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 11:24:14','2023-12-05 11:24:14','yongoe','yongoe'),
(37,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 11:24:34','2023-12-05 11:24:34','yongoe','yongoe'),
(38,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 11:25:08','2023-12-05 11:25:08','yongoe','yongoe'),
(39,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 11:25:22','2023-12-05 11:25:22','yongoe','yongoe'),
(40,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 11:25:39','2023-12-05 11:25:39','yongoe','yongoe'),
(41,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 11:27:00','2023-12-05 11:27:00','yongoe','yongoe'),
(42,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 getQuestion 方法中发生了异常','参数：[32]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'e_user_question.score as my_score\n            e_user_question.is_true as is_true\' at line 4\n### The error may exist in file [/Users/yongoe/code/github/ecy-exam/ecy-server/target/classes/mapper/exam/UserPaperMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT e_question.*,                e_exam_question.score,                e_user_question.answer as my_answer             e_user_question.score as my_score             e_user_question.is_true as is_true         FROM e_question                  LEFT JOIN e_exam_question ON e_question.id = e_exam_question.question_id                  left join e_user_question on e_question.id = e_user_question.question_id         WHERE e_question.type = ?             e_user_question.user_id= ?           AND e_question.id IN (SELECT question_id FROM e_exam_question WHERE exam_id = ?)         ORDER BY e_question.TYPE\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'e_user_question.score as my_score\n            e_user_question.is_true as is_true\' at line 4\n; bad SQL grammar []','2023-12-05 11:40:29','2023-12-05 11:40:29','yongoe','yongoe'),
(43,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 getQuestion 方法中发生了异常','参数：[32]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'e_user_question.user_id= 1\n          AND e_question.id IN (SELECT question_id FR\' at line 9\n### The error may exist in file [/Users/yongoe/code/github/ecy-exam/ecy-server/target/classes/mapper/exam/UserPaperMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT e_question.*,                e_exam_question.score,                e_user_question.answer as my_answer,             e_user_question.score as my_score,             e_user_question.is_true as is_true         FROM e_question                  LEFT JOIN e_exam_question ON e_question.id = e_exam_question.question_id                  left join e_user_question on e_question.id = e_user_question.question_id         WHERE e_question.type = ? e_user_question.user_id= ?           AND e_question.id IN (SELECT question_id FROM e_exam_question WHERE exam_id = ?)         ORDER BY e_question.TYPE\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'e_user_question.user_id= 1\n          AND e_question.id IN (SELECT question_id FR\' at line 9\n; bad SQL grammar []','2023-12-05 11:41:26','2023-12-05 11:41:26','yongoe','yongoe'),
(44,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 11:41:45','2023-12-05 11:41:45','yongoe','yongoe'),
(45,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 11:44:05','2023-12-05 11:44:05','yongoe','yongoe'),
(46,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 11:45:23','2023-12-05 11:45:23','yongoe','yongoe'),
(47,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 11:45:27','2023-12-05 11:45:27','yongoe','yongoe'),
(48,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=<p>ssssss</p>, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:24:57','2023-12-05 12:24:57','yongoe','yongoe'),
(49,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=<p>ssssss</p>, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:25:23','2023-12-05 12:25:23','yongoe','yongoe'),
(50,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=<p>ssssss</p>, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:25:25','2023-12-05 12:25:25','yongoe','yongoe'),
(51,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=<p>ssssss</p>, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:26:21','2023-12-05 12:26:21','yongoe','yongoe'),
(52,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=<p>ssssss</p>, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:26:55','2023-12-05 12:26:55','yongoe','yongoe'),
(53,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=<p>ssssss</p>, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:27:26','2023-12-05 12:27:26','yongoe','yongoe'),
(54,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=<p>ssssss</p>, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:34:23','2023-12-05 12:34:23','yongoe','yongoe'),
(55,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=<p>ssssss</p>, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:34:26','2023-12-05 12:34:26','yongoe','yongoe'),
(56,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=<p>ssssss</p>, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:35:16','2023-12-05 12:35:16','yongoe','yongoe'),
(57,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=<p>ssssss</p>, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:35:18','2023-12-05 12:35:18','yongoe','yongoe'),
(58,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=<p>ssssss</p>, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:35:49','2023-12-05 12:35:49','yongoe','yongoe'),
(59,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=<p>ssssss</p>, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:35:51','2023-12-05 12:35:51','yongoe','yongoe'),
(60,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=<p>ssssss</p>, examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:35:56','2023-12-05 12:35:56','yongoe','yongoe'),
(61,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:52:52','2023-12-05 12:52:52','yongoe','yongoe'),
(62,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{examId=32}]\njava.lang.NumberFormatException: Cannot parse null string','2023-12-05 12:53:49','2023-12-05 12:53:49','yongoe','yongoe'),
(63,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 submitScore 方法中发生了异常','参数：[[SubmitScoreReq(questionId=null, examId=null, userId=null, score=4, myScore=4.0, isTrue=null), SubmitScoreReq(questionId=null, examId=null, userId=null, score=4, myScore=4.0, isTrue=null)]]\njava.lang.NullPointerException: Cannot invoke \"com.yongoe.ecy.exam.entity.UserQuestion.setScore(java.lang.Double)\" because \"one\" is null','2023-12-05 14:37:17','2023-12-05 14:37:17','yongoe','yongoe'),
(64,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 submitScore 方法中发生了异常','参数：[32, 1, [SubmitScoreReq(questionId=null, score=4, myScore=2), SubmitScoreReq(questionId=null, score=4, myScore=2)]]\njava.lang.NullPointerException: Cannot invoke \"com.yongoe.ecy.exam.entity.UserQuestion.setScore(java.lang.Double)\" because \"one\" is null','2023-12-05 14:43:26','2023-12-05 14:43:26','yongoe','yongoe'),
(65,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 submitScore 方法中发生了异常','参数：[32, 1, [SubmitScoreReq(questionId=null, score=4, myScore=2), SubmitScoreReq(questionId=null, score=4, myScore=2)]]\njava.lang.NullPointerException: Cannot invoke \"com.yongoe.ecy.exam.entity.UserQuestion.setScore(java.lang.Double)\" because \"one\" is null','2023-12-05 14:44:18','2023-12-05 14:44:18','yongoe','yongoe'),
(66,'yongoe','异常','在 com.yongoe.ecy.exam.controller.QuestionController 的 page 方法中发生了异常','参数：[1, 1, QuestionReq(id=24, questionBankId=null, content=null, type=null, level=null, answer=null)]\norg.springframework.dao.DataIntegrityViolationException: \n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\n### The error may exist in file [/Users/yongoe/code/github/ecy-exam/ecy-server/target/classes/mapper/exam/QuestionMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: select         e_question.*,e_question_bank.name as question_bank_name         from e_question left join e_question_bank on e_question.question_bank_id = e_question_bank.id          WHERE  id = ? LIMIT ?\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\n; Column \'id\' in where clause is ambiguous','2023-12-05 15:00:09','2023-12-05 15:00:09','yongoe','yongoe'),
(67,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 export 方法中发生了异常','参数：[32, org.springframework.web.servlet.resource.ResourceUrlEncodingFilter$ResourceUrlEncodingResponseWrapper@35ea1240]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'FROM e_user_paper\n        LEFT JOIN e_user on e_user_paper.user_id = e_user.id\n \' at line 9\n### The error may exist in file [/Users/yongoe/code/github/ecy-exam/ecy-server/target/classes/mapper/exam/UserPaperMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT         e_exam.exam_name as exam_name,         e_user.name as name,         e_user_paper.status,         e_user_paper.enter_time,         e_user_paper.finish_time,         e_user_paper.score,         e_basic_department.name as dept_name,         FROM e_user_paper         LEFT JOIN e_user on e_user_paper.user_id = e_user.id         LEFT JOIN e_exam on e_user_paper.exam_id = e_exam.id         LEFT JOIN e_basic_department on e_user.department_id = e_basic_department.id         WHERE 1=1                       and e_user_paper.exam_id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'FROM e_user_paper\n        LEFT JOIN e_user on e_user_paper.user_id = e_user.id\n \' at line 9\n; bad SQL grammar []','2023-12-05 17:22:16','2023-12-05 17:22:16','yongoe','yongoe'),
(68,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 export 方法中发生了异常','参数：[32, org.springframework.web.servlet.resource.ResourceUrlEncodingFilter$ResourceUrlEncodingResponseWrapper@32b24319]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'FROM e_user_paper\n        LEFT JOIN sys_user on e_user_paper.user_id = sys_user.\' at line 9\n### The error may exist in file [/Users/yongoe/code/github/ecy-exam/ecy-server/target/classes/mapper/exam/UserPaperMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT         e_exam.exam_name as exam_name,         sys_user.name as name,         e_user_paper.status,         e_user_paper.enter_time,         e_user_paper.finish_time,         e_user_paper.score,         basic_department.name as dept_name,         FROM e_user_paper         LEFT JOIN sys_user on e_user_paper.user_id = sys_user.id         LEFT JOIN e_exam on e_user_paper.exam_id = e_exam.id         LEFT JOIN basic_department on e_user.department_id = basic_department.id         WHERE 1=1                       and e_user_paper.exam_id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'FROM e_user_paper\n        LEFT JOIN sys_user on e_user_paper.user_id = sys_user.\' at line 9\n; bad SQL grammar []','2023-12-05 17:23:56','2023-12-05 17:23:56','yongoe','yongoe'),
(69,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 export 方法中发生了异常','参数：[32, org.springframework.web.servlet.resource.ResourceUrlEncodingFilter$ResourceUrlEncodingResponseWrapper@68e60ef0]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'FROM e_user_paper\n        LEFT JOIN sys_user on e_user_paper.user_id = sys_user.\' at line 9\n### The error may exist in file [/Users/yongoe/code/github/ecy-exam/ecy-server/target/classes/mapper/exam/UserPaperMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT         e_exam.exam_name as exam_name,         sys_user.name as name,         e_user_paper.status,         e_user_paper.enter_time,         e_user_paper.finish_time,         e_user_paper.score,         basic_department.name as dept_name,         FROM e_user_paper         LEFT JOIN sys_user on e_user_paper.user_id = sys_user.id         LEFT JOIN e_exam on e_user_paper.exam_id = e_exam.id         LEFT JOIN basic_department on sys_user.department_id = basic_department.id         WHERE 1=1                       and e_user_paper.exam_id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'FROM e_user_paper\n        LEFT JOIN sys_user on e_user_paper.user_id = sys_user.\' at line 9\n; bad SQL grammar []','2023-12-05 17:26:15','2023-12-05 17:26:15','yongoe','yongoe'),
(70,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 export 方法中发生了异常','参数：[32, org.springframework.web.servlet.resource.ResourceUrlEncodingFilter$ResourceUrlEncodingResponseWrapper@5ffa799d]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'FROM e_user_paper\n        LEFT JOIN sys_user on e_user_paper.user_id = sys_user.\' at line 9\n### The error may exist in file [/Users/yongoe/code/github/ecy-exam/ecy-server/target/classes/mapper/exam/UserPaperMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT         e_exam.exam_name as exam_name,         sys_user.name as name,         e_user_paper.status,         e_user_paper.enter_time,         e_user_paper.finish_time,         e_user_paper.score,         basic_department.name as dept_name,         FROM e_user_paper         LEFT JOIN sys_user on e_user_paper.user_id = sys_user.id         LEFT JOIN e_exam on e_user_paper.exam_id = e_exam.id         LEFT JOIN basic_department on sys_user.department_id = basic_department.id         WHERE 1=1                       and e_user_paper.exam_id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'FROM e_user_paper\n        LEFT JOIN sys_user on e_user_paper.user_id = sys_user.\' at line 9\n; bad SQL grammar []','2023-12-05 17:27:04','2023-12-05 17:27:04','yongoe','yongoe'),
(71,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 export 方法中发生了异常','参数：[32, org.springframework.web.servlet.resource.ResourceUrlEncodingFilter$ResourceUrlEncodingResponseWrapper@632550f4]\njava.lang.NullPointerException: Cannot invoke \"java.util.Collection.size()\" because \"dataSet\" is null','2023-12-05 17:27:39','2023-12-05 17:27:39','yongoe','yongoe'),
(72,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 export 方法中发生了异常','参数：[32, org.springframework.web.servlet.resource.ResourceUrlEncodingFilter$ResourceUrlEncodingResponseWrapper@2082f5f3]\njava.lang.NullPointerException: Cannot invoke \"java.util.Collection.size()\" because \"dataSet\" is null','2023-12-05 17:28:44','2023-12-05 17:28:44','yongoe','yongoe'),
(73,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 getQuestion 方法中发生了异常','参数：[33]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'e_exam_question.score\' in \'field list\'\n### The error may exist in file [/Users/yongoe/code/github/ecy-exam/ecy-server/target/classes/mapper/exam/UserPaperMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT e_question.*,                e_exam_question.score,                e_user_question.answer  as my_answer,                e_user_question.score   as my_score,                e_user_question.is_true as is_true         FROM e_question                  left join e_user_question on e_question.id = e_user_question.question_id         WHERE e_question.type = ?           and e_user_question.user_id = ?           AND e_user_question.exam_id = 33           AND e_question.id IN (SELECT question_id FROM e_exam_question WHERE exam_id = ? )         ORDER BY e_question.TYPE\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'e_exam_question.score\' in \'field list\'\n; bad SQL grammar []','2023-12-05 17:53:47','2023-12-05 17:53:47','yongoe','yongoe'),
(74,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 getQuestion 方法中发生了异常','参数：[33]\norg.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'e_exam_question.score\' in \'field list\'\n### The error may exist in file [/Users/yongoe/code/github/ecy-exam/ecy-server/target/classes/mapper/exam/UserPaperMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT e_question.*,                e_exam_question.score,                e_user_question.answer  as my_answer,                e_user_question.score   as my_score,                e_user_question.is_true as is_true         FROM e_question                  left join e_user_question on e_question.id = e_user_question.question_id         WHERE e_question.type = ?           and e_user_question.user_id = ?           AND e_user_question.exam_id = ?           AND e_question.id IN (SELECT question_id FROM e_exam_question WHERE exam_id = ? )         ORDER BY e_question.TYPE\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'e_exam_question.score\' in \'field list\'\n; bad SQL grammar []','2023-12-05 17:54:21','2023-12-05 17:54:21','yongoe','yongoe'),
(75,'yongoe','异常','在 com.yongoe.ecy.system.controller.UserController 的 upload 方法中发生了异常','参数：[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@26a55ec0]\norg.springframework.dao.DataIntegrityViolationException: \n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in com/yongoe/ecy/system/mapper/UserRoleMapper.java (best guess)\n### The error may involve com.yongoe.ecy.system.mapper.UserRoleMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO sys_user_role  ( role_id, create_time, update_time, create_by, update_by )  VALUES  ( ?, ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value','2023-12-05 19:24:02','2023-12-05 19:24:02','yongoe','yongoe'),
(76,'yongoe','异常','在 com.yongoe.ecy.system.controller.UserController 的 upload 方法中发生了异常','参数：[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@2c43cc95]\norg.springframework.dao.DuplicateKeyException: \n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'111\' for key \'sys_user.username\'\n### The error may exist in com/yongoe/ecy/system/mapper/UserMapper.java (best guess)\n### The error may involve com.yongoe.ecy.system.mapper.UserMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO sys_user  ( username, password, name, avatar, email, phone,    enabled, create_time, update_time, create_by, update_by )  VALUES  ( ?, ?, ?, ?, ?, ?,    ?, ?, ?, ?, ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'111\' for key \'sys_user.username\'\n; Duplicate entry \'111\' for key \'sys_user.username\'','2023-12-05 19:25:20','2023-12-05 19:25:20','yongoe','yongoe'),
(77,'yongoe','异常','在 com.yongoe.ecy.system.controller.UserController 的 upload 方法中发生了异常','参数：[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@152e22d1]\norg.springframework.dao.DuplicateKeyException: \n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'111\' for key \'sys_user.username\'\n### The error may exist in com/yongoe/ecy/system/mapper/UserMapper.java (best guess)\n### The error may involve com.yongoe.ecy.system.mapper.UserMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO sys_user  ( username, password, name, avatar, email, phone,    enabled, create_time, update_time, create_by, update_by )  VALUES  ( ?, ?, ?, ?, ?, ?,    ?, ?, ?, ?, ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'111\' for key \'sys_user.username\'\n; Duplicate entry \'111\' for key \'sys_user.username\'','2023-12-05 19:25:45','2023-12-05 19:25:45','yongoe','yongoe'),
(78,'yongoe','异常','在 com.yongoe.ecy.system.controller.UserController 的 upload 方法中发生了异常','参数：[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@39fbc39b]\norg.springframework.dao.DuplicateKeyException: \n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'111\' for key \'sys_user.username\'\n### The error may exist in com/yongoe/ecy/system/mapper/UserMapper.java (best guess)\n### The error may involve com.yongoe.ecy.system.mapper.UserMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO sys_user  ( username, password, name, avatar, email, phone,    enabled, create_time, update_time, create_by, update_by )  VALUES  ( ?, ?, ?, ?, ?, ?,    ?, ?, ?, ?, ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'111\' for key \'sys_user.username\'\n; Duplicate entry \'111\' for key \'sys_user.username\'','2023-12-05 19:26:13','2023-12-05 19:26:13','yongoe','yongoe'),
(79,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 examQuestionInfo 方法中发生了异常','参数：[36]\njava.lang.NoSuchMethodError: \'java.lang.String com.yongoe.ecy.exam.entity.Question.getIsTrue()\'','2023-12-06 13:47:28','2023-12-06 13:47:28','yongoe','yongoe'),
(80,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=[], examId=37, questionId=27}]\njava.lang.ClassCastException: class java.util.ArrayList cannot be cast to class java.lang.String (java.util.ArrayList and java.lang.String are in module java.base of loader \'bootstrap\')','2023-12-06 15:39:34','2023-12-06 15:39:34','yongoe','yongoe'),
(81,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserQuestionController 的 answer 方法中发生了异常','参数：[{answer=[], examId=37, questionId=27}]\njava.lang.ClassCastException: class java.util.ArrayList cannot be cast to class java.lang.String (java.util.ArrayList and java.lang.String are in module java.base of loader \'bootstrap\')','2023-12-06 15:39:44','2023-12-06 15:39:44','yongoe','yongoe'),
(82,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 examQuestionInfo 方法中发生了异常','参数：[38]\njava.lang.NullPointerException: Cannot invoke \"com.yongoe.ecy.exam.entity.QuestionOption.getId()\" because \"one\" is null','2023-12-06 19:40:14','2023-12-06 19:40:14','yongoe','yongoe'),
(83,'yongoe','异常','在 com.yongoe.ecy.exam.controller.UserPaperController 的 examQuestionInfo 方法中发生了异常','参数：[38]\njava.lang.NullPointerException: Cannot invoke \"com.yongoe.ecy.exam.entity.QuestionOption.getId()\" because \"one\" is null','2023-12-06 19:41:55','2023-12-06 19:41:55','yongoe','yongoe');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL COMMENT '父id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名',
  `type` int NOT NULL COMMENT '类型',
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口路径',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件位置',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `sort` int NOT NULL COMMENT '顺序',
  `is_show` tinyint(1) NOT NULL COMMENT '是否显示',
  `enabled` tinyint(1) NOT NULL COMMENT '是否启用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`name`,`type`,`url`,`component`,`icon`,`sort`,`is_show`,`enabled`,`create_time`,`update_time`,`create_by`,`update_by`) values
(1,0,'系统管理',1,'','','fa fa-cog',1,1,1,'2023-01-01 00:00:00','2023-11-30 10:22:07','yongoe','yongoe'),
(2,0,'基础信息',1,'','','fa fa-table',0,1,1,'2023-01-01 00:00:00','2023-11-30 10:22:03','yongoe','yongoe'),
(3,1,'用户管理',2,'/system/user/**','system/User','',0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(4,1,'角色管理',2,'/system/role/**','system/Role','',0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(5,1,'菜单管理',2,'/system/menu/**','system/Menu','',0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(6,1,'系统配置',2,'/system/config/**','system/Config','',0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(7,2,'部门',2,'/basic/department/**','basic/Department','',0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(8,2,'职位',2,'/basic/position/**','basic/Position','',0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(9,2,'数据字典',2,'/basic/dict/**','basic/Dict','',0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(10,2,'数据字典-数据',2,'/basic/dict/data/**','basic/DictData','',0,0,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(11,1,'系统日志',2,'/system/log/**','system/Log','',0,1,1,'2023-09-19 05:51:08','2023-09-19 05:51:08','yongoe','yongoe'),
(100,0,'考试',1,'','','fa fa-file-text',2,1,1,'2023-11-30 10:21:40','2023-11-30 20:43:32','yongoe','yongoe'),
(104,0,'题库',1,'','','fa fa-newspaper-o',4,1,1,'2023-11-30 19:01:12','2023-12-02 22:23:57','yongoe','yongoe'),
(105,104,'题库管理',2,'','exam/question/QuestionBank','',3,1,1,'2023-11-30 11:07:16','2023-11-30 20:42:20','yongoe','yongoe'),
(106,105,'查',3,'/exam/questionbank/page*','','',0,1,1,'2023-11-30 11:07:16','2023-11-30 11:07:16','yongoe','yongoe'),
(107,105,'增',3,'/exam/questionbank/add','','',0,1,1,'2023-11-30 11:07:16','2023-11-30 11:07:16','yongoe','yongoe'),
(108,105,'改',3,'/exam/questionbank/update','','',0,1,1,'2023-11-30 11:07:16','2023-11-30 11:07:16','yongoe','yongoe'),
(109,105,'删',3,'/exam/questionbank/delete/*','','',0,1,1,'2023-11-30 11:07:16','2023-11-30 11:07:16','yongoe','yongoe'),
(112,104,'题目管理',2,'','exam/question/Question','',0,1,1,'2023-11-30 11:14:48','2023-11-30 20:42:32','yongoe','yongoe'),
(113,112,'查',3,'/exam/question/page*','','',0,1,1,'2023-11-30 11:14:48','2023-11-30 11:14:48','yongoe','yongoe'),
(114,112,'增',3,'/exam/question/add','','',0,1,1,'2023-11-30 11:14:48','2023-11-30 11:14:48','yongoe','yongoe'),
(115,112,'改',3,'/exam/question/update','','',0,1,1,'2023-11-30 11:14:48','2023-11-30 11:14:48','yongoe','yongoe'),
(116,112,'删',3,'/exam/question/delete/*','','',0,1,1,'2023-11-30 11:14:48','2023-11-30 11:14:48','yongoe','yongoe'),
(119,104,'题目选项',2,'','exam/question/QuestionOption','',0,0,1,'2023-11-30 11:15:00','2023-11-30 20:42:26','yongoe','yongoe'),
(120,119,'查',3,'/exam/questionoption/page*','','',0,1,1,'2023-11-30 11:15:00','2023-11-30 11:15:00','yongoe','yongoe'),
(121,119,'增',3,'/exam/questionoption/add','','',0,1,1,'2023-11-30 11:15:00','2023-11-30 11:15:00','yongoe','yongoe'),
(122,119,'改',3,'/exam/questionoption/update','','',0,1,1,'2023-11-30 11:15:00','2023-11-30 11:15:00','yongoe','yongoe'),
(123,119,'删',3,'/exam/questionoption/delete/*','','',0,1,1,'2023-11-30 11:15:00','2023-11-30 11:15:00','yongoe','yongoe'),
(126,100,'考试管理',2,'','exam/exam/Exam','',0,1,1,'2023-11-30 12:40:51','2023-11-30 21:40:24','yongoe','yongoe'),
(132,100,'考试详情',2,NULL,'exam/exam/ExamInfo',NULL,0,0,1,'2023-12-04 12:58:51','2023-12-04 12:58:51','yongoe','yongoe'),
(133,100,'组卷',2,NULL,'exam/exam/MakePaper',NULL,0,0,1,'2023-12-04 18:21:07','2023-12-04 18:21:07','yongoe','yongoe'),
(134,100,'我的考试',2,NULL,'exam/user/MyExam',NULL,0,1,1,'2023-12-04 19:31:29','2023-12-04 19:31:29','yongoe','yongoe'),
(135,100,'批阅',2,NULL,'exam/exam/CheckPaper',NULL,0,0,1,'2023-12-05 13:31:21','2023-12-05 13:32:37','yongoe','yongoe'),
(136,100,'打分',2,NULL,'exam/exam/CheckQuestion',NULL,0,0,1,'2023-12-05 13:50:32','2023-12-05 13:50:43','yongoe','yongoe'),
(137,100,'考生答题详情',2,NULL,'exam/user/ExamDetails',NULL,0,0,1,'2023-12-05 15:11:45','2023-12-06 11:20:13','yongoe','yongoe');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色代码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '中文名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`code`,`name`,`create_time`,`update_time`,`create_by`,`update_by`) values
(1,'admin','超级管理员','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(2,'register','新用户','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(4,'student','学生','2023-12-05 09:52:28','2023-12-05 09:52:28','yongoe','yongoe');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL COMMENT '角色id',
  `menu_id` bigint NOT NULL COMMENT '菜单id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`,`create_time`,`update_time`,`create_by`,`update_by`) values
(9,4,100,'2023-12-05 09:52:41','2023-12-05 09:52:41','yongoe','yongoe'),
(10,4,134,'2023-12-05 09:52:41','2023-12-05 09:52:41','yongoe','yongoe');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint DEFAULT NULL COMMENT '部门id',
  `position_id` bigint DEFAULT NULL COMMENT '职位id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '头像',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `last_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上次登录ip',
  `last_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `enabled` tinyint(1) NOT NULL COMMENT '是否启用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) COMMENT '用户名唯一'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`department_id`,`position_id`,`username`,`password`,`name`,`avatar`,`email`,`phone`,`remark`,`last_ip`,`last_time`,`enabled`,`create_time`,`update_time`,`create_by`,`update_by`) values
(1,6,1,'admin','111111','yongoe','/ecy-exam/file/2023/12/02/2629cc6d7aee4bc59fd9109775ada181.jpg','121887765@qq.com','10086','无','127.0.0.1','2023-12-06 20:46:24',1,'2023-01-01 00:00:00','2023-12-06 20:46:24','yongoe','yongoe'),
(2,1,1,'test','111111','test','/','111','2222',NULL,'127.0.0.1','2023-12-06 14:25:41',1,'2023-12-05 09:52:11','2023-12-06 14:25:41','yongoe','test');

/*Table structure for table `sys_user_auths` */

DROP TABLE IF EXISTS `sys_user_auths`;

CREATE TABLE `sys_user_auths` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `login_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登陆类型',
  `openid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标识',
  `access_token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭据',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_user_auths` */

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`,`create_time`,`update_time`,`create_by`,`update_by`) values
(2,1,1,'2023-12-02 16:59:37','2023-12-02 16:59:37','yongoe','yongoe'),
(3,2,4,'2023-12-05 09:53:23','2023-12-05 09:53:23','yongoe','yongoe');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
