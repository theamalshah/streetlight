-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 16, 2019 at 05:34 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `streetlight`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

DROP TABLE IF EXISTS `admin_table`;
CREATE TABLE IF NOT EXISTS `admin_table` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`admin_id`, `email_id`, `password`) VALUES
(1, 'amc@gmail.com', 'amcstreet');

-- --------------------------------------------------------

--
-- Table structure for table `area_table`
--

DROP TABLE IF EXISTS `area_table`;
CREATE TABLE IF NOT EXISTS `area_table` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(20) NOT NULL,
  `is_active` int(2) NOT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area_table`
--

INSERT INTO `area_table` (`area_id`, `area_name`, `is_active`) VALUES
(1, 'North', 1),
(2, 'South', 1);

-- --------------------------------------------------------

--
-- Table structure for table `common_problems`
--

DROP TABLE IF EXISTS `common_problems`;
CREATE TABLE IF NOT EXISTS `common_problems` (
  `com_prob_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_prob_name` varchar(20) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`com_prob_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `common_problems`
--

INSERT INTO `common_problems` (`com_prob_id`, `com_prob_name`, `is_active`) VALUES
(1, 'Bulb Broken', 1);

-- --------------------------------------------------------

--
-- Table structure for table `complaint_table`
--

DROP TABLE IF EXISTS `complaint_table`;
CREATE TABLE IF NOT EXISTS `complaint_table` (
  `complaint_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pole_number` int(11) NOT NULL,
  `com_prob_name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint_table`
--

INSERT INTO `complaint_table` (`complaint_id`, `user_id`, `pole_number`, `com_prob_name`, `description`, `is_active`) VALUES
(1, 0, 11, 'bulb broken', 'bulb broken', 1),
(2, 0, 22, 'Dim light', 'dim light', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comp_assign_table`
--

DROP TABLE IF EXISTS `comp_assign_table`;
CREATE TABLE IF NOT EXISTS `comp_assign_table` (
  `comp_id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`comp_id`),
  KEY `complaint_id` (`complaint_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comp_assign_table`
--

INSERT INTO `comp_assign_table` (`comp_id`, `complaint_id`, `id`, `is_active`) VALUES
(1, 1, 3, 1),
(2, 2, 7, 1),
(3, 2, 8, 1),
(4, 1, 7, 1),
(5, 1, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pole_table`
--

DROP TABLE IF EXISTS `pole_table`;
CREATE TABLE IF NOT EXISTS `pole_table` (
  `pole_id` int(11) NOT NULL AUTO_INCREMENT,
  `pole_char` varchar(20) NOT NULL,
  `pole_int` int(5) NOT NULL,
  `area_name` varchar(30) NOT NULL,
  `ward_name` varchar(30) NOT NULL,
  `pole_add` varchar(100) NOT NULL,
  `asset_type` varchar(30) NOT NULL,
  `bracket_type` varchar(50) NOT NULL,
  `lamp_type` varchar(30) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`pole_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pole_table`
--

INSERT INTO `pole_table` (`pole_id`, `pole_char`, `pole_int`, `area_name`, `ward_name`, `pole_add`, `asset_type`, `bracket_type`, `lamp_type`, `longitude`, `latitude`, `is_active`) VALUES
(1, 'VM', 2066, '1', '1', '127, GOMTIPUR RD, RAIPUR MILL COMPOUND, KRISHNA NAGAR, RAKHIAL, AHMEDABAD, GUJARAT 380018, INDIA', 'street Lighting', 'single', '18 w', '12.663300', '11.664400', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `is_active` int(2) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `phone`, `is_active`) VALUES
(1, 'ravi', '+919978859141', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ward_name_table`
--

DROP TABLE IF EXISTS `ward_name_table`;
CREATE TABLE IF NOT EXISTS `ward_name_table` (
  `ward_id` int(11) NOT NULL AUTO_INCREMENT,
  `ward_name` varchar(20) NOT NULL,
  `area_id` int(11) NOT NULL,
  `is_active` int(2) NOT NULL,
  PRIMARY KEY (`ward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ward_name_table`
--

INSERT INTO `ward_name_table` (`ward_id`, `ward_name`, `area_id`, `is_active`) VALUES
(1, 'saraspur RAKIYAL', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `worker_table`
--

DROP TABLE IF EXISTS `worker_table`;
CREATE TABLE IF NOT EXISTS `worker_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `email_id` varchar(30) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `worker_table`
--

INSERT INTO `worker_table` (`id`, `name`, `mobile`, `email_id`, `worker_id`, `type`, `is_active`) VALUES
(1, 'Harshil', 9586095789, 'harshil@gmail.com', 101, 'Electrician', 1),
(2, 'amal', 8469571006, 'amalshah2011@gmail.com', 202, 'Civil', 1),
(3, 'Ravi Solanki', 123456789, 'ravi@gmail.com', 11, 'Line Tester', 1),
(4, 'Jaymin', 7405755503, 'jaymin@gmail.com', 77, 'Electrician', 1),
(5, 'aayush', 8980898141, 'aayusha@gmail.com', 88, 'Civil', 1),
(6, 'Vidhi', 1234567898, 'vidhi@gmail.com', 99, 'Line Tester', 1),
(7, 'Parth', 7894561230, 'parth@gmail.com', 112, 'Electrician', 1),
(8, 'Twinkle', 1234567890, 'twinkle@gmail.com', 66, 'Civil', 1),
(9, 'Janki', 7891234560, 'janki@gmail.com', 33, 'Line Tester', 1),
(10, 'Yash', 1234567890, 'yash@gmail.com', 22, 'Line Tester', 1),
(11, 'Bhargav', 7894561230, 'bhargav@gmail.com', 102, 'Line Tester', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
