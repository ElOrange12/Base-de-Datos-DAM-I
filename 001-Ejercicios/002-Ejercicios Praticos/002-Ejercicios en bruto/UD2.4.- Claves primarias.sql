-- sudo mysql -u root -p

SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test               |
| empresadam         |
+--------------------+

USE empresadam;

SHOW TABLES;

+----------------------+
| Tables_in_empresadam |
+----------------------+
| clientes             |
+----------------------+

SELECT * FROM clientes;

+-----------+--------+------------------+-----------------------+
| dni       | nombre | apellidos        | email                 |
+-----------+--------+------------------+-----------------------+
| 12345678A | Daniel | Oliveira Vidal   | info@elorange12.com   |
+-----------+--------+------------------+-----------------------+

DESCRIBE clientes;

+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| dni       | varchar(9)   | YES  |     | NULL    |       |
| nombre    | varchar(50)  | YES  |     | NULL    |       |
| apellidos | varchar(255) | YES  |     | NULL    |       |
| email     | varchar(100) | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+

ALTER TABLE clientes ADD COLUMN identificador INT AUTO_INCREMENT PRIMARY KEY FIRST;

DESCRIBE clientes;

+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| dni           | varchar(9)   | YES  |     | NULL    |                |
| nombre        | varchar(50)  | YES  |     | NULL    |                |
| apellidos     | varchar(255) | YES  |     | NULL    |                |
| email         | varchar(100) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+

INSERT INTO clientes VALUES(NULL, '12345678A', 'Jose Vicente', 'Carratala Sanchis', 'info@jocarsa.com');
INSERT INTO clientes VALUES(NULL, '12345679A', 'Juan', 'Garcia Lopez', 'juan@jocarsa.com');

SELECT * FROM clientes;

+---------------+-----------+--------------+--------------------+---------------------+
| identificador | dni       | nombre       | apellidos          | email               |
+---------------+-----------+--------------+--------------------+---------------------+
|             1 | 12345678A | Daniel       | Oliveira Vidal     | info@elorange12.com |
|             2 | 12345678A | Jose Vicente | Carratala Sanchis  | info@jocarsa.com    |
|             3 | 12345679A | Juan         | Garcia Lopez       | juan@jocarsa.com    |
+---------------+-----------+--------------+--------------------+---------------------+

INSERT INTO clientes VALUES(2, '12345679A', 'Juan', 'Garcia Lopez', 'juan@jocarsa.com');

ERROR 1062 (23000): Duplicate entry '2' for key 'PRIMARY'