-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: mysql-saisiedevosfrais.alwaysdata.net
-- Generation Time: Apr 02, 2021 at 11:00 AM
-- Server version: 10.5.8-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saisiedevosfrais_applicompatablemvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `comptable`
--

CREATE TABLE `comptable` (
  `id` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comptable`
--

INSERT INTO `comptable` (`id`) VALUES
('co1'),
('co2'),
('co3');

-- --------------------------------------------------------

--
-- Table structure for table `etat`
--

CREATE TABLE `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('RB', 'Remboursée'),
('VA', 'Validée et mise en paiement');

-- --------------------------------------------------------

--
-- Table structure for table `fichefrais`
--

CREATE TABLE `fichefrais` (
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbjustificatifs` int(11) DEFAULT NULL,
  `montantvalide` decimal(10,2) DEFAULT NULL,
  `datemodif` date DEFAULT NULL,
  `idetat` char(2) DEFAULT 'CR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fraisforfait`
--

CREATE TABLE `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', '110.00'),
('KM', 'Frais Kilométrique', '0.52'),
('NUI', 'Nuitée Hôtel', '80.00'),
('REP', 'Repas Restaurant', '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `lignefraisforfait`
--

CREATE TABLE `lignefraisforfait` (
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idfraisforfait` char(3) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lignefraishorsforfait`
--

CREATE TABLE `lignefraishorsforfait` (
  `id` int(11) NOT NULL,
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `puissancevehicule`
--

CREATE TABLE `puissancevehicule` (
  `idpuissancevehicule` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `puissancevehicule`
--

INSERT INTO `puissancevehicule` (`idpuissancevehicule`, `libelle`, `montant`) VALUES
('4D', '4CV Diesel', '0.52'),
('4E', '4CV Essence', '0.62'),
('56D', '5/6CV Diesel', '0.58'),
('56E', '5/6CV Essence', '0.67');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(252) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateembauche` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateembauche`) VALUES
('a131', 'Villechalane', 'Louis', 'lvillachane', '13dbdf7d3600e727d522707cb533f868367be729cdfc4032e6d06b8e6b19f911f63cf661fe56ad11169092488d210438e816f4f79078c295718df6262b290cd8', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21'),
('a17', 'Andre', 'David', 'dandre', '93c3d3d7ca890c6f3fd3fe5e270e9b0cde3aa69523208976b2e95fa382d7f43a4cf97a2a7bd10e88214065b27159cc0a0f97fedf53d800a5b9e276e28e17b4c2', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23'),
('a55', 'Bedos', 'Christian', 'cbedos', '0ef320534cc5e92a107325f6a3150cf641aaeb0b1e7b17ac3f89f1ef5c5238028b85b5cb3a2bb48e34d035735c2157a81b3eed31c7ef2e61f228c461975d700a', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12'),
('a93', 'Tusseau', 'Louis', 'ltusseau', 'd3e4c8eb9180f86ef1627d46a8ec5a975caf70aa6135fb196a1a2aa56ebc246b42075fca83b61357afbc92f163bb0b55da6c2e9d59e19061fe59c6c4166d0f8d', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01'),
('b13', 'Bentot', 'Pascal', 'pbentot', '534a091cdb6432e844ef547bc1d87b5a99d5ab11a2a701e1db9ff80b4473869efb486c4f40caf350617d3c917c744df42e169454b04e1329e52126da71c7a6ed', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09'),
('b16', 'Bioret', 'Luc', 'lbioret', '6ca809e76a3830026782b6b0de6fdc8c4f24990a2cd95c5bbfe189256f7db3650d8dec40a846cfbe157cc9a228d15b5ba1a0b5cbd43850a9f47b1a9e0c0f2a06', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11'),
('b19', 'Bunisset', 'Francis', 'fbunisset', '1f3eab5ab9fc9945bf8e0e80ca93975f5f5d985257a24455290eaf70182cb8ce9fdd5e686e253d40fc31acbef27b7dc47c40f32456de8549ac642b0bee660ef5', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21'),
('b25', 'Bunisset', 'Denise', 'dbunisset', '68ee1cf8a33c8f052ad57cafa14026b22e6c3d9dc1394782efaea901af7dcae44d8bc8f144ff8339713099c11953e7da087619a5e43d278d84c03b46d589f9c8', '23 rue Manin', '75019', 'paris', '2010-12-05'),
('b28', 'Cacheux', 'Bernard', 'bcacheux', 'c27bce94a964281439ea6a17ab46ce6e0670da3877c93df0cd5e14ebe0aef3bce66c3bea7257f3b27d034e398a7089888e3b255f4a49caaccff980879ad4c1fd', '114 rue Blanche', '75017', 'Paris', '2009-11-12'),
('b34', 'Cadic', 'Eric', 'ecadic', 'e459545a65f978f12eaff36ad96f475ea9e2d497ab1c29a4fdccc8c889b996bfd20c91c9c7296f4b0532feabae0fd25068fa253fad2fd8e03ab9b5b637a2edef', '123 avenue de la République', '75011', 'Paris', '2008-09-23'),
('b4', 'Charoze', 'Catherine', 'ccharoze', '9fce860fede4fb4441e65ae1957675bea6d00f74533f10fd47e493dddaa2da2ab29ef409538a047459e9997c378b7d2694dda5d5d68791ef074f8f66b337ed9b', '100 rue Petit', '75019', 'Paris', '2005-11-12'),
('b50', 'Clepkens', 'Christophe', 'cclepkens', 'b8864461865eaab5b66ee5ad083a8a4620beed4e20cfd7e4ee76bc10677610893fbfe64c63f48af01fb5bb2f6d0690a70efef72879a9a0192310c60e48f09897', '12 allée des Anges', '93230', 'Romainville', '2003-08-11'),
('b59', 'Cottin', 'Vincenne', 'vcottin', '79d9b8bbab7161899cb824d26f5063ee2589e0d3ded30920df42466e9f0e8e8dfc5facd6f5720663a15732bd9a61dad453943d34144ca5627f9729664c3e7f20', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18'),
('c14', 'Daburon', 'François', 'fdaburon', '6352987726652d06b4cebc40ced3eead997a1adaffee47dce53c2df01970ed900824ee05f72a6b9e314e053f7cd1e7763ebe962b586641d059ac95a32ff175a7', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11'),
('c3', 'De', 'Philippe', 'pde', '62d8e965a3cceb4ded0f95b1158ded7b6fa3ec7c654f1ae322c8bea78f7ccd46b524f46c1f61242b3fd12bb7fdc5959a8ed194feec2ac1a2fbb809e74bb45f3a', '13 rue Barthes', '94000', 'Créteil', '2010-12-14'),
('c54', 'Debelle', 'Michel', 'mdebelle', 'f73a98ab9a0561e7d898969e93f0f27e77fb34e91821b21227f3aad8e01278efe07d5f32ebd4bc5601277ea8c6b22deb27009b59e11306523eb794ffa2981aa7', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23'),
('co1', 'House', 'Amy', 'ahouse', 'eba5ae9a636a3848a6673b1a3b4b946ccc66db916a869784f3bda409776705dc643cd89b142c0b65399b788db3e3b68aa8ff1f747757ca23940d857dd3bf2c36', '3 Grand Place', '13015', 'Marseille', '1999-11-01'),
('co2', 'Time', 'Jason', 'jtime', '433e62b4785015e7a0860504b3bb53e917c109962f1c898b39a6c89f67ad28c80b358d7898cbe67ab1eb2656c8307cc6661bb17936c40bfbf8df794a813013c9', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10'),
('co3', 'Grand', 'Jeanne', 'jgrand', '5556dac0cf44f6b333d3132c0de0aff72d6836b41eea51d27357a505a6e11ac0a71cd4bdff7e824784347c497481884e7cf9da0616472f8d7e118681b4ec46bf', '4 route de la mer', '13012', 'Allauh', '1998-10-01'),
('d13', 'Debelle', 'Jeanne', 'jdebelle', '8bba249274c8439780fd90f436ca62100979116e598663c24642d0a371ab71970032c3fa0b9da1573db80f867fd00c7b463b16c64d9819f022b656041aaf7fd6', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11'),
('d51', 'Debroise', 'Michel', 'mdebroise', 'dfe7b593ddb72898a0bbf326ef249efbfb1e278a04716d07f1e5baa23732a55313c5169e2c0a760c981d56cb87e65855beeb8d595704f4886612dc86e55edb11', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17'),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', 'c95dd9f05de37f54df7f202a0c0f5a39552eb72661b7da84b9a3e782216ae1d1788188e5ca83dcc1d16b743588812fccc3d69e6a9adfcd7836a6b9c907770cd2', '14 Place d Arc', '45000', 'Orléans', '2005-11-12'),
('e24', 'Desnost', 'Pierre', 'pdesnost', '3d078e614b8ea8c6e22de1fa797a1a44cf697687e45e27d81f24a15a7a782db4965f315b37f066a1a6a405930e2ff8363ba9efa7884f727784144df0b34f958f', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05'),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '707736ce79cbfaab003254677f4fae59c6e83df5ea81851d503b622b6a9ed0fb79d13d6ea3136a8de5325734798b8c216030ddf1c0a2268abf2da3fa6bb752ed', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01'),
('e49', 'Duncombe', 'Claude', 'cduncombe', '4d62f09c266b7c81539a658af42daebeaf3701d9a8922c982d3711e97de2b897a988488726001cb5772d3b5e42b93f03882ef0e8d0a5a18cc200a5559bac369e', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10'),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', 'a309a05d7051be5dab6933292007ec6c9012a16682fe30a1c1b03726ba1811cc9b8f63651315d073eff66cfad821bb4d1c56c89597e8058f2238ee7204a3f902', '25 place de la gare', '23200', 'Gueret', '1995-09-01'),
('e52', 'Eynde', 'Valérie', 'veynde', 'c58437bafd323a6da6de8780bc9fc088c457231062fca2b1b4333eec07981166f9ea9b3d09f4e5fa6f8d6354efe85b39a07f86fb153721f5807adbadd9958ec2', '3 Grand Place', '13015', 'Marseille', '1999-11-01'),
('f21', 'Finck', 'Jacques', 'jfinck', '9edf00a05e0aeaf318ea0dcc14d631056a88d9c2de3420b6ea439395ddc24057640390c5135a9a31964f0b6c5eb54ee89869df2af8a6bd16392ba7a1edef39a3', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10'),
('f39', 'Frémont', 'Fernande', 'ffremont', '32061e7c2ef0dde665e7b6a70722a1a93225a33ac4928000e0e940198c823859332bc906494065745e5216b387bd0224ae746248d7a5b8a284ced8df85e8f84f', '4 route de la mer', '13012', 'Allauh', '1998-10-01'),
('f4', 'Gest', 'Alain', 'agest', '889fe2177c79378eaa9b57f8a62a6e5afc95b10178598bcb3bbfd39aedaa2d49007ee2165d29486d9e5b8443e1b1c8d884982a630a68e0d4f081b86c8e4b2bcf', '30 avenue de la mer', '13025', 'Berre', '1985-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `visiteur`
--

CREATE TABLE `visiteur` (
  `id` char(4) NOT NULL,
  `idpuissancevehicule` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visiteur`
--

INSERT INTO `visiteur` (`id`, `idpuissancevehicule`) VALUES
('a131', '4D'),
('a17', '4D'),
('a55', '4D'),
('a93', '4D'),
('b13', '4D'),
('b16', '4D'),
('b25', '4D'),
('b28', '4D'),
('b34', '4D'),
('b4', '4D'),
('b50', '4D'),
('c14', '4D'),
('c3', '4D'),
('c54', '4D'),
('d13', '4D'),
('d51', '4D'),
('e22', '4D'),
('e24', '4D'),
('e39', '4D'),
('e49', '4D'),
('e5', '4D'),
('e52', '4D'),
('f21', '4D'),
('f39', '4D'),
('f4', '4D'),
('b19', '56D'),
('b59', '56D');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comptable`
--
ALTER TABLE `comptable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD PRIMARY KEY (`idvisiteur`,`mois`),
  ADD KEY `idetat` (`idetat`);

--
-- Indexes for table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD PRIMARY KEY (`idvisiteur`,`mois`,`idfraisforfait`),
  ADD KEY `idfraisforfait` (`idfraisforfait`);

--
-- Indexes for table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idvisiteur` (`idvisiteur`,`mois`);

--
-- Indexes for table `puissancevehicule`
--
ALTER TABLE `puissancevehicule`
  ADD PRIMARY KEY (`idpuissancevehicule`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idpuissancevehicule` (`idpuissancevehicule`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comptable`
--
ALTER TABLE `comptable`
  ADD CONSTRAINT `comptable_ibfk_1` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`);

--
-- Constraints for table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idetat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idvisiteur`) REFERENCES `visiteur` (`id`);

--
-- Constraints for table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idvisiteur`,`mois`) REFERENCES `fichefrais` (`idvisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idfraisforfait`) REFERENCES `fraisforfait` (`id`);

--
-- Constraints for table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idvisiteur`,`mois`) REFERENCES `fichefrais` (`idvisiteur`, `mois`);

--
-- Constraints for table `visiteur`
--
ALTER TABLE `visiteur`
  ADD CONSTRAINT `visiteur_ibfk_1` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `visiteur_ibfk_2` FOREIGN KEY (`idpuissancevehicule`) REFERENCES `puissancevehicule` (`idpuissancevehicule`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
