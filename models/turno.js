module.exports = (sequelize, Sequelize) => {

    const turno = sequelize.define("turno", {
        id_turno: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        estado: {
            type: Sequelize.STRING
        },
        hora: {
            type: Sequelize.DATE
        },
        fecha: {
            type: Sequelize.DATE
        },
    });
    return turno;
};