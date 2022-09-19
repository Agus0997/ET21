var express = require('express');
var router = express.Router();
var config = require("../config/config");
var jwt = require("jsonwebtoken");
const db = require("../models");
const { visita_guiada } = require('../models');
const { turno} = require('../models');
const turno = db.visita_guiada;

  
  
  router.get('/:id',async function(req, res, next) {
  
    let visita_guiada = await visita_guiada.findOne({
      where : {
        id : req.params.id
      },
      include: {
        model: db.id_museo
      },
      include: {
        model: db.nombre
      },
      include: {
        model: db.descripcion
      },
      include: {
        model: db.guia
      },
      include: {
        model: db.capacidad
      },
      include: {
        model: db.idioma
      }
    });
    res.send({
      status : true,
      response : visita_guiada
    });
    
  });
  router.put('/:id',async function(req, res, next) {
  
    let visita = await visita_guiada.findOne({
      where : {
        id : req.params.id
      },
      include: {
        model: db.id_museo
      },
      include: {
        model: db.nombre
      },
      include: {
        model: db.descripcion
      },
      include: {
        model: db.guia
      },
      include: {
        model: db.capacidad
      },
      include: {
        model: db.idioma
      }
    });
    res.send({
      status : true,
      response : visita
    });
    
  });

module.exports = router;
