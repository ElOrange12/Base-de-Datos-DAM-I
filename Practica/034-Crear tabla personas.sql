sudo mysql -u root -p

CREATE DATABASE ejemploclaves;

USE ejemploclaves;

-- Crear tabla personas --

CREATE TABLE personas(
	nombre VARCHAR(50),
	apellidos VARCHAR(255)
);

-- Añado identificador --

ALTER TABLE personas
ADD COLUMN identificador INT AUTO_INCREMENT PRIMARY KEY FIRST;

SHOW TABLES;
