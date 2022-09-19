module.exports = (sequelize, Sequelize) => {

    const museo = sequelize.define("museo", {
        id_museo: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        nombre: {
            type: Sequelize.STRING(200)
        },
        ubicacion: {
            type: Sequelize.STRING(60)
        },
        descripcion: {
            type: Sequelize.TEXT
        },
    });
    return museo;
};