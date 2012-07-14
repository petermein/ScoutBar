-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 13, 2012 at 04:46 PM
-- Server version: 5.5.9
-- PHP Version: 5.2.17

USE `mydb`;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bestelling_bestelling`
--

CREATE TABLE IF NOT EXISTS `bestelling_bestelling` (
  `besetleling_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `total` float NOT NULL,
  `personen_personen_persoon_id` int(11) NOT NULL,
  PRIMARY KEY (`besetleling_id`),
  KEY `fk_order_orders_personen_personen1` (`personen_personen_persoon_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `bestelling_bestelling`
--

INSERT INTO `bestelling_bestelling` (`besetleling_id`, `date`, `total`, `personen_personen_persoon_id`) VALUES
(1, '2012-07-10 10:25:26', 1, 4),
(2, '2012-07-10 10:25:37', 0.6, 12),
(3, '2012-07-10 10:25:56', 0, 12),
(4, '2012-07-10 10:26:08', -4, 4),
(5, '2012-07-10 10:29:25', 0, 56),
(6, '2012-02-01 12:46:24', 0.7, 1),
(7, '2012-06-20 12:48:45', 0.5, 4),
(8, '2012-07-10 12:49:31', 0.6, 1),
(9, '2012-07-10 12:55:11', 0.7, 54),
(10, '2012-05-08 13:10:04', 0.6, 1),
(11, '2012-07-10 13:10:21', -1.4, 28),
(12, '2012-07-10 13:47:45', 0.7, 1),
(13, '2012-07-10 15:14:30', 2.5, 1),
(14, '2012-07-10 15:15:25', -10, 1),
(15, '2012-07-10 16:45:41', 0, 35),
(16, '2012-07-10 16:46:37', 1.1, 60),
(17, '2012-07-10 16:47:06', 2.5, 61),
(18, '2012-07-10 16:47:23', 4.2, 47),
(19, '2012-07-10 16:47:37', 3.6, 47),
(20, '2012-06-04 17:02:08', 0, 52),
(21, '2012-07-10 17:06:34', 0, 51),
(22, '2012-07-10 17:06:58', 11.5, 26),
(23, '2012-07-09 17:09:09', 0, 52),
(24, '2012-07-10 17:09:47', 0, 28),
(25, '2012-07-10 17:19:06', 0, 5),
(26, '2012-07-10 17:19:24', 0, 27),
(27, '2012-06-06 17:19:26', 0, 28),
(28, '2012-07-12 00:24:06', 0, 11),
(29, '2012-07-12 00:24:10', 0.5, 61),
(30, '2012-07-12 13:12:38', 19.1, 1),
(31, '2012-07-12 13:13:11', -50, 34),
(32, '2012-07-12 13:13:23', 11.5, 34),
(33, '2012-07-12 13:14:01', 5.8, 47),
(34, '2012-07-12 13:17:15', -2, 16),
(35, '2012-07-12 13:17:37', 1, 61),
(36, '2012-07-13 01:33:25', 0.6, 11),
(37, '2012-07-13 01:33:39', 0, 11),
(38, '2012-07-13 01:34:06', 0.7, 47),
(39, '2012-07-13 10:02:27', 7.8, 56),
(40, '2012-07-13 10:02:43', -57.5, 56);

-- --------------------------------------------------------

--
-- Table structure for table `bestelling_regels`
--

CREATE TABLE IF NOT EXISTS `bestelling_regels` (
  `idbestelling_regels` int(11) NOT NULL AUTO_INCREMENT,
  `aantal` tinyint(4) DEFAULT NULL,
  `bestelling_bestelling_besetleling_id` int(11) NOT NULL,
  `product_product_product_id` int(11) NOT NULL,
  `personen_rechten_personen_personen_persoon_id` int(11) DEFAULT NULL,
  `personen_personen_persoon_id` int(11) NOT NULL,
  `prijs` float NOT NULL,
  PRIMARY KEY (`idbestelling_regels`),
  KEY `fk_bestelling_regels_bestelling_bestelling1` (`bestelling_bestelling_besetleling_id`),
  KEY `fk_bestelling_regels_product_product1` (`product_product_product_id`),
  KEY `fk_bestelling_regels_personen_rechten1` (`personen_rechten_personen_personen_persoon_id`),
  KEY `fk_bestelling_regels_personen_personen1` (`personen_personen_persoon_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `bestelling_regels`
--

INSERT INTO `bestelling_regels` (`idbestelling_regels`, `aantal`, `bestelling_bestelling_besetleling_id`, `product_product_product_id`, `personen_rechten_personen_personen_persoon_id`, `personen_personen_persoon_id`, `prijs`) VALUES
(1, 1, 1, 1, NULL, 4, 1),
(2, 1, 2, 20, NULL, 12, 0.6),
(3, 2, 4, 12, 1, 4, -4),
(4, 1, 6, 21, NULL, 1, 0.7),
(5, 1, 7, 23, NULL, 4, 0.5),
(6, 1, 8, 6, NULL, 1, 0.6),
(7, 1, 9, 21, NULL, 54, 0.7),
(8, 1, 10, 19, NULL, 1, 0.6),
(9, 1, 11, 12, 1, 28, -2),
(10, 1, 11, 20, 1, 28, 0.6),
(11, 1, 12, 21, NULL, 1, 0.7),
(12, 1, 13, 1, NULL, 1, 1),
(13, 1, 13, 17, NULL, 1, 0.1),
(14, 2, 13, 21, NULL, 1, 1.4),
(15, 1, 14, 2, 1, 1, 10),
(16, 1, 14, 10, 1, 1, -20),
(17, 1, 16, 5, NULL, 60, 0.5),
(18, 1, 16, 17, NULL, 60, 0.1),
(19, 1, 16, 23, NULL, 60, 0.5),
(20, 1, 17, 6, NULL, 29, 0.6),
(21, 1, 17, 19, NULL, 29, 0.6),
(22, 1, 17, 20, NULL, 29, 0.6),
(23, 1, 17, 21, NULL, 29, 0.7),
(24, 6, 18, 21, NULL, 47, 4.2),
(25, 1, 19, 5, NULL, 47, 0.5),
(26, 2, 19, 19, NULL, 47, 1.2),
(27, 2, 19, 21, NULL, 47, 1.4),
(28, 1, 19, 23, NULL, 47, 0.5),
(29, 1, 22, 2, NULL, 26, 10),
(30, 1, 22, 18, NULL, 26, 1.5),
(31, 1, 29, 8, NULL, 61, 0.5),
(32, 1, 30, 2, NULL, 1, 10),
(33, 1, 30, 4, NULL, 1, 1),
(34, 4, 30, 5, NULL, 1, 2),
(35, 1, 30, 17, NULL, 1, 0.1),
(36, 4, 30, 18, NULL, 1, 6),
(37, 1, 31, 11, 1, 34, -50),
(38, 1, 32, 2, NULL, 34, 10),
(39, 1, 32, 18, NULL, 34, 1.5),
(40, 1, 33, 5, NULL, 47, 0.5),
(41, 2, 33, 6, NULL, 47, 1.2),
(42, 1, 33, 8, NULL, 47, 0.5),
(43, 1, 33, 17, NULL, 47, 0.1),
(44, 2, 33, 19, NULL, 47, 1.2),
(45, 1, 33, 20, NULL, 47, 0.6),
(46, 1, 33, 21, NULL, 47, 0.7),
(47, 1, 33, 22, NULL, 47, 0.5),
(48, 1, 33, 23, NULL, 47, 0.5),
(49, 1, 34, 12, 1, 16, -2),
(50, 1, 35, 1, NULL, 61, 1),
(51, 1, 36, 19, NULL, 11, 0.6),
(52, 1, 38, 21, NULL, 47, 0.7),
(53, 1, 39, 17, NULL, 56, 0.1),
(54, 4, 39, 18, NULL, 56, 6),
(55, 2, 39, 19, NULL, 56, 1.2),
(56, 1, 39, 23, NULL, 56, 0.5),
(57, 3, 40, 10, 1, 56, -60),
(58, 3, 40, 19, 1, 56, 1.8),
(59, 1, 40, 21, 1, 56, 0.7);

-- --------------------------------------------------------

--
-- Table structure for table `news_ticker`
--

CREATE TABLE IF NOT EXISTS `news_ticker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bericht` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `news_ticker`
--

INSERT INTO `news_ticker` (`id`, `bericht`) VALUES
(2, 'Wij schenken geen alcohol onder de 16!'),
(3, 'Elke vrijdag, vrije inloop na 22:00 uur'),
(4, 'Een meter bier 10 euro 11 bier!'),
(5, 'Zet snel 10 euro op je rekening met PayPal! Scan de QR');

-- --------------------------------------------------------

--
-- Stand-in structure for view `personen`
--
CREATE TABLE IF NOT EXISTS `personen` (
`persoon_id` int(11)
,`voornaam` varchar(45)
,`achternaam` varchar(45)
,`email` varchar(45)
,`telefoon_nr` varchar(45)
,`nickname` varchar(45)
,`geboortedatum` date
,`rekening` int(11)
,`imgpath` varchar(255)
,`saldo` float
,`level` tinyint(4)
,`password` varchar(64)
,`last_order` datetime
);
-- --------------------------------------------------------

--
-- Table structure for table `personen_personen`
--

CREATE TABLE IF NOT EXISTS `personen_personen` (
  `persoon_id` int(11) NOT NULL AUTO_INCREMENT,
  `voornaam` varchar(45) NOT NULL,
  `achternaam` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefoon_nr` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `geboortedatum` date NOT NULL,
  `imgpath` varchar(255) DEFAULT NULL,
  `persoon_rekening_rekening_id` int(11) NOT NULL,
  `last_order` datetime NOT NULL,
  PRIMARY KEY (`persoon_id`),
  KEY `fk_personen_personen_persoon_rekening1` (`persoon_rekening_rekening_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `personen_personen`
--

INSERT INTO `personen_personen` (`persoon_id`, `voornaam`, `achternaam`, `email`, `telefoon_nr`, `nickname`, `geboortedatum`, `imgpath`, `persoon_rekening_rekening_id`, `last_order`) VALUES
(1, 'Peter', 'Mein', 'petermein@gmail.com', '0614027563', 'Peen', '1990-02-27', 'panda.jpeg', 1, '2012-07-12 13:12:38'),
(4, 'Tim ', 'Mein', 'mebusmein@gmail.com', '0643138812', '-', '1994-05-05', 'test.jpeg', 8, '2012-07-10 12:48:45'),
(5, 'Wilco', 'Berendsen', 'Test@test.com', '0612345678', '0', '1992-02-02', 'test.jpeg', 9, '2012-07-10 17:19:06'),
(6, 'Eva', 'Cornelis', 'eva.cornelis@planet.nl', '0612345678', 'Tom', '1992-01-01', 'test.jpeg', 15, '2012-07-09 23:14:14'),
(7, 'Luna', 'De Cock', 'luna.de cock@hotmail.com', '0612345678', 'Aya', '1992-01-01', 'panda.jpeg', 16, '2012-07-09 23:14:14'),
(8, 'Célia', 'Baert', 'célia.baert@hotmail.com', '0612345678', 'Raphaël', '1992-01-01', 'test.jpeg', 17, '2012-07-09 23:14:14'),
(9, 'Eline', 'Smet', 'eline.smet@home.nl', '0612345678', 'Charlotte', '1992-01-01', 'test.jpeg', 18, '2012-07-09 23:14:14'),
(10, 'Célia', 'Wuyts', 'célia.wuyts@home.nl', '0612345678', 'Lotte', '1992-01-01', 'test.jpeg', 19, '2012-07-09 23:14:14'),
(11, 'Elena', 'Vandenberghe', 'elena.vandenberghe@kpn.nl', '0612345678', 'Lotte', '1992-01-01', 'test.jpeg', 20, '2012-07-13 01:33:39'),
(12, 'Emilie', 'Timmermans', 'emilie.timmermans@home.nl', '0612345678', 'Thomas', '1992-01-01', 'test.jpeg', 21, '2012-07-10 10:25:56'),
(13, 'Yanis', 'Janssen', 'yanis.janssen@ziggo.nl', '0612345678', 'Milan', '1992-01-01', 'test.jpeg', 22, '2012-07-09 23:14:14'),
(14, 'Hugo', 'Coppens', 'hugo.coppens@ziggo.nl', '0612345678', 'Ruben', '1992-01-01', 'test.jpeg', 23, '2012-07-09 23:14:14'),
(15, 'Luca', 'Dumont', 'luca.dumont@ziggo.nl', '0612345678', 'Lola', '1992-01-01', 'panda.jpeg', 24, '2012-07-09 23:14:14'),
(16, 'Jonas', 'Lauwers', 'jonas.lauwers@kpn.nl', '0612345678', 'Tristan', '1992-01-01', 'panda.jpeg', 25, '2012-07-12 13:17:15'),
(17, 'Ethan', 'Coppens', 'ethan.coppens@home.nl', '0612345678', 'Sarah', '1992-01-01', 'panda.jpeg', 26, '2012-07-09 23:14:14'),
(18, 'Chloé', 'Martens', 'chloé.martens@gmail.com', '0612345678', 'Wout', '1992-01-01', 'panda.jpeg', 27, '2012-07-09 23:14:14'),
(19, 'Raphaël', 'Denis', 'raphaël.denis@hotmail.com', '0612345678', 'Pauline', '1992-01-01', 'panda.jpeg', 28, '2012-07-09 23:14:14'),
(20, 'Ruben', 'Bertrand', 'ruben.bertrand@hotmail.com', '0612345678', 'Eva', '1992-01-01', 'panda.jpeg', 29, '2012-07-09 23:14:14'),
(21, 'Elisa', 'Van den Broeck', 'elisa.van den broeck@kpn.nl', '0612345678', 'Alice', '1992-01-01', 'test.jpeg', 30, '2012-07-09 23:14:14'),
(22, 'Mathis', 'Janssen', 'mathis.janssen@ziggo.nl', '0612345678', 'Manon', '1992-01-01', 'panda.jpeg', 31, '2012-07-09 23:14:14'),
(23, 'Antoine', 'Petit', 'antoine.petit@kpn.nl', '0612345678', 'Mathias', '1992-01-01', 'panda.jpeg', 32, '2012-07-09 23:14:14'),
(24, 'Elisa', 'Moens', 'elisa.moens@ziggo.nl', '0612345678', 'Victor', '1992-01-01', 'test.jpeg', 33, '2012-07-09 23:14:14'),
(25, 'Lars', 'Van Dyck', 'lars.van dyck@home.nl', '0612345678', 'Charlotte', '1992-01-01', 'test.jpeg', 34, '2012-07-09 23:14:14'),
(26, 'Amélie', 'Vermeersch', 'amélie.vermeersch@ziggo.nl', '0612345678', 'Anna', '1992-01-01', 'test.jpeg', 35, '2012-07-10 17:06:58'),
(27, 'Simon', 'Verhoeven', 'simon.verhoeven@kpn.nl', '0612345678', 'Romain', '1992-01-01', 'test.jpeg', 36, '2012-07-10 17:19:24'),
(28, 'Tom', 'Jansen', 'tom.jansen@home.nl', '0612345678', 'Elias', '1992-01-01', 'test.jpeg', 37, '2012-07-10 17:19:26'),
(29, 'Eva', 'Verlinden', 'eva.verlinden@home.nl', '0612345678', 'Mathéo', '1992-01-01', 'test.jpeg', 38, '2012-07-10 16:47:06'),
(30, 'Nora', 'Verheyen', 'nora.verheyen@ziggo.nl', '0612345678', 'Alexander', '1992-01-01', 'panda.jpeg', 39, '2012-07-09 23:14:14'),
(31, 'Elisa', 'Laurent', 'elisa.laurent@ziggo.nl', '0612345678', 'Théo', '1992-01-01', 'panda.jpeg', 40, '2012-07-09 23:14:14'),
(32, 'Noah', 'De Vos', 'noah.de vos@hotmail.com', '0612345678', 'Adam', '1992-01-01', 'test.jpeg', 41, '2012-07-09 23:14:14'),
(33, 'Nicolas', 'Lauwers', 'nicolas.lauwers@kpn.nl', '0612345678', 'Alexander', '1992-01-01', 'panda.jpeg', 42, '2012-07-09 23:14:14'),
(34, 'Amélie', 'Hermans', 'amélie.hermans@ziggo.nl', '0612345678', 'Lore', '1992-01-01', 'panda.jpeg', 43, '2012-07-12 13:13:23'),
(35, 'Mohamed', 'Lauwers', 'mohamed.lauwers@gmail.com', '0612345678', 'Alice', '1992-01-01', 'test.jpeg', 44, '2012-07-10 16:45:41'),
(36, 'Nathan', 'Laurent', 'nathan.laurent@ziggo.nl', '0612345678', 'Lucie', '1992-01-01', 'test.jpeg', 45, '2012-07-09 23:14:14'),
(37, 'Louise', 'Denis', 'louise.denis@planet.nl', '0612345678', 'Lisa', '1992-01-01', 'test.jpeg', 46, '2012-07-09 23:14:14'),
(38, 'Lucas', 'Thys', 'lucas.thys@gmail.com', '0612345678', 'Elena', '1992-01-01', 'panda.jpeg', 47, '2012-07-09 23:14:14'),
(39, 'Ethan', 'Lemmens', 'ethan.lemmens@kpn.nl', '0612345678', 'Mathis', '1992-01-01', 'panda.jpeg', 48, '2012-07-09 23:14:14'),
(40, 'Jules', 'De Backer', 'jules.de backer@home.nl', '0612345678', 'Simon', '1992-01-01', 'test.jpeg', 49, '2012-07-09 23:14:14'),
(41, 'Pauline', 'Vermeiren', 'pauline.vermeiren@kpn.nl', '0612345678', 'Victor', '1992-01-01', 'panda.jpeg', 50, '2012-07-09 23:14:14'),
(42, 'Manon', 'Baert', 'manon.baert@hotmail.com', '0612345678', 'Victor', '1992-01-01', 'test.jpeg', 51, '2012-07-09 23:14:14'),
(43, 'Lotte', 'Lemaire', 'lotte.lemaire@hotmail.com', '0612345678', 'Pauline', '1992-01-01', 'panda.jpeg', 52, '2012-07-09 23:14:14'),
(44, 'Jade', 'Goossens', 'jade.goossens@planet.nl', '0612345678', 'Anna', '1992-01-01', 'panda.jpeg', 53, '2012-07-09 23:14:14'),
(45, 'Daan', 'Verstraeten', 'daan.verstraeten@planet.nl', '0612345678', 'Lily', '1992-01-01', 'test.jpeg', 54, '2012-07-09 23:14:14'),
(46, 'Lara', 'Smets', 'lara.smets@gmail.com', '0612345678', 'Yanis', '1992-01-01', 'test.jpeg', 55, '2012-07-09 23:14:14'),
(47, 'Alice', 'Martens', 'alice.martens@home.nl', '0612345678', 'Jasper', '1998-01-01', 'test.jpeg', 56, '2012-07-13 01:34:06'),
(48, 'Diego', 'Wouters', 'diego.wouters@hotmail.com', '0612345678', 'Lore', '1992-01-01', 'test.jpeg', 57, '2012-07-09 23:14:14'),
(49, 'Noah', 'De Pauw', 'noah.de pauw@kpn.nl', '0612345678', 'Elise', '1992-01-01', 'panda.jpeg', 58, '2012-07-09 23:14:14'),
(50, 'Elisa', 'Bogaert', 'elisa.bogaert@hotmail.com', '0612345678', 'Alexander', '1992-01-01', 'test.jpeg', 59, '2012-07-09 23:14:14'),
(51, 'Ruben', 'Lejeune', 'ruben.lejeune@home.nl', '0612345678', 'Lucie', '1992-01-01', 'panda.jpeg', 60, '2012-07-10 17:06:34'),
(52, 'Matteo', 'Verstraete', 'matteo.verstraete@ziggo.nl', '0612345678', 'Nathan', '1992-01-01', 'panda.jpeg', 61, '2012-07-10 17:09:09'),
(53, 'Jasper', 'Lemmens', 'jasper.lemmens@kpn.nl', '0612345678', 'Mathéo', '1992-01-01', 'test.jpeg', 62, '2012-07-09 23:14:14'),
(54, 'Anaïs', 'Renard', 'anaïs.renard@kpn.nl', '0612345678', 'Nora', '1992-01-01', 'panda.jpeg', 63, '2012-07-10 12:55:11'),
(55, 'Zoé', 'De Vos', 'zoé.de vos@kpn.nl', '0612345678', 'Matteo', '1992-01-01', 'panda.jpeg', 64, '2012-07-09 23:14:14'),
(56, 'Amber', 'Goossens', 'amber.goossens@ziggo.nl', '0612345678', 'Lotte', '1992-01-01', 'panda.jpeg', 65, '2012-07-13 10:02:43'),
(57, 'Ferre', 'Desmet', 'ferre.desmet@kpn.nl', '0612345678', 'Victor', '1992-01-01', 'panda.jpeg', 66, '2012-07-09 23:14:14'),
(58, 'Chloé', 'Verschueren', 'chloé.verschueren@gmail.com', '0612345678', 'Aya', '1992-01-01', 'panda.jpeg', 67, '2012-07-09 23:14:14'),
(59, 'Nicolas', 'Coppens', 'nicolas.coppens@kpn.nl', '0612345678', 'Nathan', '1992-01-01', 'panda.jpeg', 68, '2012-07-09 23:14:14'),
(60, 'Emma', 'Stevens', 'emma.stevens@home.nl', '0612345678', 'Tom', '1992-01-01', 'panda.jpeg', 69, '2012-07-10 16:46:37'),
(61, ' Kassa', '', '', '', '', '1900-01-01', 'panda.jpeg', 70, '2012-07-12 13:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `personen_rechten`
--

CREATE TABLE IF NOT EXISTS `personen_rechten` (
  `level` tinyint(4) DEFAULT NULL,
  `personen_personen_persoon_id` int(11) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`personen_personen_persoon_id`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personen_rechten`
--

INSERT INTO `personen_rechten` (`level`, `personen_personen_persoon_id`, `password`) VALUES
(3, 1, '0000'),
(1, 61, '4321');

-- --------------------------------------------------------

--
-- Stand-in structure for view `persoon`
--
CREATE TABLE IF NOT EXISTS `persoon` (
`persoon_id` int(11)
,`voornaam` varchar(45)
,`achternaam` varchar(45)
,`email` varchar(45)
,`telefoon_nr` varchar(45)
,`nickname` varchar(45)
,`geboortedatum` date
,`saldo` float
,`level` tinyint(4)
,`password` varchar(64)
);
-- --------------------------------------------------------

--
-- Table structure for table `persoon_rekening`
--

CREATE TABLE IF NOT EXISTS `persoon_rekening` (
  `rekening_id` int(11) NOT NULL AUTO_INCREMENT,
  `saldo` float NOT NULL,
  PRIMARY KEY (`rekening_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `persoon_rekening`
--

INSERT INTO `persoon_rekening` (`rekening_id`, `saldo`) VALUES
(1, -14.2),
(6, 0),
(7, 0),
(8, 2.5),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, -0.6),
(21, -0.6),
(22, 0),
(23, 0),
(24, 0),
(25, 2),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, -11.5),
(36, 0),
(37, 1.4),
(38, -2.5),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 38.5),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, -14.3),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, -0.7),
(64, 0),
(65, 49.7),
(66, 0),
(67, 0),
(68, 0),
(69, -1.1),
(70, -1.5);

