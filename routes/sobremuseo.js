var express = require('express');
var router = express.Router();
const db = require("../models");
const museos = db.Museo;
/* GET users listing. */
router.get('/',async function(req, res, next) {
    let Listademuseos = await museos.findAll({
      include: {
        model: db.nombre
      }
    });
    res.send({
      status : true,
      response : Listademuseos
    });
  });
  router.get('/:id',async function(req, res, next) {

    let museo_elegido = await museos.findOne({
      where : {
        id : req.params.id
      },
      include: {
        model: db.nombre
      },
      include: {
        model: db.ubicacion
      },
      include: {
        model: db.descripcion
      },
      include: {
        model: db.precio
      }
    });
    res.send({
      status : true,
      response : museo_elegido
    });
    
  });
  

module.exports = router;