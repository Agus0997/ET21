module.exports = (sequelize, Sequelize) => {

    const obra = sequelize.define("obra", {
        id_obra: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        descripcion: {
            type: Sequelize.STRING
        },
        imagen: {
            type: Sequelize.STRING(200)
        },
        fecha: {
            type: Sequelize.DATE
        }
    });
    return obra;
};