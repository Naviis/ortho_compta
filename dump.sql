-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Client :  localhost:8889
-- Généré le :  Mer 11 Mars 2015 à 16:57
-- Version du serveur :  5.5.38
-- Version de PHP :  5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `a_compta`
--

-- --------------------------------------------------------

--
-- Structure de la table `a_holder`
--

DROP TABLE IF EXISTS `a_holder`;
CREATE TABLE `a_holder` (
`id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `percentage` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `a_holder`
--

INSERT INTO `a_holder` (`id`, `name`, `percentage`) VALUES
(1, 'Mélanie', 22),
(2, 'Suzanne', 21);

-- --------------------------------------------------------

--
-- Structure de la table `a_paiement_type`
--

DROP TABLE IF EXISTS `a_paiement_type`;
CREATE TABLE `a_paiement_type` (
`id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `a_paiement_type`
--

INSERT INTO `a_paiement_type` (`id`, `type`) VALUES
(2, 'Assuré'),
(3, 'Caisse'),
(4, 'Mutuelle');

-- --------------------------------------------------------

--
-- Structure de la table `a_patient`
--

DROP TABLE IF EXISTS `a_patient`;
CREATE TABLE `a_patient` (
`id` int(11) NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type_AMO` int(11) NOT NULL,
  `holder` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `bills` text COLLATE utf8_unicode_ci NOT NULL,
  `clear` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Contenu de la table `a_patient`
--

INSERT INTO `a_patient` (`id`, `lastname`, `firstname`, `type_AMO`, `holder`, `note`, `bills`, `clear`) VALUES
(4, 'Doe', 'John', 1, 1, 'Test', '', 0),
(5, 'lepere', 'noel', 2, 1, '', '200', 0);

-- --------------------------------------------------------

--
-- Structure de la table `a_session`
--

DROP TABLE IF EXISTS `a_session`;
CREATE TABLE `a_session` (
`id` int(11) NOT NULL,
  `holder` int(11) NOT NULL,
  `patient` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type_AMO` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `a_session`
--

INSERT INTO `a_session` (`id`, `holder`, `patient`, `date`, `type_AMO`) VALUES
(2, 1, 4, '2015-03-11 00:00:00', 1),
(3, 2, 4, '2015-03-09 00:00:00', 1),
(4, 1, 5, '2015-03-20 00:00:00', 2);

-- --------------------------------------------------------

--
-- Structure de la table `a_session_paiement`
--

DROP TABLE IF EXISTS `a_session_paiement`;
CREATE TABLE `a_session_paiement` (
`id` int(11) NOT NULL,
  `session` int(11) NOT NULL,
  `type_paiement` int(11) NOT NULL,
  `value` float NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `a_session_paiement`
--

INSERT INTO `a_session_paiement` (`id`, `session`, `type_paiement`, `value`) VALUES
(1, 2, 3, 10),
(2, 2, 4, 30);

-- --------------------------------------------------------

--
-- Structure de la table `a_type_AMO`
--

DROP TABLE IF EXISTS `a_type_AMO`;
CREATE TABLE `a_type_AMO` (
`id` int(11) NOT NULL,
  `value` float NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `a_type_AMO`
--

INSERT INTO `a_type_AMO` (`id`, `value`) VALUES
(1, 12.1),
(2, 10.1),
(3, 24);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `a_holder`
--
ALTER TABLE `a_holder`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `a_paiement_type`
--
ALTER TABLE `a_paiement_type`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `a_patient`
--
ALTER TABLE `a_patient`
 ADD PRIMARY KEY (`id`), ADD KEY `type_AMO` (`type_AMO`), ADD KEY `holder` (`holder`);

--
-- Index pour la table `a_session`
--
ALTER TABLE `a_session`
 ADD PRIMARY KEY (`id`), ADD KEY `type_AMO` (`type_AMO`), ADD KEY `holder` (`holder`), ADD KEY `patient` (`patient`);

--
-- Index pour la table `a_session_paiement`
--
ALTER TABLE `a_session_paiement`
 ADD PRIMARY KEY (`id`), ADD KEY `session` (`session`), ADD KEY `type_paiement` (`type_paiement`);

--
-- Index pour la table `a_type_AMO`
--
ALTER TABLE `a_type_AMO`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `a_holder`
--
ALTER TABLE `a_holder`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `a_paiement_type`
--
ALTER TABLE `a_paiement_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `a_patient`
--
ALTER TABLE `a_patient`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `a_session`
--
ALTER TABLE `a_session`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `a_session_paiement`
--
ALTER TABLE `a_session_paiement`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `a_type_AMO`
--
ALTER TABLE `a_type_AMO`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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

--
-- Contraintes pour la table `a_session_paiement`
--
ALTER TABLE `a_session_paiement`
ADD CONSTRAINT `a_jpaiementsession_paiement` FOREIGN KEY (`type_paiement`) REFERENCES `a_paiement_type` (`id`),
ADD CONSTRAINT `a_jpaiementsession_session` FOREIGN KEY (`session`) REFERENCES `a_session` (`id`);
