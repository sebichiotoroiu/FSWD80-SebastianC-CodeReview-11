-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2019 at 04:22 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr11_sebastianchiotoroiu_travelmatic`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `addressID` int(25) NOT NULL,
  `street` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ZIP` int(11) DEFAULT NULL,
  `fk_restID` int(11) DEFAULT NULL,
  `fk_eventID` int(11) DEFAULT NULL,
  `fk_placeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`addressID`, `street`, `city`, `country`, `ZIP`, `fk_restID`, `fk_eventID`, `fk_placeID`) VALUES
(1, 'Sechshauser Gürtel 7', 'Wien', 'Austria', 1150, 1, NULL, NULL),
(2, 'Ballgasse 6', 'Viena', 'Austria', 1010, 2, NULL, NULL),
(3, 'Laxenburger 107', 'Wien', 'Austria', 1100, 3, NULL, NULL),
(4, 'Schweglerstraße 29', 'Wien', 'Austria', 1150, 4, NULL, NULL),
(5, 'General Traian Mosoiu 24', 'Brasov', 'Romania', 507025, NULL, NULL, 1),
(6, 'Castelului 1-3', 'Hunedoara', 'Romania', 331141, NULL, NULL, 2),
(7, 'Izvor 2-4, sector 5', 'Bucharest', 'Romania', 50563, NULL, NULL, 3),
(8, 'DJ186 276 Barsana', 'Barsana', 'Romania', 437035, NULL, NULL, 4),
(9, 'Various Venues', 'Cluj-Napoca', 'Romania', 520321, NULL, 1, NULL),
(10, 'Constanta', 'Constanta', 'Romania', 900178, NULL, 2, NULL),
(11, 'Bánffy Castle', 'Bontida', 'Romania', 152235, NULL, 3, NULL),
(12, 'Mihai Viteazu nr. 96', 'Sighisoara', 'Romania', 145235, NULL, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `categegory_name` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `categegory_name`) VALUES
(1, 'restaurant'),
(2, 'event'),
(3, 'place');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `eventID` int(11) NOT NULL,
  `event_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `event_time` time DEFAULT NULL,
  `website` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `fk_typeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventID`, `event_name`, `event_date`, `event_time`, `website`, `price`, `fk_typeID`) VALUES
(1, 'Untold', '2020-08-21', '21:00:00', 'https://www.festicket.com/festivals/untold-festival/', 100, 8),
(2, 'Neversea', '2020-07-10', '15:00:00', 'https://www.festicket.com/festivals/neversea-festival/', 90, 10),
(3, 'Electric Castle', '2020-07-24', '19:00:00', 'https://www.festicket.com/festivals/electric-castle/2019/', 120, 9),
(4, 'DAVA', '2020-08-28', '19:00:00', 'https://www.festicket.com/festivals/dava-festival/', 129, 10);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `imageID` int(11) NOT NULL,
  `photo_name` longblob DEFAULT NULL,
  `fk_user_profileID` int(11) DEFAULT NULL,
  `fk_restID` int(11) DEFAULT NULL,
  `fk_eventID` int(11) DEFAULT NULL,
  `fk_placesID` int(11) DEFAULT NULL,
  `url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`imageID`, `photo_name`, `fk_user_profileID`, `fk_restID`, `fk_eventID`, `fk_placesID`, `url`) VALUES
(1, NULL, NULL, 1, NULL, NULL, 'https://scontent-vie1-1.xx.fbcdn.net/v/t1.0-9/30411864_2085041001539966_4714521823263464308_n.jpg?_nc_cat=109&_nc_ohc=ud_DS83ErokAQk9Y54Ea6e_iXdbJ0WjD40JeKi2sqGq9sRTg8rJ7PHFAw&_nc_ht=scontent-vie1-1.xx&oh=cb54cbc56e9e7e42163241b49571d465&oe=5E401BC5'),
(2, NULL, NULL, 2, NULL, NULL, 'http://www.restaurantbukowina.at/wp-content/uploads/2017/01/17098303_1420250038008019_4367711568111733373_n.jpg'),
(3, NULL, NULL, 3, NULL, NULL, 'https://scontent-vie1-1.xx.fbcdn.net/v/t1.0-9/42773428_2193034307620649_8377509297700995072_n.jpg?_nc_cat=107&_nc_ohc=9zQ509SbmuIAQmQyStaQw1uM_VbgIUpwmWhk3PL7DDRgxf8uo8AJJGhVA&_nc_ht=scontent-vie1-1.xx&oh=5368ae72d6984dd094b92d6859a253d6&oe=5E4EA6A3'),
(4, NULL, NULL, 4, NULL, NULL, 'https://casamiorita.com/wp-content/uploads/2019/03/20190303-IMG_9175.jpg'),
(5, NULL, NULL, NULL, NULL, 1, 'https://cdn.pixabay.com/photo/2017/02/04/06/09/romania-2036691_1280.jpg'),
(6, NULL, NULL, NULL, NULL, 2, 'https://cdn.pixabay.com/photo/2019/08/28/16/35/castle-of-the-corvin-4437144__340.jpg'),
(7, NULL, NULL, NULL, NULL, 3, 'http://metropotam.ro/mediaserver/e/y/CasaPoporului_night.jpg'),
(8, NULL, NULL, NULL, NULL, 4, 'https://cdn.pixabay.com/photo/2015/02/19/20/14/romania-642654__340.jpg'),
(9, NULL, NULL, NULL, 1, NULL, 'https://media.resources.festicket.com/image/899x514/smart/filters:quality(70)/www/photos/UntoldFestival2020_V1.jpg'),
(10, NULL, NULL, NULL, 2, NULL, 'https://media.resources.festicket.com/image/899x514/smart/filters:quality(70)/www/photos/Neversea2020_V1.jpg'),
(11, NULL, NULL, NULL, 3, NULL, 'https://media.resources.festicket.com/image/899x514/smart/filters:quality(70)/www/photos/ElectricCastle2019_V3.jpg'),
(12, NULL, NULL, NULL, 4, NULL, 'https://media.resources.festicket.com/image/899x514/smart/filters:quality(70)/www/photos/Dava2020_V3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `placeID` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fk_typeID` int(11) DEFAULT NULL,
  `fk_imageID` int(11) DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`placeID`, `name`, `fk_typeID`, `fk_imageID`, `description`) VALUES
