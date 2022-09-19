const Sequelize = require("sequelize");
const dbConfig = require("../config/config.js");

const sequelize = new Sequelize(
    dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD,
    {
        host: dbConfig.HOST,
        dialect: dbConfig.dialect,
        user: dbConfig.USER,
        password: dbConfig.PASSWORD,
        database: dbConfig.DB,
        dialect: dbConfig.dialect
    });

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.autor = require("./autor")(sequelize, Sequelize);
db.museo = require("./museo")(sequelize, Sequelize);
db.obra_accesibilidad = require("./obra_accesibilidad")(sequelize, Sequelize);
db.obra = require("./obra")(sequelize, Sequelize);
db.plano_museo = require("./plano_museo")(sequelize, Sequelize);
db.sala_obra = require("./sala_obra")(sequelize, Sequelize);
db.sala = require("./sala")(sequelize, Sequelize);
db.tipo_accesibilidad = require("./tipo_accesibilidad")(sequelize, Sequelize);
db.tema = require("./tema")(sequelize, Sequelize);
db.turno = require("./turno")(sequelize, Sequelize);
db.usuarios = require("./usuarios")(sequelize, Sequelize);
db.visita_guiada = require("./visita_guiada")(sequelize, Sequelize);

db.museo.hasMany(db.plano_museo,{
    foreignKey : 'id_museo',
});

db.museo.hasMany(db.sala,{
    foreignKey : 'id_museo',
});

db.museo.hasMany(db.visita_guiada,{
    foreignKey : 'id_museo',
});

db.visita_guiada.hasMany(db.turno,{
    foreignKey : 'id_visita',
});

db.usuarios.hasMany(db.turno,{
    foreignKey : 'id_usuario',
});

db.sala.hasMany(db.sala_obra,{
    foreignKey : 'id_sala',
});


db.sala_obra.hasMany(db.obra,{
    foreignKey : 'id_obra',
});

db.obra.hasMany(db.obra_accesibilidad,{
    foreignKey : 'id_obra',
});

db.tema.hasMany(db.obra,{
    foreignKey : 'id_tema',
});


db.autor.hasMany(db.obra,{
    foreignKey : 'id_autor',
});

db.tipo_accesibilidad.hasMany(db.obra_accesibilidad,{
    foreignKey : 'id_tipo_accesibilidad',
});


db.tipo_accesibilidad.hasMany(db.usuarios,{
    foreignKey : 'id_tipo_accesibilidad',
});

module.exports = db;
