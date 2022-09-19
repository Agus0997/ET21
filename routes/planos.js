var express = require('express');
var router = express.Router();
const db = require("../models");
const planos = db.plano_museo;
router.get('/',async function(req, res, next) {
    let resultados = await planos.findAll({
      include: {
        model: db.id_museo
      }
    });
    res.send({
      status : true,
    });
  });
  
  
  router.get('/:id',async function(req, res, next) {
  
    let personajeEncontrado = await planos.findOne({
      where : {
        id : req.params.id
      },
      include: {
        model: db.plano
      }
    });
    res.send({
      status : true,
    });
    
  });

module.exports = router;