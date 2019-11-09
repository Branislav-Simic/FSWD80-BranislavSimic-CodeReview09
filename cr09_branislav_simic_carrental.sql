-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 09, 2019 at 04:38 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_branislav_simic_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_costs`
--

CREATE TABLE `additional_costs` (
  `additional_cost_id` int(11) NOT NULL,
  `fk_return_id` int(11) NOT NULL,
  `cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `additional_costs`
--

INSERT INTO `additional_costs` (`additional_cost_id`, `fk_return_id`, `cost`) VALUES
(1, 1, 50),
(2, 2, 0),
(3, 3, 0),
(4, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `fk_additional_cost_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `fk_additional_cost_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `fk_customer_id` int(11) NOT NULL,
  `fk_car_id` int(11) NOT NULL,
  `booking_date` datetime NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `fk_customer_id`, `fk_car_id`, `booking_date`, `from_date`, `to_date`) VALUES
(1, 2, 8, '2019-10-11 00:00:00', '2019-10-15', '2019-10-17'),
(2, 1, 7, '2019-10-18 00:00:00', '2019-10-23', '2019-10-26'),
(3, 2, 1, '2019-10-23 00:00:00', '2019-10-24', '2019-10-26'),
(4, 1, 4, '2019-10-26 00:00:00', '2019-10-27', '2019-10-28');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `fk_type_id` int(11) NOT NULL,
  `fk_location_id` int(11) NOT NULL,
  `model` varchar(55) COLLATE utf8_bin NOT NULL,
  `brand` varchar(55) COLLATE utf8_bin NOT NULL,
  `fuel_type` varchar(55) COLLATE utf8_bin NOT NULL,
  `year` year(4) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `fk_type_id`, `fk_location_id`, `model`, `brand`, `fuel_type`, `year`, `price`) VALUES
(1, 1, 1, 'C 200 ', 'Mercedes-Benz', 'Benzin', 2017, 150),
(4, 1, 2, 'C180', 'Mercedes-Benz', 'Benzin', 2016, 170),
(5, 2, 2, 'A100', 'Mercedes-Benz', 'Diesel', 2015, 99),
(6, 1, 2, '530d', 'BMW', 'Diesel', 2019, 200),
(7, 1, 1, 'S 90D', 'Tesla', 'Electric', 2019, 180),
(8, 3, 1, '4C', 'Alfa Romeo', 'Benzin', 2019, 165);

-- --------------------------------------------------------

--
-- Table structure for table `car_return`
--

CREATE TABLE `car_return` (
  `car_return_id` int(11) NOT NULL,
  `fk_booking_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `car_return`
--

INSERT INTO `car_return` (`car_return_id`, `fk_booking_id`, `date`) VALUES
(1, 1, '2019-10-17'),
(2, 2, '2019-10-26'),
(3, 3, '2019-10-26'),
(4, 4, '2019-10-28');

-- --------------------------------------------------------

--
-- Table structure for table `cost_estimate`
--

CREATE TABLE `cost_estimate` (
  `cost_id` int(11) NOT NULL,
  `fk_booking_id` int(11) NOT NULL,
  `number_of_days` int(11) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `cost_estimate`
--

INSERT INTO `cost_estimate` (`cost_id`, `fk_booking_id`, `number_of_days`, `total`) VALUES
(1, 1, 2, 300),
(2, 2, 3, 540),
(3, 3, 2, 300),
(4, 4, 1, 170);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(55) COLLATE utf8_bin NOT NULL,
  `gander` enum('M','F','U') COLLATE utf8_bin NOT NULL,
  `dob` date NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_bin NOT NULL,
  `address` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `passport_number` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `gander`, `dob`, `phone_number`, `address`, `email`, `passport_number`) VALUES
(1, 'John', 'Doe', 'M', '1990-02-04', '+4352554523', 'Kettenbrueckengasse 23, Vienna', 'john@doe.com', '213ASB3432'),
(2, 'Jane', 'Doe', 'F', '1991-11-09', '+4334342344', 'Kettenbrueckengasse 123, Vienna', 'jane@doe.com', '12313AVS32');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `ins_id` int(11) NOT NULL,
  `fk_car_id` int(11) NOT NULL,
  `policy` varchar(55) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`ins_id`, `fk_car_id`, `policy`) VALUES
(1, 8, '12332'),
(2, 6, '12333'),
(3, 5, '12334'),
(5, 4, '12336'),
(6, 1, '12337'),
(7, 7, '12338');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_cost_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_cost_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `address` varchar(55) COLLATE utf8_bin NOT NULL,
  `city` varchar(55) COLLATE utf8_bin NOT NULL,
  `country` varchar(55) COLLATE utf8_bin NOT NULL,
  `postal_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `address`, `city`, `country`, `postal_code`) VALUES
(1, 'Kettenbrueckengasse 23', 'Vienna', 'Austria', 1040),
(2, 'Karlsplatz 1a', 'Vienna', 'Austria', 1010);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `fk_invoice_id` int(11) NOT NULL,
  `fk_bill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `fk_invoice_id`, `fk_bill_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(55) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`) VALUES
(1, 'SEDAN'),
(2, 'CUV'),
(3, 'SUV'),
(4, 'PICKUP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_costs`
--
ALTER TABLE `additional_costs`
  ADD PRIMARY KEY (`additional_cost_id`),
  ADD KEY `fk_return_id` (`fk_return_id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD UNIQUE KEY `fk_additional_cost_id` (`fk_additional_cost_id`),
  ADD KEY `fk_additional_cost_id_2` (`fk_additional_cost_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_type_id` (`fk_type_id`);

--
-- Indexes for table `car_return`
--
ALTER TABLE `car_return`
  ADD PRIMARY KEY (`car_return_id`),
  ADD UNIQUE KEY `fk_booking_id` (`fk_booking_id`),
  ADD KEY `fk_booking_id_2` (`fk_booking_id`);

--
-- Indexes for table `cost_estimate`
--
ALTER TABLE `cost_estimate`
  ADD PRIMARY KEY (`cost_id`),
  ADD UNIQUE KEY `fk_booking_id` (`fk_booking_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`ins_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_cost_id` (`fk_cost_id`),
  ADD KEY `fk_cost_id_2` (`fk_cost_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `fk_invoice_id` (`fk_invoice_id`),
  ADD UNIQUE KEY `fk_bill_id` (`fk_bill_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional_costs`
--
ALTER TABLE `additional_costs`
  MODIFY `additional_cost_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `car_return`
--
ALTER TABLE `car_return`
  MODIFY `car_return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cost_estimate`
--
ALTER TABLE `cost_estimate`
  MODIFY `cost_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `insurance`
--
ALTER TABLE `insurance`
  MODIFY `ins_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additional_costs`
--
ALTER TABLE `additional_costs`
  ADD CONSTRAINT `additional_costs_ibfk_1` FOREIGN KEY (`fk_return_id`) REFERENCES `car_return` (`car_return_id`) ON UPDATE CASCADE;

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`fk_additional_cost_id`) REFERENCES `additional_costs` (`additional_cost_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`fk_type_id`) REFERENCES `type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `car_return`
--
ALTER TABLE `car_return`
  ADD CONSTRAINT `car_return_ibfk_1` FOREIGN KEY (`fk_booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cost_estimate`
--
ALTER TABLE `cost_estimate`
  ADD CONSTRAINT `cost_estimate_ibfk_1` FOREIGN KEY (`fk_booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_cost_id`) REFERENCES `cost_estimate` (`cost_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`fk_bill_id`) REFERENCES `bill` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
