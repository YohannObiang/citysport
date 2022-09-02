// Creation de l'application Express
var express = require("express")
var app = express()

// Connecter Node JS a mysql
var mysql = require("mysql")

app.use(express.json())

// Creation d'une connexion effective a mysql
const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'citysport'
})

// Etat de la connexion
con.connect((err)=>{
    if(err)
    {
        console.log(err)
    }else{
        console.log('connexion reussie');
    }
})


app.get('/', (req, res)=>{
    res.send('Hello');
})

// Lister les differents modeles Chaussures

app.get('/api/get', (req, res)=>{
    
    con.query('SELECT * FROM chaussures',(err,result)=>{
        if(err) res.status(500).send(err)
        
        res.status(200).json(result)
    })
})

// Lister les differentes marques de chaussures
app.get('/api/get/:id', (req, res)=>{
    
    con.query('SELECT * FROM chaussures WHERE idChaussure=?',[req.params.idChaussure],(err,result)=>{
        if(err) res.status(500).send(err)
        
        res.status(200).json(result)
    })
})

// Attributs de chaque chaussures
app.post('/api/post', (req, res)=>{
    const idMarque = req.body.idMarque;
    const taille = req.body.taille;
    const couleur = req.body.couleur;
    const prix = req.body.prix;
    const modele = req.body.modele;

// Ajout des modeles de chaussures   
   
    con.query('INSERT INTO chaussures VALUES(NULL,?,?,?,?,?)',[idMarque,taille,couleur,prix,modele],(err,result)=>{
        if(err)
    {
        console.log(err)
    }else{
        res.send('Modele de chaussure ajoute');
    }
    })
})

// Attributs de chaque marques
app.post('/api/marques/post', (req, res)=>{
    const marque = req.body.marque;
    const logo = req.body.logo;

// Ajout des marques de chaussures   
    con.query('INSERT INTO marques VALUES(NULL,?,?)',[marque,logo],(err,result)=>{
        if(err)
    {
        console.log(err)
    }else{
        res.send('Marque ajoutee');
    }
    })
})
// Definition du port a ecouter
app.listen(3000, (err)=>{
    if(err)
    {
        console.log(err)
    }else{
        console.log('Sur le port 3000');
    }
})