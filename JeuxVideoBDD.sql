-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Lun 18 Mai 2015 à 15:46
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
(1, 'journaliste', 'Super pseudo'),
(2, 'dératiseur', 'je déraratise');

-- --------------------------------------------------------

--
-- Structure de la table `bloc`
--

CREATE TABLE IF NOT EXISTS `bloc` (
  `idBloc` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) DEFAULT NULL,
  `Titre` varchar(50) DEFAULT NULL,
  `Content` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idBloc`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `bloc`
--

INSERT INTO `bloc` (`idBloc`, `Type`, `Titre`, `Content`) VALUES
(1, 'JPG', 'Super jpg', 'Lorem Ipsum'),
(2, 'test2', 'test2', 'test2');

-- --------------------------------------------------------

--
-- Structure de la table `contenu`
--

CREATE TABLE IF NOT EXISTS `contenu` (
  `idContenu` int(11) NOT NULL AUTO_INCREMENT,
  `idTest` int(11) NOT NULL,
  `idBloc` int(11) NOT NULL,
  PRIMARY KEY (`idContenu`),
  KEY `fk_Contenu_Test1_idx` (`idTest`),
  KEY `fk_Contenu_Bloc1_idx` (`idBloc`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `contenu`
--

INSERT INTO `contenu` (`idContenu`, `idTest`, `idBloc`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `developpeur`
--

CREATE TABLE IF NOT EXISTS `developpeur` (
  `idDeveloppeur` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idDeveloppeur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `developpeur`
--

INSERT INTO `developpeur` (`idDeveloppeur`, `Nom`) VALUES
(1, 'cedo'),
(2, 'bibi');

-- --------------------------------------------------------

--
-- Structure de la table `developpeurs`
--

CREATE TABLE IF NOT EXISTS `developpeurs` (
  `idDeveloppeurs` int(11) NOT NULL AUTO_INCREMENT,
  `idDeveloppeur` int(11) NOT NULL,
  `idInformation` int(11) NOT NULL,
  PRIMARY KEY (`idDeveloppeurs`),
  KEY `fk_Developpeurs_Developpeur1_idx` (`idDeveloppeur`),
  KEY `fk_Developpeurs_Information1_idx` (`idInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `developpeurs`
--

