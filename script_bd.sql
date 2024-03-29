CREATE DATABASE DB_Site;
USE DB_Site;
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
    prix                            DECIMAL(7,2) NOT NULL,
    description                          VARCHAR(200) NOT NULL,
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
		

INSERT INTO `produit_catégorie` (`id_catégorie`, `nom`, `lien_image`) 
	VALUES (NULL, 'Consoles', '/images/consoles/consoles.jpg');
INSERT INTO `produit_catégorie` (`id_catégorie`, `nom`, `lien_image`) 
	VALUES (NULL, 'Écouteurs', '/images/ecouteurs/ecouteurs.jpg');
INSERT INTO `produit_catégorie` (`id_catégorie`, `nom`, `lien_image`) 
	VALUES (NULL, 'Frigidaires', '/images/frigos/frigos.jpg');
INSERT INTO `produit_catégorie` (`id_catégorie`, `nom`, `lien_image`)
	VALUES (NULL, 'Ordinateurs portable', '/images/laptops/laptops.jpg');
INSERT INTO `produit_catégorie` (`id_catégorie`, `nom`, `lien_image`) 
	VALUES (NULL, 'Souris', '/images/souris/souris.jpg');
INSERT INTO `produit_catégorie` (`id_catégorie`, `nom`, `lien_image`) 
	VALUES (NULL, 'Telephones', '/images/telephones/telephones.jpg');

INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `description`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES 
	(NULL, 'KFC Console', '666.99', 'KFC Console', 'KFC', '/images/consoles/kfc.jpg', '1'), 
	(NULL, 'Nintendo Switch', '500.9', 'Nintendo Switch', 'Nintendo', '/images/consoles/nintendoswitch.jpg', '1');
INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `description`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES
	(NULL, 'PS5', '450.99', 'PS5', 'PlayStation', '/images/consoles/ps5.jpg', 1),
	(NULL, 'Xbox series x', '469.99', 'Xbox series X', 'Microsoft', '/images/consoles/xbox.jpg', 1);
INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `description`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES 
	(NULL, 'Astro A20', '69.99', 'Astro A20', 'Astro', '/images/ecouteurs/Astro A20.jpg', '2'), 
	(NULL, 'Kotion Each G9000', '2.99', 'Kotion Each G9000 Over Ear Gaming Headphones with Mic and LED (Black/Blue)', 'Kotion', '/images/ecouteurs/Insmart.jpg', '2');
INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `description`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES 
	(NULL, 'LVL40 Gaming Headset for Nintendo Switch', '29.99', 'LVL40 Neon Blue and Neon Red Wired Stereo Gaming Headset for Nintendo Switch', 'LVL40', '/images/ecouteurs/LVL40Nintendo.jpg', '2'), 
	(NULL, 'SOMIC G951', '48.99', 'SOMIC G951 Pink Lovely Cat Shape Noise Cancelling Girl Gaming Headphones', 'Somic', '/images/ecouteurs/SOMIC G951.jpg', '2');

INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `description`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES 
	(NULL, 'LG 2706V', '1499.99', 'LG - Réfrigérateur côte à côte à ultragrande capacité (25,6 pi3)', 'LG', '/images/frigos/LG2706V.jpg', '3'), 
	(NULL, 'LG 22596S', '1299.99', 'LG - Réfrigérateur côte à côte à ultragrande capacité (25,6 pi3) avec distributeur d’eau et de glaçons', 'LG', '/images/frigos/LG22596S.jpg', '3');
INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `description`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES 
	(NULL, 'Samsung RF26J7510SR/AA', '1799.50', 'Réfrigérateur à portes françaises de 25,5 pi³ avec SpaceMax™', 'Samsung', '/images/frigos/SamsungRF2.jpg', '3'), 
	(NULL, 'Samsung RF25HMIDBSG/AA ', '2000.70', 'Réfrigérateur à portes françaises de 24,7 pi³ avec technologie Twin Cooling Plus™ en acier inoxydable noir', 'Samsung', '/images/frigos/SamsungRF28.jpg', '3');
	
INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `description`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES 
	(NULL, 'Acer aspire 5', '1549.99', 'Acer Aspire 5, 15.6\" Full HD, 8th Gen Intel Core i5-8250U, GeForce MX150, 8GB DDR4 Memory, 256GB SSD, A515-51G-515J ', 'Acer', '/images/laptops/acer-aspire5.jpg', '4'), 
	(NULL, 'Alienware Area51', '5000.99', 'Alienware Area-51 R5 Gaming Laptop - 7th Gen X-Series Intel 6-Core i7-7800X Processor up to 4.00 GHz, 64GB DDR4 Memory, 512GB SSD + 4TB Hard Drive, NVIDIA GeForce RTX 2080 8GB GDDR6, Windows 10 Home', 'Alienware', '/images/laptops/alien-ware-area51.jpg', '4');
INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `description`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES 
	(NULL, 'Macbook air', '3000.16', ' Apple MacBook Air 13.3\" Notebook, Apple Magical M1 Chip , 256 GB SSD, 8 GB Unified Memory, Gold ', 'Apple', '/images/laptops/macbook_air.jpg', '4'), 
	(NULL, 'MSI GF63', '1588.66', 'MSI GF63 Thin 9RCX-818 15.6\" Gaming Laptop, Thin Bezel, Intel Core i7-9750H, NVIDIA GeForce GTX1050ti, 8GB, 256GB NVMe SSD ', 'MSI', '/images/laptops/MSI-GF63.jpg', '4');

INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `description`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES 
	(NULL, 'FIYOO Pink Gaming Mouse', '49.99', 'Pink Gaming Mouse Silent Click, 7 Colors LED Backlit Optical Game Mice Ergonomic USB Wired Mice Compatible with Laptop PC, 7 Buttons, 4 Adjustable DPI', 'FIYOO', '/images/souris/FIYOO.jpg', '5'), 
	(NULL, 'Optical Spider', '99.99', 'real tarantula SPIDER inside lucite Optical USB 3D computer Mouse,very cool!!perfect for customized gift,gift mouse', 'Optical Spider', '/images/souris/OpticalSpider.jpg', '5');
INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `description`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES 
	(NULL, 'PICTEK Gaming Mouse', '42.99', 'PICTEK Gaming Mouse, [RGB Backlit] [7200 DPI] [8 Programmable Buttons] Gaming Mice, Wired Computer Mouses with Fire', 'PICTEK', '/images/souris/PICTEK.jpg', '5'), 
	(NULL, 'Razer DeathAdder Essential Gaming Mouse', '39.99', 'Razer DeathAdder Essential Gaming Mouse: 6400 DPI Optical Sensor - 5 Programmable Buttons - Rubber Side Grips - Classic Black ', 'Razor', '/images/souris/RazorMouse.jpg', '5');

INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `description`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES 
	(NULL, 'Samsung Galaxy Note 7', '850.00', 'Samsung’s Galaxy Note series is one of the most iconic smartphone lines of all time. Not only do they come with great specifications and features for power users.', 'Samsung', '/images/telephones/GalaxyNote7.jpg', '6'), 
	(NULL, 'Samsung Galaxy S21', '1399.99', 'Put the future in the palm of your hand with the Samsung Galaxy S21 5G. The adaptive 120Hz display and an all-day intelligent battery add to an amazing experience.', 'Samsung', '/images/telephones/galaxys21.jpg', '6');
INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `description`, `marque`, `image`, `produit_catégorie_id_catégorie`) VALUES 
	(NULL, 'Iphone 12', '1299.99', 'Let the fun begin with the iPhone 12. It features the powerful A14 Bionic chip, 5G to download and stream high-quality video. Other features include incredible low-light photography.', 'Apple', '/images/telephones/iphone-12.png', '6'), 
	(NULL, 'Nokia 3310', '9999.99', 'Téléphone indestructible. Veuillez ne pas l\'échapper, sinon la Terre va être détruite et le téléphone restera intact. Ce téléphone fonctionnera plus longtemps que vous et vos enfants combiné.', 'Nokia', '/images/telephones/nokia3310.jpg', '6');

