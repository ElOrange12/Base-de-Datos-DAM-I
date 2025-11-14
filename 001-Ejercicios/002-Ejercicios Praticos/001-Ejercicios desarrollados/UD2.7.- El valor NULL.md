En este ejercicio se trabaja con la tabla `pedidos` en MySQL para practicar cómo manejar valores NULL y garantizar la integridad de los datos.

Se muestran operaciones de inserción y selección de registros, y se observa cómo MySQL impide que se inserten valores nulos en columnas que no lo permiten, lo que refuerza la importancia de definir correctamente las restricciones de las tablas.

---

Primero de todo entremos en MySQL:

```
    sudo mysql -u root -p
```

Ahora veamos que tablas hay y creeamos una llamada `empresadam` y la usamos:

```
    SHOW DATABASES;

    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | performance_schema |
    | sys                |
    | test               |
    +--------------------+

    CREATE DATABASE empresadam;

    USE empresadam;
```

Veamos las tablas que tiene y en la de pedidos añadimos un varios productos:

```
    SHOW TABLES;

    +----------------------+
    | Tables_in_empresadam |
    +----------------------+
    | clientes             |
    | productos            |
    | pedidos              |
    +----------------------+

    INSERT INTO pedidos (numerodepedido, cliente, producto) 
    VALUES ('001', 'Juan Pérez', 'Laptop');

    SELECT * FROM pedidos;

    +----------------+------------+----------+
    | numerodepedido | cliente    | producto |
    +----------------+------------+----------+
    | 001            | Juan Pérez | Laptop   |
    +----------------+------------+----------+

    INSERT INTO pedidos (numerodepedido, cliente, producto) VALUES ('002', NULL, 'Monitor');

    ERROR 1048 (23000): Column 'cliente' cannot be null    
```

Vemos que si añadimos una caracteristica como `NULL` salta un error.

Por ultimo salimos de MySQL:

```
    EXIT;
```

---

```
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
+--------------------+

CREATE DATABASE empresadam;

USE empresadam;

SHOW TABLES;

+----------------------+
| Tables_in_empresadam |
+----------------------+
| clientes             |
| productos            |
| pedidos              |
+----------------------+

INSERT INTO pedidos (numerodepedido, cliente, producto) 
VALUES ('001', 'Juan Pérez', 'Laptop');

SELECT * FROM pedidos;

+----------------+------------+----------+
| numerodepedido | cliente    | producto |
+----------------+------------+----------+
| 001            | Juan Pérez | Laptop   |
+----------------+------------+----------+

INSERT INTO pedidos (numerodepedido, cliente, producto) VALUES ('002', NULL, 'Monitor');

ERROR 1048 (23000): Column 'cliente' cannot be null

EXIT;
```

**Notas:**

- No hay que olvidarse de poner ";" al terminar cualquier acción

---

Comprender y manejar los valores **NULL** es fundamental para mantener la consistencia de la base de datos. 

Este ejercicio muestra cómo MySQL aplica restricciones automáticamente para evitar datos incompletos y permite al estudiante aprender a diseñar tablas con reglas claras, asegurando que cada registro contenga la información necesaria.