INSERT INTO `developpeurs` (`idDeveloppeurs`, `idDeveloppeur`, `idInformation`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

CREATE TABLE IF NOT EXISTS `editeur` (
  `idEditeur` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEditeur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `editeur`
--

INSERT INTO `editeur` (`idEditeur`, `Nom`) VALUES
(1, 'sony'),
(2, 'ubisoft');

-- --------------------------------------------------------

--
-- Structure de la table `editeurs`
--

CREATE TABLE IF NOT EXISTS `editeurs` (
  `idEditeurs` int(11) NOT NULL AUTO_INCREMENT,
  `idInformation` int(11) NOT NULL,
  `idEditeur` int(11) NOT NULL,
  PRIMARY KEY (`idEditeurs`),
  KEY `fk_Editeurs_Information_idx` (`idInformation`),
  KEY `fk_Editeurs_Editeur1_idx` (`idEditeur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `editeurs`
--

INSERT INTO `editeurs` (`idEditeurs`, `idInformation`, `idEditeur`) VALUES
(1, 1, 1),
(2, 1, 2);

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
(1, 1, 1, 'http://www.jeuxvideo.com/articles/0001/00010672-final-fantasy-vii-test.htm', 'Final Fantasy VII', 'S''il est des œuvres d''art qui résistent à l''épreuve du temps aux yeux du public, \r\n					il existe aussi des jeux qui ne se démodent pas dans le cœur des joueurs. La grande lignée \r\n					des Final Fantasy fait sans conteste partie de cette catégorie de titres qui auront su, au \r\n					fil du temps, imposer leur loi dans l''univers vidéoludique, et pour quelques-uns de ses \r\n					représentants entrer au panthéon des jeux cultes. C''est certainement le cas de Final Fantasy \r\n					VII, grand RPG s''il e'),
(2, 2, 1, 'ergeg', 'zerze', 'ezer');

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
(1, 1, 'Role'),
(2, 1, 'FPS');

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
(2, 'json', 'tototo');

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
(1, 'Final Fantasy X', 2, 'Final Fantasy X est un jeu de rôle sorti sur Playstation 2. \r\nLe monde de Spira vit dans la crainte d''une entité maléfique nommée Sin. \r\nVous incarnez une équipe menée par le jeune Tidus dans une quête pour libérer la terre de l''oppression, uniquement possible au prix d''une invocation finale...', '+12'),
(2, 'crash bandicoot', 4, 'top', NULL);

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
(2, 1, 2);

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
(1, 'Skyforge nous présente son Lumencien', 'Lien media', '2015-04-14', 'video', 'Lorem Ipsum', 94),
(2, 'test2', 'test2', '2015-04-15', 'test2', 'test2', 5);

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
(1, 1, 'MultiJoueurs'),
(2, 2, 'MultiJoueurs');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE IF NOT EXISTS `note` (
  `idNote` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) DEFAULT NULL,
  `Valeur` int(45) DEFAULT NULL,
  `Content` longtext,
  PRIMARY KEY (`idNote`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `note`
--

INSERT INTO `note` (`idNote`, `Type`, `Valeur`, `Content`) VALUES
(1, 'graphismes', 44, 'Lorem ipsum'),
(2, 'test2', 12, 'test2');

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `idNotes` int(11) NOT NULL AUTO_INCREMENT,
  `idNote` int(11) NOT NULL,
  `idTest` int(11) NOT NULL,
  PRIMARY KEY (`idNotes`),
  KEY `fk_Notes_Note1_idx` (`idNote`),
  KEY `fk_Notes_Test1_idx` (`idTest`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `notes`
--

INSERT INTO `notes` (`idNotes`, `idNote`, `idTest`) VALUES
(1, 1, 1),
(2, 2, 1);

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
(2, 2, 'Redaction');

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
(2, 'finlande');

-- --------------------------------------------------------

--
-- Structure de la table `plateform`
--

CREATE TABLE IF NOT EXISTS `plateform` (
  `idPlateform` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPlateform`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `plateform`
--

INSERT INTO `plateform` (`idPlateform`, `Type`) VALUES
(1, 'PS4'),
(2, 'test2');

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
(1, 1, 18, 'jean claude', 'super jeux'),
(2, 2, 10, 'bg', 'ok');

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
(1, 1, 1, 'www.ffx-europe.com'),
(2, 2, 2, 'test2');

-- --------------------------------------------------------

--
-- Structure de la table `sortie`
--

CREATE TABLE IF NOT EXISTS `sortie` (
  `idSortie` int(11) NOT NULL AUTO_INCREMENT,
  `idPays` int(11) NOT NULL,
  `idPlateform` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`idSortie`),
  KEY `fk_Sortie_Pays1_idx` (`idPays`),
  KEY `fk_Sortie_Plateform1_idx` (`idPlateform`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `sortie`
--

INSERT INTO `sortie` (`idSortie`, `idPays`, `idPlateform`, `Date`) VALUES
(1, 1, 1, '2015-04-09'),
(2, 2, 1, '2015-04-15');

-- --------------------------------------------------------

--
-- Structure de la table `sorties`
--

CREATE TABLE IF NOT EXISTS `sorties` (
  `idSorties` int(11) NOT NULL AUTO_INCREMENT,
  `idInformation` int(11) NOT NULL,
  `idSortie` int(11) NOT NULL,
  PRIMARY KEY (`idSorties`),
  KEY `fk_Sorties_Sortie1_idx` (`idSortie`),
  KEY `fk_Sorties_Information1_idx` (`idInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `sorties`
--

INSERT INTO `sorties` (`idSorties`, `idInformation`, `idSortie`) VALUES
(1, 1, 1),
(2, 2, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `supports`
--

INSERT INTO `supports` (`idSupports`, `idInformation`, `Nom`) VALUES
(1, 1, 'XBOX'),
(2, 2, 'PC'),
(3, 2, 'PC');

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `idTag` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idTag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `tag`
--

INSERT INTO `tag` (`idTag`, `Type`) VALUES
(1, '#sisi'),
(2, 'test2');

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `idTags` int(11) NOT NULL AUTO_INCREMENT,
  `idTag` int(11) NOT NULL,
  `idMedia` int(11) NOT NULL,
  PRIMARY KEY (`idTags`),
  KEY `fk_Tags_Tag1_idx` (`idTag`),
  KEY `fk_Tags_Media1_idx` (`idMedia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `tags`
--

INSERT INTO `tags` (`idTags`, `idTag`, `idMedia`) VALUES
(1, 1, 1),
(2, 2, 2);

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
(1, 1, 1, 1, '2015-04-15', 'redaction'),
(2, 2, 1, 2, '2015-04-17', 'test');

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
(1, 1, 'Aventure'),
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
(1, 1, 'BA', 'Bande annonce'),
(2, 2, 'tesy', 'test2');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `contenu`
--
ALTER TABLE `contenu`
  ADD CONSTRAINT `fk_Contenu_Bloc1` FOREIGN KEY (`idBloc`) REFERENCES `bloc` (`idBloc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Contenu_Test1` FOREIGN KEY (`idTest`) REFERENCES `test` (`idTest`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `developpeurs`
--
ALTER TABLE `developpeurs`
  ADD CONSTRAINT `fk_Developpeurs_Developpeur1` FOREIGN KEY (`idDeveloppeur`) REFERENCES `developpeur` (`idDeveloppeur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Developpeurs_Information1` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `editeurs`
--
ALTER TABLE `editeurs`
  ADD CONSTRAINT `fk_Editeurs_Editeur1` FOREIGN KEY (`idEditeur`) REFERENCES `editeur` (`idEditeur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Editeurs_Information` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `entete`
--
ALTER TABLE `entete`
  ADD CONSTRAINT `fk_Entete_Auteur1` FOREIGN KEY (`idAuteur`) REFERENCES `auteur` (`idAuteur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Entete_Image1` FOREIGN KEY (`idImage`) REFERENCES `image` (`idImage`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_JeuxMedia_jeu1` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`idJeu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_JeuxMedia_Media1` FOREIGN KEY (`idMedia`) REFERENCES `media` (`idMedia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `fk_Notes_Note1` FOREIGN KEY (`idNote`) REFERENCES `note` (`idNote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Notes_Test1` FOREIGN KEY (`idTest`) REFERENCES `test` (`idTest`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `opinion`
--
ALTER TABLE `opinion`
  ADD CONSTRAINT `fk_Opinion_Jeu1` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`idJeu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `plateform_media`
--
ALTER TABLE `plateform_media`
  ADD CONSTRAINT `fk_Plateform_Media_Media1` FOREIGN KEY (`idMedia`) REFERENCES `media` (`idMedia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Plateform_Media_Plateform1` FOREIGN KEY (`idPlateform`) REFERENCES `plateform` (`idPlateform`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Contraintes pour la table `sortie`
--
ALTER TABLE `sortie`
  ADD CONSTRAINT `fk_Sortie_Pays1` FOREIGN KEY (`idPays`) REFERENCES `pays` (`idPays`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Sortie_Plateform1` FOREIGN KEY (`idPlateform`) REFERENCES `plateform` (`idPlateform`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sorties`
--
ALTER TABLE `sorties`
  ADD CONSTRAINT `fk_Sorties_Information1` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Sorties_Sortie1` FOREIGN KEY (`idSortie`) REFERENCES `sortie` (`idSortie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `supports`
--
ALTER TABLE `supports`
  ADD CONSTRAINT `fk_Supports_Information1` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_Tags_Media1` FOREIGN KEY (`idMedia`) REFERENCES `media` (`idMedia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Tags_Tag1` FOREIGN KEY (`idTag`) REFERENCES `tag` (`idTag`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `fk_Test_Entete1` FOREIGN KEY (`idEntete`) REFERENCES `entete` (`idEntete`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Test_Jeu1` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`idJeu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Test_Plateform1` FOREIGN KEY (`idPlateform`) REFERENCES `plateform` (`idPlateform`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
