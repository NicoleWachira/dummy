-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2024 at 06:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `waste`
--

-- --------------------------------------------------------

--
-- Table structure for table `collector`
--

CREATE TABLE `collector` (
  `collector_id` int(11) NOT NULL,
  `Vehicleno` varchar(255) NOT NULL,
  `Licenceno` varchar(255) NOT NULL,
  `Routes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collector`
--

INSERT INTO `collector` (`collector_id`, `Vehicleno`, `Licenceno`, `Routes`) VALUES
(1, 'KAZ 784F', 'A1234', 'Mbagathi');

-- --------------------------------------------------------

--
-- Table structure for table `recycler`
--

CREATE TABLE `recycler` (
  `recycler_id` int(11) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `CompanyName` varchar(255) NOT NULL,
  `recycler_licence` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recycler`
--

INSERT INTO `recycler` (`recycler_id`, `Location`, `CompanyName`, `recycler_licence`) VALUES
(1, 'Thika', 'PETCOKENYA', '');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL,
  `requestor_id` int(11) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Wastetype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`request_id`, `requestor_id`, `Location`, `Wastetype`) VALUES
(1, 1, 'Thika', 'Solid'),
(2, 2, 'Madaraka', 'Liquid'),
(3, 1, 'Thika', 'Solid'),
(4, 2, 'Madaraka', 'Liquid'),
(5, 4, 'Kilimani', 'Recyclable');

-- --------------------------------------------------------

--
-- Table structure for table `requestor`
--

CREATE TABLE `requestor` (
  `requestor_id` int(11) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Wastetype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requestor`
--

INSERT INTO `requestor` (`requestor_id`, `Location`, `Wastetype`) VALUES
(1, 'Thika', 'Solid'),
(2, 'Madaraka', 'Liquid'),
(4, 'Kilimani', 'Recyclable');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `Fullname` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phonenumber` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `Fullname`, `Email`, `Phonenumber`, `Password`, `role`) VALUES
(1, 'Brain', 'Brain@gmail.com', '0705688543', '$2y$10$IisAELdgnHBMZRY2td.1rOLnMDkyxq/cr1koGToUWbbZ7.7XtR/c2', 'requestor'),
(2, 'Collins', 'Collins@gmail.com', '0705688543', '$2y$10$nbkhhqQEK71S4KNWm6znjupUN00dkXUlfihh2OKqS8JdPP/XbACkW', 'collector'),
(3, 'Robert', 'Robert@gmail', '0705688543', '$2y$10$k8i1VpeiW4RtFf3DIknPneq9nEpDc983ZvhyisyIS3RALYCD6vAa2', 'recycler'),
(4, 'reqs', 'reqs@gmail.com', '0705688543', '$2y$10$HcR/9/OsO/u67r7sHAqtV.//kJ3WCIcID81mLsTTMdUc/Hhj8JfQu', 'requestor'),
(5, 'Ronnie Davidson', 'Ronnie@gmail.com', '0798543233', '$2y$10$UHXMBcpawK0u2jG1Yutn2Ob9d.4Lbfu4AKOJ8WJn1iY95i/A/sDXq', 'requestor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collector`
--
ALTER TABLE `collector`
  ADD PRIMARY KEY (`collector_id`);

--
-- Indexes for table `recycler`
--
ALTER TABLE `recycler`
  ADD PRIMARY KEY (`recycler_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `requestor`
--
ALTER TABLE `requestor`
  ADD PRIMARY KEY (`requestor_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `collector`
--
ALTER TABLE `collector`
  MODIFY `collector_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recycler`
--
ALTER TABLE `recycler`
  MODIFY `recycler_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `requestor`
--
ALTER TABLE `requestor`
  MODIFY `requestor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
