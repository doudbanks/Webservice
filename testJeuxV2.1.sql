-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 19 Mai 2015 à 09:35
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mydb`;

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE IF NOT EXISTS `auteur` (
  `idAuteur` int(11) NOT NULL AUTO_INCREMENT,
  `Fonction` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAuteur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`idAuteur`, `Fonction`, `Description`) VALUES
(1, 'testeur1', 'description testeur 1'),
(2, 'testeur2', 'description testeur 2');

-- --------------------------------------------------------

--
-- Structure de la table `bloc`
--

CREATE TABLE IF NOT EXISTS `bloc` (
  `idBloc` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) DEFAULT NULL,
  `Titre` varchar(50) DEFAULT NULL,
  `Content` varchar(500) DEFAULT NULL,
  `idTest` int(11) NOT NULL,
  PRIMARY KEY (`idBloc`),
  KEY `fk_Bloc_Test1_idx` (`idTest`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `bloc`
--

INSERT INTO `bloc` (`idBloc`, `Type`, `Titre`, `Content`, `idTest`) VALUES
(1, 'pppp', 'oooo', 'uuuuu', 1),
(2, 'ttt', 'nnnn', 'tttt', 2);

-- --------------------------------------------------------

--
-- Structure de la table `developpeur`
--

CREATE TABLE IF NOT EXISTS `developpeur` (
  `idDeveloppeur` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `idInformation` int(11) NOT NULL,
  PRIMARY KEY (`idDeveloppeur`),
  KEY `fk_Developpeur_Information1_idx` (`idInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `developpeur`
--

INSERT INTO `developpeur` (`idDeveloppeur`, `Nom`, `idInformation`) VALUES
(1, 'Squaresoft', 1),
(2, 'sony', 2);

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

