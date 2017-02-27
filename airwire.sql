-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.48-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for airwire
DROP DATABASE IF EXISTS `airwire`;
CREATE DATABASE IF NOT EXISTS `airwire` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `airwire`;


-- Dumping structure for table airwire.hotelinfo
DROP TABLE IF EXISTS `hotelinfo`;
CREATE TABLE IF NOT EXISTS `hotelinfo` (
  `S_ID` int(11) NOT NULL AUTO_INCREMENT,
  `HOTELNAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`S_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table airwire.hotelinfo: ~1 rows (approximately)
DELETE FROM `hotelinfo`;
/*!40000 ALTER TABLE `hotelinfo` DISABLE KEYS */;
INSERT INTO `hotelinfo` (`S_ID`, `HOTELNAME`) VALUES
	(1, 'Hotel Sagar Plaza');
/*!40000 ALTER TABLE `hotelinfo` ENABLE KEYS */;


-- Dumping structure for table airwire.prepaidcodes
DROP TABLE IF EXISTS `prepaidcodes`;
CREATE TABLE IF NOT EXISTS `prepaidcodes` (
  `P_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AMOUNT` int(11) DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
  `DAYS` int(11) DEFAULT NULL,
  `INUSE` varchar(255) DEFAULT NULL,
  `LOCKDATE` datetime DEFAULT NULL,
  `PREPAIDCODE` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`P_ID`),
  UNIQUE KEY `PREPAIDCODE` (`PREPAIDCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table airwire.prepaidcodes: ~2 rows (approximately)
DELETE FROM `prepaidcodes`;
/*!40000 ALTER TABLE `prepaidcodes` DISABLE KEYS */;
INSERT INTO `prepaidcodes` (`P_ID`, `AMOUNT`, `DATE`, `DAYS`, `INUSE`, `LOCKDATE`, `PREPAIDCODE`, `STATUS`) VALUES
	(1, 0, '2017-02-25 13:20:53', 1, '1', NULL, '13518940', '0'),
	(2, 0, '2017-02-25 13:21:25', 7, '1', NULL, '23523525', '1');
/*!40000 ALTER TABLE `prepaidcodes` ENABLE KEYS */;


-- Dumping structure for table airwire.systems
DROP TABLE IF EXISTS `systems`;
CREATE TABLE IF NOT EXISTS `systems` (
  `S_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LASTLOGIN` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `Role` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`S_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table airwire.systems: ~2 rows (approximately)
DELETE FROM `systems`;
/*!40000 ALTER TABLE `systems` DISABLE KEYS */;
INSERT INTO `systems` (`S_ID`, `LASTLOGIN`, `Name`, `PASSWORD`, `Role`, `USERNAME`) VALUES
	(1, NULL, 'Admin', 'Admin', 'admin', 'admin'),
	(2, NULL, 'operator', 'Operator', 'operator', 'operator');
/*!40000 ALTER TABLE `systems` ENABLE KEYS */;


-- Dumping structure for table airwire.usedplaninfo
DROP TABLE IF EXISTS `usedplaninfo`;
CREATE TABLE IF NOT EXISTS `usedplaninfo` (
  `U_Id` int(11) NOT NULL AUTO_INCREMENT,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT NULL,
  `ByUser` varchar(255) DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
  `EMAILID` varchar(255) DEFAULT NULL,
  `GUESTNAME` varchar(255) DEFAULT NULL,
  `MOBILENO` varchar(255) DEFAULT NULL,
  `PHOTOIDPROOF` varchar(255) DEFAULT NULL,
  `PHOTOIDPROOFTYPE` varchar(255) DEFAULT NULL,
  `PLAN` varchar(255) DEFAULT NULL,
  `PREPAIDCODE` varchar(255) DEFAULT NULL,
  `ROOMNO` varchar(255) DEFAULT NULL,
  `hotelName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`U_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table airwire.usedplaninfo: ~6 rows (approximately)
DELETE FROM `usedplaninfo`;
/*!40000 ALTER TABLE `usedplaninfo` DISABLE KEYS */;
INSERT INTO `usedplaninfo` (`U_Id`, `ADDRESS`, `AMOUNT`, `ByUser`, `DATE`, `EMAILID`, `GUESTNAME`, `MOBILENO`, `PHOTOIDPROOF`, `PHOTOIDPROOFTYPE`, `PLAN`, `PREPAIDCODE`, `ROOMNO`, `hotelName`) VALUES
	(1, '', 0, 'admin', '2017-02-25 00:00:00', '', 'Bhagwat ', '', '22555', 'ELECTION CARD', '1', '13518940', '101', NULL),
	(2, '', 0, 'admin', '2017-02-25 00:00:00', '', '', '', 'fsv', 'ELECTION CARD', '1', '13518940', 'f', NULL),
	(3, '', 0, 'admin', '2017-02-25 00:00:00', '', 'Arun Renguntwar', '', 'safsaf', 'ELECTION CARD', '1', '13518940', '101', NULL),
	(4, '', 0, 'admin', '2017-02-25 00:00:00', '', '', '', 'df', 'AADHAR CARD', '1', '13518940', 'sad', NULL),
	(5, '', 0, 'admin', '2017-02-25 00:00:00', '', '', '', '32423', 'ELECTION CARD', '1', '13518940', '10', NULL),
	(6, '', 0, 'admin', '2017-02-25 00:00:00', '', 'Bhagwat', '', '1223', 'AADHAR CARD', '1', '13518940', '101', NULL);
/*!40000 ALTER TABLE `usedplaninfo` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
