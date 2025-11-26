sudo mysql -u root -p

CREATE DATABASE composiciones;

USE composiciones;

CREATE TABLE alumnos(
	Identificador INT PRIMARY KEY,
	nombre VARCHAR(100),
	apellidos VARCHAR(100)
);

CREATE TABLE profesores(
	Identificador INT PRIMARY KEY,
	nombre VARCHAR(100),
	apellidos VARCHAR(100)
);

CREATE TABLE asignaturas(
	Identificador INT PRIMARY KEY,
	nombre VARCHAR (100),
	id_profesor INT
);

CREATE TABLE matriculas(
	Identificador INT PRIMARY KEY,
	id_asignatura INT,
	id_alumno INT
);

INSERT INTO alumnos (Identificador, nombre, apellidos) VALUES
(1, 'Javier', 'López Martín'),
(2, 'María', 'Gómez Ruiz'),
(3, 'Lucía', 'Serrano Torres'),
(4, 'Diego', 'Hernández Vidal'),
(5, 'Ana', 'Pérez Sánchez'),
(6, 'Carlos', 'Ramírez Muñoz'),
(7, 'Laura', 'Navarro Ortega'),
(8, 'Sergio', 'Castillo Arenas'),
(9, 'Paula', 'Domínguez Prieto'),
(10, 'Irene', 'Flores García'),
(11, 'Alejandro', 'Vega Alonso'),
(12, 'Nuria', 'Requena Belda'),
(13, 'Samuel', 'Campos Rivas'),
(14, 'Claudia', 'Méndez Pastor'),
(15, 'Hugo', 'Garrido Molina'),
(16, 'Adrián', 'Esteban Rojas'),
(17, 'Elena', 'Carrillo Díaz'),
(18, 'Marta', 'Santos Laguna'),
(19, 'Pablo', 'Calvo Bueno'),
(20, 'Noelia', 'Pascual López'),
(21, 'Rafael', 'Fernández Cuenca'),
(22, 'Julia', 'Barrios Cortés'),
(23, 'Mario', 'Aguilar Fuentes'),
(24, 'Celia', 'Morales Cano'),
(25, 'Victor', 'Hidalgo León'),
(26, 'Sofía', 'Reyes Carmona'),
(27, 'Álvaro', 'Soto Guerrero'),
(28, 'Beatriz', 'Ibáñez Romero'),
(29, 'David', 'Salas Rubio'),
(30, 'Andrea', 'Roca Pardo');

INSERT INTO profesores (Identificador, nombre, apellidos) VALUES
(1, 'Manuel', 'Rodríguez García'),
(2, 'Elena', 'Martínez Pardo'),
(3, 'José', 'Santiago Rivera'),
(4, 'Isabel', 'Campos Navarro'),
(5, 'Francisco', 'Rubio Díaz'),
(6, 'Carmen', 'Soler Torres'),
(7, 'Antonio', 'Mesa Fernández'),
(8, 'Raquel', 'Benítez Morales'),
(9, 'Jorge', 'Trujillo Pérez'),
(10, 'Patricia', 'Alarcón Gómez'),
(11, 'Luis', 'Pastor Hidalgo'),
(12, 'Eva', 'Carrasco Molina'),
(13, 'Roberto', 'Fuentes Lara'),
(14, 'Silvia', 'Calderón Muñoz'),
(15, 'Alberto', 'Sánchez Torres');

INSERT INTO asignaturas (Identificador, nombre, id_profesor) VALUES
(1, 'Matemáticas I', 1),
(2, 'Lengua Castellana', 2),
(3, 'Historia de España', 3),
(4, 'Física General', 4),
(5, 'Química Básica', 5),
(6, 'Biología', 6),
(7, 'Tecnología', 7),
(8, 'Educación Física', 8),
(9, 'Inglés', 9),
(10, 'Francés', 10),
(11, 'Economía', 11),
(12, 'Filosofía', 12),
(13, 'Informática', 13),
(14, 'Música', 14),
(15, 'Geografía', 15),
(16, 'Matemáticas II', 1),
(17, 'Programación', 13),
(18, 'Dibujo Técnico', 7),
(19, 'Literatura Universal', 2),
(20, 'Laboratorio', 5);