CREATE TABLE IF NOT EXISTS `editeur` (
  `idEditeur` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) DEFAULT NULL,
  `idInformation` int(11) NOT NULL,
  PRIMARY KEY (`idEditeur`),
  KEY `fk_Editeur_Information1_idx` (`idInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `editeur`
--

INSERT INTO `editeur` (`idEditeur`, `Nom`, `idInformation`) VALUES
(1, '>Sony', 1),
(2, 'toto', 2);

-- --------------------------------------------------------

--
-- Structure de la table `entete`
--

CREATE TABLE IF NOT EXISTS `entete` (
  `idEntete` int(11) NOT NULL AUTO_INCREMENT,
  `idAuteur` int(11) NOT NULL,
  `idImage` int(11) NOT NULL,
  `Lien` varchar(500) DEFAULT NULL,
  `Titre` varchar(100) DEFAULT NULL,
  `Resume` longtext,
  PRIMARY KEY (`idEntete`),
  KEY `fk_Entete_Image1_idx` (`idImage`),
  KEY `fk_Entete_Auteur1_idx` (`idAuteur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `entete`
--

INSERT INTO `entete` (`idEntete`, `idAuteur`, `idImage`, `Lien`, `Titre`, `Resume`) VALUES
(1, 1, 1, 'uyigkugiug', 'titre1', 'lorem ipsum'),
(2, 2, 2, 'qfq', 'titre2', 'lorem ipsum');

-- --------------------------------------------------------

--
-- Structure de la table `genres`
--

CREATE TABLE IF NOT EXISTS `genres` (
  `idGenres` int(11) NOT NULL AUTO_INCREMENT,
  `idInformation` int(11) NOT NULL,
  `Nom` enum('MMORPG','Role','FPS') DEFAULT NULL,
  PRIMARY KEY (`idGenres`),
  KEY `fk_Genres_Information1_idx` (`idInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `genres`
--

INSERT INTO `genres` (`idGenres`, `idInformation`, `Nom`) VALUES
(1, 1, 'MMORPG'),
(2, 2, 'FPS');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `idImage` int(11) NOT NULL AUTO_INCREMENT,
  `Format` varchar(45) DEFAULT NULL,
  `Lien` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idImage`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `image`
--

INSERT INTO `image` (`idImage`, `Format`, `Lien`) VALUES
(1, 'png', 'http://image.jeuxvideo.com/images-md/ps/f/i/final-fantasy-vii-playstation-ps1-00a.jpg'),
(2, 'test', 'http://image.jeuxvideo.com/images-md/ps/f/i/final-fantasy-vii-playstation-ps1-00a.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `idInformation` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `Nb_Max_Player` int(11) DEFAULT NULL,
  `Description` longtext,
  `Classification` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `information`
--

INSERT INTO `information` (`idInformation`, `Nom`, `Nb_Max_Player`, `Description`, `Classification`) VALUES
(1, 'Final Fantasy X', 2, 'super jeux', NULL),
(2, 'crash bandicoot', 1, 'très bon jeu', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `jeu`
--

CREATE TABLE IF NOT EXISTS `jeu` (
  `idJeu` int(11) NOT NULL AUTO_INCREMENT,
  `idInformation` int(11) NOT NULL,
  PRIMARY KEY (`idJeu`),
  KEY `fk_Game_Information1_idx` (`idInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `jeu`
--

INSERT INTO `jeu` (`idJeu`, `idInformation`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `jeumedia`
--

CREATE TABLE IF NOT EXISTS `jeumedia` (
  `idJeuMedia` int(11) NOT NULL AUTO_INCREMENT,
  `idMedia` int(11) NOT NULL,
  `idJeu` int(11) NOT NULL,
  PRIMARY KEY (`idJeuMedia`),
  KEY `fk_JeuxMedia_Media1_idx` (`idMedia`),
  KEY `fk_JeuxMedia_jeu1_idx` (`idJeu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `jeumedia`
--

INSERT INTO `jeumedia` (`idJeuMedia`, `idMedia`, `idJeu`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `idMedia` int(11) NOT NULL AUTO_INCREMENT,
  `Titre` varchar(100) DEFAULT NULL,
  `Lien` varchar(500) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Description` longtext,
  `Nb_Vue` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMedia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `media`
--

INSERT INTO `media` (`idMedia`, `Titre`, `Lien`, `Date`, `Type`, `Description`, `Nb_Vue`) VALUES
(1, 'titre1', 'azzr', '2015-05-20', 'test', 'lormem ipsum', 5),
(2, 'titre 2', 'fezfz', '2015-05-22', 'refezf', 'test', 18);

-- --------------------------------------------------------

--
-- Structure de la table `modeleeco`
--

CREATE TABLE IF NOT EXISTS `modeleeco` (
  `idModeleEco` int(11) NOT NULL AUTO_INCREMENT,
  `idInformation` int(11) NOT NULL,
  `Nom` enum('Achat','En Ligne') DEFAULT NULL,
  PRIMARY KEY (`idModeleEco`),
  KEY `fk_ModeleEco_Information1_idx` (`idInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `modeleeco`
--

INSERT INTO `modeleeco` (`idModeleEco`, `idInformation`, `Nom`) VALUES
(1, 1, 'Achat'),
(2, 2, 'En Ligne');

-- --------------------------------------------------------

--
-- Structure de la table `modes`
--

CREATE TABLE IF NOT EXISTS `modes` (
  `idModes` int(11) NOT NULL AUTO_INCREMENT,
  `idInformation` int(11) NOT NULL,
  `Nom` enum('MultiJoueurs','Solo') DEFAULT NULL,
  PRIMARY KEY (`idModes`),
  KEY `fk_Modes_Information1_idx` (`idInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `modes`
--

INSERT INTO `modes` (`idModes`, `idInformation`, `Nom`) VALUES
(1, 1, 'Solo'),
(2, 1, 'MultiJoueurs');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE IF NOT EXISTS `note` (
  `idNote` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) DEFAULT NULL,
  `Valeur` int(11) DEFAULT NULL,
  `Content` longtext,
  `idTest` int(11) NOT NULL,
  PRIMARY KEY (`idNote`),
  KEY `fk_Note_Test1_idx` (`idTest`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `note`
--

INSERT INTO `note` (`idNote`, `Type`, `Valeur`, `Content`, `idTest`) VALUES
(1, 'type1', 10, 'dfed', 1),
(2, 'zezzd', 15, 'okok', 2);

-- --------------------------------------------------------

--
-- Structure de la table `opinion`
--

CREATE TABLE IF NOT EXISTS `opinion` (
  `idOpinion` int(11) NOT NULL AUTO_INCREMENT,
  `idJeu` int(11) NOT NULL,
  `Type` enum('Redaction','Lecteur') DEFAULT NULL,
  PRIMARY KEY (`idOpinion`),
  KEY `fk_Opinion_Jeu1_idx` (`idJeu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `opinion`
--

INSERT INTO `opinion` (`idOpinion`, `idJeu`, `Type`) VALUES
(1, 1, 'Redaction'),
(2, 2, 'Lecteur');

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE IF NOT EXISTS `pays` (
  `idPays` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPays`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`idPays`, `Nom`) VALUES
(1, 'France'),
(2, 'Italie');

-- --------------------------------------------------------

--
-- Structure de la table `plateform`
--

CREATE TABLE IF NOT EXISTS `plateform` (
  `idPlateform` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) DEFAULT NULL,
  `idSorties` int(11) NOT NULL,
  PRIMARY KEY (`idPlateform`),
  KEY `fk_Plateform_Sorties1_idx` (`idSorties`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `plateform`
--

INSERT INTO `plateform` (`idPlateform`, `Type`, `idSorties`) VALUES
(1, 'type1', 1),
(2, 'type2', 2);

-- --------------------------------------------------------

--
-- Structure de la table `plateform_media`
--

CREATE TABLE IF NOT EXISTS `plateform_media` (
  `idPlateform_Media` int(11) NOT NULL AUTO_INCREMENT,
  `idPlateform` int(11) NOT NULL,
  `idMedia` int(11) NOT NULL,
  PRIMARY KEY (`idPlateform_Media`),
  KEY `fk_Plateform_Media_Plateform1_idx` (`idPlateform`),
  KEY `fk_Plateform_Media_Media1_idx` (`idMedia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `plateform_media`
--

INSERT INTO `plateform_media` (`idPlateform_Media`, `idPlateform`, `idMedia`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `redacteur`
--

CREATE TABLE IF NOT EXISTS `redacteur` (
  `idRedacteur` int(11) NOT NULL AUTO_INCREMENT,
  `idOpinion` int(11) NOT NULL,
  `NoteGlobal` int(11) DEFAULT NULL,
  `Testeur` varchar(45) DEFAULT NULL,
  `Texte` longtext,
  PRIMARY KEY (`idRedacteur`),
  KEY `fk_Redacteur_Opinion1_idx` (`idOpinion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `redacteur`
--

INSERT INTO `redacteur` (`idRedacteur`, `idOpinion`, `NoteGlobal`, `Testeur`, `Texte`) VALUES
(1, 1, 10, 'test', 'zefez'),
(2, 2, 15, 'bibi', 'text2');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE IF NOT EXISTS `site` (
  `idSite` int(11) NOT NULL AUTO_INCREMENT,
  `idInformation` int(11) NOT NULL,
  `idPays` int(11) NOT NULL,
  `Nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSite`),
  KEY `fk_Site_Information1_idx` (`idInformation`),
  KEY `fk_Site_Pays1_idx` (`idPays`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `site`
--

INSERT INTO `site` (`idSite`, `idInformation`, `idPays`, `Nom`) VALUES
(1, 1, 1, 'site1'),
(2, 2, 2, 'site2');

-- --------------------------------------------------------

--
-- Structure de la table `sorties`
--

CREATE TABLE IF NOT EXISTS `sorties` (
  `idSorties` int(11) NOT NULL AUTO_INCREMENT,
  `idInformation` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `idPays` int(11) NOT NULL,
  PRIMARY KEY (`idSorties`),
  KEY `fk_Sorties_Information1_idx` (`idInformation`),
  KEY `fk_Sorties_Pays1_idx` (`idPays`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `sorties`
--

INSERT INTO `sorties` (`idSorties`, `idInformation`, `Date`, `idPays`) VALUES
(1, 1, '2015-05-13', 1),
(2, 2, '2015-05-07', 2);

-- --------------------------------------------------------

--
-- Structure de la table `supports`
--

CREATE TABLE IF NOT EXISTS `supports` (
  `idSupports` int(11) NOT NULL AUTO_INCREMENT,
  `idInformation` int(11) NOT NULL,
  `Nom` enum('PS4','XBOX','PC') DEFAULT NULL,
  PRIMARY KEY (`idSupports`),
  KEY `fk_Supports_Information1_idx` (`idInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `supports`
--

INSERT INTO `supports` (`idSupports`, `idInformation`, `Nom`) VALUES
(1, 1, 'PS4'),
(2, 1, 'XBOX');

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `idTag` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) DEFAULT NULL,
  `idMedia` int(11) NOT NULL,
  PRIMARY KEY (`idTag`),
  KEY `fk_Tag_Media1_idx` (`idMedia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `tag`
--

INSERT INTO `tag` (`idTag`, `Type`, `idMedia`) VALUES
(1, 'trfyghj', 1),
(2, 'ppp', 2);

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `idTest` int(11) NOT NULL AUTO_INCREMENT,
  `idJeu` int(11) NOT NULL,
  `idEntete` int(11) NOT NULL,
  `idPlateform` int(11) NOT NULL,
  `Date_Publication` date DEFAULT NULL,
  `Type` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idTest`),
  KEY `fk_Test_Entete1_idx` (`idEntete`),
  KEY `fk_Test_Plateform1_idx` (`idPlateform`),
  KEY `fk_Test_Jeu1_idx` (`idJeu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `test`
--

INSERT INTO `test` (`idTest`, `idJeu`, `idEntete`, `idPlateform`, `Date_Publication`, `Type`) VALUES
(1, 1, 1, 1, '2015-05-21', 'zezre'),
(2, 2, 2, 2, '2015-05-30', 'zetrtttt');

-- --------------------------------------------------------

--
-- Structure de la table `themes`
--

CREATE TABLE IF NOT EXISTS `themes` (
  `idThemes` int(11) NOT NULL AUTO_INCREMENT,
  `idInformation` int(11) NOT NULL,
  `Nom` enum('Course','Aventure','Fuck') DEFAULT NULL,
  PRIMARY KEY (`idThemes`),
  KEY `fk_Themes_Information1_idx` (`idInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `themes`
--

INSERT INTO `themes` (`idThemes`, `idInformation`, `Nom`) VALUES
(1, 1, 'Course'),
(2, 2, 'Aventure');

-- --------------------------------------------------------

--
-- Structure de la table `typemedia`
--

CREATE TABLE IF NOT EXISTS `typemedia` (
  `idTypeMedia` int(11) NOT NULL AUTO_INCREMENT,
  `idMedia` int(11) NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTypeMedia`),
  KEY `fk_TypeMedia_Media1_idx` (`idMedia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `typemedia`
--

INSERT INTO `typemedia` (`idTypeMedia`, `idMedia`, `Type`, `Description`) VALUES
(1, 1, 'ert', 'setzrzr'),
(2, 2, 'zerzer', 'rtyry');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `bloc`
--
ALTER TABLE `bloc`
  ADD CONSTRAINT `fk_Bloc_Test1` FOREIGN KEY (`idTest`) REFERENCES `test` (`idTest`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `developpeur`
--
ALTER TABLE `developpeur`
  ADD CONSTRAINT `fk_Developpeur_Information1` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `editeur`
--
ALTER TABLE `editeur`
  ADD CONSTRAINT `fk_Editeur_Information1` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `entete`
--
ALTER TABLE `entete`
  ADD CONSTRAINT `fk_Entete_Image1` FOREIGN KEY (`idImage`) REFERENCES `image` (`idImage`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Entete_Auteur1` FOREIGN KEY (`idAuteur`) REFERENCES `auteur` (`idAuteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `genres`
--
ALTER TABLE `genres`
  ADD CONSTRAINT `fk_Genres_Information1` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `jeu`
--
ALTER TABLE `jeu`
  ADD CONSTRAINT `fk_Game_Information1` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `jeumedia`
--
ALTER TABLE `jeumedia`
  ADD CONSTRAINT `fk_JeuxMedia_Media1` FOREIGN KEY (`idMedia`) REFERENCES `media` (`idMedia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_JeuxMedia_jeu1` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`idJeu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `modeleeco`
--
ALTER TABLE `modeleeco`
  ADD CONSTRAINT `fk_ModeleEco_Information1` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `modes`
--
ALTER TABLE `modes`
  ADD CONSTRAINT `fk_Modes_Information1` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `fk_Note_Test1` FOREIGN KEY (`idTest`) REFERENCES `test` (`idTest`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `opinion`
--
ALTER TABLE `opinion`
  ADD CONSTRAINT `fk_Opinion_Jeu1` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`idJeu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `plateform`
--
ALTER TABLE `plateform`
  ADD CONSTRAINT `fk_Plateform_Sorties1` FOREIGN KEY (`idSorties`) REFERENCES `sorties` (`idSorties`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `plateform_media`
--
ALTER TABLE `plateform_media`
  ADD CONSTRAINT `fk_Plateform_Media_Plateform1` FOREIGN KEY (`idPlateform`) REFERENCES `plateform` (`idPlateform`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Plateform_Media_Media1` FOREIGN KEY (`idMedia`) REFERENCES `media` (`idMedia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `redacteur`
--
ALTER TABLE `redacteur`
  ADD CONSTRAINT `fk_Redacteur_Opinion1` FOREIGN KEY (`idOpinion`) REFERENCES `opinion` (`idOpinion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `fk_Site_Information1` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Site_Pays1` FOREIGN KEY (`idPays`) REFERENCES `pays` (`idPays`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sorties`
--
ALTER TABLE `sorties`
  ADD CONSTRAINT `fk_Sorties_Information1` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Sorties_Pays1` FOREIGN KEY (`idPays`) REFERENCES `pays` (`idPays`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `supports`
--
ALTER TABLE `supports`
  ADD CONSTRAINT `fk_Supports_Information1` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `fk_Tag_Media1` FOREIGN KEY (`idMedia`) REFERENCES `media` (`idMedia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `fk_Test_Entete1` FOREIGN KEY (`idEntete`) REFERENCES `entete` (`idEntete`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Test_Plateform1` FOREIGN KEY (`idPlateform`) REFERENCES `plateform` (`idPlateform`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Test_Jeu1` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`idJeu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `themes`
--
ALTER TABLE `themes`
  ADD CONSTRAINT `fk_Themes_Information1` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `typemedia`
--
ALTER TABLE `typemedia`
  ADD CONSTRAINT `fk_TypeMedia_Media1` FOREIGN KEY (`idMedia`) REFERENCES `media` (`idMedia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
