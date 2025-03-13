-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 13, 2025 at 05:21 PM
-- Server version: 8.0.34
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `megacitycab`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(1, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `BillID` int NOT NULL AUTO_INCREMENT,
  `BookingID` int NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `Tax` decimal(5,2) DEFAULT '0.00',
  `Discount` decimal(5,2) DEFAULT '0.00',
  `FinalAmount` decimal(10,2) NOT NULL,
  `PaymentStatus` enum('Paid','Unpaid') DEFAULT 'Unpaid',
  PRIMARY KEY (`BillID`),
  KEY `BookingID` (`BookingID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`BillID`, `BookingID`, `TotalAmount`, `Tax`, `Discount`, `FinalAmount`, `PaymentStatus`) VALUES
(55, 78, 5000.00, 250.00, 200.00, 5050.00, 'Paid'),
(56, 79, 7200.00, 360.00, 500.00, 7060.00, 'Unpaid'),
(57, 80, 1500.00, 75.00, 50.00, 1525.00, 'Paid'),
(58, 81, 9800.00, 490.00, 600.00, 9690.00, 'Paid'),
(59, 82, 6400.00, 320.00, 300.00, 6420.00, 'Unpaid'),
(60, 83, 8500.00, 425.00, 450.00, 8475.00, 'Paid'),
(61, 84, 2300.00, 115.00, 100.00, 2315.00, 'Unpaid'),
(62, 85, 4700.00, 235.00, 200.00, 4735.00, 'Paid'),
(63, 86, 3600.00, 180.00, 150.00, 3630.00, 'Unpaid'),
(64, 87, 2900.00, 145.00, 120.00, 2925.00, 'Paid'),
(65, 88, 7600.00, 380.00, 550.00, 7430.00, 'Paid'),
(66, 89, 4200.00, 210.00, 180.00, 4230.00, 'Unpaid'),
(67, 90, 5900.00, 295.00, 250.00, 5945.00, 'Paid'),
(68, 91, 6900.00, 345.00, 400.00, 6845.00, 'Paid'),
(69, 92, 3200.00, 160.00, 130.00, 3230.00, 'Unpaid'),
(70, 93, 8500.00, 425.00, 600.00, 8325.00, 'Paid'),
(71, 94, 9700.00, 485.00, 700.00, 9485.00, 'Unpaid'),
(72, 95, 4200.00, 210.00, 180.00, 4230.00, 'Paid'),
(73, 96, 5200.00, 260.00, 220.00, 5240.00, 'Unpaid'),
(74, 97, 8100.00, 405.00, 500.00, 8005.00, 'Paid'),
(75, 98, 2900.00, 145.00, 120.00, 2925.00, 'Paid'),
(76, 99, 4300.00, 215.00, 200.00, 4315.00, 'Unpaid'),
(77, 100, 6400.00, 320.00, 350.00, 6370.00, 'Paid'),
(78, 101, 8700.00, 435.00, 600.00, 8535.00, 'Unpaid'),
(79, 102, 3400.00, 170.00, 140.00, 3430.00, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `CarID` int NOT NULL,
  `PickupLocation` varchar(255) NOT NULL,
  `Destination` varchar(255) NOT NULL,
  `BookingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Pending','Completed','Cancelled') DEFAULT 'Pending',
  PRIMARY KEY (`BookingID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `CarID` (`CarID`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingID`, `CustomerID`, `CarID`, `PickupLocation`, `Destination`, `BookingDate`, `Status`) VALUES
(78, 43, 56, 'Colombo Fort', 'Mount Lavinia', '2025-02-18 03:45:00', 'Cancelled'),
(79, 44, 57, 'Moratuwa', 'Nugegoda', '2025-02-18 04:00:00', 'Completed'),
(80, 45, 58, 'Battaramulla', 'Colombo 7', '2025-02-18 05:15:00', 'Pending'),
(81, 46, 59, 'Dehiwala', 'Kotte', '2025-02-18 05:30:00', 'Completed'),
(82, 47, 60, 'Negombo', 'Gampaha', '2025-02-18 06:45:00', 'Pending'),
(83, 48, 61, 'Borella', 'Rajagiriya', '2025-02-18 08:00:00', 'Cancelled'),
(84, 49, 62, 'Pettah', 'Kandy', '2025-02-18 08:30:00', 'Pending'),
(85, 50, 63, 'Kolonnawa', 'Maharagama', '2025-02-18 09:40:00', 'Completed'),
(86, 51, 64, 'Kirulapone', 'Wattala', '2025-02-18 10:50:00', 'Pending'),
(87, 52, 65, 'Ratmalana', 'Colombo 3', '2025-02-18 12:00:00', 'Completed'),
(88, 53, 66, 'Mt. Lavinia', 'Panadura', '2025-02-18 13:15:00', 'Pending'),
(89, 54, 67, 'Colombo 10', 'Piliyandala', '2025-02-18 13:30:00', 'Cancelled'),
(90, 55, 68, 'Colombo 4', 'Nugegoda', '2025-02-18 14:35:00', 'Pending'),
(91, 56, 69, 'Kelaniya', 'Mullaitivu', '2025-02-18 16:00:00', 'Completed'),
(92, 57, 70, 'Kaduwela', 'Bambalapitiya', '2025-02-18 17:10:00', 'Pending'),
(93, 58, 71, 'Wellawatte', 'Colombo 6', '2025-02-18 18:25:00', 'Completed'),
(94, 59, 72, 'Nugegoda', 'Gampaha', '2025-02-18 19:40:00', 'Pending'),
(95, 60, 73, 'Maharagama', 'Dehiwala', '2025-02-18 21:00:00', 'Completed'),
(96, 61, 74, 'Borella', 'Kollupitiya', '2025-02-18 22:10:00', 'Pending'),
(97, 62, 75, 'Maharagama', 'Kirulapone', '2025-02-18 23:25:00', 'Completed'),
(98, 63, 76, 'Dehiwala', 'Colombo 2', '2025-02-18 23:50:00', 'Pending'),
(99, 64, 77, 'Borella', 'Nugegoda', '2025-02-19 01:05:00', 'Completed'),
(100, 65, 78, 'Rajagiriya', 'Pettah', '2025-02-19 02:15:00', 'Pending'),
(101, 66, 79, 'Kotte', 'Battaramulla', '2025-02-19 03:25:00', 'Completed'),
(102, 67, 80, 'Colombo 5', 'Kelaniya', '2025-02-19 04:35:00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
CREATE TABLE IF NOT EXISTS `cars` (
  `CarID` int NOT NULL AUTO_INCREMENT,
  `CarModel` varchar(50) NOT NULL,
  `CarNumber` varchar(20) NOT NULL,
  `DriverID` int DEFAULT NULL,
  `Status` enum('Available','Booked','Under Maintenance') DEFAULT 'Available',
  PRIMARY KEY (`CarID`),
  UNIQUE KEY `CarNumber` (`CarNumber`),
  KEY `DriverID` (`DriverID`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`CarID`, `CarModel`, `CarNumber`, `DriverID`, `Status`) VALUES
(56, 'Toyota Corolla', 'AB1234', 32, 'Available'),
(57, 'Honda Civic', 'BC5678', 33, 'Booked'),
(58, 'Ford Mustang', 'CD2345', 34, 'Under Maintenance'),
(59, 'BMW 320i', 'DE6789', 35, 'Available'),
(60, 'Audi A4', 'EF3456', 36, 'Booked'),
(61, 'Mercedes-Benz C-Class', 'FG8901', 37, 'Under Maintenance'),
(62, 'Hyundai Elantra', 'GH2345', 38, 'Available'),
(63, 'Kia Sorento', 'HI5678', 39, 'Booked'),
(64, 'Nissan Altima', 'IJ6789', 40, 'Available'),
(65, 'Chevrolet Malibu', 'JK1234', 41, 'Under Maintenance'),
(66, 'Toyota Camry', 'KL5678', 42, 'Booked'),
(67, 'Honda Accord', 'LM8901', 43, 'Available'),
(68, 'Ford Focus', 'MN2345', 44, 'Under Maintenance'),
(69, 'BMW X5', 'NO3456', 45, 'Available'),
(70, 'Audi Q5', 'OP5678', 46, 'Booked'),
(71, 'Mercedes-Benz E-Class', 'PQ8901', 47, 'Available'),
(72, 'Hyundai Tucson', 'QR2345', 48, 'Booked'),
(73, 'Kia Forte', 'RS5678', 49, 'Under Maintenance'),
(74, 'Nissan Sentra', 'ST6789', 50, 'Available'),
(75, 'Chevrolet Cruze', 'TU1234', 51, 'Booked'),
(76, 'Toyota RAV4', 'UV3456', 52, 'Available'),
(77, 'Honda HR-V', 'VW5678', 53, 'Under Maintenance'),
(78, 'Ford Explorer', 'WX6789', 54, 'Booked'),
(79, 'BMW 5 Series', 'XY2345', 55, 'Available'),
(80, 'Audi A6', 'YZ3456', 56, 'Booked');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `RegistrationNumber` varchar(20) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `NIC` varchar(15) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `RegistrationNumber` (`RegistrationNumber`),
  UNIQUE KEY `NIC` (`NIC`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `RegistrationNumber`, `FullName`, `Address`, `NIC`, `PhoneNumber`, `Email`, `CreatedAt`) VALUES
(43, 'REG001', 'Amal Perera', '123 Main St, Colombo', '987654321V', '0771234567', 'amal@example.com', '2025-02-18 17:19:16'),
(44, 'REG002', 'Nimal Silva', '45 Park Ave, Kandy', '965432187V', '0779876543', 'nimal@example.com', '2025-02-18 17:19:16'),
(45, 'REG003', 'Kamal Fernando', '78 River Rd, Galle', '987321654V', '0714561234', 'kamal@example.com', '2025-02-18 17:19:16'),
(46, 'REG004', 'Sunil Jayawardena', '56 Lake St, Negombo', '965874123V', '0707893216', 'sunil@example.com', '2025-02-18 17:19:16'),
(47, 'REG005', 'Chathura Weerasinghe', '23 Hilltop, Nuwara Eliya', '941258963V', '0753216549', 'chathura@example.com', '2025-02-18 17:19:16'),
(48, 'REG006', 'Dilshan Madushanka', '88 Beach Rd, Matara', '987654987V', '0776549873', 'dilshan@example.com', '2025-02-18 17:19:16'),
(49, 'REG007', 'Sanduni Rajapaksha', '14 Green Way, Jaffna', '935214789V', '0761597534', 'sanduni@example.com', '2025-02-18 17:19:16'),
(50, 'REG008', 'Tharindu Wickramasinghe', '67 Maple St, Colombo', '987654852V', '0747539518', 'tharindu@example.com', '2025-02-18 17:19:16'),
(51, 'REG009', 'Piumi Karunaratne', '12 Ocean View, Gampaha', '975214369V', '0778527419', 'piumi@example.com', '2025-02-18 17:19:16'),
(52, 'REG010', 'Gayan Dissanayake', '34 Sunset Blvd, Kegalle', '985214789V', '0723692581', 'gayan@example.com', '2025-02-18 17:19:16'),
(53, 'REG011', 'Shanaka Peiris', '9 Central St, Badulla', '964785123V', '0789874123', 'shanaka@example.com', '2025-02-18 17:19:16'),
(54, 'REG012', 'Thilini Senanayake', '29 Railway Rd, Kurunegala', '952364789V', '0774123657', 'thilini@example.com', '2025-02-18 17:19:16'),
(55, 'REG013', 'Harsha Pathirana', '52 King St, Anuradhapura', '998745632V', '0768745123', 'harsha@example.com', '2025-02-18 17:19:16'),
(56, 'REG014', 'Kasun Jayasundara', '15 Temple Rd, Polonnaruwa', '967514823V', '0746352147', 'kasun@example.com', '2025-02-18 17:19:16'),
(57, 'REG015', 'Chaminda Ekanayake', '27 Coconut Grove, Ratnapura', '956214783V', '0774152637', 'chaminda@example.com', '2025-02-18 17:19:16'),
(58, 'REG016', 'Supun Jayasinghe', '19 Mountain Rd, Kalutara', '974125836V', '0758523697', 'supun@example.com', '2025-02-18 17:19:16'),
(59, 'REG017', 'Ravindu Madusanka', '22 Lakeside Rd, Ampara', '963214578V', '0739632581', 'ravindu@example.com', '2025-02-18 17:19:16'),
(60, 'REG018', 'Sachini Gamage', '10 Lotus Ave, Batticaloa', '987541236V', '0707418529', 'sachini@example.com', '2025-02-18 17:19:16'),
(61, 'REG019', 'Malith Perera', '33 Palm St, Trincomalee', '965784123V', '0783697412', 'malith@example.com', '2025-02-18 17:19:16'),
(62, 'REG020', 'Janani Samarakoon', '11 Sunrise Ave, Mannar', '952317468V', '0729876541', 'janani@example.com', '2025-02-18 17:19:16'),
(63, 'REG021', 'Hasitha Lakmal', '8 Riverbank Rd, Puttalam', '976541289V', '0761237896', 'hasitha@example.com', '2025-02-18 17:19:16'),
(64, 'REG022', 'Manoj Siriwardena', '21 Pearl St, Hambantota', '985147632V', '0744563219', 'manoj@example.com', '2025-02-18 17:19:16'),
(65, 'REG023', 'Shan Perera', '44 Seaside Rd, Mullaitivu', '963254178V', '0777896541', 'shan@example.com', '2025-02-18 17:19:16'),
(66, 'REG024', 'Dinesh Wickramaratne', '5 New Town Rd, Kilinochchi', '957863214V', '0759631478', 'dinesh@example.com', '2025-02-18 17:19:16'),
(67, 'REG025', 'Tharushi Fernando', '37 Mountain View, Monaragala', '985216743V', '+94788529637', 'tharushi@example.com', '2025-02-18 17:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
CREATE TABLE IF NOT EXISTS `drivers` (
  `DriverID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) NOT NULL,
  `LicenseNumber` varchar(20) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Status` enum('Active','Inactive') DEFAULT 'Active',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DriverID`),
  UNIQUE KEY `LicenseNumber` (`LicenseNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`DriverID`, `FullName`, `LicenseNumber`, `PhoneNumber`, `Address`, `Status`, `CreatedAt`) VALUES
(32, 'John Doe', 'LN123456789', '0771234567', '123 Main St, Colombo', 'Active', '2025-02-18 17:01:43'),
(33, 'Jane Smith', 'LN987654321', '0779876543', '45 Park Ave, Kandy', 'Active', '2025-02-18 17:01:43'),
(34, 'David Johnson', 'LN456123789', '0714561234', '78 River Rd, Galle', 'Active', '2025-02-18 17:01:43'),
(35, 'Michael Brown', 'LN789321654', '0707893216', '56 Lake St, Negombo', 'Active', '2025-02-18 17:01:43'),
(36, 'Emily Davis', 'LN321654987', '0753216549', '23 Hilltop, Nuwara Eliya', 'Inactive', '2025-02-18 17:01:43'),
(37, 'Chris Wilson', 'LN654987321', '0776549873', '88 Beach Rd, Matara', 'Active', '2025-02-18 17:01:43'),
(38, 'Sarah Miller', 'LN159753486', '0761597534', '14 Green Way, Jaffna', 'Active', '2025-02-18 17:01:43'),
(39, 'Robert Taylor', 'LN753951852', '0747539518', '67 Maple St, Colombo', 'Active', '2025-02-18 17:01:43'),
(40, 'Jessica Anderson', 'LN852741963', '0778527419', '12 Ocean View, Gampaha', 'Active', '2025-02-18 17:01:43'),
(41, 'William Thomas', 'LN369258147', '0723692581', '34 Sunset Blvd, Kegalle', 'Active', '2025-02-18 17:01:43'),
(42, 'Matthew White', 'LN987412365', '0789874123', '9 Central St, Badulla', 'Active', '2025-02-18 17:01:43'),
(43, 'Ashley Martinez', 'LN412365789', '0774123657', '29 Railway Rd, Kurunegala', 'Inactive', '2025-02-18 17:01:43'),
(44, 'Daniel Harris', 'LN874512369', '0768745123', '52 King St, Anuradhapura', 'Active', '2025-02-18 17:01:43'),
(45, 'Olivia Clark', 'LN635214789', '0746352147', '15 Temple Rd, Polonnaruwa', 'Active', '2025-02-18 17:01:43'),
(46, 'James Lewis', 'LN415263789', '0774152637', '27 Coconut Grove, Ratnapura', 'Active', '2025-02-18 17:01:43'),
(47, 'Sophia Walker', 'LN852369741', '0758523697', '19 Mountain Rd, Kalutara', 'Active', '2025-02-18 17:01:43'),
(48, 'Ethan Hall', 'LN963258147', '0739632581', '22 Lakeside Rd, Ampara', 'Active', '2025-02-18 17:01:43'),
(49, 'Mia Allen', 'LN741852963', '0707418529', '10 Lotus Ave, Batticaloa', 'Active', '2025-02-18 17:01:43'),
(50, 'Alexander Young', 'LN369741258', '0783697412', '33 Palm St, Trincomalee', 'Inactive', '2025-02-18 17:01:43'),
(51, 'Charlotte King', 'LN987654123', '0729876541', '11 Sunrise Ave, Mannar', 'Active', '2025-02-18 17:01:43'),
(52, 'Benjamin Scott', 'LN123789654', '0761237896', '8 Riverbank Rd, Puttalam', 'Active', '2025-02-18 17:01:43'),
(53, 'Ava Adams', 'LN456321987', '0744563219', '21 Pearl St, Hambantota', 'Active', '2025-02-18 17:01:43'),
(54, 'Henry Nelson', 'LN789654123', '0777896541', '44 Seaside Rd, Mullaitivu', 'Inactive', '2025-02-18 17:01:43'),
(55, 'Lucas Carter', 'LN963147852', '0759631478', '5 New Town Rd, Kilinochchi', 'Active', '2025-02-18 17:01:43'),
(56, 'Emma Mitchell', 'LN852963741', '0788529637', '37 Mountain View, Monaragala', 'Active', '2025-02-18 17:01:43'),
(58, 'Megan Green', 'LIC100024', '+94701856212', '832 Elmwood Dr, Stoneford', 'Active', '2025-03-06 08:17:34'),
(59, 'Thilak', '12', '+94701856212', 'ad', 'Active', '2025-03-06 08:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

DROP TABLE IF EXISTS `help`;
CREATE TABLE IF NOT EXISTS `help` (
  `HelpID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`HelpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`CarID`) REFERENCES `cars` (`CarID`);

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`DriverID`) REFERENCES `drivers` (`DriverID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
