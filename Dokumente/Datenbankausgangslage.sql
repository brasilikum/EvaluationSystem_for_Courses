-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Sep 2013 um 17:23
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
  `questionnaireId` int(12) NOT NULL,
  `text` varchar(1024) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionId` (`questionId`),
  KEY `questionnaireId` (`questionnaireId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `participant`
--

CREATE TABLE IF NOT EXISTS `participant` (
  `hash` varchar(40) COLLATE utf8_bin NOT NULL,
  `questionnaireId` int(12) NOT NULL,
  PRIMARY KEY (`hash`),
  KEY `questionnaireId` (`questionnaireId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `text` varchar(1024) COLLATE utf8_bin NOT NULL,
  `category` varchar(2) COLLATE utf8_bin NOT NULL,
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
  `courseName` varchar(256) COLLATE utf8_bin NOT NULL,
  `category` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT 'VL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `password`, `role`, `username`) VALUES
(2, '7dfe73130d621f720f9823dcdb8dbf4f583fa969', 'admin', 'plutka');

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `answertoquestion`
--
ALTER TABLE `answertoquestion`
  ADD CONSTRAINT `answertoquestion_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answertoquestion_ibfk_2` FOREIGN KEY (`questionnaireId`) REFERENCES `questionnaire` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`questionnaireId`) REFERENCES `questionnaire` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
