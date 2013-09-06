-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Sep 2013 um 15:06
-- Server Version: 5.6.11
-- PHP-Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `evaluation`
--
CREATE DATABASE IF NOT EXISTS `evaluation` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `evaluation`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `answertoquestion`
--

CREATE TABLE IF NOT EXISTS `answertoquestion` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `questionId` int(12) NOT NULL,
  `answertext` varchar(1024) COLLATE utf8_bin NOT NULL,
  `answernumber` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionId` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `participant`
--

CREATE TABLE IF NOT EXISTS `participant` (
  `hash` varchar(48) COLLATE utf8_bin NOT NULL,
  `questionnaireId` int(12) NOT NULL,
  PRIMARY KEY (`hash`),
  KEY `questionnaireId` (`questionnaireId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `participant`
--

INSERT INTO `participant` (`hash`, `questionnaireId`) VALUES
('425a781442b7296bd7a69abc18ad60fde1338f9e', 3),
('5a330c37ce59a47cca29f2cfb49caeceaae3058f', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `text` varchar(1024) COLLATE utf8_bin NOT NULL,
  `category` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT 'VL',
  `type` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'radio',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `question`
--

INSERT INTO `question` (`id`, `text`, `category`, `type`) VALUES
(2, 'Die Ausstattung der Räume bewerte ich als gut', 'VL', 'radio'),
(3, 'Der Lehrende geht offen auf Fragen ein', 'VL', 'radio'),
(4, 'Der Lehrende kann komplexe Sachverhalte deutlich machen', 'VL', 'radio'),
(5, 'Das hat mir besonders gefallen', 'VL', 'text'),
(6, 'Das hat mir nicht gefallen', 'VL', 'text');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `questionnaire`
--

CREATE TABLE IF NOT EXISTS `questionnaire` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `profId` int(12) NOT NULL,
  `expirationDate` date NOT NULL,
  `Semester` varchar(20) COLLATE utf8_bin NOT NULL,
  `courseName` varchar(256) COLLATE utf8_bin NOT NULL,
  `category` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT 'VL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `questionnaire`
--

INSERT INTO `questionnaire` (`id`, `profId`, `expirationDate`, `Semester`, `courseName`, `category`) VALUES
(3, 4, '2013-09-19', 'SoSe2013', '3D-Animation', 'VL');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `password` varchar(256) COLLATE utf8_bin NOT NULL,
  `role` varchar(12) COLLATE utf8_bin NOT NULL,
  `username` varchar(12) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `password`, `role`, `username`) VALUES
(2, '7dfe73130d621f720f9823dcdb8dbf4f583fa969', 'admin', 'plutka'),
(3, 'admin', 'admin', 'admin');

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `answertoquestion`
--
ALTER TABLE `answertoquestion`
  ADD CONSTRAINT `answertoquestion_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`questionnaireId`) REFERENCES `questionnaire` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
