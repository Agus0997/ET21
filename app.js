var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var cors = require('cors');
var jwt = require("jsonwebtoken");
const db = require("./models");
var config = require("./config/config");

var indexRouter = require('./routes/index');
var visitasRouter = require('./routes/visitas');
var museoRouter = require('./routes/museo');
var museoRouter = require('./routes/planos');
var app = express();

app.use(cors());

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/visitas', visitasRouter);
app.use('/museo', museoRouter);
app.use('/planos', planosRouter);

module.exports = app;
