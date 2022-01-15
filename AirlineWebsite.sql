DROP DATABASE `AirlineWebsite`;
CREATE DATABASE IF NOT EXISTS `AirlineWebsite`;
USE `AirlineWebsite`;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `administrator`;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `administrator` (
 `a_first` varchar(50),
  `a_last` varchar(50),
	`a_user` varchar(50),
    `a_pass` varchar(50),
    PRIMARY KEY(`a_user`, `a_pass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('Kim','Nam-joon', 'a1', 'rm');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `customer_rep`;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `customer_rep` (
  `crid` int,
  `cr_first` varchar(50),
  `cr_last` varchar(50),
  `cr_user` varchar(50),
  `cr_pass` varchar(50),
  PRIMARY KEY (`crid`, `cr_user`, `cr_pass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `customer_rep` DISABLE KEYS */;
INSERT INTO `customer_rep` VALUES (1, 'Jung', 'Ho-seok', 'cr1','crj'),(2, 'Jeon', 'Jung-kook', 'cr2','crjk'),
(3, 'Park', 'Ji-min', 'cr3','crjimin');
/*!40000 ALTER TABLE `customer_rep` ENABLE KEYS */;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `user`;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `user` (
  `f_name` varchar(50),
  `l_name` varchar(50),
  `u_user` varchar(50),
  `u_pass` varchar(50),
  `cid` int,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user` VALUES
('Min', 'Yoon-gi', 'u1', 'suga', 1),
('Kim', 'Tae-hyung', 'u2', 'v', 2),
('Kim', 'Seok-jin', 'u3', 'jin', 3);

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `airline`;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `airline` (
  `2letterid` varchar(2),
PRIMARY KEY (`2letterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `Airline` DISABLE KEYS */;
INSERT INTO `Airline` VALUES ('AA'),('AI'),('EK'),('CX'),('DL'),('KE'),('JL'),('B6'),
('AS'),('UA'),('NH'),('SQ');
/*!40000 ALTER TABLE `Airline` ENABLE KEYS */;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `aircraft`;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `aircraft` (
	`2letterid` varchar(2),
	`aircraft_num` int,
	`seats` int,
PRIMARY KEY (`2letterid`, `aircraft_num`),
FOREIGN KEY(`2letterid`) REFERENCES `airline` (`2letterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `Aircraft` VALUES ('AA', 1, 1),('AI', 2, 5),
('EK', 3, 7),('CX', 4, 5),('DL', 5, 2),('KE', 6, 4),('JL', 7, 3),
('B6', 8, 9),('AS', 9, 2),('UA', 10, 3), ('NH', 11, 4),('SQ', 12, 4);

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `airport`;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `airport` (
  `3letterid` varchar(3),
  PRIMARY KEY (`3letterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
INSERT INTO `Airport` VALUES ('JFK'),('EWR'),('BOS'),('SEA'),('ICN'),('BKK'),('SIN'),('HKG'),
('NRT'),('DEL'),('CCU'),('PVG'),('PEK'),('DTW'),('ATL'),('SFO'),('LAX');
/*!40000 ALTER TABLE `Airport` ENABLE KEYS */;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `flight`;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `flight` (
  `flight_num` int,
  `dep_airport` varchar(3),
  `arr_airport` varchar(3),
  `dTime` time,
  `aTime` time,
  `duration` varchar(100),
  `isinternational` boolean,
  `isdomestic` boolean,
  `price` float,
  `stops` int,
  `2letterid` varchar(2),
  `class` varchar(10),
PRIMARY KEY (`flight_num`),
FOREIGN KEY (`2letterid`) REFERENCES airline (`2letterid`),
FOREIGN KEY (`dep_airport`) REFERENCES airport(`3letterid`) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (`arr_airport`) REFERENCES airport(`3letterid`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `flight` VALUES
(1, 'JFK', 'DEL', '6:33:00', '8:58:00', '865 min', true, false, 5807.65, 0, 'AA', 'business'),
(2, 'DEL', 'JFK', '3:20:00', '5:55:00', '875 min', true, false, 9299.68, 0, 'AA', 'first'),
 (3, 'JFK', 'DEL', '4:10:00', '6:55:00', '885 min', true, false, 1877.57, 0, 'AI', 'economy'),
  (5 ,   'DEL', 'CCU', '16:55:00', '19:10:00', '135 min', true, false, 7478.32,  0, 'AI', 'first'),
(6, 'CCU', 'DEL', '20:30:00', '22:45:00', '135 min', true, false, 1973.92,  0, 'AI', 'economy'),
 (7,'DEL', 'CCU', '6:00:00', '8:30:00', '150 min', true, false, 6281.54,  0, 'EK', 'business'),
(8, 'CCU', 'DEL', '7:00:00', '9:15:00', '135 min', true, false, 1776.83,  0, 'EK', 'economy');

SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS `FlightDates`;
SET FOREIGN_KEY_CHECKS=1; 
CREATE TABLE `FlightDates` (
	`2letterid` varchar(2),
    `aircraft_num` int,
    `operatingDays` varchar(100),
    PRIMARY KEY (`2letterid`, `aircraft_num`, `operatingDays`),
    FOREIGN KEY (`2letterid`,`aircraft_num`) REFERENCES aircraft(`2letterid`,`aircraft_num`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `FlightDates` DISABLE KEYS */;
INSERT INTO `FlightDates` VALUES 
('AA', 1, 'Monday'), ('AA', 1, 'Wednesday'), ('AA', 1, 'Friday'), 

('AI', 2, 'Monday'), ('AI', 2, 'Wednesday'), ('AI', 2, 'Saturday'), ('AI', 2, 'Sunday'),

('EK', 3, 'Tuesday'), ('EK', 3, 'Thursday'), ('EK', 3, 'Saturday'),

('CX', 4, 'Monday'), ('CX', 4, 'Tuesday'), ('CX', 4, 'Wednesday'), ('CX', 4, 'Saturday'),

('DL', 5, 'Tuesday'), ('DL', 5, 'Wednesday'), ('DL', 5, 'Thursday'), ('DL', 5, 'Sunday'),

('KE', 6, 'Wednesday'), ('KE', 6, 'Thursday'), ('KE', 6, 'Saturday'), ('KE', 6, 'Sunday'),

('JL', 7, 'Monday'), ('JL', 7, 'Thursday'), ('JL', 7, 'Saturday'), ('JL', 7, 'Sunday'),

('B6', 8, 'Monday'),('B6', 8, 'Tuesday'),('B6', 8,'Thursday'),('B6', 8,'Sunday'), 

('AS', 9, 'Monday'),('AS', 9, 'Tuesday'),('AS', 9, 'Wednesday'),('AS', 9, 'Sunday'),

('UA', 10, 'Tuesday'),('UA', 10, 'Wednesday'),('UA', 10, 'Thursday'),('UA', 10, 'Saturday'),('UA', 10, 'Sunday'), 

('NH', 11, 'Wednesday'),  ('NH', 11, 'Thursday'), ('NH', 11, 'Saturday'), ('NH', 11, 'Sunday'), 

('SQ', 12, 'Monday'), ('SQ', 12, 'Tuesday'),('SQ', 12, 'Thursday'),('SQ', 12, 'Sunday');

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `ticket`;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `ticket` (
  `cid` int,
  `flight_num` int,
  `ticket_num` int NOT NULL AUTO_INCREMENT,
  `booking_fee` int DEFAULT 25,
  `cancelfee` int,
  `class` varchar(50),
  `seatnum` int, 
  `total_fare` float,
   `departure_date` date,
  `date_of_purchase` date,
  `time_of_purchase` time,
PRIMARY KEY (`ticket_num`),
FOREIGN KEY (`flight_num`) REFERENCES flight (`flight_num`) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (`cid`) REFERENCES user (`cid`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `Questions`;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `Questions` (
  `cid` int, 
  `question_num` int NOT NULL AUTO_INCREMENT,
  `answeredOrNot` boolean NOT NULL DEFAULT 0,
  `question` varchar(1000),
  PRIMARY KEY (`question_num`, `cid`),
  FOREIGN KEY (`cid`) REFERENCES user (`cid`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `Answers`;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `Answers` (
	`cid` int,
	`question_num` int,
	`crid` int,
	`answer` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`question_num`, `crid`),
  FOREIGN KEY (`cid`, `question_num`) REFERENCES `Questions` (`cid`,`question_num`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`crid`) REFERENCES `customer_rep` (`crid`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `WaitingList`;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `WaitingList` (
  `cid` int,
  `flight_num` int,
  `class` varchar(50),
   `priorityNum` int,
   `departure_date` date,
  PRIMARY KEY (`cid`,`flight_num`),
  FOREIGN KEY (`cid`) REFERENCES `user` (`cid`) ON UPDATE CASCADE,
  FOREIGN KEY (`flight_num`) REFERENCES `flight` (`flight_num`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;