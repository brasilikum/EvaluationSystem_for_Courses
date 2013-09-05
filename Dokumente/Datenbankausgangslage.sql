-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 05. Sep 2013 um 16:06
-- Server Version: 5.5.29
-- PHP-Version: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Datenbank: `Evaluation`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `answertoquestion`
--

CREATE TABLE `answertoquestion` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `questionId` int(12) NOT NULL,
  `questionnaireId` int(12) NOT NULL,
  `text` varchar(1024) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionId` (`questionId`),
  KEY `questionnaireId` (`questionnaireId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `answertoquestion`
--

INSERT INTO `answertoquestion` (`id`, `questionId`, `questionnaireId`, `text`) VALUES
(1, 1, 1, 'Niemals'),
(2, 1, 1, 'Na klaro!');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `participant`
--

CREATE TABLE `participant` (
  `hash` varchar(40) COLLATE utf8_bin NOT NULL,
  `questionnaireId` int(12) NOT NULL,
  PRIMARY KEY (`hash`),
  KEY `questionnaireId` (`questionnaireId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question`
--

CREATE TABLE `question` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `text` varchar(1024) COLLATE utf8_bin NOT NULL,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `question`
--

INSERT INTO `question` (`id`, `text`, `type`) VALUES
(1, 'Findest du Plutka cool?', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `questionnaire`
--

CREATE TABLE `questionnaire` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `profId` int(12) NOT NULL,
  `expirationDate` date NOT NULL,
  `courseName` varchar(256) COLLATE utf8_bin NOT NULL,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `questionnaire`
--

INSERT INTO `questionnaire` (`id`, `profId`, `expirationDate`, `courseName`, `type`) VALUES
(1, 1, '2013-09-05', 'ARMA', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
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
