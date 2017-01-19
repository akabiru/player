var jsonServer = require('json-server');

// Return an Express server
var server = jsonServer.create();

// Set default middleware (logger, static, cors and no-cache)
server.use(jsonServer.defaults());

var router = jsonServer.router('db.json');
server.use(router);

console.log('Magic happens on port 4000');
server.listen(4000);