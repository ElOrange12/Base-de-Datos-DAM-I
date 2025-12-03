Vamos a poner en practica en nuestro examen trimestral como hacer una base de datos bien estructurada, tener este conocimiento hace que lo que un día cierta información puede ser dificil de encontrar, otro sea un abrir y cerrar de ojos, pondremos en practica técnicas como una `PRIMARY KEY` que nos sirve como un identificador único para cada cosa que insertemos en nuestra tabla o una `FOREIGN KEY` la cual no ayuda a relacionar dos tablas.

---

Empezamos entrando en MySQL desde la terminal de nuestra maquina, en nuestro caso al estar utilizando Linux utilizaremos el siguiente comando:

```
	sudo mysql -u root -p
```

Ya dentro de MySQL vamos a empezar con el ejercicio.

Lo primero de todo es crear nuestra nueva base de datos, que la llamaremos `portafolioexamen`, el comando para ello es el siguiente:

```
	CREATE DATABASE portafolioexamen;
```

Comprobamos que esta se creo y la usamos:

```
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
```

Vale ya tenemos nuestra base de datos creada y operativa para empezar a hacer tablas.

Creemos la primera tabla (`categoriaportafolio`):

```
	CREATE TABLE categoriaportafolio(
		identificador INT AUTO_INCREMENT,
		nombre VARCHAR(255),
		PRIMARY KEY (Identificador)
	);
```

Esta tiene un identificador, el cual es una `PRIMARY KEY` que se va autoincrementando, y un nombre, que es un `VARCHAR`.

Ahora comprobemos que se ha creado perfectamente:

```
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
```

A salido todo perfecto, probemos a insertar cosas dentro de la tabla:

```
	INSERT INTO categoriaportafolio VALUES(
		NULL,
		'Tecnología'
	);

	INSERT INTO categoriaportafolio VALUES(
		NULL,
		'Deportes'
	);
```

Ahora veamos si se han añadido correctamente:

```
	SELECT * FROM categoriaportafolio;

	+---------------+-------------+
	| identificador | nombre      |
	+---------------+-------------+
	|             1 | Tecnología  |
	|             2 | Deportes    |
	+---------------+-------------+
```

Vale creemos otra tabla esta vez se llamará `piezasportafolio`:

```
	CREATE TABLE piezaportafolio(
		identificador INT AUTO_INCREMENT,
		titulo VARCHAR(100),
		descripcion VARCHAR(255),
		fecha VARCHAR(100),
		id_categoria INT(255),
		PRIMARY KEY (Identificador)
	);
```

Comprobamos que todo haya salido bien:

```
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
```

¡Perfecto! Con la segunda tabla creada vamos a enlazarla con la otra tabla, para esto utilizaremos una clave foranea, esta la añadiremos utilizando el siguiente comando:

```
	ALTER TABLE piezaportafolio
	ADD CONSTRAINT piezas_a_categoria 
	FOREIGN KEY (id_categoria) REFERENCES categoriaportafolio(identificador) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE;
```

Ya tenemos `piezaportafolio` enlazada con `categoriaportafolio`, ahora vamos a insertar cosas en la tabla `piezaportafolio`:

```
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
```

Comprobamos que se haya añadido correctamente:

```
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
```

Vaya, parece que hemos cometido una falta de ortografía en `identificador = 4` hemos puesto "Zapatillos" en vez de "Zapatillas", vamos a actualizarlo:

```
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
```

Perfecto corregido, pero a lo mejor hay demasiadas piezas vamos a eliminar una para ver que tal:

```
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
```

Ahora sí, todo perfecto.

Ahora vayamos con la vista de la dos tablas, a esta la llamaremos `vista_piezas`:

```
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
```

Vista creada o al menos eso pensamos, veamos si se creo de verdad:

```
	SELECT * FROM vista_piezas;

	+---------------------------+------------------------------------------------------------------------------+------------+-------------+
	| titulo                    | descripcion                                                                  | fecha      | nombre      |
	+---------------------------+------------------------------------------------------------------------------+------------+-------------+
	| Ordenador portátil        | Portátil ultraligero con procesador Intel i7 y 16GB de RAM.                  | 2025-11-10 | Tecnología  |
	| Auriculares inalámbricos  | Auriculares Bluetooth con cancelación de ruido y micrófono integrado.        | 2025-11-10 | Tecnología  |
	| Balón de fútbol           | Balón oficial de la liga profesional, hecho con materiales de alta calidad.  | 2025-11-10 | Deportes    |
	| Zapatillas deportivas     | Zapatillas ligeras y cómodas ideales para correr o entrenar.                 | 2025-11-10 | Deportes    |
	+---------------------------+------------------------------------------------------------------------------+------------+-------------+
```

Por ultimo vamos a crear un usuario para que solo el pueda entrar a nuestra base de datos.

Primero creamos el usuario:

```
	CREATE USER 
	'creadorportafolio'@'localhost' 
	IDENTIFIED  BY 'PortafolioExamen2526$';
```

Ahora le damos acceso al usuario:

```
	GRANT USAGE ON *.* TO 'danielo'@'localhost';
```

Le limitamos los privilegios que tenga:

```
	ALTER USER 'creadorportafolio'@'localhost' 
	REQUIRE NONE 
	WITH MAX_QUERIES_PER_HOUR 0 
	MAX_CONNECTIONS_PER_HOUR 0 
	MAX_UPDATES_PER_HOUR 0 
	MAX_USER_CONNECTIONS 0;
```

Y ahora le damos acceso a la base de datos:

```
	GRANT ALL PRIVILEGES ON `portafolioexamen`.* 
	TO 'creadorportafolio'@'localhost
```

Y por ultimo refrescamos la tabla de privilegios:

```
	FLUSH PRIVILEGES;
```

Y ya estaría todo hecho en el ejercio propuesto.

---

A continuación se muestra un ejemplo de código del ejercicio resuelto:

```

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
```

**Notas:**

- Es importante no olvidarse de poner ";" después de cada comando.
- Para poder insert algo en una tabla tiene que tener el `INSERT` la misma estructura que la tabla.
- Si queremos crear una vista hay que tener en cuenta que no haya dos columnas de dos tablas que se llamen igual.
- La contraseña puede requerir Mayus, minus, numeros, caracteres, min len

---

En conclusión vemos la importancía en una base de datos de todas sus tablas y vistas, estas nos ayudan a almacenar y ordenar información que a la hora de administrar dicha información sea todo más sencillo si sabes utilizar estas bases de datos.
