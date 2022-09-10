-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2022 at 11:58 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plant`
--

-- --------------------------------------------------------

--
-- Table structure for table `adress`
--

CREATE TABLE `adress` (
  `userid` int(10) NOT NULL,
  `housename` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `pincode` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `avail_plant`
--

CREATE TABLE `avail_plant` (
  `pid` int(10) NOT NULL,
  `pname` varchar(30) NOT NULL,
  `cost` int(10) NOT NULL,
  `aqty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `pid` int(10) NOT NULL,
  `cqty` int(10) NOT NULL,
  `ctotal` int(30) NOT NULL,
  `cartid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `porder`
--

CREATE TABLE `porder` (
  `pid` int(10) NOT NULL,
  `orderno` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `oqty` int(10) NOT NULL,
  `tcost` int(10) NOT NULL,
  `total` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `userid` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `phoneno` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`housename`),
  ADD KEY `Foreign key` (`userid`);

--
-- Indexes for table `avail_plant`
--
ALTER TABLE `avail_plant`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `porder`
--
ALTER TABLE `porder`
  ADD PRIMARY KEY (`orderno`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`userid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adress`
--
ALTER TABLE `adress`
  ADD CONSTRAINT `Foreign key` FOREIGN KEY (`userid`) REFERENCES `register` (`userid`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `avail_plant` (`pid`);

--
-- Constraints for table `porder`
--
ALTER TABLE `porder`
  ADD CONSTRAINT `porder_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `avail_plant` (`pid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
