var express = require('express');
var http = require('http');
var mysql = require('mysql');
var app = express();
var bodyParser = require('body-parser');
var dateFormat = require('dateformat');
var now = new Date();
const siteTitle = "To Spite The Amish";
const baseURL = "http://localhost:4000";
/**
* connect to server
*/
var server = app.listen(4000, function () {
    console.log("serveur fonctionne sur 4000");
});

app.use(bodyParser.urlencoded({ extended: true }));
module.exports = app;

app.use( express.static( "views" ) );

app.set('view engine', 'ejs');

app.use('/js', express.static(__dirname + '/node_modules/bootstrap/dist/js'));
app.use('/js', express.static(__dirname + '/node_modules/tether/dist/js'));
app.use('/js', express.static(__dirname + '/node_modules/jquery/dist'));
app.use('/css', express.static(__dirname + '/node_modules/bootstrap/dist/css'));

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
    con.query("SELECT * FROM produit WHERE produit_catégorie_id_catégorie = (SELECT id_catégorie FROM produit_catégorie WHERE nom = '" + req.params.id + "'); "+
    "SELECT * FROM produit_catégorie ORDER BY id_catégorie ASC", [1,2],
        function (err, result) {
            console.log(result);
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
    con.query("SELECT id_produit, image, marque, nom, prix, description FROM produit WHERE nom = '" + req.params.id + "'; SELECT b.nombre, c.nom, c.adresse, c.ville, c.code_postale, c.tel FROM produit a, inventaire b, magasin c WHERE a.id_produit = b.produit_id_produit AND a.nom = '" + req.params.id + "' AND b.magasin_id_magasin = c.id_magasin; SELECT * FROM produit_catégorie ORDER BY id_catégorie ASC;",[1,2,3], 
        function (err, result) {
            res.render('pages/produit.ejs', {
                siteTitle: siteTitle,
                pageTitle: "Produit",
                item: result[0],
                outils: result[1],
                items: result[2]
            });
        });
});
/*
pour ajouter un produit au panier
*/

app.post('/produit/:id', function (req, res) {
    /* get the record base on ID
    */
    var query = "INSERT INTO panier (produit_id_produit) VALUES (";
    query += " '" + req.params.id +"');";
    con.query(query, function (err, result) {
        if (err) throw err;
        res.redirect(baseURL);
    });
});

/*
pour generer la page de panier
*/
app.get('/panier', function (req, res) {
    con.query("SELECT * FROM produit_catégorie ORDER BY id_catégorie ASC",
        function (err, result) {
            res.render('pages/panier.ejs', {
                siteTitle: siteTitle,
                pageTitle: "Panier",
                items: result
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
