module.exports = (sequelize, Sequelize) => {

    const tema = sequelize.define("tema", {
        id_tema: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        descripcion: {
            type: Sequelize.STRING
        },
    });
    return tema;
};