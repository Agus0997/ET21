module.exports = (sequelize, Sequelize) => {

    const visita_guiada = sequelize.define("visita_guiada", {
        id_visita: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        nombre: {
            type: Sequelize.STRING
        },
        descripcion:{
            type: Sequelize.STRING(200)
        },
        idioma: {
            type: Sequelize.STRING(50)
        },
        horario_entrada: {
            type: Sequelize.DATE
        },
        horario_salida: {
            type: Sequelize.DATE
        },
        guia: {
            type: Sequelize.STRING(200)
        },
        capacidad: {
            type: Sequelize.INTEGER
        }
        });
        return visita_guiada;
    };
    