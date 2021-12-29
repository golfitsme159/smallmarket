-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2021 at 09:15 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smallmarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `Bank_ID` varchar(6) COLLATE utf8_thai_520_w2 NOT NULL,
  `Bank_name` varchar(26) COLLATE utf8_thai_520_w2 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`Bank_ID`, `Bank_name`) VALUES
('bank01', 'กรุงไทย'),
('bank02', 'กสิกรไทย'),
('bank03', 'ไทยพาณิชย์'),
('bank04', 'กรุงเทพ'),
('bank05', 'ออมสิน'),
('bank06', 'กรุงศรี'),
('bank07', 'อื่นๆ');

-- --------------------------------------------------------

--
-- Table structure for table `lock`
--

CREATE TABLE `lock` (
  `L_ID` int(11) NOT NULL,
  `L_Name` text COLLATE utf8_thai_520_w2 NOT NULL,
  `P_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `M_ID` int(11) NOT NULL,
  `M_User` text COLLATE utf8_thai_520_w2 NOT NULL,
  `M_Pass` text COLLATE utf8_thai_520_w2 NOT NULL,
  `M_Name` text COLLATE utf8_thai_520_w2 NOT NULL,
  `M_Phonenumber` text COLLATE utf8_thai_520_w2 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`M_ID`, `M_User`, `M_Pass`, `M_Name`, `M_Phonenumber`) VALUES
(1, 'golf', '12345', 'golf', '0987654321');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `ON_ID` varchar(6) COLLATE utf8_thai_520_w2 NOT NULL,
  `ON_User` text COLLATE utf8_thai_520_w2 NOT NULL,
  `ON_Pass` varchar(26) COLLATE utf8_thai_520_w2 NOT NULL,
  `ON_Name` varchar(26) COLLATE utf8_thai_520_w2 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Pay_ID` varchar(6) COLLATE utf8_thai_520_w2 NOT NULL,
  `Pay_Date` date NOT NULL,
  `Slip_Filename` text COLLATE utf8_thai_520_w2 NOT NULL,
  `Price` int(11) NOT NULL,
  `Bank_ID` varchar(6) COLLATE utf8_thai_520_w2 NOT NULL,
  `PS_ID` varchar(6) COLLATE utf8_thai_520_w2 NOT NULL,
  `R_ID` varchar(6) COLLATE utf8_thai_520_w2 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

-- --------------------------------------------------------

--
-- Table structure for table `paymentstatus`
--

CREATE TABLE `paymentstatus` (
  `PS_ID` varchar(6) COLLATE utf8_thai_520_w2 NOT NULL,
  `PS_Name` varchar(26) COLLATE utf8_thai_520_w2 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

--
-- Dumping data for table `paymentstatus`
--

INSERT INTO `paymentstatus` (`PS_ID`, `PS_Name`) VALUES
('PS01', 'ชำระเงินแล้ว'),
('PS02', 'ยังไม่ชำระเงิน');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `P_ID` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Z_ID` int(11) NOT NULL,
  `T_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

-- --------------------------------------------------------

--
-- Table structure for table `producttype`
--

CREATE TABLE `producttype` (
  `T_ID` int(11) NOT NULL,
  `T_Name` text COLLATE utf8_thai_520_w2 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `R_ID` int(11) NOT NULL,
  `M_ID` int(11) NOT NULL,
  `L_ID` int(11) NOT NULL,
  `R_FDate` date NOT NULL,
  `R_EDate` date NOT NULL,
  `RS_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

-- --------------------------------------------------------

--
-- Table structure for table `rentstatus`
--

CREATE TABLE `rentstatus` (
  `RS_ID` varchar(6) COLLATE utf8_thai_520_w2 NOT NULL,
  `RS_Name` varchar(26) COLLATE utf8_thai_520_w2 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

--
-- Dumping data for table `rentstatus`
--

INSERT INTO `rentstatus` (`RS_ID`, `RS_Name`) VALUES
('RS01', 'เช่าอยู่'),
('RS02', 'ว่าง');

-- --------------------------------------------------------

--
-- Table structure for table `reserve`
--

CREATE TABLE `reserve` (
  `RE_ID` int(11) NOT NULL,
  `RE_FDate` date NOT NULL,
  `RE_EDate` date NOT NULL,
  `L_ID` int(11) NOT NULL,
  `RES_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

-- --------------------------------------------------------

--
-- Table structure for table `reservestatus`
--

CREATE TABLE `reservestatus` (
  `RES_ID` varchar(6) COLLATE utf8_thai_520_w2 NOT NULL,
  `RES_Name` varchar(26) COLLATE utf8_thai_520_w2 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

--
-- Dumping data for table `reservestatus`
--

INSERT INTO `reservestatus` (`RES_ID`, `RES_Name`) VALUES
('RES01', 'จอง'),
('RES02', 'ว่าง');

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `Z_ID` int(11) NOT NULL,
  `Z_Name` text COLLATE utf8_thai_520_w2 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`Bank_ID`);

--
-- Indexes for table `lock`
--
ALTER TABLE `lock`
  ADD PRIMARY KEY (`L_ID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`M_ID`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`ON_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Pay_ID`);

--
-- Indexes for table `paymentstatus`
--
ALTER TABLE `paymentstatus`
  ADD PRIMARY KEY (`PS_ID`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`P_ID`);

--
-- Indexes for table `producttype`
--
ALTER TABLE `producttype`
  ADD PRIMARY KEY (`T_ID`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`R_ID`);

--
-- Indexes for table `rentstatus`
--
ALTER TABLE `rentstatus`
  ADD PRIMARY KEY (`RS_ID`);

--
-- Indexes for table `reserve`
--
ALTER TABLE `reserve`
  ADD PRIMARY KEY (`RE_ID`);

--
-- Indexes for table `reservestatus`
--
ALTER TABLE `reservestatus`
  ADD PRIMARY KEY (`RES_ID`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`Z_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lock`
--
ALTER TABLE `lock`
  MODIFY `L_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `M_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `P_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producttype`
--
ALTER TABLE `producttype`
  MODIFY `T_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rent`
--
ALTER TABLE `rent`
  MODIFY `R_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reserve`
--
ALTER TABLE `reserve`
  MODIFY `RE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `Z_ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
