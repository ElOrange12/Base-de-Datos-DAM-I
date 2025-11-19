sudo mysql -u root -p

CREATE DATABASE ejemploclaves;

USE ejemploclaves;

-- Crear tabla emails --

CREATE TABLE emails(
	direccion VARCHAR(50),
	persona VARCHAR(255)
);

-- Añado identificador --

ALTER TABLE emails
ADD COLUMN identificador INT AUTO_INCREMENT PRIMARY KEY FIRST;

SHOW TABLES;
