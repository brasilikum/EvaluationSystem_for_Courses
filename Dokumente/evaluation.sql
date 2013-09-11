-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 11. Sep 2013 um 16:26
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=273 ;

--
-- Daten für Tabelle `answertoquestion`
--

INSERT INTO `answertoquestion` (`id`, `answertext`, `questionId`, `questionnaireId`, `answernumber`, `answerhash`) VALUES
(217, NULL, 59, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(218, NULL, 60, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(219, NULL, 61, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(220, NULL, 62, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(221, NULL, 63, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(222, NULL, 64, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(223, NULL, 65, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(224, NULL, 66, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(225, NULL, 67, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(226, NULL, 68, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(227, NULL, 69, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(228, NULL, 70, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(229, NULL, 71, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(230, NULL, 72, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(231, NULL, 73, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(232, NULL, 74, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(233, NULL, 75, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(234, NULL, 76, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(235, NULL, 77, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(236, NULL, 78, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(237, '12', 79, 27, NULL, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(238, NULL, 81, 27, NULL, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(239, 'huuuuu', 82, 27, NULL, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(240, NULL, 83, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(241, NULL, 84, 27, 0, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(242, NULL, 88, 27, 1, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(243, 'Medieninformatik', 1, 27, NULL, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(244, NULL, 2, 27, NULL, 'fe090197a61d5ed119dd2140160a1dcaf7e6ea10'),
(245, NULL, 59, 27, 2, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(246, NULL, 60, 27, 1, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(247, NULL, 61, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(248, NULL, 62, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(249, NULL, 63, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(250, NULL, 64, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(251, NULL, 65, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(252, NULL, 66, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(253, NULL, 67, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(254, NULL, 68, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(255, NULL, 69, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(256, NULL, 70, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(257, NULL, 71, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(258, NULL, 72, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(259, NULL, 73, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(260, NULL, 74, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(261, NULL, 75, 27, 1, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(262, NULL, 76, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(263, NULL, 77, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(264, NULL, 78, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(265, '12', 79, 27, NULL, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(266, NULL, 81, 27, NULL, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(267, 'huuuuu', 82, 27, NULL, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(268, 'huuuuu', 83, 27, NULL, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(269, 'huuuuu', 84, 27, NULL, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(270, NULL, 88, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(271, 'Medieninformatik', 1, 27, NULL, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a'),
(272, NULL, 2, 27, 0, '080f311ca33e82d5f4def3f4ff8af26f74d9db8a');

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
('b77a8e7b8b9f8cf10a8350be00a332a2559557ef', 27),
('cdc148dff455baf847529b5aaf2acd31bc55b971', 27),
('d562fc5b10ae148f881089abcea4a6866f71682b', 27),
('9f9308e18f80166ac607ddc71e4cbb374fa588fb', 28),
('d629b7f999c035f8571f5819146f2706f5293b35', 28);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

--
-- Daten für Tabelle `question`
--

INSERT INTO `question` (`id`, `text`, `category`, `rangeMin`, `rangeMax`, `rangeStep`, `type`, `prio`) VALUES
(1, 'Studiengang?', '', 0, 0, 0, 'text', 100),
(2, 'Semester?', '', 0, 0, 0, 'musel', 99),
(3, 'Ich habe X% der Vorlesungen besucht', '', 0, 0, 0, 'radio', 0),
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
(79, 'Der Aufwand in Stunden/Woche für Vor-/Nachbereitung beträgt', 'VL', 0, 0, 0, 'musel', 0),
(81, 'Ich gebe der Vorlesung die Gesamtnote(Noten von 1 bis 5)', 'VL', 0, 0, 0, 'musel', 0),
(82, 'Ich gebe diese Note weil', 'VL', 0, 0, 0, 'text', 0),
(83, 'Mir hat besonders gefallen', 'VL', 0, 0, 0, 'text', 0),
(84, 'Mir hat nicht gefallen', 'VL', 0, 0, 0, 'text', 0),
(85, 'Die Laborausstattung ist sehr gut', 'PR', 0, 0, 0, 'radio', 0),
(86, 'Die Unterlagen zur Vorbereitung sind hilfreich und verständlich', 'PR', 0, 0, 0, 'radio', 0),
(87, 'Die Anforderungen sind transparent', 'PR', 0, 0, 0, 'radio', 0),
(88, 'Der Bezug zur Vorlesung ist gegeben', 'VL', 0, 0, 0, 'radio', 0),
(89, 'Die Betreuenden gehen aufgeschlossen auf meine Fragen ein', 'PR', 0, 0, 0, 'radio', 0),
(90, 'Die Verfügbarkeit der Betreuenden ist gegeben', 'PR', 0, 0, 0, 'radio', 0),
(91, 'Der Umfang der Versuche/Übungen ist angemessen', 'PR', 0, 0, 0, 'radio', 0),
(92, 'Die selbstständige Durchführung der Versuche/Übungen wird gefördert', 'PR', 0, 0, 0, 'radio', 0),
(93, 'Das Feedback ist hilfreich', 'PR', 0, 0, 0, 'radio', 0),
(94, 'Der Aufwand für Vor- und Nachbereitung in Stunden beträgt insgesamt', 'PR', 0, 0, 0, 'musel', 0),
(95, 'Ich gebe dem Praktikum die Gesamtnote', 'PR', 0, 0, 0, 'musel', 0),
(96, 'Ich gebe diese Note weil', 'PR', 0, 0, 0, 'text', 0),
(97, 'Mir hat besonders gefallen', 'PR', 0, 0, 0, 'text', 0),
(98, 'Mir hat nicht gefallen', 'PR', 0, 0, 0, 'text', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

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
(27, 5, '2013-09-10', 'SoSe 2013', 'Apple Für Dummies', 'VL'),
(28, 5, '2013-09-13', 'SoSe 2013', 'Penis', 'PR');

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
  ADD CONSTRAINT `participant_ibfk_3` FOREIGN KEY (`questionnaireId`) REFERENCES `questionnaire` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD CONSTRAINT `questionnaire_ibfk_1` FOREIGN KEY (`profId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
