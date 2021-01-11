/*
SQLyog Community v12.4.3 (64 bit)
MySQL - 10.4.11-MariaDB : Database - homework7
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`homework7` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `homework7`;

/*Table structure for table `tb_location` */

CREATE TABLE `tb_location` (
  `location_code` varchar(6) NOT NULL,
  `location_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`location_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_location` */

insert  into `tb_location`(`location_code`,`location_name`) values 
('INFO01','Laboratorium 1 M Informatika'),
('INFO02','Laboratorium 2 M Informatika'),
('INFO03','Ruang Dosen M Informatika');

/*Table structure for table `tb_product` */

CREATE TABLE `tb_product` (
  `type_code` varchar(6) NOT NULL,
  `location_code` varchar(6) NOT NULL,
  `product_code` varchar(6) NOT NULL,
  `product_name` varbinary(100) DEFAULT NULL,
  `total` int(5) DEFAULT NULL,
  PRIMARY KEY (`type_code`,`location_code`,`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_product` */

insert  into `tb_product`(`type_code`,`location_code`,`product_code`,`product_name`,`total`) values 
('A001','INFO02','AP004','Papan Tulis',11),
('E001','INFO01','EK0014','Komputer',2),
('E001','INFO01','EK0015','Printer',3),
('E001','INFO01','EK0016','LCD Projector',1),
('E001','INFO02','EK0014','Komputer',8),
('E001','INFO02','EK0015','Printer',6),
('E001','INFO02','EK0016','LCD Projector',2),
('M001','INFO01','MM011','Meja Komputer',35),
('M001','INFO01','MM012','Kursi Hidrolik',30),
('M001','INFO02','MM011','Meja Komputer',45),
('M001','INFO03','MM012','Kursi Hidrolik',10);

/*Table structure for table `tb_type` */

CREATE TABLE `tb_type` (
  `type_code` varchar(6) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_type` */

insert  into `tb_type`(`type_code`,`type_name`,`description`) values 
('A001','ATK','alat tulis kantor'),
('E001','Alat-alat elektronik','alat elektronik'),
('M001','Mebeler','alat mebel');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
