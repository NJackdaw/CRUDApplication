/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.30 : Database - online_library
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`online_library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `online_library`;

/*Table structure for table `author` */

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `surname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `biography` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `author` */

insert  into `author`(`author_id`,`name`,`surname`,`birthday`,`biography`) values (21,'Harper','Lee','1926-04-18','Nelle Harper Lee (April 28, 1926 – February 19, 2016) was an American novelist best known for her 1960 novel To Kill a Mockingbird. It won the 1961 Pulitzer Prize and has become a classic of modern American literature. Lee has received numerous accolades and honorary degrees, including the Presidential Medal of Freedom in 2007 which was awarded for her contribution to literature.[1][2][3] She assisted her close friend Truman Capote in his research for the book In Cold Blood (1966).[4] Capote was the basis for the character Dill Harris in To Kill a Mockingbird.[5]'),(22,'David','Thomas','1932-06-02','Rex David Thomas (July 2, 1932 – January 8, 2002) was an American businessman, philanthropist, and fast-food tycoon. Thomas was the founder and chief executive officer of Wendy\'s, a fast-food restaurant chain specializing in hamburgers.[1][2] He is also known for appearing in more than 800 commercial advertisements for the chain from 1989 to 2002,[3] more than any other company founder in television history.\r\n'),(23,'Ben','Goldacre','1974-05-20','Ben Michael Goldacre MBE (born 20 May 1974)[1][2][3] is a British physician, academic and science writer. He is the first Bennett Professor of Evidence-Based Medicine and director of the Bennett Institute for Applied Data Science at the University of Oxford.[6] He is a founder of the AllTrials campaign and OpenTrials[4] to require open science practices in clinical trials.'),(24,'Thomas','Tyron','1926-01-24','Thomas Lester Tryon (January 14, 1926 – September 4, 1991) was an American actor and novelist. He is best known for playing the title role in the film The Cardinal (1963), featured roles in the war films The Longest Day (1962) and In Harm\'s Way (1965) with John Wayne, and especially the Walt Disney television character Texas John Slaughter (1958–1961).');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `page` varbinary(100) DEFAULT NULL,
  `year` year DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `author_id` (`author_id`),
  KEY `genre_id` (`genre_id`),
  KEY `publisher_id` (`publisher_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `book_ibfk_3` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `book` */

insert  into `book`(`book_id`,`title`,`page`,`year`,`author_id`,`genre_id`,`publisher_id`) values (22,'To Kill a Mockingbird','281',1960,21,1,1),(23,'Pragmatic Programmer','320',2019,22,9,2),(24,'Bad Science','370',2008,23,4,2),(25,'Harvest Home','400',2018,24,10,1);

/*Table structure for table `genre` */

DROP TABLE IF EXISTS `genre`;

CREATE TABLE `genre` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `genre` */

insert  into `genre`(`genre_id`,`type`) values (1,'Novel'),(4,'Medicine'),(9,'Programming'),(10,'Horror');

/*Table structure for table `password` */

DROP TABLE IF EXISTS `password`;

CREATE TABLE `password` (
  `pass_id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`pass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `password` */

insert  into `password`(`pass_id`,`password`) values (1,'admin');

/*Table structure for table `publisher` */

DROP TABLE IF EXISTS `publisher`;

CREATE TABLE `publisher` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `boss` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `publisher` */

insert  into `publisher`(`publisher_id`,`name`,`address`,`phone`,`boss`) values (1,'Zigzag','Komitas','+789456122','Mr.Book'),(2,'LUYS','ABOVYAN21','+44477745','MR.Kniga');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
