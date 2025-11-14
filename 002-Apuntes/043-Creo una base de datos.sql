-- sudo mysql -u root -p

CREATE DATABASE clientes;
USE clientes;

CREATE TABLE clientes(
	nombre VARCHAR(255),
	apellidos VARCHAR(255),
	edad INT
);

INSERT INTO clientes VALUES ('Pedro', 'Lopez', '45')
INSERT INTO clientes VALUES ('Pepe', 'Martinez', '45')
-- podeís usar IA para crear más inserts

INSERT INTO clientes VALUES ('Pablo', 'Gonzalez', '32');
INSERT INTO clientes VALUES ('Paula', 'Fernandez', '28');
INSERT INTO clientes VALUES ('Patricia', 'Vidal', '39');
INSERT INTO clientes VALUES ('Pau', 'Serrano', '22');
INSERT INTO clientes VALUES ('Pilar', 'Dominguez', '51');
INSERT INTO clientes VALUES ('Paco', 'Alvarez', '47');
INSERT INTO clientes VALUES ('Petra', 'Navarro', '33');
INSERT INTO clientes VALUES ('Pascual', 'Hernandez', '54');
INSERT INTO clientes VALUES ('Puri', 'Crespo', '41');
INSERT INTO clientes VALUES ('Pablo', 'Romero', '36');
INSERT INTO clientes VALUES ('Pol', 'Castillo', '27');
INSERT INTO clientes VALUES ('Penelope', 'Muñoz', '30');
INSERT INTO clientes VALUES ('Prospero', 'Rey', '63');
INSERT INTO clientes VALUES ('Paolo', 'Rivas', '29');
INSERT INTO clientes VALUES ('Priscila', 'Marin', '26');
INSERT INTO clientes VALUES ('Piedad', 'Cano', '48');
INSERT INTO clientes VALUES ('Piero', 'Benitez', '35');
INSERT INTO clientes VALUES ('Petronila', 'Carmona', '52');
INSERT INTO clientes VALUES ('Pamela', 'Ortiz', '34');
INSERT INTO clientes VALUES ('Plácido', 'Rubio', '56');
INSERT INTO clientes VALUES ('Pablo', 'Molina', '23');
INSERT INTO clientes VALUES ('Perla', 'Suarez', '31');
INSERT INTO clientes VALUES ('Prince', 'Garcia', '40');
INSERT INTO clientes VALUES ('Patricio', 'Torres', '37');
INSERT INTO clientes VALUES ('Portia', 'Lozano', '28');
INSERT INTO clientes VALUES ('Percy', 'Vega', '44');
INSERT INTO clientes VALUES ('Pina', 'Herrero', '33');
INSERT INTO clientes VALUES ('Pius', 'Calderón', '50');
