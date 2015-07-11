-- MySQL Script generated by MySQL Workbench
-- 05/20/15 11:04:50
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Information` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Information` (
  `idInformation` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(50) NULL,
  `Nb_Max_Player` INT NULL,
  `Description` LONGTEXT NULL,
  `Classification` VARCHAR(45) NULL,
  PRIMARY KEY (`idInformation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Editeur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Editeur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Editeur` (
  `idEditeur` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NULL,
  `idInformation` INT NOT NULL,
  PRIMARY KEY (`idEditeur`),
  INDEX `fk_Editeur_Information1_idx` (`idInformation` ASC),
  CONSTRAINT `fk_Editeur_Information1`
    FOREIGN KEY (`idInformation`)
    REFERENCES `mydb`.`Information` (`idInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Developpeur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Developpeur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Developpeur` (
  `idDeveloppeur` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(50) NULL,
  `idInformation` INT NOT NULL,
  PRIMARY KEY (`idDeveloppeur`),
  INDEX `fk_Developpeur_Information1_idx` (`idInformation` ASC),
  CONSTRAINT `fk_Developpeur_Information1`
    FOREIGN KEY (`idInformation`)
    REFERENCES `mydb`.`Information` (`idInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pays`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pays` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pays` (
  `idPays` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idPays`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plateform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Plateform` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Plateform` (
  `idPlateform` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(45) NULL,
  PRIMARY KEY (`idPlateform`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sorties`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Sorties` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Sorties` (
  `idSorties` INT NOT NULL AUTO_INCREMENT,
  `idInformation` INT NOT NULL,
  `idPays` INT NOT NULL,
  `idPlateform` INT NOT NULL,
  `Date` DATE NULL,
  PRIMARY KEY (`idSorties`),
  INDEX `fk_Sorties_Information1_idx` (`idInformation` ASC),
  INDEX `fk_Sorties_Pays1_idx` (`idPays` ASC),
  INDEX `fk_Sorties_Plateform1_idx` (`idPlateform` ASC),
  CONSTRAINT `fk_Sorties_Information1`
    FOREIGN KEY (`idInformation`)
    REFERENCES `mydb`.`Information` (`idInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sorties_Pays1`
    FOREIGN KEY (`idPays`)
    REFERENCES `mydb`.`Pays` (`idPays`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sorties_Plateform1`
    FOREIGN KEY (`idPlateform`)
    REFERENCES `mydb`.`Plateform` (`idPlateform`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Genres` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Genres` (
  `idGenres` INT NOT NULL AUTO_INCREMENT,
  `idInformation` INT NOT NULL,
  `Nom` ENUM('MMORPG','Role','FPS') NULL,
  PRIMARY KEY (`idGenres`),
  INDEX `fk_Genres_Information1_idx` (`idInformation` ASC),
  CONSTRAINT `fk_Genres_Information1`
    FOREIGN KEY (`idInformation`)
    REFERENCES `mydb`.`Information` (`idInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Themes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Themes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Themes` (
  `idThemes` INT NOT NULL AUTO_INCREMENT,
  `idInformation` INT NOT NULL,
  `Nom` ENUM('Course','Aventure','Fuck') NULL,
  PRIMARY KEY (`idThemes`),
  INDEX `fk_Themes_Information1_idx` (`idInformation` ASC),
  CONSTRAINT `fk_Themes_Information1`
    FOREIGN KEY (`idInformation`)
    REFERENCES `mydb`.`Information` (`idInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Modes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Modes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Modes` (
  `idModes` INT NOT NULL AUTO_INCREMENT,
  `idInformation` INT NOT NULL,
  `Nom` ENUM('MultiJoueurs','Solo') NULL,
  PRIMARY KEY (`idModes`),
  INDEX `fk_Modes_Information1_idx` (`idInformation` ASC),
  CONSTRAINT `fk_Modes_Information1`
    FOREIGN KEY (`idInformation`)
    REFERENCES `mydb`.`Information` (`idInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Supports`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Supports` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Supports` (
  `idSupports` INT NOT NULL AUTO_INCREMENT,
  `idInformation` INT NOT NULL,
  `Nom` ENUM('PS4','XBOX','PC') NULL,
  PRIMARY KEY (`idSupports`),
  INDEX `fk_Supports_Information1_idx` (`idInformation` ASC),
  CONSTRAINT `fk_Supports_Information1`
    FOREIGN KEY (`idInformation`)
    REFERENCES `mydb`.`Information` (`idInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Site`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Site` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Site` (
  `idSite` INT NOT NULL AUTO_INCREMENT,
  `idInformation` INT NOT NULL,
  `idPays` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idSite`),
  INDEX `fk_Site_Information1_idx` (`idInformation` ASC),
  INDEX `fk_Site_Pays1_idx` (`idPays` ASC),
  CONSTRAINT `fk_Site_Information1`
    FOREIGN KEY (`idInformation`)
    REFERENCES `mydb`.`Information` (`idInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Site_Pays1`
    FOREIGN KEY (`idPays`)
    REFERENCES `mydb`.`Pays` (`idPays`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ModeleEco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ModeleEco` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ModeleEco` (
  `idModeleEco` INT NOT NULL AUTO_INCREMENT,
  `idInformation` INT NOT NULL,
  `Nom` ENUM('Achat','En Ligne') NULL,
  PRIMARY KEY (`idModeleEco`),
  INDEX `fk_ModeleEco_Information1_idx` (`idInformation` ASC),
  CONSTRAINT `fk_ModeleEco_Information1`
    FOREIGN KEY (`idInformation`)
    REFERENCES `mydb`.`Information` (`idInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Image` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Image` (
  `idImage` INT NOT NULL AUTO_INCREMENT,
  `Format` VARCHAR(45) NULL,
  `Lien_Image` VARCHAR(500) NULL,
  PRIMARY KEY (`idImage`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Auteur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Auteur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Auteur` (
  `idAuteur` INT NOT NULL AUTO_INCREMENT,
  `Fonction` VARCHAR(50) NULL,
  `Description` VARCHAR(100) NULL,
  PRIMARY KEY (`idAuteur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entete`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Entete` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Entete` (
  `idEntete` INT NOT NULL AUTO_INCREMENT,
  `idAuteur` INT NOT NULL,
  `idImage` INT NOT NULL,
  `Lien` VARCHAR(500) NULL,
  `Titre` VARCHAR(100) NULL,
  `Resume` LONGTEXT NULL,
  PRIMARY KEY (`idEntete`),
  INDEX `fk_Entete_Image1_idx` (`idImage` ASC),
  INDEX `fk_Entete_Auteur1_idx` (`idAuteur` ASC),
  CONSTRAINT `fk_Entete_Image1`
    FOREIGN KEY (`idImage`)
    REFERENCES `mydb`.`Image` (`idImage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entete_Auteur1`
    FOREIGN KEY (`idAuteur`)
    REFERENCES `mydb`.`Auteur` (`idAuteur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Jeu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Jeu` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Jeu` (
  `idJeu` INT NOT NULL AUTO_INCREMENT,
  `idInformation` INT NOT NULL,
  PRIMARY KEY (`idJeu`),
  INDEX `fk_Game_Information1_idx` (`idInformation` ASC),
  CONSTRAINT `fk_Game_Information1`
    FOREIGN KEY (`idInformation`)
    REFERENCES `mydb`.`Information` (`idInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Test` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Test` (
  `idTest` INT NOT NULL AUTO_INCREMENT,
  `idJeu` INT NOT NULL,
  `idEntete` INT NOT NULL,
  `idPlateform` INT NOT NULL,
  `Date_Publication` DATE NULL,
  `Type` VARCHAR(60) NULL,
  PRIMARY KEY (`idTest`),
  INDEX `fk_Test_Entete1_idx` (`idEntete` ASC),
  INDEX `fk_Test_Plateform1_idx` (`idPlateform` ASC),
  INDEX `fk_Test_Jeu1_idx` (`idJeu` ASC),
  CONSTRAINT `fk_Test_Entete1`
    FOREIGN KEY (`idEntete`)
    REFERENCES `mydb`.`Entete` (`idEntete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Test_Plateform1`
    FOREIGN KEY (`idPlateform`)
    REFERENCES `mydb`.`Plateform` (`idPlateform`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Test_Jeu1`
    FOREIGN KEY (`idJeu`)
    REFERENCES `mydb`.`Jeu` (`idJeu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bloc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Bloc` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Bloc` (
  `idBloc` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(100) NULL,
  `Titre` VARCHAR(50) NULL,
  `Content` VARCHAR(500) NULL,
  `idTest` INT NOT NULL,
  PRIMARY KEY (`idBloc`),
  INDEX `fk_Bloc_Test1_idx` (`idTest` ASC),
  CONSTRAINT `fk_Bloc_Test1`
    FOREIGN KEY (`idTest`)
    REFERENCES `mydb`.`Test` (`idTest`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Note`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Note` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Note` (
  `idNote` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(45) NULL,
  `Valeur` INT NULL,
  `Content` LONGTEXT NULL,
  `idTest` INT NOT NULL,
  PRIMARY KEY (`idNote`),
  INDEX `fk_Note_Test1_idx` (`idTest` ASC),
  CONSTRAINT `fk_Note_Test1`
    FOREIGN KEY (`idTest`)
    REFERENCES `mydb`.`Test` (`idTest`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Media` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Media` (
  `idMedia` INT NOT NULL AUTO_INCREMENT,
  `Titre` VARCHAR(100) NULL,
  `Lien` VARCHAR(500) NULL,
  `Date` DATE NULL,
  `Type` VARCHAR(50) NULL,
  `Description` LONGTEXT NULL,
  `Nb_Vue` INT NULL,
  PRIMARY KEY (`idMedia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plateform_Media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Plateform_Media` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Plateform_Media` (
  `idPlateform_Media` INT NOT NULL AUTO_INCREMENT,
  `idPlateform` INT NOT NULL,
  `idMedia` INT NOT NULL,
  PRIMARY KEY (`idPlateform_Media`),
  INDEX `fk_Plateform_Media_Plateform1_idx` (`idPlateform` ASC),
  INDEX `fk_Plateform_Media_Media1_idx` (`idMedia` ASC),
  CONSTRAINT `fk_Plateform_Media_Plateform1`
    FOREIGN KEY (`idPlateform`)
    REFERENCES `mydb`.`Plateform` (`idPlateform`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plateform_Media_Media1`
    FOREIGN KEY (`idMedia`)
    REFERENCES `mydb`.`Media` (`idMedia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tag` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tag` (
  `idTag` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(100) NULL,
  `idMedia` INT NOT NULL,
  PRIMARY KEY (`idTag`),
  INDEX `fk_Tag_Media1_idx` (`idMedia` ASC),
  CONSTRAINT `fk_Tag_Media1`
    FOREIGN KEY (`idMedia`)
    REFERENCES `mydb`.`Media` (`idMedia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`JeuMedia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`JeuMedia` ;

CREATE TABLE IF NOT EXISTS `mydb`.`JeuMedia` (
  `idJeuMedia` INT NOT NULL AUTO_INCREMENT,
  `idMedia` INT NOT NULL,
  `idJeu` INT NOT NULL,
  PRIMARY KEY (`idJeuMedia`),
  INDEX `fk_JeuxMedia_Media1_idx` (`idMedia` ASC),
  INDEX `fk_JeuxMedia_jeu1_idx` (`idJeu` ASC),
  CONSTRAINT `fk_JeuxMedia_Media1`
    FOREIGN KEY (`idMedia`)
    REFERENCES `mydb`.`Media` (`idMedia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_JeuxMedia_jeu1`
    FOREIGN KEY (`idJeu`)
    REFERENCES `mydb`.`Jeu` (`idJeu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Opinion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Opinion` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Opinion` (
  `idOpinion` INT NOT NULL AUTO_INCREMENT,
  `idJeu` INT NOT NULL,
  `Type` ENUM('Redaction','Lecteur') NULL,
  PRIMARY KEY (`idOpinion`),
  INDEX `fk_Opinion_Jeu1_idx` (`idJeu` ASC),
  CONSTRAINT `fk_Opinion_Jeu1`
    FOREIGN KEY (`idJeu`)
    REFERENCES `mydb`.`Jeu` (`idJeu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Redacteur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Redacteur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Redacteur` (
  `idRedacteur` INT NOT NULL AUTO_INCREMENT,
  `idOpinion` INT NOT NULL,
  `NoteGlobal` INT NULL,
  `Testeur` VARCHAR(45) NULL,
  `Texte` LONGTEXT NULL,
  PRIMARY KEY (`idRedacteur`),
  INDEX `fk_Redacteur_Opinion1_idx` (`idOpinion` ASC),
  CONSTRAINT `fk_Redacteur_Opinion1`
    FOREIGN KEY (`idOpinion`)
    REFERENCES `mydb`.`Opinion` (`idOpinion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TypeMedia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TypeMedia` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TypeMedia` (
  `idTypeMedia` INT NOT NULL AUTO_INCREMENT,
  `idMedia` INT NOT NULL,
  `Type` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`idTypeMedia`),
  INDEX `fk_TypeMedia_Media1_idx` (`idMedia` ASC),
  CONSTRAINT `fk_TypeMedia_Media1`
    FOREIGN KEY (`idMedia`)
    REFERENCES `mydb`.`Media` (`idMedia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`idAuteur`, `Fonction`, `Description`) VALUES
(1, 'testeur1', 'description testeur 1'),
(2, 'testeur2', 'description testeur 2');











--
-- Contenu de la table `image`
--

INSERT INTO `image` (`idImage`, `Format`, `Lien_Image`) VALUES
(1, 'png', 'http://image.jeuxvideo.com/images-md/ps/f/i/final-fantasy-vii-playstation-ps1-00a.jpg'),
(2, 'test', 'http://image.jeuxvideo.com/images-md/ps/f/i/final-fantasy-vii-playstation-ps1-00a.jpg');

--
-- Contenu de la table `information`
--

INSERT INTO `information` (`idInformation`, `Nom`, `Nb_Max_Player`, `Description`, `Classification`) VALUES
(1, 'Final Fantasy X', 2, 'super jeux', NULL),
(2, 'crash bandicoot', 1, 'très bon jeu', NULL);



--
-- Contenu de la table `genres`
--

INSERT INTO `genres` (`idGenres`, `idInformation`, `Nom`) VALUES
(1, 1, 'MMORPG'),
(2, 2, 'FPS');
--
-- Contenu de la table `editeur`
--

INSERT INTO `editeur` (`idEditeur`, `Nom`, `idInformation`) VALUES
(1, '>Sony', 1),
(2, 'toto', 2);
--
-- Contenu de la table `developpeur`
--

INSERT INTO `developpeur` (`idDeveloppeur`, `Nom`, `idInformation`) VALUES
(1, 'Squaresoft', 1),
(2, 'sony', 2);

--
-- Contenu de la table `jeu`
--

INSERT INTO `jeu` (`idJeu`, `idInformation`) VALUES
(1, 1),
(2, 2);



--
-- Contenu de la table `media`
--

INSERT INTO `media` (`idMedia`, `Titre`, `Lien`, `Date`, `Type`, `Description`, `Nb_Vue`) VALUES
(1, 'titre1', 'azzr', '2015-05-20', 'test', 'lormem ipsum', 5),
(2, 'titre 2', 'fezfz', '2015-05-22', 'refezf', 'test', 18);


--
-- Contenu de la table `jeumedia`
--

INSERT INTO `jeumedia` (`idJeuMedia`, `idMedia`, `idJeu`) VALUES
(1, 1, 1),
(2, 2, 2);


--
-- Contenu de la table `modeleeco`
--

INSERT INTO `modeleeco` (`idModeleEco`, `idInformation`, `Nom`) VALUES
(1, 1, 'Achat'),
(2, 2, 'En Ligne');

--
-- Contenu de la table `modes`
--

INSERT INTO `modes` (`idModes`, `idInformation`, `Nom`) VALUES
(1, 1, 'Solo'),
(2, 1, 'MultiJoueurs');



--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`idPays`, `Nom`) VALUES
(1, 'France'),
(2, 'Italie');

--
-- Contenu de la table `plateform`
--

INSERT INTO `plateform` (`idPlateform`, `Type`) VALUES
(1, 'type1'),
(2, 'type2');

--
-- Contenu de la table `plateform_media`
--

INSERT INTO `plateform_media` (`idPlateform_Media`, `idPlateform`, `idMedia`) VALUES
(1, 1, 1),
(2, 2, 2);



--
-- Contenu de la table `site`
--

INSERT INTO `site` (`idSite`, `idInformation`, `idPays`, `Nom`) VALUES
(1, 1, 1, 'site1'),
(2, 2, 2, 'site2');



--
-- Contenu de la table `supports`
--

INSERT INTO `supports` (`idSupports`, `idInformation`, `Nom`) VALUES
(1, 1, 'PS4'),
(2, 1, 'XBOX');

--
-- Contenu de la table `tag`
--

INSERT INTO `tag` (`idTag`, `Type`, `idMedia`) VALUES
(1, 'trfyghj', 1),
(2, 'ppp', 2);

--
-- Contenu de la table `entete`
--

INSERT INTO `entete` (`idEntete`, `idAuteur`, `idImage`, `Lien`, `Titre`, `Resume`) VALUES
(1, 1, 1, 'uyigkugiug', 'titre1', 'lorem ipsum'),
(2, 2, 2, 'qfq', 'titre2', 'lorem ipsum');

--
-- Contenu de la table `test`
--

INSERT INTO `test` (`idTest`, `idJeu`, `idEntete`, `idPlateform`, `Date_Publication`, `Type`) VALUES
(1, 1, 1, 1, '2015-05-21', 'zezre'),
(2, 2, 2, 2, '2015-05-30', 'zetrtttt');

--
-- Contenu de la table `themes`
--

INSERT INTO `themes` (`idThemes`, `idInformation`, `Nom`) VALUES
(1, 1, 'Course'),
(2, 2, 'Aventure');

--
-- Contenu de la table `typemedia`
--

INSERT INTO `typemedia` (`idTypeMedia`, `idMedia`, `Type`, `Description`) VALUES
(1, 1, 'ert', 'setzrzr'),
(2, 2, 'zerzer', 'rtyry');

--
-- Contenu de la table `bloc`
--

INSERT INTO `bloc` (`idBloc`, `Type`, `Titre`, `Content`, `idTest`) VALUES
(1, 'pppp', 'oooo', 'uuuuu', 1),
(2, 'ttt', 'nnnn', 'tttt', 2);


--
-- Contenu de la table `note`
--

INSERT INTO `note` (`idNote`, `Type`, `Valeur`, `Content`, `idTest`) VALUES
(1, 'type1', 10, 'dfed', 1),
(2, 'zezzd', 15, 'okok', 2);

--
-- Contenu de la table `opinion`
--

INSERT INTO `opinion` (`idOpinion`, `idJeu`, `Type`) VALUES
(1, 1, 'Redaction'),
(2, 2, 'Lecteur');

--
-- Contenu de la table `redacteur`
--

INSERT INTO `redacteur` (`idRedacteur`, `idOpinion`, `NoteGlobal`, `Testeur`, `Texte`) VALUES
(1, 1, 10, 'test', 'zefez'),
(2, 2, 15, 'bibi', 'text2');

--
-- Contenu de la table `sorties`
--

INSERT INTO `sorties` (`idSorties`, `idInformation`, `Date`, `idPays`,`idPlateform`) VALUES
(1, 1, '2015-05-13',1, 1),
(2, 2, '2015-05-07',2, 2);