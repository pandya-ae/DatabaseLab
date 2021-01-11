/*
SQLyog Community v12.4.3 (64 bit)
MySQL - 10.4.11-MariaDB : Database - warehouse
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`warehouse` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `warehouse`;

/*Table structure for table `distributor` */

CREATE TABLE `distributor` (
  `distributor_code` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `gender` char(1) NOT NULL,
  PRIMARY KEY (`distributor_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `distributor` */

insert  into `distributor`(`distributor_code`,`name`,`address`,`city`,`gender`) values 
(1,'Dony Prawita','Jln. Kakak Tua No. 20','Denpasar','L'),
(2,'Agus Surya','Jln. Ahmad Yani No. 12','Singaraja','L'),
(3,'Agustina','Jln. Merak No. 34','Denpasar','P'),
(4,'Agus Sanjaya','Jln. Laksamana No. 1','Singaraja','L'),
(5,'Windhyarmawan','Jln. Durian No. 70','Klungkung','L'),
(6,'Agus Nurmansyah','Jln. Komodo No. 10','Tabanan','L'),
(7,'Dewi Lestina Sari','Jln. Pramuka No. 2','Gianyar','P'),
(8,'Endah Setiana','Jln. Melon No. 1','Gianyar','P'),
(9,'Indah Purnama S. ','Jln. Yudistira No. 54','Karangasem','P'),
(10,'Hendra Tresnadana','Jln. Dewi Sartika No. 5','Singaraja','L');

/*Table structure for table `product` */

CREATE TABLE `product` (
  `product_code` varchar(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `distributor_code` int(11) NOT NULL,
  KEY `distributor_code` (`distributor_code`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`distributor_code`) REFERENCES `distributor` (`distributor_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `product` */

insert  into `product`(`product_code`,`product_name`,`distributor_code`) values 
('P001','Dove',1),
('P002','Pepsodent',4),
('P003','Sunlight',2),
('P004','Cusson',4),
('P005','Baygon',5),
('P006','CloseUp',6),
('P007','Rinso',8),
('P008','Molto',9),
('P009','Indomilk',3),
('P010','Sunsilk',10),
('P011','Indomie',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
