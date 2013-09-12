-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Sep 2013 um 11:19
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

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question`
--

CREATE TABLE IF NOT EXISTS `question` (
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
(1, 'Studiengang?', '', 0, 0, 0, 'text', 100),
(2, 'Semester?', '', 1, 20, 1, 'musel', 99),
(3, 'Ich habe X% der Vorlesungen besucht', '', 0, 100, 5, 'musel', 0),
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
(94, 'Der Aufwand für Vor- und Nachbereitung in Stunden beträgt insgesamt', 'PR', 0, 50, 1, 'musel', 0),
(95, 'Ich gebe dem Praktikum die Gesamtnote', 'PR', 1, 5, 0.5, 'musel', 0),
(96, 'Ich gebe diese Note weil', 'PR', 0, 0, 0, 'text', 0),
(97, 'Mir hat besonders gefallen', 'PR', 0, 0, 0, 'text', 0),
(98, 'Mir hat nicht gefallen', 'PR', 0, 0, 0, 'text', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
