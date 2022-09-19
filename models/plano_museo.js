module.exports = (sequelize, Sequelize) => {

    const plano_museo = sequelize.define("plano_museo", {
        id_plano_museo: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        plano: {
            type: Sequelize.STRING(200)
        },

    });
    return plano_museo ;
};