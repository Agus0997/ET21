module.exports = (sequelize, Sequelize) => {

    const tipo_accesibilidad = sequelize.define("tipo_accesibilidad", {
        id_tipo_accesibilidad: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        descripcion: {
            type: Sequelize.STRING
        },
    });
    return tipo_accesibilidad;
};