--
-- Triggers `persoon_rekening`
--
DROP TRIGGER IF EXISTS `updatetime`;
DELIMITER //
CREATE TRIGGER `updatetime` AFTER UPDATE ON `persoon_rekening`
 FOR EACH ROW BEGIN
UPDATE personen_personen SET `personen_personen`.`last_order`=NOW() WHERE `personen_personen`.`persoon_rekening_rekening_id`=NEW.rekening_id;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_product`
--

CREATE TABLE IF NOT EXISTS `product_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(45) DEFAULT NULL,
  `prijs` float DEFAULT NULL,
  `min_leeftijd` int(11) DEFAULT NULL,
  `categorie` int(11) NOT NULL,
  `imgpath` varchar(255) DEFAULT NULL,
  `weight` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `product_product`
--

INSERT INTO `product_product` (`product_id`, `naam`, `prijs`, `min_leeftijd`, `categorie`, `imgpath`, `weight`) VALUES
(1, 'Bier', 1, 16, 1, 'product/bier.jpeg', 0),
(2, 'Meter Bier', 10, 16, 1, 'product/meterbier.jpeg', 0),
(4, 'Wijn', 1, 16, 1, 'product/wijn.jpeg', 0),
(5, 'Cola', 0.5, 0, 2, 'product/cola.jpeg', 0),
(6, 'Mars', 0.6, 0, 3, 'product/mars.jpeg', 0),
(7, '10 Euro', -10, 0, 4, 'geld/10euro.jpg', 10),
(8, 'Fanta', 0.5, 0, 2, 'product/fanta.jpeg', 0),
(9, '5 euro', -5, 0, 4, 'geld/5euro.jpg', 5),
(10, '20 euro', -20, 0, 4, 'geld/20euro.jpg', 20),
(11, '50 euro', -50, 0, 4, 'geld/50euro.jpg', 50),
(12, '2 euro', -2, 0, 4, 'geld/2euro.jpg', 2),
(13, '1 euro', -1, 0, 4, 'geld/1euro.jpg', 1),
(14, '50 cent', -0.5, 0, 4, 'geld/0.5euro.jpg', 0.5),
(15, '20 cent', -0.2, 0, 4, 'geld/0.2euro.jpg', 0.2),
(16, '10 cent', -0.1, 0, 4, 'geld/0.1euro.jpg', 0.1),
(17, 'Ranja', 0.1, 0, 2, 'product/limonade.jpeg', 0),
(18, 'Beco', 1.5, 16, 1, 'product/beco.jpeg', 0),
(19, 'Twix', 0.6, 0, 3, 'product/twix.jpeg', 0),
(20, 'Snickers', 0.6, 0, 3, 'product/snickers.jpeg', 0),
(21, 'Stroopwafel', 0.7, 0, 3, 'product/stroopwafel.jpeg', 0),
(22, 'Sinaasappelsap', 0.5, 0, 2, 'product/sinaasappelsap.jpeg', 0),
(23, 'Appelsap', 0.5, 0, 2, 'product/appelsap.jpeg', 0);

