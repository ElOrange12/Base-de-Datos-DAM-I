En este ejercicio se trabaja con una tabla de clientes en una base de datos relacional utilizando MySQL. 

Se practican conceptos fundamentales como la creación de tablas, definición de tipos de datos y las operaciones básicas CRUD (Crear, Leer, Actualizar y Eliminar). Estas acciones son esenciales para gestionar información de manera estructurada y eficiente en aplicaciones reales.

---

Primero creamos la tabla `clientes`:

```
    CREATE TABLE clientes(
        dni VARCHAR(9),
        nombre VARCHAR(50),
        apellidos VARCHAR(255),
        email VARCHAR(100)
    );
```

Ahora añadimos un cliente a nuestra tabla:

```
    INSERT INTO clientes VALUES(
        '12345678A',
        'Daniel',
        'Oliveira Vidal',
        'info@elorange12.com'
    );
```

Comprobamos que se haya creado todo perfecto:

```
    SELECT * FROM clientes

    +-----------+--------+------------------+-----------------------+
    | dni       | nombre | apellidos        | email                 |
    +-----------+--------+------------------+-----------------------+
    | 12345678A | Daniel | Oliveira Vidal   | info@elorange12.com   |
    +-----------+--------+------------------+-----------------------+
```

Ahora probemos a actualizar un cliente:

```
    UPDATE clientes
    SET dni = '11111111A'
    WHERE nombre = 'Daniel';
```

Y por ultimo probemos a eliminarlo:

```
    DELETE FROM clientes
    WHERE dni = '11111111A';
```

---

A continuación se muestra un ejemplo de código del ejercicio resuelto:

```
CREATE TABLE clientes(
	dni VARCHAR(9),
	nombre VARCHAR(50),
	apellidos VARCHAR(255),
	email VARCHAR(100)
);

INSERT INTO clientes VALUES(
	'12345678A',
	'Daniel',
	'Oliveira Vidal',
	'info@elorange12.com'
);

SELECT * FROM clientes

+-----------+--------+------------------+-----------------------+
| dni       | nombre | apellidos        | email                 |
+-----------+--------+------------------+-----------------------+
| 12345678A | Daniel | Oliveira Vidal   | info@elorange12.com   |
+-----------+--------+------------------+-----------------------+

UPDATE clientes
SET dni = '11111111A'
WHERE nombre = 'Daniel';


DELETE FROM clientes
WHERE dni = '11111111A';

```

**Notas:**

- No hay que olvidarse de poner al final de cada acción un ";".

---

La práctica con estas operaciones permite comprender cómo manipular registros en una base de datos, asegurando la correcta inserción, actualización y consulta de los datos. 

Dominar estas técnicas es clave para el desarrollo de aplicaciones que requieran gestión de información, garantizando integridad y consistencia en los datos almacenados.