var mysql = require('mysql2');

var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'Pikachu22@',
    database : 'melancia'
});

connection.connect(function(err) {
    if (err) throw err;
    console.log('Conectado ao BD com sucesso!')
});



module.exports = connection;