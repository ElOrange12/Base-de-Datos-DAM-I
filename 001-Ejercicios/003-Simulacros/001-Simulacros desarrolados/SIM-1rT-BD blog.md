Este código SQL crea una base de datos llamada `blog-simulacro`, diseñada para gestionar autores y entradas de un blog.

Incluye la creación de las tablas `autores` y `entradas`, estableciendo una relación entre ambas mediante una clave foránea.

También se insertan datos de ejemplo y se crea una vista (`vista_entradas`) que muestra la información combinada de las dos tablas, facilitando la consulta de los datos.

El ejercicio aplica conceptos esenciales de modelado relacional, claves primarias y foráneas, y consultas SQL con `JOIN`.

---

Iniciando sesión en MySQL
```
	sudo mysql -u root -p
```

Creamos la te base de datos:
```
	CREATE DATABASE blog-simulacro;
```

Nos aseguramos de que este la base de datos:
```
	SHOW DATABASES;
```

La seleccionamos:
```
	USE blog-simulacro;
```

Creamos una tabla:
```
	CREATE TABLE autores(
		identificador INT(10),
		nombre VARCHAR(100),
		apellidos VARCHAR(100),
		email VARCHAR(100)
	);
```

O bien sin identificador:
```
	CREATE TABLE autores(
		nombre VARCHAR(100),
		apellidos VARCHAR(100),
		email VARCHAR(100)
	);
```

O bien Primary key desde el principio:
```
	CREATE TABLE autores(
		identificador INT AUTO_INCREMENT,
		nombre VARCHAR(100),
		apellidos VARCHAR(100),
		email VARCHAR(100),
		PRIMARY KEY (Identificador)
	);
```

Miramos que hemos creado bien:
```
	SHOW TABLES;
```

Quiero tirar la columna Identificador para crearla bien:
```
	ALTER TABLE autores DROP Identificador
```

Ahora creo columna:
```
	ALTER TABLE autores ADD COLUMN Identificador INT auto_increment PRIMARY KEY FIRST;
```

Vamos a ver qué es lo que se ha hecho:
```
	DESCRIBE autores;
```

Ahora quiero insetar un autor de prueba:
```
	INSERT INTO autores VALUES(
		NULL,
		'Jose Vicente',
		'Carratalá',
		'info@jocarsa.com'
	);
```

Me aseguro:
```
	SELECT * FROM autores;
```
	
Creo la tabla de entradas:

```
	CREATE TABLE autores(
		identificador INT AUTO_INCREMENT,
		titulo VARCHAR(100),
		fecha VARCHAR(100),
		imagen VARCHAR(100),
		id_autor INT(255),
		contenido TEXT,
		PRIMARY KEY (Identificador)
	);
```

Miramos que hemos creado bien:
```
	SHOW TABLES;
```
```
	DESCRIBE entradas;
```

Creamos una foreign key
```
	ALTER TABLE entradas
	ADD CONSTRAINT entradas_a_autor 
	FOREIGN KEY (id_autor) REFERENCES autor(Identificador) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE;
```

> Si hemos introducido algo mal:
> ALTER TABLE _NombreTabla_
> MODIFY COLUMN _LoQueQueremosCambiar_ _AQueLoQueremosCambiar_

Insertamos una entrada
```
	INSERT INTO entradas VALUES(
		NULL,
		'Titulo de la primera entrada',
		'2025-11-03',
		'image.jpg'
		1,
		'Este es el contenido de la primera entrada'
	);
```

Comprobamos:
```
	SELECT * FROM entradas;
```

Petición cruzada:
```
	SELECT
	entradas.titulo, entradas.fecha, entradas.imagen, entradas.contenido,
	autores.nombre, autores.apellidos
	FROM entradas
	LEFT JOIN autores
	ON entradas.id_autor = autores.Identificador;
```

Por ultimo creamos una vista:
```
	CREATE VIEW vista_entradas AS
	SELECT
	entradas.titulo, entradas.fecha, entradas.imagen, entradas.contenido,
	autores.nombre, autores.apellidos
	FROM entradas
	LEFT JOIN autores
	ON entradas.id_autor = autores.Identificador;
```

Comprobamos la vista:
```
	SELECT * FROM vista_entradas;
```

---

A continuación se muestra un ejemplo de código del ejercicio resuelto:

```
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
```

**NOTAS:**

- Muy importante el uso de ";" al terminar cada acción

---	

En resumen, este código demuestra cómo diseñar y relacionar tablas en una base de datos MySQL para representar la estructura de un blog.

Refuerza conceptos como la integridad referencial, el uso de consultas combinadas (`JOIN`) y la creación de vistas para simplificar el acceso a la información.

Es un ejemplo práctico de cómo aplicar SQL para construir y gestionar sistemas de datos reales.
