const express = require('express');
const mysql = require('mysql');

//create connection
const db = mysql.createConnection({
    host:'localhost',
    user:'root',
    password: '',
    database: 'nodemysql'
});

//connect
db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('MySql Connected...')
});

const app = express();

// create database
// app.get('/createdb', (req, res) => {
//     let sql = 'CREATE DATABASE nodemysql;';
//     db.query(sql, (err, result) => {
//         if(err) throw err;
//         console.log(result);
//         res.send('database created...')
//     })
// })

//route for create booking
app.get('/api/booking',(req, res) => {
    var booking = req;
    console.log(booking);
    //db.query(`INSERT INTO appointments VALUES () `)
})

//General Query returns (Errors, Result, Fields)
app.get('/querydb', (req, res) => {
    db.query('SELECT * FROM employees', (error, results, fields) => {
        if (error) {
            throw error;
        }
        console.log(results[0]);
        res.send('database Queried...')
    });
});

app.listen('3000', () => {
    console.log('server started on port 3000')
});
