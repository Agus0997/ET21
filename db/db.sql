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
Url VARCHAR (200) NOT NULL,
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
       (3, 'Museo Historico Nacional', 'Defensa 1600, CABA', 'El Museo invita a conocer y pensar la historia argentina a través de las colecciones, y de actividades culturales y educativas', 'Entrada gratuita')
       
INSERT INTO Visita_Guiada (Id_VisitaGuiada, Id_Museo, Nombre, Descricion, Horario, Guia, Capacidad, Idioma)
VALUES (1, 1, 'Sueño de una tarde en el museo.', 'Una invitación a un viaje onírico de la mano de algunos artistas de la colección de arte del siglo XX.', 'Sábados 3 y 17; y domingos 4 y 18 de septiembre, a las 17.00.','Roxana Pruzan.', '20 personas.', 'Español.'),
       (2, 1, 'Visitas guiadas: De Colección.', 'Arte de los Antiguos Pueblos Andinos.' 'Martes de septiembre, a las 16.00.', 'Germán Warszatska.', '28 Personas','Ingles'),
       (3, 2, 'Cómo se yergue el ícono Frida.', 'Esta conferencia penetra en la complejísima dinámica de la transformación póstuma que ha sufrido la figura de Frida Kahlo.', 'Miércoles 21 de septiembre a las 19:00. Auditorio.', 'Mari Carmen Ramírez', '40 Personas', 'Español'),
       (4, 2, 'Continúa Bolivia + La expresión del deseo.', 'Dos grupos de marginales, de distinta composición generacional, se disputan la modesta geografía de una plaza, en la síntesis más perfecta del tema recurrente de Caetano: el enfrentamiento de pobres contra pobres como el síntoma atroz de la pérdida de una conciencia política.', 'Jueves a las 21:00', 'Adrián Caetano', '60 Personas', 'Español'),
		 (5, 3, 'Texturas y sonidos de la Revolución', 'Recorrido sensorial y participativo para personas ciegas sobre la exposición Tiempo de Revolución, con materiales hápticos, audio descripciones, sonidos y otras apoyaturas accesibles.', 'Miercoles, Jueves y Virnes a las 12:00.', 'Martha Sosa', '15 Personas', 'Ingles'),
		 (6, 3, 'Guia por las exposiciones actuales el museo', 'Actividad para público en general, no para grupos consolidados.', 'Miércoles, jueves y viernes 16 h. Sábados a las 11:30, 14, 15 y 17 h.', 'Sin Guia a Cargo.', 'Sin Limite de Personas.', 'Español') 