-- --------------------------------------------------------

--
-- Structure for view `personen`
--
DROP TABLE IF EXISTS `personen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `personen` AS select `p`.`persoon_id` AS `persoon_id`,`p`.`voornaam` AS `voornaam`,`p`.`achternaam` AS `achternaam`,`p`.`email` AS `email`,`p`.`telefoon_nr` AS `telefoon_nr`,`p`.`nickname` AS `nickname`,`p`.`geboortedatum` AS `geboortedatum`,`p`.`persoon_rekening_rekening_id` AS `rekening`,`p`.`imgpath` AS `imgpath`,`rek`.`saldo` AS `saldo`,`r`.`level` AS `level`,`r`.`password` AS `password`,`p`.`last_order` AS `last_order` from ((`personen_personen` `p` left join `persoon_rekening` `rek` on((`p`.`persoon_rekening_rekening_id` = `rek`.`rekening_id`))) left join `personen_rechten` `r` on((`p`.`persoon_id` = `r`.`personen_personen_persoon_id`)));

-- --------------------------------------------------------

--
-- Structure for view `persoon`
--
DROP TABLE IF EXISTS `persoon`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `persoon` AS select `p`.`persoon_id` AS `persoon_id`,`p`.`voornaam` AS `voornaam`,`p`.`achternaam` AS `achternaam`,`p`.`email` AS `email`,`p`.`telefoon_nr` AS `telefoon_nr`,`p`.`nickname` AS `nickname`,`p`.`geboortedatum` AS `geboortedatum`,`rek`.`saldo` AS `saldo`,`r`.`level` AS `level`,`r`.`password` AS `password` from ((`personen_personen` `p` left join `persoon_rekening` `rek` on((`p`.`persoon_rekening_rekening_id` = `rek`.`rekening_id`))) left join `personen_rechten` `r` on((`p`.`persoon_rekening_rekening_id` = `r`.`personen_personen_persoon_id`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bestelling_bestelling`
--
ALTER TABLE `bestelling_bestelling`
  ADD CONSTRAINT `fk_order_orders_personen_personen1` FOREIGN KEY (`personen_personen_persoon_id`) REFERENCES `personen_personen` (`persoon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `bestelling_regels`
--
ALTER TABLE `bestelling_regels`
  ADD CONSTRAINT `fk_bestelling_regels_bestelling_bestelling1` FOREIGN KEY (`bestelling_bestelling_besetleling_id`) REFERENCES `bestelling_bestelling` (`besetleling_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bestelling_regels_personen_personen1` FOREIGN KEY (`personen_personen_persoon_id`) REFERENCES `personen_personen` (`persoon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bestelling_regels_personen_rechten1` FOREIGN KEY (`personen_rechten_personen_personen_persoon_id`) REFERENCES `personen_rechten` (`personen_personen_persoon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bestelling_regels_product_product1` FOREIGN KEY (`product_product_product_id`) REFERENCES `product_product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `personen_personen`
--
ALTER TABLE `personen_personen`
  ADD CONSTRAINT `fk_personen_personen_persoon_rekening1` FOREIGN KEY (`persoon_rekening_rekening_id`) REFERENCES `persoon_rekening` (`rekening_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `personen_rechten`
--
ALTER TABLE `personen_rechten`
  ADD CONSTRAINT `fk_personen_rechten_personen_personen1` FOREIGN KEY (`personen_personen_persoon_id`) REFERENCES `personen_personen` (`persoon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
