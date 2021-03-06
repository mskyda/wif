var express = require('express'),
	api = require('./private/routes'),
	bodyParser = require('body-parser'),
	fs = require('fs'),
	http = require('http'),
	https = require('https'),
	forceSSL = require('express-force-ssl'),
	credentials = {
		key : fs.readFileSync('./private/ssl/key.key', 'utf8'),
		cert: fs.readFileSync('./private/ssl/crt.crt', 'utf8'),
		ca  : [fs.readFileSync('./private/ssl/crt_int.crt', 'utf8')]
	},
	app = express(),
	httpServer = http.createServer(app),
	httpsServer = https.createServer(credentials, app),
	wwwRedirect = function(req, res, next){
		if(req.headers.host.slice(0, 4) === 'www.'){

			var newHost = req.headers.host.slice(4);

			return res.redirect(301, req.protocol + '://' + newHost + req.originalUrl);

		}
		next();
	};

// Todo: config.js

app.set('trust proxy', true);

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(forceSSL);
app.use(wwwRedirect);
app.use(express.static('./public/' + (process.env.WIF_MODE || 'dev')));

app.get('/api/spots', api.Spots.get);
app.get('/api/spots/:id', api.Spots.get);
app.post('/api/spots', api.Spots.post);
app.put('/api/spots/:id', api.Spots.put);
app.delete('/api/spots/:id', api.Spots.delete);
app.post('/api/auth', api.Auth.init);

app.use(function(req, res) { // 404
	res.status(404);
	// eslint-disable-next-line no-console
	console.log('Error: Not found URL ', req.url);
	res.send('<h1>404: Page not Found</h1>');
});

app.use(function(err, req, res) { // error
	res.status(err.status || 500);
	// eslint-disable-next-line no-console
	console.log('Error: ', res.statusCode, err.message);
	res.send('<h1>' + err.status + ': Internal Server Error</h1>');
});

var portHTTP = process.env.PORT_HTTP || 8080,
	portHTTPS = process.env.PORT_HTTPS || 8443;

httpServer.listen(portHTTP, function(){
	// eslint-disable-next-line no-console
	console.log('Success: HTTP listening on port ' + portHTTP);
});
httpsServer.listen(portHTTPS, function(){
	// eslint-disable-next-line no-console
	console.log('Success: HTTPS listening on port ' + portHTTPS);
});