-- sudo mysql -u root -p

CREATE DATABASE portafolio;

SHOW DATABASES;

+--------------------+
| biblioteca25       |
| ejemploclaves      |
| empresadam         |
| information_schema |
| mysql              |
| performance_schema |
| portafolio         |
| sys                |
+--------------------+

USE portafolio;

CREATE TABLE categoria(
	identificador INT AUTO_INCREMENT,
	titulo VARCHAR(255),
	descripcion VARCHAR(255),
	PRIMARY KEY (Identificador)
);

SHOW TABLES;

+----------------------+
| Tables_in_portafolio |
+----------------------+
| categoria            |
+----------------------+

DESCRIBE categoria;

+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| titulo        | varchar(255) | YES  |     | NULL    |                |
| descripcion   | varchar(255) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+

INSERT INTO categoria VALUES(
	'Tecnología',
	'Artículos y novedades sobre informática, gadgets y software.'
);

INSERT INTO categoria VALUES(
	NULL,
	'Deportes',
	'Noticias y contenido relacionado con fútbol, baloncesto y otros deportes.'
);

SELECT * FROM categoria;

+---------------+-------------+----------------------------------------------------------------------------+
| identificador | titulo      | descripcion                                                                |
+---------------+-------------+----------------------------------------------------------------------------+
|             1 | Tecnología  | Artículos y novedades sobre informática, gadgets y software.               |
|             2 | Deportes    | Noticias y contenido relacionado con fútbol, baloncesto y otros deportes.  |
+---------------+-------------+----------------------------------------------------------------------------+

CREATE TABLE pieza(
	identificador INT AUTO_INCREMENT,
	titulo VARCHAR(100),
	descripcion VARCHAR(255),
	imagen VARCHAR(100),
	url VARCHAR(255),
	id_categoria INT(255),
	PRIMARY KEY (Identificador)
);

SHOW TABLES;
+----------------------+
| Tables_in_portafolio |
+----------------------+
| categoria            |
| pieza                |
+----------------------+

DESCRIBE pieza;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| titulo        | varchar(100) | YES  |     | NULL    |                |
| decripción    | varchar(255) | YES  |     | NULL    |                |
| imagen        | varchar(100) | YES  |     | NULL    |                |
| url           | varchar(255) | YES  |     | NULL    |                |
| id_categoria  | int          | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+

ALTER TABLE pieza
ADD CONSTRAINT piezas_a_autor 
FOREIGN KEY (id_categoria) REFERENCES categoria(identificador) 
ON DELETE CASCADE 
ON UPDATE CASCADE;

INSERT INTO pieza VALUES (
	NULL,
	'Ordenador portátil',
	'Portátil ultraligero con procesador Intel i7 y 16GB de RAM.',
	'portatil.jpg',
	'https://ejemplo.com/portatil',
	1
);

INSERT INTO pieza VALUES (
	NULL,
	'Auriculares inalámbricos',
	'Auriculares Bluetooth con cancelación de ruido y micrófono integrado.', 
	'auriculares.jpg',
	'https://ejemplo.com/auriculares',
	1
);

INSERT INTO pieza VALUES (
	NULL,
	'Balón de fútbol',
	'Balón oficial de la liga profesional, hecho con materiales de alta calidad.',
	'balon.jpg',
	'https://ejemplo.com/balon',
	2
);

INSERT INTO pieza VALUES (
	NULL,
	'Zapatillas deportivas',
	'Zapatillas ligeras y cómodas ideales para correr o entrenar.',
	'zapatillas.jpg',
	'https://ejemplo.com/zapatillas',
	2
);

INSERT INTO pieza VALUES (
	NULL,
	'Smartwatch',
	'Reloj inteligente con monitor de ritmo cardíaco y seguimiento de actividad.',
	'smartwatch.jpg',
	'https://ejemplo.com/smartwatch',
	1
);

SELECT * FROM pieza;

+---------------+---------------------------+------------------------------------------------------------------------------+-----------------+---------------------------------+--------------+
| identificador | titulo                    | descripcion                                                                  | imagen          | url                             | id_categoria |
+---------------+---------------------------+------------------------------------------------------------------------------+-----------------+---------------------------------+--------------+
|             1 | Ordenador portátil        | Portátil ultraligero con procesador Intel i7 y 16GB de RAM.                  | portatil.jpg    | https://ejemplo.com/portatil    |            1 |
|             2 | Auriculares inalámbricos  | Auriculares Bluetooth con cancelación de ruido y micrófono integrado.        | auriculares.jpg | https://ejemplo.com/auriculares |            1 |
|             3 | Balón de fútbol           | Balón oficial de la liga profesional, hecho con materiales de alta calidad.  | balon.jpg       | https://ejemplo.com/balon       |            2 |
|             4 | Zapatillas deportivas     | Zapatillas ligeras y cómodas ideales para correr o entrenar.                 | zapatillas.jpg  | https://ejemplo.com/zapatillas  |            2 |
|             5 | Smartwatch                | Reloj inteligente con monitor de ritmo cardíaco y seguimiento de actividad.  | smartwatch.jpg  | https://ejemplo.com/smartwatch  |            1 |
+---------------+---------------------------+------------------------------------------------------------------------------+-----------------+---------------------------------+--------------+

