var express = require('express');
var app = express();
var fs = require('fs');
var bodyParser = require('body-parser');
var path = require('path');

app.use('/', express.static(__dirname + '/dist'));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var port = process.env.PORT || 8080;

// Set up an Router for our API
var api = express.Router();              

api.get('/', function(req, res) {
  res.json({ message: 'hooray! welcome to our api!' });   
});

// Register our routes and have them prefixed with /api
app.use('/api', api);

// Start the server
app.listen(port);
console.log('Server started on port: ' + port);
