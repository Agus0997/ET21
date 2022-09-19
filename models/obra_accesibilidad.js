module.exports = (sequelize, Sequelize) => {

    const obra_accesibilidad = sequelize.define("obra_accesibilidad", {
        id_obra: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        id_tipo_accesibilidad : {
            type: Sequelize.INTEGER,
            primaryKey: true,
        },
        accesibilidad : {
            type: Sequelize.STRING
        }
    });
    return obra_accesibilidad;
};