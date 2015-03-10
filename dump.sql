-- phpMyAdmin SQL Dump
-- version 4.0.6
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 10 Mars 2015 à 22:52
-- Version du serveur: 5.5.33
-- Version de PHP: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données: `a_compta`
--

-- --------------------------------------------------------

--
-- Structure de la table `a_holder`
--

DROP TABLE IF EXISTS `a_holder`;
CREATE TABLE `a_holder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `percentage` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `a_holder`
--

INSERT INTO `a_holder` (`id`, `name`, `percentage`) VALUES
(1, 'Mélanie', 22);

-- --------------------------------------------------------

--
-- Structure de la table `a_paiement_type`
--

DROP TABLE IF EXISTS `a_paiement_type`;
CREATE TABLE `a_paiement_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('insured','insurance','mutual') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `a_patient`
--

DROP TABLE IF EXISTS `a_patient`;
CREATE TABLE `a_patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type_AMO` int(11) NOT NULL,
  `holder` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `bills` text COLLATE utf8_unicode_ci NOT NULL,
  `clear` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_AMO` (`type_AMO`),
  KEY `holder` (`holder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Contenu de la table `a_patient`
--

INSERT INTO `a_patient` (`id`, `lastname`, `firstname`, `type_AMO`, `holder`, `note`, `bills`, `clear`) VALUES
(4, 'Doe', 'John', 1, 1, 'Test', '', 1),
(5, 'lepere', 'noel', 2, 1, '', '200', 0);

-- --------------------------------------------------------

--
-- Structure de la table `a_session`
--

DROP TABLE IF EXISTS `a_session`;
CREATE TABLE `a_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `holder` int(11) NOT NULL,
  `patient` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type_AMO` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_AMO` (`type_AMO`),
  KEY `holder` (`holder`),
  KEY `patient` (`patient`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `a_session`
--

INSERT INTO `a_session` (`id`, `holder`, `patient`, `date`, `type_AMO`) VALUES
(2, 1, 4, '2015-03-11 00:00:00', 1),
(3, 1, 4, '2015-03-09 00:00:00', 1),
(4, 1, 5, '2015-03-20 00:00:00', 2);

-- --------------------------------------------------------

--
-- Structure de la table `a_type_AMO`
--

DROP TABLE IF EXISTS `a_type_AMO`;
CREATE TABLE `a_type_AMO` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `a_type_AMO`
--

INSERT INTO `a_type_AMO` (`id`, `value`) VALUES
(1, 12.1),
(2, 10.1),
(3, 24);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `a_patient`
--
ALTER TABLE `a_patient`
  ADD CONSTRAINT `patient_holder` FOREIGN KEY (`holder`) REFERENCES `a_holder` (`id`),
  ADD CONSTRAINT `patient_type_AMO` FOREIGN KEY (`type_AMO`) REFERENCES `a_type_AMO` (`id`);

--
-- Contraintes pour la table `a_session`
--
ALTER TABLE `a_session`
  ADD CONSTRAINT `session_holder` FOREIGN KEY (`holder`) REFERENCES `a_holder` (`id`),
  ADD CONSTRAINT `session_patient` FOREIGN KEY (`patient`) REFERENCES `a_patient` (`id`),
  ADD CONSTRAINT `session_typeAMO` FOREIGN KEY (`type_AMO`) REFERENCES `a_type_AMO` (`id`);
