// index.js
const express = require('express');
const bodyParser = require('body-parser');
var cors = require('cors');

const app = express();
app.use(bodyParser.json());
app.use(cors());

var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";

app.post('/update', (req, res) => {
    MongoClient.connect(url, function(err, db) {
      if (err) throw err;
      var dbo = db.db("sdb");
      req.body.epoch = Math.floor(new Date() / 1000);
      dbo.collection("samples").insertOne(req.body, function(err, res) {
        if (err) throw err;
        console.log(req.body);
        db.close();
      });
    });

    res.sendStatus(200);
});

app.post('/log', (req, res) => {
    MongoClient.connect(url, function(err, db) {
      if (err) throw err;
      var dbo = db.db("sdb");
      req.body.epoch = Math.floor(new Date() / 1000);
      dbo.collection("log").insertOne(req.body, function(err, res) {
        if (err) throw err;
        console.log(req.body);
        db.close();
      });
    });

    res.sendStatus(200);
});

app.get('/data', function(req, res) {
  MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("sdb");
      var epoch = Math.floor(new Date() / 1000);
      dbo.collection("samples").find({ epoch: { $gt: epoch - 100*60*60*6 } }).toArray(function(err, result) {
      if (err) throw err;
      console.log(result);
      res.json(result);
      db.close();
    });
  });
});

app.get('/log', function(req, res) {
  MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("sdb");
      var epoch = Math.floor(new Date() / 1000);
      dbo.collection("log").find({ epoch: { $gt: epoch - 100*60*60*6 } }).toArray(function(err, result) {
      if (err) throw err;
      console.log(result);
      res.json(result);
      db.close();
    });
  });
});

app.listen(8080, () => console.log(`Started server at http://localhost:8080!`));
