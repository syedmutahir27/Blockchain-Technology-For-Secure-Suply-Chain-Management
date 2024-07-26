/*
SQLyog Community v8.71 
MySQL - 5.5.30 : Database - schain
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`schain` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `schain`;

/*Table structure for table `checkup` */

DROP TABLE IF EXISTS `checkup`;

CREATE TABLE `checkup` (
  `PID` varchar(255) DEFAULT NULL,
  `UserID` varchar(255) DEFAULT NULL,
  `MID` varchar(255) DEFAULT NULL,
  `Status1` varchar(255) DEFAULT NULL,
  `Date1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `checkup` */

/*Table structure for table `de` */

DROP TABLE IF EXISTS `de`;

CREATE TABLE `de` (
  `UserId` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Expert` varchar(255) DEFAULT NULL,
  `Mobile` varchar(255) DEFAULT NULL,
  `CID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserId`,`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `de` */

/*Table structure for table `dealer` */

DROP TABLE IF EXISTS `dealer`;

CREATE TABLE `dealer` (
  `UserId` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Mobile` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserId`,`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dealer` */

/*Table structure for table `dmm` */

DROP TABLE IF EXISTS `dmm`;

CREATE TABLE `dmm` (
  `PID` varchar(255) DEFAULT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `MID` varchar(255) DEFAULT NULL,
  `Status1` varchar(255) DEFAULT NULL,
  `Date1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dmm` */

/*Table structure for table `ew` */

DROP TABLE IF EXISTS `ew`;

CREATE TABLE `ew` (
  `PID` varchar(255) DEFAULT NULL,
  `UserID` varchar(255) DEFAULT NULL,
  `MID` varchar(255) DEFAULT NULL,
  `Status1` varchar(255) DEFAULT NULL,
  `Date1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ew` */

/*Table structure for table `fab` */

DROP TABLE IF EXISTS `fab`;

CREATE TABLE `fab` (
  `PID` varchar(255) DEFAULT NULL,
  `UserID` varchar(255) DEFAULT NULL,
  `MID` varchar(255) DEFAULT NULL,
  `Status1` varchar(255) DEFAULT NULL,
  `Date1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fab` */

/*Table structure for table `fit` */

DROP TABLE IF EXISTS `fit`;

CREATE TABLE `fit` (
  `PID` varchar(255) DEFAULT NULL,
  `UserID` varchar(255) DEFAULT NULL,
  `MID` varchar(255) DEFAULT NULL,
  `Status1` varchar(255) DEFAULT NULL,
  `Date1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fit` */

/*Table structure for table `fw` */

DROP TABLE IF EXISTS `fw`;

CREATE TABLE `fw` (
  `PID` varchar(255) DEFAULT NULL,
  `UserID` varchar(255) DEFAULT NULL,
  `MID` varchar(255) DEFAULT NULL,
  `Status1` varchar(255) DEFAULT NULL,
  `Date1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fw` */

/*Table structure for table `issue` */

DROP TABLE IF EXISTS `issue`;

CREATE TABLE `issue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(255) DEFAULT NULL,
  `CID` varchar(255) DEFAULT NULL,
  `Issue` varchar(255) DEFAULT NULL,
  `Status1` varchar(255) DEFAULT NULL,
  `Date1` varchar(255) DEFAULT NULL,
  `Domain` varchar(255) DEFAULT NULL,
  `MRO` varchar(255) DEFAULT NULL,
  `SDate` varchar(255) DEFAULT NULL,
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `issue` */

/*Table structure for table `management` */

DROP TABLE IF EXISTS `management`;

CREATE TABLE `management` (
  `UserId` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Mobile` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserId`,`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `management` */

/*Table structure for table `mem` */

DROP TABLE IF EXISTS `mem`;

CREATE TABLE `mem` (
  `UserId` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Mobile` varchar(255) DEFAULT NULL,
  `Department` varchar(255) DEFAULT NULL,
  `CID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserId`,`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mem` */

/*Table structure for table `mm` */

DROP TABLE IF EXISTS `mm`;

CREATE TABLE `mm` (
  `UserId` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Models` varchar(255) DEFAULT NULL,
  `Mobile` varchar(255) DEFAULT NULL,
  `CID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserId`,`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mm` */

/*Table structure for table `mro` */

DROP TABLE IF EXISTS `mro`;

CREATE TABLE `mro` (
  `UserID` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Domain` varchar(255) DEFAULT NULL,
  `Mobile` varchar(255) DEFAULT NULL,
  `CID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserID`,`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mro` */

/*Table structure for table `oem` */

DROP TABLE IF EXISTS `oem`;

CREATE TABLE `oem` (
  `UserId` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Mobile` varchar(255) DEFAULT NULL,
  `Products` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserId`,`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oem` */

/*Table structure for table `oemperson` */

DROP TABLE IF EXISTS `oemperson`;

CREATE TABLE `oemperson` (
  `UserId` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Mobile` varchar(255) DEFAULT NULL,
  `Zone` varchar(255) DEFAULT NULL,
  `CID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserId`,`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oemperson` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `Oid` varchar(255) DEFAULT NULL,
  `Dealer` varchar(255) DEFAULT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `tot` int(11) DEFAULT NULL,
  `RDate` varchar(255) DEFAULT NULL,
  `Mid` varchar(255) DEFAULT NULL,
  `Status1` varchar(255) DEFAULT NULL,
  `ADate` varchar(255) DEFAULT NULL,
  `DDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orders` */

/*Table structure for table `ospec` */

DROP TABLE IF EXISTS `ospec`;

CREATE TABLE `ospec` (
  `Fid` varchar(255) DEFAULT NULL,
  `Img` longblob,
  `Content` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ospec` */

/*Table structure for table `req` */

DROP TABLE IF EXISTS `req`;

CREATE TABLE `req` (
  `UserId` varchar(255) DEFAULT NULL,
  `OEMID` varchar(255) DEFAULT NULL,
  `Type1` varchar(255) DEFAULT NULL,
  `PID` varchar(255) DEFAULT NULL,
  `Date1` varchar(255) DEFAULT NULL,
  `Status1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `req` */

/*Table structure for table `spec` */

DROP TABLE IF EXISTS `spec`;

CREATE TABLE `spec` (
  `Fid` varchar(255) DEFAULT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `OEMId` varchar(255) DEFAULT NULL,
  `Type1` varchar(255) DEFAULT NULL,
  `Img` longblob,
  `Key1` varchar(255) DEFAULT NULL,
  `PID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `spec` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
