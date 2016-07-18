var express = require('express');
var app = express();
var fs = require('fs');
var bodyParser = require('body-parser');
var path = require('path');
var exec = require('child_process').exec;

app.use('/', express.static(__dirname + '/dist'));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var port = process.env.PORT || 8888;

// Set up an Router for our API
var api = express.Router();              

api.get('/speeches/', function(req, res) {
  exec('cd ~/torch-rnn/ && th sample.lua -length 1500 -gpu -1 -temperature 0.5 -checkpoint /opt/trumpgen/training/checkpoint/checkpoint.t7',
    function (error, stdout, stderr) {
      res.header("Access-Control-Allow-Origin", "*");
      res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
      
      if (stderr) {
        res.status(500).send('Speech could not be generated');
      }
      else {
        res.json({ speech: stdout });
      }
  });
});

// Register our routes and have them prefixed with /api
app.use('/api', api);

// Start the server
app.listen(port);
console.log('Server started on port: ' + port);
