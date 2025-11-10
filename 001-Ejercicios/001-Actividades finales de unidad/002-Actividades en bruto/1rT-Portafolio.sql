-- sudo mysql -u root -p

CREATE DATABASE portafolioexamen;

SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| biblioteca25       |
| ejemploclaves      |
| empresadam         |
| information_schema |
| mysql              |
| performance_schema |
| portafolio         |
| portafolioexamen   |
| sys                |
+--------------------+

USE portafolioexamen;

CREATE TABLE categoriaportafolio(
	identificador INT AUTO_INCREMENT,
	nombre VARCHAR(255),
	PRIMARY KEY (Identificador)
);

SHOW TABLES;

+----------------------------+
| Tables_in_portafolioexamen |
+----------------------------+
| categoriaportafolio        |
+----------------------------+

DESCRIBE categoriaportafolio;

+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| nombre        | varchar(255) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+

INSERT INTO categoriaportafolio VALUES(
	NULL,
	'Tecnología'
);

INSERT INTO categoriaportafolio VALUES(
	NULL,
	'Deportes'
);

SELECT * FROM categoriaportafolio;

+---------------+-------------+
| identificador | nombre      |
+---------------+-------------+
|             1 | Tecnología  |
|             2 | Deportes    |
+---------------+-------------+

CREATE TABLE piezaportafolio(
	identificador INT AUTO_INCREMENT,
	titulo VARCHAR(100),
	descripcion VARCHAR(255),
	fecha VARCHAR(100),
	id_categoria INT(255),
	PRIMARY KEY (Identificador)
);

SHOW TABLES;
+----------------------------+
| Tables_in_portafolioexamen |
+----------------------------+
| categoriaportafolio        |
| piezaportafolio            |
+----------------------------+

DESCRIBE piezaportafolio;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| titulo        | varchar(100) | YES  |     | NULL    |                |
| descripcion   | varchar(255) | YES  |     | NULL    |                |
| fecha         | varchar(100) | YES  |     | NULL    |                |
| id_categoria  | int          | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+

ALTER TABLE piezaportafolio
ADD CONSTRAINT piezas_a_categoria 
FOREIGN KEY (id_categoria) REFERENCES categoriaportafolio(identificador) 
ON DELETE CASCADE 
ON UPDATE CASCADE;

INSERT INTO piezaportafolio VALUES (
	NULL,
	'Ordenador portátil',
	'Portátil ultraligero con procesador Intel i7 y 16GB de RAM.',
	'2025-11-10',
	1
);

INSERT INTO piezaportafolio VALUES (
	NULL,
	'Auriculares inalámbricos',
	'Auriculares Bluetooth con cancelación de ruido y micrófono integrado.', 
	'2025-11-10',
	1
);

INSERT INTO piezaportafolio VALUES (
	NULL,
	'Balón de fútbol',
	'Balón oficial de la liga profesional, hecho con materiales de alta calidad.',
	'2025-11-10',
	2
);

INSERT INTO piezaportafolio VALUES (
	NULL,
	'Zapatillos deportivas',
	'Zapatillas ligeras y cómodas ideales para correr o entrenar.',
	'2025-11-10',
	2
);

INSERT INTO piezaportafolio VALUES (
	NULL,
	'Smartwatch',
	'Reloj inteligenta con monitor de ritmo cardíaco y seguimiento de actividad.',
	'2025-11-10',
	1
);

SELECT * FROM piezaportafolio;

+---------------+---------------------------+------------------------------------------------------------------------------+------------+--------------+
| identificador | titulo                    | descripcion                                                                  | fecha      | id_categoria |
+---------------+---------------------------+------------------------------------------------------------------------------+------------+--------------+
|             1 | Ordenador portátil        | Portátil ultraligero con procesador Intel i7 y 16GB de RAM.                  | 2025-11-10 |            1 |
|             2 | Auriculares inalámbricos  | Auriculares Bluetooth con cancelación de ruido y micrófono integrado.        | 2025-11-10 |            1 |
|             3 | Balón de fútbol           | Balón oficial de la liga profesional, hecho con materiales de alta calidad.  | 2025-11-10 |            2 |
|             4 | Zapatillos deportivas     | Zapatillas ligeras y cómodas ideales para correr o entrenar.                 | 2025-11-10 |            2 |
|             5 | Smartwatch                | Reloj inteligente con monitor de ritmo cardíaco y seguimiento de actividad.  | 2025-11-10 |            1 |
+---------------+---------------------------+------------------------------------------------------------------------------+------------+--------------+

UPDATE piezaportafolio;
SET titulo = 'Zapatillos deportivas'
WHERE identificador = '4';

SELECT * FROM piezaportafolio;