(1, 'Castle Bran', 5, 5, 'In the center of Romania is a medieval castle believed to have once held Vlad the Impaler prisoner'),
(2, 'Corvin\'s Castle', 5, 6, 'Corvin Castle, also known as Hunyadi Castle or Hunedoara Castle is a Gothic-Renaissance castle in Hunedoara, Romania'),
(3, 'Parliament Bucharest', 6, 7, 'The Palace of the Parliament (Romanian: Palatul Parlamentului) is the seat of the Parliament of Romania.'),
(4, 'Barsana Monastery', 7, 8, 'The tallest wooden building in Europe. Barsana Monastery is one of the landmarks of Maramures.');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `restID` int(11) NOT NULL,
  `rest_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` int(100) DEFAULT NULL,
  `rest_description` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fk_typeID` int(11) DEFAULT NULL,
  `website` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`restID`, `rest_name`, `phone_number`, `rest_description`, `fk_typeID`, `website`) VALUES
(1, 'Donaudelta', 5641000, 'Traditional peasant products', 4, 'http://www.donaudelta.at'),
(2, 'Bukowina', 5120628, 'Traditional peasant products\r\n', 2, 'http://www.restaurantbukowina.at'),
(3, 'Casa Romaneasca', 9920106, 'Traditional products\r\n', 4, 'http://www.casaromaneasca.at'),
(4, 'Casa Miorita', 11097143, 'Traditional peasant products\r\n', 3, 'https://casamiorita.com');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `typeID` int(11) NOT NULL,
  `type_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fk_categoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`typeID`, `type_name`, `fk_categoryID`) VALUES
(1, 'chinese', 1),
(2, 'indian', 1),
(3, 'tailandez', 1),
(4, 'romanian', 1),
(5, 'museum', 3),
(6, 'historical site', 3),
(7, 'church', 3),
(8, 'concert', 2),
(9, 'party', 2),
(10, 'festival', 2),
(11, 'dance', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `username` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fk_user_roleID` int(11) DEFAULT NULL,
  `fk_profileID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `user_email`, `password`, `fk_user_roleID`, `fk_profileID`) VALUES
(1, 'sebi', 'sebi@a.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 1, 0),
(2, 'maria', 'maria@a.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 2, 0),
(3, 'alina', 'alina@a.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 2, 0),
(4, 'alin', 'alin@a.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_history`
--

CREATE TABLE `user_history` (
  `historyID` int(11) NOT NULL,
  `fk_userID` int(11) DEFAULT NULL,
  `fk_restID` int(11) DEFAULT NULL,
  `fk_eventID` int(11) DEFAULT NULL,
  `fk_placeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `profileID` int(11) NOT NULL,
  `first_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `fk_userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`profileID`, `first_name`, `last_name`, `age`, `fk_userID`) VALUES
(1, 'sebi', 'chiotoroiu', 42, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `roleID` int(11) NOT NULL,
  `user_role` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`roleID`, `user_role`) VALUES
(1, 'admin'),
(2, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressID`),
  ADD KEY `fk_restID` (`fk_restID`),
  ADD KEY `fk_eventID` (`fk_eventID`),
  ADD KEY `fk_placeID` (`fk_placeID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eventID`),
  ADD KEY `fk_typeID` (`fk_typeID`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`imageID`),
  ADD KEY `fk_user_profileID` (`fk_user_profileID`),
  ADD KEY `fk_restID` (`fk_restID`),
  ADD KEY `fk_eventID` (`fk_eventID`),
  ADD KEY `fk_placesID` (`fk_placesID`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`placeID`),
  ADD KEY `fk_typeID` (`fk_typeID`),
  ADD KEY `fk_imageID` (`fk_imageID`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`restID`),
  ADD KEY `fk_typeID` (`fk_typeID`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`typeID`),
  ADD KEY `fk_categoryID` (`fk_categoryID`),
  ADD KEY `fk_categoryID_2` (`fk_categoryID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `fk_user_roleID` (`fk_user_roleID`),
  ADD KEY `fk_profileID` (`fk_profileID`),
  ADD KEY `fk_user_roleID_2` (`fk_user_roleID`),
  ADD KEY `fk_profileID_2` (`fk_profileID`);

--
-- Indexes for table `user_history`
--
ALTER TABLE `user_history`
  ADD PRIMARY KEY (`historyID`),
  ADD KEY `fk_userID` (`fk_userID`),
  ADD KEY `fk_restID` (`fk_restID`),
  ADD KEY `fk_eventID` (`fk_eventID`),
  ADD KEY `fk_placeID` (`fk_placeID`),
  ADD KEY `fk_placeID_2` (`fk_placeID`),
  ADD KEY `fk_eventID_2` (`fk_eventID`),
  ADD KEY `fk_restID_2` (`fk_restID`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`profileID`),
  ADD UNIQUE KEY `fk_userID_2` (`fk_userID`),
  ADD KEY `fk_userID` (`fk_userID`),
  ADD KEY `fk_userID_3` (`fk_userID`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`roleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `addressID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `imageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `placeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `restID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_history`
--
ALTER TABLE `user_history`
  MODIFY `historyID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `profileID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
