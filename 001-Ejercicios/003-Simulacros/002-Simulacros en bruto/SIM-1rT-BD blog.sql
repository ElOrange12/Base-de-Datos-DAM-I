-- sudo mysql -u root -p

CREATE DATABASE blog-simulacro;

SHOW DATABASES;

USE blog-simulacro;

CREATE TABLE autores(
	identificador INT AUTO_INCREMENT,
	nombre VARCHAR(100),
	apellidos VARCHAR(100),
	email VARCHAR(100),
	PRIMARY KEY (Identificador)
);

SHOW TABLES;

DESCRIBE autores;

INSERT INTO autores VALUES(
	NULL,
	'Jose Vicente',
	'Carratalá',
	'info@jocarsa.com'
);

SELECT * FROM autores;

CREATE TABLE autores(
	identificador INT AUTO_INCREMENT,
	titulo VARCHAR(100),
	fecha VARCHAR(100),
	imagen VARCHAR(100),
	id_autor INT(255),
	contenido TEXT,
	PRIMARY KEY (Identificador)
);

SHOW TABLES;

DESCRIBE entradas;

ALTER TABLE entradas
ADD CONSTRAINT entradas_a_autor 
FOREIGN KEY (id_autor) REFERENCES autor(Identificador) 
ON DELETE CASCADE 
ON UPDATE CASCADE;

INSERT INTO entradas VALUES(
	NULL,
	'Titulo de la primera entrada',
	'2025-11-03',
	'image.jpg'
	1,
	'Este es el contenido de la primera entrada'
);

SELECT * FROM entradas;

SELECT
entradas.titulo, entradas.fecha, entradas.imagen, entradas.contenido,
autores.nombre, autores.apellidos
FROM entradas
LEFT JOIN autores
ON entradas.id_autor = autores.Identificador;

CREATE VIEW vista_entradas AS
SELECT
entradas.titulo, entradas.fecha, entradas.imagen, entradas.contenido,
autores.nombre, autores.apellidos
FROM entradas
LEFT JOIN autores
ON entradas.id_autor = autores.Identificador;

SELECT * FROM vista_entradas;








