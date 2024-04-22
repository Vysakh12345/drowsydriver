/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - drowsy
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`drowsy` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `drowsy`;

/*Table structure for table `accident` */

DROP TABLE IF EXISTS `accident`;

CREATE TABLE `accident` (
  `aid` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `datetime` varchar(100) DEFAULT NULL,
  `status` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `accident` */

insert  into `accident`(`aid`,`user_id`,`latitude`,`longitude`,`datetime`,`status`) values 
(1,5,'10.5155958','76.2180628','2024-04-12 13:07:54.795205','Pending'),
(2,5,'10.515578','76.2180574','2024-04-12 13:09:34.189186','Pending'),
(3,5,'10.515578','76.2180574','2024-04-12 13:09:34.804529','Pending'),
(4,5,'10.51607791800052','76.21956244111061','2024-04-12 13:14:45.336214','Pending'),
(5,5,'10.515556731261313','76.21817045845091','2024-04-12 13:15:28.773792','Pending'),
(6,5,'10.515556731261313','76.21817045845091','2024-04-12 13:15:29.272639','Pending'),
(7,5,'10.515682501718402','76.21813802048564','2024-04-12 13:16:41.798300','Pending'),
(8,5,'10.515447263605893','76.21815185062587','2024-04-12 13:17:01.234528','Pending'),
(9,5,'10.515447263605893','76.21815185062587','2024-04-12 13:17:02.146135','Pending'),
(10,5,'10.515447263605893','76.21815185062587','2024-04-12 13:17:04.056229','Pending'),
(11,NULL,'10.747596309520304','76.26518815755844','2024-04-17 13:27:46.695184','Pending'),
(12,NULL,'10.747596309520304','76.26518815755844','2024-04-17 13:27:47.082144','Pending'),
(13,NULL,'10.747451009228826','76.2654166482389','2024-04-17 13:28:56.084305','Pending'),
(14,NULL,'10.747451009228826','76.2654166482389','2024-04-17 13:28:56.949286','Pending');

/*Table structure for table `detection` */

DROP TABLE IF EXISTS `detection`;

CREATE TABLE `detection` (
  `detection_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `detected` varchar(100) DEFAULT NULL,
  `datetime` datetime(6) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`detection_id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

/*Data for the table `detection` */

insert  into `detection`(`detection_id`,`user_id`,`detected`,`datetime`,`image`) values 
(1,NULL,'Eyes Closed','2024-04-12 12:24:38.000000','1'),
(2,NULL,'Eyes Closed','2024-04-12 12:24:39.000000','1'),
(3,NULL,'Head Tild Detected','2024-04-12 12:24:43.000000','1'),
(4,NULL,'Head Tild Detected','2024-04-12 12:24:50.000000','1'),
(5,NULL,'Head Tild Detected','2024-04-12 12:24:52.000000','1'),
(6,NULL,'Head Tild Detected','2024-04-12 12:24:53.000000','1'),
(7,NULL,'Eyes Closed','2024-04-12 12:24:54.000000','1'),
(8,NULL,'Eyes Closed','2024-04-12 12:24:55.000000','1'),
(9,1,'Eyes Closed','2024-04-12 12:27:14.000000','1'),
(10,1,'Eyes Closed','2024-04-12 12:27:14.000000','1'),
(11,1,'Eyes Closed','2024-04-12 12:27:17.000000','1'),
(12,1,'Eyes Closed','2024-04-12 12:27:18.000000','1'),
(13,1,'Eyes Closed','2024-04-12 12:27:21.000000','1'),
(14,1,'Eyes Closed','2024-04-12 12:27:22.000000','1'),
(15,1,'Eyes Closed','2024-04-12 12:28:55.000000','1'),
(16,1,'Head Tild Detected','2024-04-12 12:29:02.000000','1'),
(17,1,'Head Tild Detected','2024-04-12 12:29:08.000000','1'),
(18,1,'Eyes Closed','2024-04-12 12:29:17.000000','1'),
(19,5,'Head Tild Detected','2024-04-12 14:02:54.000000','1'),
(20,5,'Head Tild Detected','2024-04-12 14:02:55.000000','1'),
(21,5,'Head Tild Detected','2024-04-12 14:02:56.000000','1'),
(22,5,'Head Tild Detected','2024-04-12 14:02:57.000000','1'),
(23,5,'Head Tild Detected','2024-04-12 14:02:58.000000','1'),
(24,5,'Head Tild Detected','2024-04-12 14:02:59.000000','1'),
(25,5,'Head Tild Detected','2024-04-12 14:03:01.000000','1'),
(26,5,'Head Tild Detected','2024-04-12 14:03:02.000000','1'),
(27,5,'Head Tild Detected','2024-04-12 14:03:03.000000','1'),
(28,5,'Head Tild Detected','2024-04-12 14:03:04.000000','1'),
(29,5,'Head Tild Detected','2024-04-12 14:03:05.000000','1'),
(30,5,'Head Tild Detected','2024-04-12 14:03:06.000000','1'),
(31,5,'Head Tild Detected','2024-04-12 14:03:07.000000','1'),
(32,5,'Head Tild Detected','2024-04-12 14:03:08.000000','1'),
(33,5,'Head Tild Detected','2024-04-12 14:03:09.000000','1'),
(34,5,'Head Tild Detected','2024-04-12 14:03:11.000000','1'),
(35,5,'Head Tild Detected','2024-04-12 14:03:12.000000','1'),
(36,5,'Head Tild Detected','2024-04-12 14:03:13.000000','1'),
(37,5,'Head Tild Detected','2024-04-12 14:03:14.000000','1'),
(38,5,'Head Tild Detected','2024-04-12 14:03:15.000000','1'),
(39,5,'Head Tild Detected','2024-04-12 14:03:16.000000','1'),
(40,5,'Head Tild Detected','2024-04-12 14:03:18.000000','1'),
(41,5,'Head Tild Detected','2024-04-12 14:03:19.000000','1'),
(42,5,'Head Tild Detected','2024-04-12 14:03:20.000000','1'),
(43,5,'Head Tild Detected','2024-04-12 14:03:21.000000','1'),
(44,5,'Head Tild Detected','2024-04-12 14:03:22.000000','1'),
(45,5,'Head Tild Detected','2024-04-12 14:03:23.000000','1'),
(46,5,'Head Tild Detected','2024-04-12 14:03:24.000000','1'),
(47,5,'Head Tild Detected','2024-04-12 14:03:25.000000','1'),
(48,5,'Head Tild Detected','2024-04-12 14:03:26.000000','1'),
(49,5,'Head Tild Detected','2024-04-12 14:03:28.000000','1'),
(50,5,'Head Tild Detected','2024-04-12 14:03:29.000000','1'),
(51,5,'Head Tild Detected','2024-04-12 14:03:30.000000','1'),
(52,5,'Head Tild Detected','2024-04-12 14:03:31.000000','1'),
(53,5,'Head Tild Detected','2024-04-12 14:03:33.000000','1'),
(54,5,'Head Tild Detected','2024-04-12 14:03:34.000000','1'),
(55,5,'Head Tild Detected','2024-04-12 14:03:35.000000','1'),
(56,5,'Head Tild Detected','2024-04-12 14:03:36.000000','1'),
(57,5,'Head Tild Detected','2024-04-12 14:03:37.000000','1'),
(58,5,'Head Tild Detected','2024-04-12 14:03:40.000000','1'),
(59,5,'Head Tild Detected','2024-04-12 14:03:41.000000','1'),
(60,5,'Head Tild Detected','2024-04-12 14:03:42.000000','1'),
(61,5,'Head Tild Detected','2024-04-12 14:03:43.000000','1'),
(62,5,'Head Tild Detected','2024-04-12 14:03:44.000000','1'),
(63,5,'Head Tild Detected','2024-04-12 14:03:45.000000','1'),
(64,5,'Head Tild Detected','2024-04-12 14:03:46.000000','1'),
(65,5,'Head Tild Detected','2024-04-12 14:03:47.000000','1'),
(66,5,'Head Tild Detected','2024-04-12 14:03:48.000000','1'),
(67,5,'Head Tild Detected','2024-04-12 14:03:52.000000','1'),
(68,5,'Head Tild Detected','2024-04-12 14:03:53.000000','1'),
(69,5,'Head Tild Detected','2024-04-12 14:03:54.000000','1'),
(70,5,'Head Tild Detected','2024-04-12 14:03:55.000000','1'),
(71,5,'Head Tild Detected','2024-04-12 14:03:56.000000','1'),
(72,5,'Head Tild Detected','2024-04-12 14:03:57.000000','1'),
(73,5,'Head Tild Detected','2024-04-12 14:03:59.000000','1'),
(74,5,'Head Tild Detected','2024-04-12 14:04:00.000000','1'),
(75,5,'Head Tild Detected','2024-04-12 14:04:01.000000','1'),
(76,5,'Head Tild Detected','2024-04-12 14:04:02.000000','1'),
(77,5,'Head Tild Detected','2024-04-12 14:04:04.000000','1'),
(78,5,'Head Tild Detected','2024-04-12 14:04:06.000000','1'),
(79,5,'Head Tild Detected','2024-04-12 14:04:07.000000','1'),
(80,5,'Head Tild Detected','2024-04-12 14:04:08.000000','1'),
(81,5,'Head Tild Detected','2024-04-12 14:04:10.000000','1'),
(82,5,'Head Tild Detected','2024-04-12 14:04:16.000000','1'),
(83,5,'Head Tild Detected','2024-04-12 14:04:19.000000','1'),
(84,5,'Head Tild Detected','2024-04-12 14:04:22.000000','1'),
(85,5,'Head Tild Detected','2024-04-12 14:04:26.000000','1'),
(86,5,'Head Tild Detected','2024-04-12 14:04:27.000000','1'),
(87,5,'Head Tild Detected','2024-04-12 14:04:28.000000','1'),
(88,5,'Head Tild Detected','2024-04-12 14:04:29.000000','1'),
(89,5,'Head Tild Detected','2024-04-12 14:04:30.000000','1'),
(90,5,'Head Tild Detected','2024-04-12 14:04:31.000000','1'),
(91,5,'Head Tild Detected','2024-04-12 14:04:33.000000','1'),
(92,5,'Head Tild Detected','2024-04-12 14:04:36.000000','1'),
(93,5,'Head Tild Detected','2024-04-12 14:04:37.000000','1'),
(94,5,'Head Tild Detected','2024-04-12 14:04:39.000000','1'),
(95,5,'Head Tild Detected','2024-04-12 14:04:43.000000','1'),
(96,5,'Head Tild Detected','2024-04-12 14:04:44.000000','1'),
(97,5,'Head Tild Detected','2024-04-12 14:04:52.000000','1'),
(98,5,'Head Tild Detected','2024-04-12 14:04:53.000000','1'),
(99,5,'Head Tild Detected','2024-04-12 14:04:54.000000','1'),
(100,5,'Head Tild Detected','2024-04-12 14:04:56.000000','1'),
(101,5,'Head Tild Detected','2024-04-12 14:04:57.000000','1'),
(102,5,'Head Tild Detected','2024-04-12 14:04:58.000000','1'),
(103,5,'Head Tild Detected','2024-04-12 14:05:03.000000','1'),
(104,5,'Head Tild Detected','2024-04-12 14:05:04.000000','1'),
(105,5,'Head Tild Detected','2024-04-17 13:33:07.000000','1');

/*Table structure for table `emergencies` */

DROP TABLE IF EXISTS `emergencies`;

CREATE TABLE `emergencies` (
  `emergencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `emergency` varchar(100) DEFAULT NULL,
  `date_time` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `image` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`emergencies_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `emergencies` */

insert  into `emergencies`(`emergencies_id`,`user_id`,`emergency`,`date_time`,`status`,`latitude`,`longitude`,`image`) values 
(1,5,'emergency','2024-04-12 13:12:36','pending','10.5155752','76.2180514','static/uploads/9f1be2ff-d0f4-43e5-98de-f4a97e7de572abc.jpg'),
(2,5,'emergency','2024-04-12 13:15:32','pending','10.515556731261313','76.21817045845091','static/uploads/2cdc7443-0f79-4c41-876a-8e84613335e7abc.jpg'),
(3,5,'emergency','2024-04-12 13:15:33','pending','10.515556731261313','76.21817045845091','static/uploads/330c8f5d-a1d8-455f-a6db-9446709b509babc.jpg'),
(4,5,'emergency','2024-04-12 13:16:44','pending','10.515682501718402','76.21813802048564','static/uploads/eecef790-773f-46df-8aa3-a49d035164aeabc.jpg'),
(5,5,'emergency','2024-04-12 13:17:04','pending','10.515447263605893','76.21815185062587','static/uploads/e8ca28c7-9710-446c-b627-ec487d76b540abc.jpg'),
(6,5,'emergency','2024-04-12 13:17:09','pending','10.515447263605893','76.21815185062587','static/uploads/92b54517-b6f8-48a5-a390-76fcbd39f3e6abc.jpg'),
(7,NULL,'emergency','2024-04-17 13:27:51','pending','10.747403861023486','76.26540516503155','static/uploads/7213877d-f696-4626-96fd-56215915d0d9abc.jpg'),
(8,NULL,'emergency','2024-04-17 13:29:01','pending','10.747478962875903','76.26525839790702','static/uploads/aff8d493-6daa-4b94-bbe5-341d9f2f06eaabc.jpg');

/*Table structure for table `emergencystatus` */

DROP TABLE IF EXISTS `emergencystatus`;

CREATE TABLE `emergencystatus` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `emergency_id` int(11) DEFAULT NULL,
  `updatedstatus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `emergencystatus` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `usertype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin123','Admin@123','admin'),
(2,'car123','car','car'),
(3,'emergency','emergency','emergency'),
(4,'jhgjgh','jgmn','user'),
(6,'jbkj','sada','user'),
(7,'%s','%s','emergency'),
(8,'abcdef','fedcba','emergency'),
(29,'vysakh','vysakh@123','emergency'),
(32,'jomin123','Jomin@123','user'),
(12,'vys','san','emergency'),
(13,'abczyx','abcdef','user'),
(14,'abczyx','','user'),
(27,'asdrrrfd','polisa','emergency'),
(34,'abcdef123','Abcdef@123','user'),
(33,'user123','user@123','user'),
(31,'ddd123','Ddd@12345','user'),
(23,'pjkjkl','lkkjlkj','user'),
(30,'akh123','Akhkar@123','user'),
(35,'abc123','abc@123','user'),
(36,'tyuip123','Tyuip@123','user'),
(39,'bsbdbd','hdhdhd','user'),
(38,'jomin123','Jomin@123','user'),
(40,'sandeepk12','sandeepk@123','user'),
(41,'sandeepk12','sandeepk@123','user'),
(42,'sandeepk12','sandeepk@123','user'),
(43,'sandeepjb','Sandeepjb123','emergency'),
(44,'ranijayan','ranijayan','user');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `datetime` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `message` */

insert  into `message`(`message_id`,`user_id`,`description`,`status`,`datetime`) values 
(1,5,'okkkk','pending','2024-0'),
(2,5,'asddxccs','pending','2024-0'),
(3,5,'dadsdasasf','pending','2024-0');

/*Table structure for table `registeremergency` */

DROP TABLE IF EXISTS `registeremergency`;

CREATE TABLE `registeremergency` (
  `emergency_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `login_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`emergency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `registeremergency` */

insert  into `registeremergency`(`emergency_id`,`first_name`,`last_name`,`type`,`phone`,`email`,`login_id`) values 
(1,'Vysakh','Sankar','user','80','ccc@gmail.com',3),
(2,'abc','def','user','1234567890','abcdef@gmail.com',11),
(3,'Vysakh','Sankar','user','8078117559','aaa@gmail.com',12),
(4,'','','','6564645','',24),
(5,'adsacadsa','asfvdfsdx','user','78454','polisa@gmail.com',25),
(8,'Vysakh','Sankar','user','80717559','vysakhsankar@gmail.com',28),
(10,'sandeep','jb','user','89445','sandeepjb@gmail.com',43);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(10) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `vehicle_no` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`login_id`,`first_name`,`last_name`,`vehicle_no`,`phone`,`email`) values 
(1,1,'0','Vysakh','Sankar','9525','08078117559'),
(2,NULL,'0','v','S','6595','0807819'),
(3,NULL,'3','fff','fff','887','8787'),
(4,NULL,'4','jjhgjgh','hggfhgfh','574','45751'),
(5,2,'jjhgjgh','hggfhgfh','574','45751','byu@gmail.com'),
(6,NULL,'ghjh','nbkbk','54445','578745','abc@gmail.com'),
(7,NULL,'abc','zyx','88','5647898454','abczyx@gmail.com'),
(19,NULL,'jomin','joy','89','080545','jominc@gmail.com'),
(18,NULL,'Vysakh','Sankar','5845','1234567890','ddd@gmail.com'),
(17,NULL,'akh','kar','84','08078117559','akh@gmail.com'),
(16,NULL,'hfdc','kar','845','0807','bhj@gmail.com'),
(20,33,'vysakh','sankar','850','8576548','abcs@gmail.com'),
(21,34,'abcdef','ghikjl','657','546321','abcdef@gmail.com'),
(22,35,'123','456','23578','5231178','123@gmail.com'),
(23,36,'tyuip','gfdsa','1234','987654','tyuip@gmail.com'),
(26,39,'jejdjd','jdjdjd','499494','499595','ehheeh'),
(25,38,'jomin','joy','654','864578','jomin@gmail.com'),
(27,42,'sandeep','k','789','6534298','sandeep@gmail.com'),
(28,44,'rani','jayakumar','765','563542','ranijayakumar@gmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
