CREATE DATABASE electrolux;
USE electrolux;
CREATE TABLE inventaire (
    produit_id_produit  INT NOT NULL,
    magasin_id_magasin  INT NOT NULL,
    nombre              INT NOT NULL
);

ALTER TABLE inventaire ADD CONSTRAINT inventaire_pk PRIMARY KEY ( produit_id_produit,
                                                                  magasin_id_magasin );

CREATE TABLE magasin (
    id_magasin    INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom           VARCHAR(50),
    adresse       CHAR(100) NOT NULL,
    ville         VARCHAR(50) NOT NULL,
    code_postale  CHAR(6) NOT NULL,
    tel           CHAR(10) NOT NULL
);

CREATE TABLE panier (
    produit_id_produit          INT NOT NULL,
    utilisateur_id_utilisateur  INT NOT NULL,
    nombre                      INT NOT NULL
);

ALTER TABLE panier ADD CONSTRAINT panier_pk PRIMARY KEY ( produit_id_produit,
                                                          utilisateur_id_utilisateur );

CREATE TABLE produit (
    id_produit                      INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom                             VARCHAR(50) NOT NULL,
    prix                            DECIMAL(5,2) NOT NULL,
    modele                          VARCHAR(100) NOT NULL,
    marque                          VARCHAR(50) NOT NULL,
    image                           VARCHAR(100) NOT NULL,
    produit_catégorie_id_catégorie  INT NOT NULL
);


CREATE TABLE produit_catégorie (
    id_catégorie  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom           VARCHAR(50) NOT NULL,
	lien_image	  VARCHAR(50) NOT NULL
);

CREATE TABLE utilisateur (
    id_utilisateur  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    email           VARCHAR(100) NOT NULL,
    tel             CHAR(10),
    nom             VARCHAR(50) NOT NULL,
    prenom          VARCHAR(50) NOT NULL,
    addresse        VARCHAR(100),
    ville           VARCHAR(50),
    code_postale    CHAR(6),
    mot_de_passe    VARCHAR(100) NOT NULL
);

ALTER TABLE inventaire
    ADD CONSTRAINT inventaire_magasin_fk FOREIGN KEY ( magasin_id_magasin )
        REFERENCES magasin ( id_magasin );

ALTER TABLE inventaire
    ADD CONSTRAINT inventaire_produit_fk FOREIGN KEY ( produit_id_produit )
        REFERENCES produit ( id_produit );

ALTER TABLE panier
    ADD CONSTRAINT panier_produit_fk FOREIGN KEY ( produit_id_produit )
        REFERENCES produit ( id_produit );

ALTER TABLE panier
    ADD CONSTRAINT panier_utilisateur_fk FOREIGN KEY ( utilisateur_id_utilisateur )
        REFERENCES utilisateur ( id_utilisateur );

ALTER TABLE produit
    ADD CONSTRAINT produit_produit_catégorie_fk FOREIGN KEY ( produit_catégorie_id_catégorie )
        REFERENCES produit_catégorie ( id_catégorie );
		
		
--Script d'insertion:
INSERT INTO `produit_catégorie` (`id_catégorie`, `nom`, `lien_image`) 
	VALUES (NULL, 'Consoles', '/views/images/consoles/consoles.jpg');
INSERT INTO `produit_catégorie` (`id_catégorie`, `nom`, `lien_image`) 
	VALUES (NULL, 'Écouteurs', '/views/images/ecouteurs/ecouteurs.jpg');
INSERT INTO `produit_catégorie` (`id_catégorie`, `nom`, `lien_image`) 
	VALUES (NULL, 'Frigidaires', '/views/images/frigos/frigos.jpg');
INSERT INTO `produit_catégorie` (`id_catégorie`, `nom`, `lien_image`)
	VALUES (NULL, 'Ordinateurs portable', '/views/images/laptops/laptops.jpg');
INSERT INTO `produit_catégorie` (`id_catégorie`, `nom`, `lien_image`) 
	VALUES (NULL, 'Souris', '/views/images/souris/souris.jpg')
INSERT INTO `produit_catégorie` (`id_catégorie`, `nom`, `lien_image`) 
	VALUES (NULL, 'Telephones', '/views/images/telephones/telephones.jpg');

INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `modele`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES 
	(NULL, 'KFC Console', '666.99', 'KFC Console', 'KFC', '/views/images/consoles/kfc.jpg', '1'), 
	(NULL, 'Nintendo Switch', '500.9', 'Nintendo Switch', 'Nintendo', '/views/images/consoles/nintendoswitch.jpg', '1');
INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `modele`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES
	(NULL, 'PS5', '450.99', 'PS5', 'PlayStation', '/views/images/consoles/ps5.jpg', 1),
	(NULL, 'xbox_series_x', '469.99', 'Xbox series X', 'Microsoft', '/views/images/consoles/xbox.jpg', 1);



