-- sudo apt install mysql-server

-- sudo mysql -u root -p

CREATE DATABASE empresadam;

USE empresadam;

CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    edad INT
);

INSERT INTO empleados (nombre, apellido, edad) VALUES ('Juan', 'Pérez', 30);
INSERT INTO empleados (nombre, apellido, edad) VALUES ('María', 'González', 25);

SELECT * FROM empleados;

+----+--------+----------+------+
| id | nombre | apellido | edad |
+----+--------+----------+------+
|  1 | Juan   | Pérez    |   30 |
|  2 | María  | González |   25 |
+----+--------+----------+------+

UPDATE empleados SET edad = 31 WHERE nombre = 'Juan';
DELETE FROM empleados WHERE id = 2;