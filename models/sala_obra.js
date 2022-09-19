module.exports = (sequelize, Sequelize) => {

    const sala_obra = sequelize.define("sala_obra", {
        id_sala_obra : {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
    
    });
    return sala_obra;
};