# Application_Web
<h1> Boutique d’appareils électronique </h1>

<h2>Description:</h2>

    Barre de navigation: logo, menu déroulant avec les différentes catégories, nom du site, et des actions selon si l’utilisateur est connecté ou non: 

    Déconnecté: lien vers les pages de connexion et de création de compte. 

    Connecté:  menu déroulant de profil avec un lien vers le panier et pour se déconnecter 

    Page principale: lien vers les différentes catégories de produits (console, téléphone, ordinateur portable, souris, écouteurs, frigos connectés) avec leur photo et leur nom 

    Page de catégorie sélectionnée: liste des différents produits avec image, prix, nom 

    Page de produit sélectionné: nom, marque, prix, description, quantité à mettre dans le panier et bouton pour mettre dans le panier(si connecté), tableau de disponibilité dans magasin 

    Page de connexion: nom d’utilisateur, mot de passe, lien vers la création de compte 

    Page de création de comptes: prénom, nom, courriel, mot de passe, téléphone, adresse, ville, code postal 

    Page de panier: si l’utilisateur est connecté et qu’il y a quelque chose dans son panier, affichage dans une table l’image, le nom, la marque, le nombre, le prix unitaire, le prix total et de options pour chacun des produits. 

    Actions: modifier le nombre du produit et enlever le produit du panier. 

    Fin du tableau: Affichage du prix total du panier sans les taxes 

    Base de données: voir l’image (désolé pour la qualité, j’ai importé l’image dans un autre document si vous voulez une meilleure qualité) 

<h2>Résumé: </h2>

    Page principale: Cette page permet à l’utilisateur d’accéder aux 6 différentes catégories sois console, téléphone, ordinateur portable, souris, écouteurs ou frigidaires. Quand l’utilisateur sélectionnera une des catégories, il sera redirigé vers la page de la catégorie sélectionnée. 

    Page de catégorie sélectionnée: Cette page affichera tous les différents produits correspondant à leur catégorie respective. Une image de chaque produit sera présente sur la page, ainsi que le nom et le prix des produits. En cliquant sur un produit, l’utilisateur sera redirigé vers la page du produit. 

    Page de produit sélectionnée: Cette page contient une image du produit sélectionné, le nom du produit, son prix et dans quel magasin il est disponible. Si l’utilisateur est connecté, il y a un menu déroulant pour le nombre de produit à mettre dans le panier et un bouton qui permet de mettre le produit dans le panier de l’utilisateur, en cliquant sur le bouton l’utilisateur ne sera pas redirigé à la page de panier, mais le produit sera rajouté au panier.  

    Page de connexion: Cette page affichera le menu de connexion pour le client. L’utilisateur pourra entrer son adresse courriel ainsi que son mot de passe pour avoir accès à son panier de produits. Si l’utilisateur n’a pas de compte de connexion, il pourra cliquer sur un bouton de création de comptes et être redirigé vers la page respective. 

    Page de création de comptes : Cette page affichera le menu pour que l’utilisateur puisse se créer un compte. Les clients pourront y accéder à l’aide d’un bouton, qui se trouve dans la page connexion. Il aura le choix de se faire un compte pour accélérer le processus de l’achat et ainsi avoir l’accès au panier. 

    Page de panier: Cette page aura le panier du client, celui-ci contiendra tous les achats qui vont se faire dans le magasin pour que le client puisse continuer à magasiner sans perdre les articles désirés. Les produits présents dans le panier seront sauvegardés dans la base de données, donc quand l’utilisateur fermera sa session, il ne perdra pas les produits dans le panier. 

    Dans la barre de navigation, qui sera la même pour tout le site, elle change selon si l’utilisateur est connecté ou non. 

    Si l’utilisateur n’est pas connecté: lien vers les pages de connexion et de création de compte. 

    Si l’utilisateur est connecté:  menu déroulant de profil avec un lien vers le panier et pour se déconnecter 

<h2>Futur projets pour le site web:</h2>

    * Ajout de AJAX pour vérifier les informations envoyés par le client au niveau client et pouvoir envoyer des alertes s’il y a une erreur au niveau serveur pour mettre le client au courrant des problèmes. 

    * Insertion des modules de paiement dans la page panier pour que le client puisse acheter 

    * Insertion d’un module Google Maps pour les adresses des magasins 

    * Vérification du courriel de l’utilisateur 

    * Mettre un vérificateur d’adresse et d’un input pour faciliter l’entrée d’une adresse 

    * Mettre en place des mesures pour sécuriser les mots de passe (salting et haching) 

    * Essayer de mettre en place une façon de garder l’utilisateur en ligne lorsqu’il quitte le site. 
