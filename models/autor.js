module.exports = (sequelize, Sequelize) => {

    const autor = sequelize.define("autor", {
        id_autor: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        nombre: {
            type: Sequelize.STRING(200)
        },
        nacimiento: {
            type: Sequelize.DATE
        },
        fallecimiento: {
            type: Sequelize.DATE
        }
    });
    return autor;
};