INSERT INTO `magasin` (`id_magasin`, `nom`, `adresse`, `ville`, `code_postale`, `tel`) VALUES 
	(NULL, 'Centre-Principal', '10555 avenue du Bois-de-Boulogne', 'Montréal', 'H4N1L4', '5143323000'), 
	(NULL, 'Sainte-Marie-aux-Mines ', '1015 Rue Du Marché Central', 'Montreal', 'H4N3J8', '5143811251');
INSERT INTO `magasin` (`id_magasin`, `nom`, `adresse`, `ville`, `code_postale`, `tel`) VALUES 
	(NULL, 'l\'Emmental', '4777 Pierre-de Coubertin Avenue', 'Montreal', 'H1V1B3', '5148683000'), 
	(NULL, 'Porte de l\'enfer', '9555 Boulevard du Golf', 'Anjou', 'H1J2Y2', '5143535353') ;
	
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('1', '1', '81'), ('1', '2', '29'), ('1', '3', '18'), ('1', '4', '58');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('2', '1', '79'), ('2', '2', '93'), ('2', '3', '80'), ('2', '4', '41');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('3', '1', '13'), ('3', '2', '32'), ('3', '3', '77'), ('3', '4', '75');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('4', '1', '77'), ('4', '2', '66'), ('4', '3', '9'), ('4', '4', '60');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('5', '1', '58'), ('5', '2', '95'), ('5', '3', '68'), ('5', '4', '95');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('6', '1', '62'), ('6', '2', '46'), ('6', '3', '82'), ('6', '4', '80');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('7', '1', '89'), ('7', '2', '25'), ('7', '3', '33'), ('7', '4', '82');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('8', '1', '97'), ('8', '2', '9'), ('8', '3', '29'), ('8', '4', '43');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('9', '1', '34'), ('9', '2', '15'), ('9', '3', '61'), ('9', '4', '68');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('10', '1', '65'), ('10', '2', '79'), ('10', '3', '35'), ('10', '4', '61');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('11', '1', '69'), ('11', '2', '76'), ('11', '3', '38'), ('11', '4', '50');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('12', '1', '21'), ('12', '2', '43'), ('12', '3', '89'), ('12', '4', '1');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('13', '1', '79'), ('13', '2', '52'), ('13', '3', '59'), ('13', '4', '19');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('14', '1', '32'), ('14', '2', '20'), ('14', '3', '50'), ('14', '4', '35');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('15', '1', '47'), ('15', '2', '38'), ('15', '3', '68'), ('15', '4', '54');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('16', '1', '59'), ('16', '2', '98'), ('16', '3', '44'), ('16', '4', '4');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('17', '1', '3'), ('17', '2', '33'), ('17', '3', '41'), ('17', '4', '61');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('18', '1', '5'), ('18', '2', '40'), ('18', '3', '94'), ('18', '4', '78');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('19', '1', '60'), ('19', '2', '6'), ('19', '3', '26'), ('19', '4', '86');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('20', '1', '8'), ('20', '2', '32'), ('20', '3', '58'), ('20', '4', '45');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('21', '1', '36'), ('21', '2', '32'), ('21', '3', '3'), ('21', '4', '44');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('22', '1', '49'), ('22', '2', '9'), ('22', '3', '11'), ('22', '4', '13');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('23', '1', '65'), ('23', '2', '25'), ('23', '3', '21'), ('23', '4', '27');
INSERT INTO `inventaire` (`produit_id_produit`, `magasin_id_magasin`, `nombre`) VALUES
	('24', '1', '10'), ('24', '2', '80'), ('24', '3', '1'), ('24', '4', '71');