SELECT 
    pieza.titulo AS titulo_pieza, 
    pieza.descripcion AS descripcion_pieza, 
    pieza.imagen, 
    pieza.url, 
    categoria.titulo AS titulo_categoria, 
    categoria.descripcion AS descripcion_categoria
FROM pieza
LEFT JOIN categoria
ON pieza.id_categoria = categoria.identificador;

+---------------------------+------------------------------------------------------------------------------+-----------------+---------------------------------+------------------+----------------------------------------------------------------------------+
| Ordenador portátil        | Portátil ultraligero con procesador Intel i7 y 16GB de RAM.                  | portatil.jpg    | https://ejemplo.com/portatil    | Tecnología       | Artículos y novedades sobre informática, gadgets y software.               |
| Auriculares inalámbricos  | Auriculares Bluetooth con cancelación de ruido y micrófono integrado.        | auriculares.jpg | https://ejemplo.com/auriculares | Tecnología       | Artículos y novedades sobre informática, gadgets y software.               |
| Balón de fútbol           | Balón oficial de la liga profesional, hecho con materiales de alta calidad.  | balon.jpg       | https://ejemplo.com/balon       | Deportes         | Noticias y contenido relacionado con fútbol, baloncesto y otros deportes.  |
| Zapatillas deportivas     | Zapatillas ligeras y cómodas ideales para correr o entrenar.                 | zapatillas.jpg  | https://ejemplo.com/zapatillas  | Deportes         | Noticias y contenido relacionado con fútbol, baloncesto y otros deportes.  |
| Smartwatch                | Reloj inteligente con monitor de ritmo cardíaco y seguimiento de actividad.  | smartwatch.jpg  | https://ejemplo.com/smartwatch  | Tecnología       | Artículos y novedades sobre informática, gadgets y software.               |
+---------------------------+------------------------------------------------------------------------------+-----------------+---------------------------------+------------------+----------------------------------------------------------------------------+

CREATE VIEW vista_piezas AS
SELECT
	pieza.titulo AS titulo_pieza, 
    pieza.descripcion AS descripcion_pieza, 
    pieza.imagen, 
    pieza.url, 
    categoria.titulo AS titulo_categoria, 
    categoria.descripcion AS descripcion_categoria
FROM pieza
LEFT JOIN categoria
ON pieza.id_categoria = categoria.identificador;

SELECT * FROM vista_piezas;

+---------------------------+------------------------------------------------------------------------------+-----------------+---------------------------------+------------------+----------------------------------------------------------------------------+
| Ordenador portátil        | Portátil ultraligero con procesador Intel i7 y 16GB de RAM.                  | portatil.jpg    | https://ejemplo.com/portatil    | Tecnología       | Artículos y novedades sobre informática, gadgets y software.               |
| Auriculares inalámbricos  | Auriculares Bluetooth con cancelación de ruido y micrófono integrado.        | auriculares.jpg | https://ejemplo.com/auriculares | Tecnología       | Artículos y novedades sobre informática, gadgets y software.               |
| Balón de fútbol           | Balón oficial de la liga profesional, hecho con materiales de alta calidad.  | balon.jpg       | https://ejemplo.com/balon       | Deportes         | Noticias y contenido relacionado con fútbol, baloncesto y otros deportes.  |
| Zapatillas deportivas     | Zapatillas ligeras y cómodas ideales para correr o entrenar.                 | zapatillas.jpg  | https://ejemplo.com/zapatillas  | Deportes         | Noticias y contenido relacionado con fútbol, baloncesto y otros deportes.  |
| Smartwatch                | Reloj inteligente con monitor de ritmo cardíaco y seguimiento de actividad.  | smartwatch.jpg  | https://ejemplo.com/smartwatch  | Tecnología       | Artículos y novedades sobre informática, gadgets y software.               |
+---------------------------+------------------------------------------------------------------------------+-----------------+---------------------------------+------------------+----------------------------------------------------------------------------+

-- Crea usuario nuevo con contraseña
-- Creamos el nombre de usuario que queramos
CREATE USER 
'danielo'@'localhost' 
IDENTIFIED  BY 'Portafolio2526$';

-- Permite acceso a ese usuario
GRANT USAGE ON *.* TO 'danielo'@'localhost';

--[tuservidor] == localhost
-- La contraseña puede requerir Mayus, minus, numeros, caracteres, min len

-- Quitale todos los limites que tenga
ALTER USER 'danielo'@'localhost' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;

-- Dale acceso a la base de datos empresadam
GRANT ALL PRIVILEGES ON `portafolio`.* 
TO 'danielo'@'localhost';

-- Recarga la tabla de privilegios
FLUSH PRIVILEGES;
