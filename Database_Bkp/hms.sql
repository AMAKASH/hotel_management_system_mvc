-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2021 at 01:41 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reservation_date` datetime NOT NULL,
  `reserved_date_from` date NOT NULL,
  `reserved_date_to` date NOT NULL,
  `reservation` varchar(2048) NOT NULL,
  `rent` float(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `assigned_rooms` varchar(2048) NOT NULL,
  `checkin_date` date NOT NULL,
  `checkout_date` date NOT NULL,
  `comments` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `reservation_date`, `reserved_date_from`, `reserved_date_to`, `reservation`, `rent`, `status`, `assigned_rooms`, `checkin_date`, `checkout_date`, `comments`) VALUES
(26, 2, '2021-04-30 04:03:08', '2021-05-01', '2021-04-02', '', 0.00, 3, '', '0000-00-00', '0000-00-00', ''),
(28, 1, '2021-04-30 00:13:00', '2021-05-03', '2021-05-04', 'Adult: 1 Child: 1 Rooms: 1', 0.00, 4, '', '0000-00-00', '0000-00-00', ''),
(30, 2, '2021-04-30 00:31:31', '2021-05-01', '2021-05-06', 'Adult: 2 Child: 2 Rooms: 1', 0.00, 1, 'DDB001', '0000-00-00', '0000-00-00', ''),
(31, 2, '2021-04-30 01:19:16', '2021-04-30', '2021-05-03', 'Adult: 2 Child: 2 Rooms: 1', 0.00, 1, 'STD001', '0000-00-00', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'Standard Double Bed',
  `rent` decimal(10,2) NOT NULL,
  `room_no` varchar(10) NOT NULL,
  `description` text NOT NULL DEFAULT 'No Description Available',
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `type`, `rent`, `room_no`, `description`, `status`) VALUES
(1, 'The Royal Suite', '30000.00', 'ROYAL001', 'The Royal Description', 1),
(2, 'Standard Double Bed', '1000.00', 'STD001', 'No Description Available', 2),
(3, 'Standard Single Bed', '1000.00', 'STS001', 'No Description Available', 2),
(4, 'Standard Double Bed', '1000.00', 'STD002', 'No Description Available', 2),
(5, 'Delux Double Bed', '2000.00', 'DDB001', 'No Description Available', 2),
(6, 'Delux Double Bed', '2000.00', 'DDB002', 'No Description Available', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(2048) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `phone_number` varchar(11) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `image`, `role`, `phone_number`, `date_of_birth`, `address`) VALUES
(1, 'Abid Mahmood', 'amakash', 'amakash12@gmail.com', '$2y$10$bI9vVQ4DH3CNz7in0PHqK.wx90U03P1/a0C64FBiiQ1O.R3Doxewu', '', 2, '01973054376', '2001-02-24', 'House#27, Road#05, Dhaka Uddan, Dhaka'),
(2, 'Anika Mahmooda', 'anika', 'anika@gmail.com', '$2y$10$p4gqqz1djDlrx3kyRpTHG.lyvfki0oweUzTyBeJx6iS9106pauG7K', '', 0, '01710238702', '2016-12-16', '741/2A, Road # 09, Adabar, Dhaka');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_foreign_key_name` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `fk_foreign_key_name` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
