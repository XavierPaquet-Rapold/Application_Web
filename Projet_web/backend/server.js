var express = require('express');
var http = require('http');
var mysql = require('mysql');
var app = express();
var bodyParser = require('body-parser');
var dateFormat = require('dateformat');
var now = new Date();
const siteTitle = "Simple application";
const baseURL = "http://localhost:4000";

/**
* connect to server
*/
var server = app.listen(4000, function () {
    console.log("serveur fonctionne sur 4000... ENFIN!!! ");
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
    database: "electrolux"
});


app.get('/', function (req, res) {
    con.query("", function (
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
    con.query("", function (
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
app.get('/categorie', function (req, res) {
    con.query("",
        function (err, result) {
            res.render('pages/categorie.ejs', {
                siteTitle: siteTitle,
                pageTitle: "Categorie",
                items: result
            });
        });
});

/*
pour generer la page de produit
*/
app.get('/produit', function (req, res) {
    con.query("",
        function (err, result) {
            res.render('pages/produit.ejs', {
                siteTitle: siteTitle,
                pageTitle: "Produit",
                items: result
            });
        });
});

/*
pour generer la page de panier
*/
app.get('/panier', function (req, res) {
    con.query("",
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
    con.query("",
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
    var query = "INSERT INTO utilisateur(email,tel,nom,prenom,addresse, ville, code_postale, mot_de_passe) VALUES(";
        query += " '"+req.body.email+"',"; 
        query += " '"+req.body.tel+"',"; 
        query += " '"+req.body.Nom+"',"; 
        query += " '"+req.body.Prenom+"',";
        query += " '"+req.body.adresse+"',"; 
        query += " '"+req.body.ville+"',";
        query += " '"+req.body.Postale+"',";
        query += " '"+req.body.password+"')";
       
    
    con.query(query, function(err,result){
        if(err) throw err;
        res.redirect(baseURL);
    });
});
