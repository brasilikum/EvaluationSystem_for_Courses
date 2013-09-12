-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 12. Sep 2013 um 18:10
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
  KEY `questionnaireId` (`questionnaireId`),
  KEY `answerhash` (`answerhash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=31 ;

--
-- Daten für Tabelle `answertoquestion`
--

INSERT INTO `answertoquestion` (`id`, `answertext`, `questionId`, `questionnaireId`, `answernumber`, `answerhash`) VALUES
(1, 'Hipsterstudiengang', 4, 32, NULL, 'd312654c71c8332f3435ee0102809355e78863df'),
(2, NULL, 5, 32, 13, 'd312654c71c8332f3435ee0102809355e78863df'),
(3, NULL, 85, 32, 2, 'd312654c71c8332f3435ee0102809355e78863df'),
(4, NULL, 86, 32, 4, 'd312654c71c8332f3435ee0102809355e78863df'),
(5, NULL, 87, 32, 3, 'd312654c71c8332f3435ee0102809355e78863df'),
(6, NULL, 89, 32, 3, 'd312654c71c8332f3435ee0102809355e78863df'),
(7, NULL, 90, 32, 4, 'd312654c71c8332f3435ee0102809355e78863df'),
(8, NULL, 91, 32, 3, 'd312654c71c8332f3435ee0102809355e78863df'),
(9, NULL, 92, 32, 4, 'd312654c71c8332f3435ee0102809355e78863df'),
(10, NULL, 93, 32, 4, 'd312654c71c8332f3435ee0102809355e78863df'),
(11, NULL, 94, 32, 8, 'd312654c71c8332f3435ee0102809355e78863df'),
(12, NULL, 95, 32, 4, 'd312654c71c8332f3435ee0102809355e78863df'),
(13, 'Ich ein hipster bin', 96, 32, NULL, 'd312654c71c8332f3435ee0102809355e78863df'),
(14, 'Yolo', 97, 32, NULL, 'd312654c71c8332f3435ee0102809355e78863df'),
(15, 'Deine mudda', 98, 32, NULL, 'd312654c71c8332f3435ee0102809355e78863df'),
(16, 'Medieninformatik', 4, 32, NULL, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(17, NULL, 5, 32, 7, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(18, NULL, 85, 32, 5, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(19, NULL, 86, 32, 3, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(20, NULL, 87, 32, 1, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(21, NULL, 89, 32, 3, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(22, NULL, 90, 32, 2, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(23, NULL, 91, 32, 4, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(24, NULL, 92, 32, 3, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(25, NULL, 93, 32, 0, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(26, NULL, 94, 32, 5, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(27, NULL, 95, 32, 2, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(28, 'jjjjjuuuuuuuuuuusa', 96, 32, NULL, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(29, 'hahhahaha', 97, 32, NULL, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13'),
(30, 'plutti', 98, 32, NULL, '7df99b9fd370f89629aa7e26bbb28ff5cbd10d13');

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
('a23595d43756eca68308112402a30394656db474', 21),
('27a1fb282f93a832b106f85bd268644f399fe700', 22),
('96a617ac3c8a06a47f40220726b07f22b05a4919', 22),
('4f8c785d82ce6cddc6a25e9d8d858c3fc00514bc', 23),
('dd98f89bf9100367956e6293a65e98a104020e62', 23),
('01dc7215e0da8bab9583b052686377fd4a318cd6', 24),
('3fc9ff86751934466f053ffcb99a46e469bc39a3', 24),
('047a9d26b99a75a0e16a34022fd84f5f65fda0ee', 25),
('e7a4bd0a2d8fac9ecd624d9dd4b48d4c28b94fc8', 26),
('5c2099eb1e768389a36a3a7db54e5bab9321873b', 31),
('913bf39dc06572ae6105e9107f0fdce2768ef163', 31),
('e1b73cf6335640cbb1ada21f5ae786433a348d75', 32);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question`
--

CREATE TABLE `question` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `text` varchar(1024) NOT NULL,
  `category` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'VL',
  `rangeMin` float NOT NULL,
  `rangeMax` float NOT NULL,
  `rangeStep` float NOT NULL,
  `type` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'radio',
  `prio` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=99 ;

--
-- Daten für Tabelle `question`
--

INSERT INTO `question` (`id`, `text`, `category`, `rangeMin`, `rangeMax`, `rangeStep`, `type`, `prio`) VALUES
(1, 'Studiengang:', 'VL', 0, 0, 0, 'text', 100),
(2, 'Semester:', 'VL', 1, 20, 1, 'musel', 99),
(3, 'Ich habe X% der Vorlesungen besucht', 'VL', 0, 100, 5, 'musel', 0),
(4, 'Studiengang:', 'PR', 0, 0, 0, 'text', 100),
(5, 'Semester:', 'PR', 1, 20, 1, 'musel', 99),
(59, 'Der inhaltliche Aufbau ist logisch nachvollziehbar', 'VL', 0, 0, 0, 'radio', 0),
(60, 'Ein Bezug zwischen Theorie und Praxis/Anwendung wird hergestellt', 'VL', 0, 0, 0, 'radio', 0),
(61, 'Die / der Lehrende spricht verständlich(Lautstärke, Deutlichkeit)', 'VL', 0, 0, 0, 'radio', 0),
(62, 'Der / die Lehrende kann Komplizierte versändlich machen', 'VL', 0, 0, 0, 'radio', 0),
(63, 'Die Veranstaltung hat mein Interesse an der Thematik geweckt', 'VL', 0, 0, 0, 'radio', 0),
(64, 'Zum Mitdenken und Durchdenken des Stoffes/Themas wird angeragt', 'VL', 0, 0, 0, 'radio', 0),
(65, 'Die / der Lehrende wirkt vorbereitet', 'VL', 0, 0, 0, 'radio', 0),
(66, 'Die Materialien zur Vorlesung sind hilfreich (Skripte, Folien, etc.)', 'VL', 0, 0, 0, 'radio', 0),
(67, 'Medien (Tafel, OHP, Beamer) werden sinnvoll eingesetzt', 'VL', 0, 0, 0, 'radio', 0),
(68, 'Die / der Lehrende ist kooperativ und aufgeschlossen', 'VL', 0, 0, 0, 'radio', 0),
(69, 'Das Tempo des Kurses ist angemessen', 'VL', 0, 0, 0, 'radio', 0),
(70, 'Der Umfang ist angemessen', 'VL', 0, 0, 0, 'radio', 0),
(71, 'Der Schwierigkeitsgrad ist angemessen', 'VL', 0, 0, 0, 'radio', 0),
(72, 'Außerhalb der Veranstaltung findet eine gute Betreuung statt', 'VL', 0, 0, 0, 'radio', 0),
(73, 'Die / der Lehrende fördert Fragen und aktive Mitarbeit', 'VL', 0, 0, 0, 'radio', 0),
(74, 'Auf Beiträge der Teilnehmer/-innen gibt es ein hilfreiches Feedback', 'VL', 0, 0, 0, 'radio', 0),
(75, 'Die Prüfungsanforderungen sind transparent', 'VL', 0, 0, 0, 'radio', 0),
(76, 'Ich lerne viel in der Veranstaltung', 'VL', 0, 0, 0, 'radio', 0),
(77, 'Die aktive Beteiligung der Studierenden bewerte ich als sehr gut', 'VL', 0, 0, 0, 'radio', 0),
(78, 'Die Ausstattung der Hörsäle ist sehr gut', 'VL', 0, 0, 0, 'radio', 0),
(79, 'Der Aufwand in Stunden/Woche für Vor-/Nachbereitung beträgt', 'VL', 0, 50, 1, 'musel', 0),
(81, 'Ich gebe der Vorlesung die Gesamtnote(Noten von 1 bis 5)', 'VL', 1, 5, 0.5, 'musel', 0),
(82, 'Ich gebe diese Note weil', 'VL', 0, 0, 0, 'tarea', 0),
(83, 'Mir hat besonders gefallen', 'VL', 0, 0, 0, 'tarea', 0),
(84, 'Mir hat nicht gefallen', 'VL', 0, 0, 0, 'tarea', 0),
(85, 'Die Laborausstattung ist sehr gut', 'PR', 0, 0, 0, 'radio', 0),
(86, 'Die Unterlagen zur Vorbereitung sind hilfreich und verständlich', 'PR', 0, 0, 0, 'radio', 0),
(87, 'Die Anforderungen sind transparent', 'PR', 0, 0, 0, 'radio', 0),
(88, 'Der Bezug zur Vorlesung ist gegeben', 'VL', 0, 0, 0, 'radio', 0),
(89, 'Die Betreuenden gehen aufgeschlossen auf meine Fragen ein', 'PR', 0, 0, 0, 'radio', 0),
(90, 'Die Verfügbarkeit der Betreuenden ist gegeben', 'PR', 0, 0, 0, 'radio', 0),
(91, 'Der Umfang der Versuche/Übungen ist angemessen', 'PR', 0, 0, 0, 'radio', 0),
(92, 'Die selbstständige Durchführung der Versuche/Übungen wird gefördert', 'PR', 0, 0, 0, 'radio', 0),
(93, 'Das Feedback ist hilfreich', 'PR', 0, 0, 0, 'radio', 0),
(94, 'Der Aufwand für Vor- und Nachbereitung in Stunden beträgt insgesamt', 'PR', 0, 50, 1, 'musel', 0),
(95, 'Ich gebe dem Praktikum die Gesamtnote', 'PR', 1, 5, 0.5, 'musel', 0),
(96, 'Ich gebe diese Note weil', 'PR', 0, 0, 0, 'tarea', 0),
(97, 'Mir hat besonders gefallen', 'PR', 0, 0, 0, 'tarea', 0),
(98, 'Mir hat nicht gefallen', 'PR', 0, 0, 0, 'tarea', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Daten für Tabelle `questionnaire`
--

INSERT INTO `questionnaire` (`id`, `profId`, `expirationDate`, `semester`, `courseName`, `category`) VALUES
(21, 3, '2013-09-13', 'SoSe 2013', 'ARMA', 'PR'),
(22, 3, '2013-09-13', 'SoSe 2013', 'Huibuh', 'PR'),
(23, 3, '2013-09-13', 'SoSe 2013', 'ARMA', 'VL'),
(24, 3, '2013-09-13', 'SoSe 2013', 'RMA', 'VL'),
(25, 5, '2013-09-13', 'SoSe 2013', 'ARMA', 'PR'),
(26, 5, '2013-09-13', 'SoSe 2013', 'AppleFanboyism', 'PR'),
(31, 3, '2013-09-13', 'SoSe 2013', 'Test mit GEorg ', 'PR'),
(32, 5, '2013-09-11', 'SoSe 2013', 'Finaler Test', 'PR');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `submitters`
--

CREATE TABLE `submitters` (
  `answerhash` varchar(52) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `questionnaireId` int(12) NOT NULL,
  PRIMARY KEY (`answerhash`),
  KEY `questionnaireId` (`questionnaireId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `submitters`
--

INSERT INTO `submitters` (`answerhash`, `questionnaireId`) VALUES
('7df99b9fd370f89629aa7e26bbb28ff5cbd10d13', 32),
('d312654c71c8332f3435ee0102809355e78863df', 32);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) COLLATE utf8_bin NOT NULL,
  `password` varchar(256) COLLATE utf8_bin NOT NULL,
  `role` varchar(12) COLLATE utf8_bin NOT NULL,
  `fullName` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fullName` (`fullName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`, `fullName`) VALUES
(3, 'admin', 'admin', 'admin', 'Herr Prof. Von Und Zu'),
(4, 'user', 'user', 'user', 'Studiensekretariat'),
(5, 'plutti', 'apple', 'admin', 'Björn Plutka'),
(6, 'juergi', 'mathe', 'admin', 'Dr. Jürgen Kampmann');

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
  ADD CONSTRAINT `participant_ibfk_3` FOREIGN KEY (`questionnaireId`) REFERENCES `questionnaire` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD CONSTRAINT `questionnaire_ibfk_1` FOREIGN KEY (`profId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `submitters`
--
ALTER TABLE `submitters`
  ADD CONSTRAINT `submitters_ibfk_1` FOREIGN KEY (`questionnaireId`) REFERENCES `questionnaire` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `submitters_ibfk_2` FOREIGN KEY (`answerhash`) REFERENCES `answertoquestion` (`answerhash`) ON DELETE CASCADE ON UPDATE CASCADE;
