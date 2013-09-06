-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 06. Sep 2013 um 16:11
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
  `id` int(12) NOT NULL,
  `answertext` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `questionId` int(12) NOT NULL,
  `answernumber` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answertext` (`answertext`(255)),
  KEY `questionId` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `participant`
--

CREATE TABLE `participant` (
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

CREATE TABLE `question` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `text` varchar(1024) NOT NULL,
  `category` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'VL',
  `type` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'radio',
  PRIMARY KEY (`id`),
  KEY `category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=99 ;

--
-- Daten für Tabelle `question`
--

INSERT INTO `question` (`id`, `text`, `category`, `type`) VALUES
(59, 'Der inhaltliche Aufbau ist logisch nachvollziehbar', 'VL', 'radio'),
(60, 'Ein Bezug zwischen Theorie und Praxis/Anwendung wird hergestellt', 'VL', 'radio'),
(61, 'Die / der Lehrende spricht verständlich(Lautstärke, Deutlichkeit)', 'VL', 'radio'),
(62, 'Der / die Lehrende kann Komplizierte versändlich machen', 'VL', 'radio'),
(63, 'Die Veranstaltung hat mein Interesse an der Thematik geweckt', 'VL', 'radio'),
(64, 'Zum Mitdenken und Durchdenken des Stoffes/Themas wird angeragt', 'VL', 'radio'),
(65, 'Die / der Lehrende wirkt vorbereitet', 'VL', 'radio'),
(66, 'Die Materialien zur Vorlesung sind hilfreich (Skripte, Folien, etc.)', 'VL', 'radio'),
(67, 'Medien (Tafel, OHP, Beamer) werden sinnvoll eingesetzt', 'VL', 'radio'),
(68, 'Die / der Lehrende ist kooperativ und aufgeschlossen', 'VL', 'radio'),
(69, 'Das Tempo des Kurses ist angemessen', 'VL', 'radio'),
(70, 'Der Umfang ist angemessen', 'VL', 'radio'),
(71, 'Der Schwierigkeitsgrad ist angemessen', 'VL', 'radio'),
(72, 'Außerhalb der Veranstaltung findet eine gute Betreuung statt', 'VL', 'radio'),
(73, 'Die / der Lehrende fördert Fragen und aktive Mitarbeit', 'VL', 'radio'),
(74, 'Auf Beiträge der Teilnehmer/-innen gibt es ein hilfreiches Feedback', 'VL', 'radio'),
(75, 'Die Prüfungsanforderungen sind transparent', 'VL', 'radio'),
(76, 'Ich lerne viel in der Veranstaltung', 'VL', 'radio'),
(77, 'Die aktive Beteiligung der Studierenden bewerte ich als sehr gut', 'VL', 'radio'),
(78, 'Die Ausstattung der Hörsäle ist sehr gut', 'VL', 'radio'),
(79, 'Der Aufwand in Stunden/Woche für Vor-/Nachbereitung beträgt', 'VL', 'text'),
(80, 'Ich habe X% der Vorlesungen besucht', 'VL', 'radio'),
(81, 'Ich gebe der Vorlesung die Gesamtnote(Noten von 1 bis 5)', 'VL', 'text'),
(82, 'Ich gebe diese Note weil', 'VL', 'text'),
(83, 'Mir hat besonders gefallen', 'VL', 'radio'),
(84, 'Mir hat nicht gefallen', 'VL', 'radio'),
(85, 'Die Laborausstattung ist sehr gut', 'PR', 'radio'),
(86, 'Die Unterlagen zur Vorbereitung sind hilfreich und verständlich', 'PR', 'radio'),
(87, 'Die Anforderungen sind transparent', 'PR', 'radio'),
(88, 'Der Bezug zur Vorlesung ist gegeben', 'VL', 'radio'),
(89, 'Die Betreuenden gehen aufgeschlossen auf meine Fragen ein', 'PR', 'radio'),
(90, 'Die Verfügbarkeit der Betreuenden ist gegeben', 'PR', 'radio'),
(91, 'Der Umfang der Versuche/Übungen ist angemessen', 'PR', 'radio'),
(92, 'Die selbstständige Durchführung der Versuche/Übungen wird gefördert', 'PR', 'radio'),
(93, 'Das Feedback ist hilfreich', 'PR', 'radio'),
(94, 'Der Aufwand für Vor- und Nachbereitung in Stunden beträgt insgesamt', 'PR', 'text'),
(95, 'Ich gebe dem Praktikum die Gesamtnote', 'PR', 'text'),
(96, 'Ich gebe diese Note weil', 'PR', 'text'),
(97, 'Mir hat besonders gefallen', 'PR', 'text'),
(98, 'Mir hat nicht gefallen', 'PR', 'text');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `questionnaire`
--

CREATE TABLE `questionnaire` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `profId` int(12) NOT NULL,
  `expirationDate` date NOT NULL,
  `semester` varchar(20) NOT NULL,
  `courseName` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `category` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'VL',
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `profId` (`profId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `questionnaire`
--

INSERT INTO `questionnaire` (`id`, `profId`, `expirationDate`, `semester`, `courseName`, `category`) VALUES
(3, 3, '2013-09-19', 'SoSe2013', '3D-Animation', 'VL');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) COLLATE utf8_bin NOT NULL,
  `password` varchar(256) COLLATE utf8_bin NOT NULL,
  `role` varchar(12) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(3, 'admin', 'admin', 'admin'),
(4, 'user', 'user', 'user');

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

--
-- Constraints der Tabelle `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD CONSTRAINT `questionnaire_ibfk_1` FOREIGN KEY (`profId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
