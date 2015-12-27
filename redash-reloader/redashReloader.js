var casper = require('casper').create();

var opts = casper.cli.options;
var scheme = opts.scheme || 'http';
var host = opts.host || 'localhost';
var port = opts.port || '9001';
var email = opts.email || 'admin';
var password = opts.password || 'admin';
var queryId = opts.query_id;

if (!queryId || queryId.length <= 0) {
  console.error('query_id is required');
  process.exit(1);
}

var url = scheme + '://' + host + ':' + port + '/queries/' + queryId;
var loginParams = {
  email: email,
  password: password
};

casper.start(url, function () {
  this.fill('form', loginParams, true);
});

casper.then(function () {
  this.click('button[title="Refresh Dataset"]');
});

casper.run();
