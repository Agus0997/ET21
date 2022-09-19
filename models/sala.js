//const { FOREIGNKEYS } = require("sequelize/types/lib/query-types");

module.exports = (sequelize, Sequelize) => {

    const sala = sequelize.define("sala", {
        id_sala: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        id_museo: {
            type: Sequelize.INTEGER
        },
        descripcion: {
            type: Sequelize.STRING
        },
    });
    return sala;
};