+---------------+---------------------------+------------------------------------------------------------------------------+------------+--------------+
| identificador | titulo                    | descripcion                                                                  | fecha      | id_categoria |
+---------------+---------------------------+------------------------------------------------------------------------------+------------+--------------+
|             1 | Ordenador portátil        | Portátil ultraligero con procesador Intel i7 y 16GB de RAM.                  | 2025-11-10 |            1 |
|             2 | Auriculares inalámbricos  | Auriculares Bluetooth con cancelación de ruido y micrófono integrado.        | 2025-11-10 |            1 |
|             3 | Balón de fútbol           | Balón oficial de la liga profesional, hecho con materiales de alta calidad.  | 2025-11-10 |            2 |
|             4 | Zapatillas deportivas     | Zapatillas ligeras y cómodas ideales para correr o entrenar.                 | 2025-11-10 |            2 |
|             5 | Smartwatch                | Reloj inteligente con monitor de ritmo cardíaco y seguimiento de actividad.  | 2025-11-10 |            1 |
+---------------+---------------------------+------------------------------------------------------------------------------+------------+--------------+

DELETE FROM piezaportafolio
WHERE identificador = '5'

+---------------+---------------------------+------------------------------------------------------------------------------+------------+--------------+
| identificador | titulo                    | descripcion                                                                  | fecha      | id_categoria |
+---------------+---------------------------+------------------------------------------------------------------------------+------------+--------------+
|             1 | Ordenador portátil        | Portátil ultraligero con procesador Intel i7 y 16GB de RAM.                  | 2025-11-10 |            1 |
|             2 | Auriculares inalámbricos  | Auriculares Bluetooth con cancelación de ruido y micrófono integrado.        | 2025-11-10 |            1 |
|             3 | Balón de fútbol           | Balón oficial de la liga profesional, hecho con materiales de alta calidad.  | 2025-11-10 |            2 |
|             4 | Zapatillas deportivas     | Zapatillas ligeras y cómodas ideales para correr o entrenar.                 | 2025-11-10 |            2 |
+---------------+---------------------------+------------------------------------------------------------------------------+------------+--------------+

SELECT 
    piezaportafolio.titulo, 
    piezaportafolio.descripcion, 
    piezaportafolio.fecha, 
    categoriaportafolio.nombre 
FROM piezaportafolio
LEFT JOIN categoriaportafolio
ON piezaportafolio.id_categoria = categoriaportafolio.identificador;

+---------------------------+------------------------------------------------------------------------------+------------+-------------+
| titulo                    | descripcion                                                                  | fecha      | nombre      |
+---------------------------+------------------------------------------------------------------------------+------------+-------------+
| Ordenador portátil        | Portátil ultraligero con procesador Intel i7 y 16GB de RAM.                  | 2025-11-10 | Tecnología  |
| Auriculares inalámbricos  | Auriculares Bluetooth con cancelación de ruido y micrófono integrado.        | 2025-11-10 | Tecnología  |
| Balón de fútbol           | Balón oficial de la liga profesional, hecho con materiales de alta calidad.  | 2025-11-10 | Deportes    |
| Zapatillas deportivas     | Zapatillas ligeras y cómodas ideales para correr o entrenar.                 | 2025-11-10 | Deportes    |
| Smartwatch                | Reloj inteligente con monitor de ritmo cardíaco y seguimiento de actividad.  | 2025-11-10 | Tecnología  |
+---------------------------+------------------------------------------------------------------------------+------------+-------------+

CREATE VIEW vista_piezas AS
SELECT 
    piezaportafolio.titulo, 
    piezaportafolio.descripcion, 
    piezaportafolio.fecha, 
    categoriaportafolio.nombre 
FROM piezaportafolio
LEFT JOIN categoriaportafolio
ON piezaportafolio.id_categoria = categoriaportafolio.identificador;

SELECT * FROM vista_piezas;

+---------------------------+------------------------------------------------------------------------------+------------+-------------+
| titulo                    | descripcion                                                                  | fecha      | nombre      |
+---------------------------+------------------------------------------------------------------------------+------------+-------------+
| Ordenador portátil        | Portátil ultraligero con procesador Intel i7 y 16GB de RAM.                  | 2025-11-10 | Tecnología  |
| Auriculares inalámbricos  | Auriculares Bluetooth con cancelación de ruido y micrófono integrado.        | 2025-11-10 | Tecnología  |
| Balón de fútbol           | Balón oficial de la liga profesional, hecho con materiales de alta calidad.  | 2025-11-10 | Deportes    |
| Zapatillas deportivas     | Zapatillas ligeras y cómodas ideales para correr o entrenar.                 | 2025-11-10 | Deportes    |
| Smartwatch                | Reloj inteligente con monitor de ritmo cardíaco y seguimiento de actividad.  | 2025-11-10 | Tecnología  |
+---------------------------+------------------------------------------------------------------------------+------------+-------------+

-- Crea usuario nuevo con contraseña
-- Creamos el nombre de usuario que queramos
CREATE USER 
'creadorportafolio'@'localhost' 
IDENTIFIED  BY 'PortafolioExamen2526$';

-- Permite acceso a ese usuario
GRANT USAGE ON *.* TO 'danielo'@'localhost';

-- Quitale todos los limites que tenga
ALTER USER 'creadorportafolio'@'localhost' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;

-- Dale acceso a la base de datos empresadam
GRANT ALL PRIVILEGES ON `portafolioexamen`.* 
TO 'creadorportafolio'@'localhost';

-- Recarga la tabla de privilegios
FLUSH PRIVILEGES;
