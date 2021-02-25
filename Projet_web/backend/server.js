var express = require('express');
var http = require('http');
var mysql = require('mysql');
var app = express();
var session = require('express-session');
var path = require('path');
var bodyParser = require('body-parser');
var dateFormat = require('dateformat');
const { Console } = require('console');
var now = new Date();
const siteTitle = "To Spite The Amish";
const baseURL = "http://localhost:4000";

/**
* connect to server
*/
var server = app.listen(4000, function () {
    console.log("serveur fonctionne sur 4000");
});

app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

app.use(bodyParser.urlencoded({ extended: true }));
module.exports = app;
app.use(bodyParser.json());
app.use( express.static( "views" ) );

app.set('view engine', 'ejs');

app.use('/js', express.static(__dirname + '/node_modules/bootstrap/dist/js'));
app.use('/js', express.static(__dirname + '/node_modules/tether/dist/js'));
app.use('/js', express.static(__dirname + '/node_modules/jquery/dist'));
app.use('/css', express.static(__dirname + '/node_modules/bootstrap/dist/css'));
app.use('/css', express.static(__dirname + '/style'));


/**
* connexion à la BD
*/
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "db_site",
    multipleStatements: true
});

/*
pour générer la page principale
*/
app.get('/', function (req, res) {
    con.query("SELECT * FROM produit_catégorie ORDER BY id_catégorie ASC", function (
        err, result) {
        res.render('pages/index', {
            siteTitle: siteTitle,
            pageTitle: "Page Principale",
            items: result
        });
    });
});

/*
pour generer la page de connexion
*/
app.get('/connexion', function (req, res) {
    con.query("SELECT * FROM produit_catégorie ORDER BY id_catégorie ASC", function (
        err, result) {
        res.render('pages/connexion.ejs', {
            siteTitle: siteTitle,
            pageTitle: "Connexion",
            items: result
        });
    });
});

/*
pour generer la page de categorie
*/
app.get('/categorie/:id', function (req, res) {
    con.query("SELECT * FROM produit WHERE produit_catégorie_id_catégorie = (SELECT id_catégorie FROM produit_catégorie WHERE nom = ?); "+
    "SELECT * FROM produit_catégorie ORDER BY id_catégorie ASC", [req.params.id],
        function (err, result) {
            res.render('pages/categorie.ejs', {
                siteTitle: siteTitle,
                pageTitle: "Categorie",
                outils: result[0],
                items: result[1]
            });
        });
});

/*
pour generer la page de produit
*/
app.get('/produit/:id', function (req, res) {
    con.query("SELECT id_produit, image, marque, nom, prix, description FROM produit WHERE nom = ?;" +
    " SELECT b.nombre, c.nom, c.adresse, c.ville, c.code_postale, c.tel FROM produit a, inventaire b, magasin c WHERE a.id_produit = b.produit_id_produit AND a.nom = ? AND b.magasin_id_magasin = c.id_magasin;"+
    " SELECT * FROM produit_catégorie ORDER BY id_catégorie ASC;", [req.params.id, req.params.id],
        function (err, result) {
            res.render('pages/produit.ejs', {
                siteTitle: siteTitle,
                pageTitle: "Produit",
                item: result[0],
                outils: result[1],
                items: result[2],
            });
        });
});
/*
pour ajouter un produit au panier
*/

app.post('/produit/:id', function (req, res) {
    /* get the record base on ID
    */

    var quantite = req.body.quantity;
    var id_produit = req.body.id_produit;
    if(req.session.loggedin){
        con.query("INSERT INTO panier (produit_id_produit, utilisateur_id_utilisateur, nombre) VALUES (?, ?, ?);", [id_produit, req.session.id_utilisateur, quantite], 
        function (err, result) {
            if (err) throw err;
            res.status(204).send();
        });
    }else{
        res.status(204).send();
    }
});

/*
pour generer la page de panier
*/
app.get('/panier', function (req, res) {
        con.query("SELECT * FROM produit_catégorie ORDER BY id_catégorie ASC;" + 
        " SELECT panier.nombre, produit.image, produit.nom, produit.marque FROM panier, produit WHERE utilisateur_id_utilisateur = ? AND panier.produit_id_produit = produit.id_produit;", 
        [req.session.id_utilisateur],

        function (err, result) {
            res.render('pages/panier.ejs', {
                siteTitle: siteTitle,
                pageTitle: "Panier",
                items: result[0],
                outils: result[1],
                connexion: req.session.loggedin
            });
        });
});

/*
pour generer la page de creation de compte
*/
app.get('/creation', function (req, res) {
    con.query("SELECT * FROM produit_catégorie ORDER BY id_catégorie ASC",
        function (err, result) {
            res.render('pages/creation.ejs', {
                siteTitle: siteTitle,
                pageTitle: "Creation de compte",
                items: result
            });
        });
});

/**
 * Reception de connexion et mise en memoire
 */
app.post('/connexion', function(req, res) {
    var username = req.body.username;
    var password = req.body.password;
    if (username && password) {
        con.query('SELECT * FROM utilisateur WHERE email = ? AND mot_de_passe = ?', [username, password], function(error, results, fields) {
            if (results.length > 0) {
                req.session.loggedin = true;
                req.session.username = username;
                req.session.id_utilisateur = results[0].id_utilisateur;
                res.redirect('/panier');
            } else {
                res.status(204).send();
            }
        });
    } else {
        res.status(204).send();
    }
});

/**
 * get methode : poure fermer la session de l'utilisateur
 */
app.get('/logout',  function (req, res, next)  {
    if (req.session.loggedin) {
      // delete session object
      req.session.destroy(function (err) {
        if (err) {
           next(err);
        }
              
        res.status(204).send();
        });
    } else {
        
        res.status(204).send();
        
    }
  });

/**
 * post methode to date : pour ajouter un utilisateur a la BD
 */
app.post('/creation', function (req,res){
    /**
     * get the record base on ID
     */
    var postable = req.body.Postale.split(" ").join("");
    var query = "INSERT INTO utilisateur(email, tel, nom, prenom, addresse, ville, code_postale, mot_de_passe) VALUES(";
        query += " '"+req.body.email+"',"; 
        query += " '"+req.body.tel+"',"; 
        query += " '"+req.body.Nom+"',"; 
        query += " '"+req.body.Prenom+"',";
        query += " '"+req.body.adresse+"',"; 
        query += " '"+req.body.ville+"',";
        query += " '"+postable+"',";
        query += " '"+req.body.password+"')";
       
    
    con.query(query, function(err,result){
        if(err) throw err;
        res.redirect(baseURL);
    });
});