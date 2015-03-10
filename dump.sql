-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Client :  localhost:8889
-- Généré le :  Mar 10 Mars 2015 à 08:37
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

CREATE TABLE `a_holder` (
`id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `percentage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `a_paiement_type`
--

CREATE TABLE `a_paiement_type` (
`id` int(11) NOT NULL,
  `type` enum('insured','insurance','mutual') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `a_patient`
--

CREATE TABLE `a_patient` (
`id` int(11) NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type_AMO` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `clear` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `a_session`
--

CREATE TABLE `a_session` (
`id` int(11) NOT NULL,
  `holder` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type_AMO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `a_type_AMO`
--

CREATE TABLE `a_type_AMO` (
`id` int(11) NOT NULL,
  `value` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
 ADD PRIMARY KEY (`id`), ADD KEY `type_AMO` (`type_AMO`);

--
-- Index pour la table `a_session`
--
ALTER TABLE `a_session`
 ADD PRIMARY KEY (`id`), ADD KEY `type_AMO` (`type_AMO`), ADD KEY `holder` (`holder`);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `a_paiement_type`
--
ALTER TABLE `a_paiement_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `a_patient`
--
ALTER TABLE `a_patient`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `a_session`
--
ALTER TABLE `a_session`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `a_type_AMO`
--
ALTER TABLE `a_type_AMO`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `a_patient`
--
ALTER TABLE `a_patient`
ADD CONSTRAINT `patient_type_AMO` FOREIGN KEY (`type_AMO`) REFERENCES `a_type_AMO` (`id`);

--
-- Contraintes pour la table `a_session`
--
ALTER TABLE `a_session`
ADD CONSTRAINT `session_typeAMO` FOREIGN KEY (`type_AMO`) REFERENCES `a_type_AMO` (`id`),
ADD CONSTRAINT `session_holder` FOREIGN KEY (`holder`) REFERENCES `a_holder` (`id`);
