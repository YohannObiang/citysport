CREATE DATABASE citysport;

USE citysport

CREATE USER 'yohann'@'localhost' IDENTIFIED BY 'yohannobiang';
GRANT ALL PRIVILEGES ON citysport. * TO 'yohann'@'localhost';


SELECT User, Host FROM mysql.user;

CREATE TABLE `client` (
  `idClient` int(8) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `contact` int(8) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `commande` (
  `idCommande` int(8) NOT NULL AUTO_INCREMENT,
  `idClient` int(8) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`idCommande`),
  INDEX par_ind (`idClient`),
    FOREIGN KEY (`idClient`)
        REFERENCES client(`idClient`)
        ON DELETE CASCADE
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `marque` (
  `idMarque` int(8) NOT NULL AUTO_INCREMENT,
  `marque` varchar(30) NOT NULL,
  `logo` varchar(30) NOT NULL,
  PRIMARY KEY (`idMarque`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `chaussures` (
  `idChaussure` int(8) NOT NULL AUTO_INCREMENT,
  `idMarque` int(8) NOT NULL,
  `couleur` varchar(20) NOT NULL,
  `taille` int(2) NOT NULL,
  `prix` float NOT NULL,
  `modeleChaussure` varchar(25) NOT NULL,
  PRIMARY KEY (`idChaussure`),  
  INDEX par_ind (`idMarque`),
    FOREIGN KEY (`idMarque`)
        REFERENCES marques(`idMarque`)
        ON DELETE CASCADE
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `detailcommandes` (
  `idCommande` int(8) NOT NULL AUTO_INCREMENT,
  `idChaussure` int(8) NOT NULL,
  `quantite` int(3) NOT NULL,
  PRIMARY KEY (`idCommande`),
  INDEX par_ind (`idChaussure`),
    FOREIGN KEY (`idChaussure`)
        REFERENCES chaussures(`idChaussure`)
        ON DELETE CASCADE
  
) ENGINE=Innodb DEFAULT CHARSET=utf8;


INSERT INTO `marques` (`idMarque`, `marque`, `logo`) VALUES
(1, 'Converse', 'LogoConverse'),
(2, 'Nike', 'LogoNike'),
(3, 'Adias', 'LogoAdidas');


INSERT INTO `chaussures` (`idChaussure`, `idMarque`, `taille`, `couleur`, `prix`, `modeleChaussure`) VALUES
(1, 1, 43, 'noir', 25000, 'ALL STAR'),
(2, 3, 43, 'blanc', 50000, 'OZWEEGO'),
(3, 2, 43, 'noir', 85000, 'HUARACHE');


-- LISTE LES MARQUES CONTENUS DANS DANS LA TABLES CHAUSSURES
SELECT marque FROM marques;

-- SUPPRIME LA CHASSURE DE MODELE ALL STAR
DELETE FROM chaussures WHERE idChaussure = 1;  

-- MISE A JOUR LA CHASSURE DE MARQUE HUARACHE
UPDATE chaussures SET modeleChaussure = 'HUARACHE2' WHERE idChaussure = 2;