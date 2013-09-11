-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 11. Sep 2013 um 13:41
-- Server Version: 5.5.29
-- PHP-Version: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Datenbank: `evaluation`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `answertoquestion`
--

CREATE TABLE `answertoquestion` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `answertext` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `questionId` int(12) NOT NULL,
  `questionnaireId` int(12) NOT NULL,
  `answernumber` int(2) DEFAULT NULL,
  `answerhash` varchar(52) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answertext` (`answertext`(255)),
  KEY `questionId` (`questionId`),
  KEY `questionnaireId` (`questionnaireId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=171 ;

--
-- Daten für Tabelle `answertoquestion`
--

INSERT INTO `answertoquestion` (`id`, `answertext`, `questionId`, `questionnaireId`, `answernumber`, `answerhash`) VALUES
(165, 'Plutka ist voll der Apple-Fanboy', 98, 4, NULL, 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(166, NULL, 87, 4, 5, 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(167, 'Modul ist voll scheiße ich hasse Apple', 98, 4, NULL, '84a516841ba77a5b4648de2cd0dfcb30ea46dbb4'),
(168, NULL, 87, 4, 3, 'b623e693ab0f20478fb22928891f8fd91f3cd368'),
(169, NULL, 86, 4, 5, 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(170, NULL, 86, 4, 1, 'b623e693ab0f20478fb22928891f8fd91f3cd368');

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
  `prio` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

--
-- Daten für Tabelle `question`
--

INSERT INTO `question` (`id`, `text`, `category`, `type`, `prio`) VALUES
(59, 'Der inhaltliche Aufbau ist logisch nachvollziehbar', 'VL', 'radio', 0),
(60, 'Ein Bezug zwischen Theorie und Praxis/Anwendung wird hergestellt', 'VL', 'radio', 0),
(61, 'Die / der Lehrende spricht verständlich(Lautstärke, Deutlichkeit)', 'VL', 'radio', 0),
(62, 'Der / die Lehrende kann Komplizierte versändlich machen', 'VL', 'radio', 0),
(63, 'Die Veranstaltung hat mein Interesse an der Thematik geweckt', 'VL', 'radio', 0),
(64, 'Zum Mitdenken und Durchdenken des Stoffes/Themas wird angeragt', 'VL', 'radio', 0),
(65, 'Die / der Lehrende wirkt vorbereitet', 'VL', 'radio', 0),
(66, 'Die Materialien zur Vorlesung sind hilfreich (Skripte, Folien, etc.)', 'VL', 'radio', 0),
(67, 'Medien (Tafel, OHP, Beamer) werden sinnvoll eingesetzt', 'VL', 'radio', 0),
(68, 'Die / der Lehrende ist kooperativ und aufgeschlossen', 'VL', 'radio', 0),
(69, 'Das Tempo des Kurses ist angemessen', 'VL', 'radio', 0),
(70, 'Der Umfang ist angemessen', 'VL', 'radio', 0),
(71, 'Der Schwierigkeitsgrad ist angemessen', 'VL', 'radio', 0),
(72, 'Außerhalb der Veranstaltung findet eine gute Betreuung statt', 'VL', 'radio', 0),
(73, 'Die / der Lehrende fördert Fragen und aktive Mitarbeit', 'VL', 'radio', 0),
(74, 'Auf Beiträge der Teilnehmer/-innen gibt es ein hilfreiches Feedback', 'VL', 'radio', 0),
(75, 'Die Prüfungsanforderungen sind transparent', 'VL', 'radio', 0),
(76, 'Ich lerne viel in der Veranstaltung', 'VL', 'radio', 0),
(77, 'Die aktive Beteiligung der Studierenden bewerte ich als sehr gut', 'VL', 'radio', 0),
(78, 'Die Ausstattung der Hörsäle ist sehr gut', 'VL', 'radio', 0),
(79, 'Der Aufwand in Stunden/Woche für Vor-/Nachbereitung beträgt', 'VL', 'text', 0),
(80, 'Ich habe X% der Vorlesungen besucht', 'VL', 'radio', 0),
(81, 'Ich gebe der Vorlesung die Gesamtnote(Noten von 1 bis 5)', 'VL', 'text', 0),
(82, 'Ich gebe diese Note weil', 'VL', 'text', 0),
(83, 'Mir hat besonders gefallen', 'VL', 'radio', 0),
(84, 'Mir hat nicht gefallen', 'VL', 'radio', 0),
(85, 'Die Laborausstattung ist sehr gut', 'PR', 'radio', 0),
(86, 'Die Unterlagen zur Vorbereitung sind hilfreich und verständlich', 'PR', 'radio', 0),
(87, 'Die Anforderungen sind transparent', 'PR', 'radio', 0),
(88, 'Der Bezug zur Vorlesung ist gegeben', 'VL', 'radio', 0),
(89, 'Die Betreuenden gehen aufgeschlossen auf meine Fragen ein', 'PR', 'radio', 0),
(90, 'Die Verfügbarkeit der Betreuenden ist gegeben', 'PR', 'radio', 0),
(91, 'Der Umfang der Versuche/Übungen ist angemessen', 'PR', 'radio', 0),
(92, 'Die selbstständige Durchführung der Versuche/Übungen wird gefördert', 'PR', 'radio', 0),
(93, 'Das Feedback ist hilfreich', 'PR', 'radio', 0),
(94, 'Der Aufwand für Vor- und Nachbereitung in Stunden beträgt insgesamt', 'PR', 'text', 0),
(95, 'Ich gebe dem Praktikum die Gesamtnote', 'PR', 'text', 0),
(96, 'Ich gebe diese Note weil', 'PR', 'text', 0),
(97, 'Mir hat besonders gefallen', 'PR', 'text', 0),
(98, 'Mir hat nicht gefallen', 'PR', 'text', 0),
(99, 'Studiengang?', 'VL', 'text', 100),
(100, 'Studiengang?', 'PR', 'text', 100),
(101, 'Semester?', 'VL', 'musel', 99),
(102, 'Semester?', 'PR', 'musel', 99);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Daten für Tabelle `questionnaire`
--

INSERT INTO `questionnaire` (`id`, `profId`, `expirationDate`, `semester`, `courseName`, `category`) VALUES
(3, 3, '2013-09-19', 'SoSe2013', '3D-Animation', 'VL'),
(4, 5, '2013-09-09', 'SoSe 2013', 'ARMA', 'PR'),
(5, 3, '2013-09-13', 'SoSe 2013', 'Verteilte Systeme', 'VL'),
(7, 3, '2013-09-13', 'SoSe 2013', 'Usability', 'PR'),
(9, 3, '2013-09-13', 'SoSe 2013', 'Usability', 'VL');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(3, 'admin', 'admin', 'admin'),
(4, 'user', 'user', 'user'),
(5, 'plutti', 'apple', 'admin');

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

--
-- Constraints der Tabelle `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD CONSTRAINT `questionnaire_ibfk_1` FOREIGN KEY (`profId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
