{\rtf1\ansi\ansicpg1252\cocoartf1187\cocoasubrtf390
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural

\f0\fs24 \cf0 -- phpMyAdmin SQL Dump\
-- version 3.5.7\
-- http://www.phpmyadmin.net\
--\
-- Host: localhost\
-- Erstellungszeit: 04. Sep 2013 um 16:11\
-- Server Version: 5.5.29\
-- PHP-Version: 5.4.10\
\
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";\
SET time_zone = "+00:00";\
\
--\
-- Datenbank: `Evaluation`\
--\
\
-- --------------------------------------------------------\
\
--\
-- Tabellenstruktur f\'fcr Tabelle `answertoquestion`\
--\
\
CREATE TABLE `answertoquestion` (\
  `id` int(12) NOT NULL AUTO_INCREMENT,\
  `questionId` int(15) NOT NULL,\
  `text` varchar(1024) COLLATE utf8_bin NOT NULL,\
  `questionnaireId` int(12) NOT NULL,\
  PRIMARY KEY (`id`)\
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;\
\
-- --------------------------------------------------------\
\
--\
-- Tabellenstruktur f\'fcr Tabelle `question`\
--\
\
CREATE TABLE `question` (\
  `id` int(12) NOT NULL AUTO_INCREMENT,\
  `text` varchar(1024) COLLATE utf8_bin NOT NULL,\
  `type` int(1) NOT NULL,\
  PRIMARY KEY (`id`)\
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;\
\
-- --------------------------------------------------------\
\
--\
-- Tabellenstruktur f\'fcr Tabelle `questionnaire`\
--\
\
CREATE TABLE `questionnaire` (\
  `id` int(12) NOT NULL AUTO_INCREMENT,\
  `profId` int(12) NOT NULL,\
  `expirationDate` date NOT NULL,\
  `courseName` varchar(256) COLLATE utf8_bin NOT NULL,\
  `type` int(1) NOT NULL,\
  PRIMARY KEY (`id`)\
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;\
}