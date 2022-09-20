DROP DATABASE if exists OlimpiadasProgramacion;
CREATE DATABASE OlimpiadasProgramacion;

USE OlimpiadasProgramacion;
SET FOREIGN_key_checks=0;

CREATE TABLE Museo(
id_museo INT (50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre TEXT  NOT NULL,
ubicacion VARCHAR  (200) NOT NULL,
descripcion TEXT NOT NULL,
precio VARCHAR (50) NOT NULL
);

CREATE TABLE Plano_Museo(
Id_PlanoMuseo INT (50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Id_museo INT (50) NOT NULL,
Plano INT (50) NOT NULL,
FOREIGN KEY (Id_museo) REFERENCES Museo(Id_museo)
);

-- DROP TABLE if EXISTS Visita_guiada;
CREATE TABLE Visita_Guiada(
Id_VisitaGuiada INT (50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Id_Museo INT (50) NOT NULL,
Nombre TEXT NOT NULL,
Descripcion TEXT NOT NULL,
Horario VARCHAR (50) NOT NULL,
Guia TEXT NOT NULL,
Capacidad INT (50) NOT NULL,
Idioma TEXT NOT NULL,
FOREIGN KEY (Id_Museo) REFERENCES Museo(Id_Museo)
);

CREATE TABLE Tema(
Id_Tema INT (50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Descripcion TEXT NOT NULL
);

-- DROP TABLE if EXISTS autor;
CREATE TABLE Autor(
Id_Autor INT (50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR (200) NOT NULL,
Nacimiento VARCHAR (50) NOT NULL,
Fallecimiento VARCHAR (50) NOT NULL
);

CREATE TABLE Sala(
Id_Sala INT (50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Id_Museo INT (50) NOT NULL,
Descripcion TEXT (250) NOT NULL,
FOREIGN KEY (Id_museo) REFERENCES Museo(Id_Museo)
);

CREATE TABLE Obra(
Id_Obra INT (50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Id_Sala INT (50) NOT NULL,
Id_Tema INT (50) NOT NULL,
Id_Autor INT (50) NOT NULL,
Imagen VARCHAR (200) NOT NULL,
Fecha VARCHAR (50) NOT NULL,
Descripcion TEXT NOT NULL,
FOREIGN KEY (Id_Sala) REFERENCES Sala(Id_Sala),
FOREIGN KEY (Id_Tema) REFERENCES Tema(Id_Tema),
FOREIGN KEY (Id_Autor) REFERENCES Autor(Id_Autor)
);

CREATE TABLE Sala_Obra(
Id_Obra INT (50) NOT NULL,
Id_Sala INT (50) NOT NULL,
PRIMARY KEY (Id_Obra, Id_Sala),
FOREIGN KEY (Id_Sala) REFERENCES Sala(Id_Sala),
FOREIGN KEY (Id_Obra) REFERENCES Obra(Id_Obra)
);

CREATE TABLE Tipo_Accesibilidad(
Id_TipoAccesibilidad INT (50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Descripcion TEXT NOT NULL
);

CREATE TABLE Obra_Accesibilidad(
Id_Obra INT (50) NOT NULL,
Id_TipoAccesibilidad INT (50) NOT NULL,
accesibilidad TEXT NOT NULL,
PRIMARY KEY (Id_Obra, Id_TipoAccesibilidad),
FOREIGN KEY (Id_Obra) REFERENCES Obra(Id_Obra),
FOREIGN KEY (Id_TipoAccesibilidad) REFERENCES Tipo_Accesibilidad(Id_TipoAccesibilidad)
);

CREATE TABLE Turno(
Id_Turno INT (50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Id_VisitaGuiada INT (50) NOT NULL,
Aceptado TEXT NOT NULL,
Email VARCHAR (50) NOT NULL,
FOREIGN KEY (Id_VisitaGuiada) REFERENCES Visita_Guiada(Id_VisitaGuiada)
);


INSERT INTO Museo (id_museo, Nombre, ubicacion, descripcion, precio)
VALUES (1, 'Museo Nacional de Bellas Artes', 'Av. del Libertador 1473, Buenos Aires', 'ubicado en la Ciudad de Buenos Aires, es una de las instituciones públicas de arte más importantes de Argentina. Alberga un patrimonio sumamente diverso, que incluye más de 12.000 piezas, entre pinturas, esculturas, dibujos, grabados, textiles y objetos', 'Entrada gratuita'),
       (2, 'Museo de Arte Latinoamericano', 'Av. Pres. Figueroa Alcorta 3415, CABA', 'Fundación Costantini, más conocido simplemente como MALBA, es un museo argentino fundado en septiembre de 2001. Fue creado con el objetivo de coleccionar, preservar, estudiar y difundir el arte latinoamericano desde principios del siglo XX hasta la actualidad', '$400'),
       (3, 'Museo Historico Nacional', 'Defensa 1600, CABA', 'El Museo invita a conocer y pensar la historia argentina a través de las colecciones, y de actividades culturales y educativas', 'Entrada gratuita');
       
INSERT INTO Visita_Guiada (Id_VisitaGuiada, Id_Museo, Nombre, Descripcion, Horario, Guia, Capacidad, Idioma)
VALUES (1, 1, 'Sueño de una tarde en el museo.', 'Una invitación a un viaje onírico de la mano de algunos artistas de la colección de arte del siglo XX.', 'Sábados 3 y 17; y domingos 4 y 18 de septiembre, a las 17.00.','Roxana Pruzan.', '20 personas.', 'Español.'),
       (2, 1, 'Visitas guiadas: De Colección.', 'Arte de los Antiguos Pueblos Andinos.' 'Martes de septiembre, a las 16.00.', 'Germán Warszatska.', '28 Personas','Ingles'),
       (3, 2, 'Cómo se yergue el ícono Frida.', 'Esta conferencia penetra en la complejísima dinámica de la transformación póstuma que ha sufrido la figura de Frida Kahlo.', 'Miércoles 21 de septiembre a las 19:00. Auditorio.', 'Mari Carmen Ramírez', '40 Personas', 'Español'),
       (4, 2, 'Continúa Bolivia + La expresión del deseo.', 'Dos grupos de marginales, de distinta composición generacional, se disputan la modesta geografía de una plaza, en la síntesis más perfecta del tema recurrente de Caetano: el enfrentamiento de pobres contra pobres como el síntoma atroz de la pérdida de una conciencia política.', 'Jueves a las 21:00', 'Adrián Caetano', '60 Personas', 'Español'),
(5, 3, 'Texturas y sonidos de la Revolución', 'Recorrido sensorial y participativo para personas ciegas sobre la exposición Tiempo de Revolución, con materiales hápticos, audio descripciones, sonidos y otras apoyaturas accesibles.', 'Miercoles, Jueves y Virnes a las 12:00.', 'Martha Sosa', '15 Personas', 'Ingles'),
(6, 3, 'Guia por las exposiciones actuales el museo', 'Actividad para público en general, no para grupos consolidados.', 'Miércoles, jueves y viernes 16 h. Sábados a las 11:30, 14, 15 y 17 h.', 'Sin Guia a Cargo.', 'Sin Limite de Personas.', 'Español');

INSERT INTO Tema(Id_Tema, Descripción)
Values (1, 'La exposición “Carmelo Arden Quin, en la trama del arte constructivo” presenta en el Museo Nacional de Bellas Artes las transformaciones en la obra plástica.'),
(2, 'Como parte central de la exposición Tercer ojo. Colección Costantini en Malba, se presenta Diego y yo. Obra que marcó el récord para el arte latinoamericano en noviembre de 2021.'),
(3, '“Lilian Obligado, trazos de vida” presenta por primera vez en el país el cuerpo de obra de esta gran ilustradora argentina de libros para niños. La muestra está compuesta de dibujos y bocetos originales realizados durante los inicios de su carrera.');

INSERT INTO Autor (Id_Autor, Nombre, Nacimiento, Fallecimiento)
Values (1, 'Carmelo Arden Quin.', '16 de marzo de 1913, Rivera, Uruguay.', '27 de septiembre de 2010, Savigny-sur-Orge, Francia.'),
       (2, 'Frida Kahlo.', '6 de julio de 1907, Coyacán, México.', '13 de julio de 1954, Coyácan, México.'),
       (3, 'Lilian Obligado', '4 de diciembre de 1931.', '27 de septiembre de 2021.');

INSERT INTO plano_museo (Id_PlanoMuseo, Id_Museo, Plano)
VALUES (1, 1, ''),
(2, 1, 'https://www.bellasartes.gob.ar/media/tinymceuploads/d8489b2f-dc26-49c6-a444-f96b21422493.jpg'),
(3, 1, 'https://www.bellasartes.gob.ar/media/tinymceuploads/5c3a381c-c7b3-4b75-a000-854b1918fe03.jpg'),
(4, 2, 'https://wikiarquitectura.com/wp-content/uploads/2017/01/Malba11.jpg),
(5, 2, 'https://wikiarquitectura.com/wp-content/uploads/2017/01/MALBA_pb-500x375.jpg'),
(6, 3, 'http://2.bp.blogspot.com/_7kfR-LBob0Q/S7APPdGeVNI/AAAAAAAAQMU/Z-YJo0ZjS2o/s1600/ST21.jpg'),
(7, 3, 'https://images.adsttc.com/media/images/5255/6eec/e8e4/4eff/0200/0753/large_jpg/Planta_nivel_1.jpg?1381330657'),



INSERT INTO sala (Id_Sala, Id_Museo, Descripcion)
VALUES (1, 1, 'Sala principal, Historia Maya.'),
       (2, 2, 'Sala Principal, Arte de Frida Kahlo.'),
       (3, 3, 'Sala más visitada, Expo. de Instrumentos musicales.');
       
       
INSERT INTO obra (Id_Obra, Id_Sala, Id_Tema, Id_Autor, Imagen, Fecha, Descripcion)
VALUES (1, 1, 1, 'URL', 'https://uploads6.wikiart.org/images/carmelo-arden-quin/blue-circle-1947.jpg!Large.jpg', '1947', 'Bucle Circle es un tipo de arte abstracto.'),
       (2, 2, 2, 'URL', 'https://www.pbs.org/weta/fridakahlo/images/works_diegoandi.jpg', '1944', 'Diego y yo es un auto retratro junto con su marido Diego Rivera como un tercer ojo.'),
       (3, 3, 3, 'URL', 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1325129581i/1835315._UY394_SS394_.jpg', '1960', 'Four Puppies narra sobre unos cachorros que van descubriendo el mundo.');


INSERT INTO sala_obra (Id_Sala, Id_Obra)
VALUES (1, 1),
       (2, 2),
       (3, 3);
       
INSERT INTO tipo_accesibilidad (Id_TipoAccesibilidad, Descripcion)
VALUES (1, 'Arte sensorial y participativo para personas ciegas, con audios descriptivos, sonidos y otros apoyos accesibles.'),
       (2, 'Arte sensorial y participativo para personas ciegas, con audios descriptivos, sonidos y otros apoyos accesibles.'),
       (3, 'Arte sensorial y participativo para personas ciegas, con audios descriptivos, sonidos y otros apoyos accesibles.');
       
INSERT INTO obra_accesibilidad (Id_Obra, Id_TipoAccesibilidad, descripcion)
VALUES (1, 1, 'Obra visual abstracta'),
       (2, 2, 'Obra visual y sensorial, con sonidos'),
       (3, 3, 'Obra visual sobre un libro de cachorros');

INSERT INTO turno (Id_Turno, Id_VisitaGuiada, Aceptado, Email)
VALUES  (1, 1, 'Aceptado', 'Pelozo.Brunella.ET21.21@Gmail.com');