En esta actividad se trabaja con MySQL, un sistema gestor de bases de datos relacional muy utilizado para almacenar y administrar información de forma estructurada.
El ejercicio consiste en crear una base de datos llamada `empresadam`, donde se define una tabla `empleados` con varios campos que representan los datos básicos de los trabajadores de una empresa.
A través de diferentes sentencias SQL, se insertan registros, se consultan los datos y se realizan operaciones de actualización y eliminación, mostrando así las funciones más esenciales del lenguaje SQL.

---

Primero de todo para comenzar instalaremos mysql en nuestro ordenador, como el nuestro es un Linux utilizaremos el siguiente comando:

```
    sudo apt install mysql-server
```

A continuación entraremos en `MySQL`, utilizamos el siguiente comando para acceder:

```
    sudo mysql -u root -p
```

Ahora ya dentro de MySQL vamos a crear nuestra base de datos que le llamaremos `empresadam`:

```
    CREATE DATABASE empresadam;
```

Después de crearla utilizaremos el siguiente comando para utilizar esa base de datos:

```
    USE empresadam;
```

Ya tenemos la base de datos y la estamos utilizando, ahora vamos a crear una tabla dentro de esta que la llamaremos `empleados`:

```
    CREATE TABLE empleados (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100),
        apellido VARCHAR(100),
        edad INT
    );
```

Dentro de esta hay una columna que es `id` esta es una `PRIMARY KEY` que se va autoincrementando, otras dos que son `nombre` y `apellido` que son `VARCHAR`, es decir, guardan una cadena de texto y por ultimo una columna que es `edad` que es `INT` que almacena números enteros.

Ya creada la tabla le añadimos dos empleados de ejemplo:

```
    INSERT INTO empleados (nombre, apellido, edad) VALUES ('Juan', 'Pérez', 30);
    INSERT INTO empleados (nombre, apellido, edad) VALUES ('María', 'González', 25);
```

Veamos como ha quedado la tabla utilizando el siguiente comando:

```
    SELECT * FROM empleados;

    +----+--------+----------+------+
    | id | nombre | apellido | edad |
    +----+--------+----------+------+
    |  1 | Juan   | Pérez    |   30 |
    |  2 | María  | González |   25 |
    +----+--------+----------+------+
```

Por ultimo probemos a hacer actualizar o eliminar alguno de los empleados:

```
    UPDATE empleados SET edad = 31 WHERE nombre = 'Juan';
    DELETE FROM empleados WHERE id = 2;
```

---

A continuación se muestra un ejemplo de código del programa resuelto:

```
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
```

**Notas:**

- No olvidarse de poner el ";" después de cada comando
- Saber identificar cada tipo de dato a guardar ya sea `INT`, `VARCHAR` o lo que sea.

---

En conclusión el objetivo de esta actividad es familiarizarte con los conceptos básicos de las bases de datos relacionales y aprender cómo interactuar con ellas mediante MySQL.
El código presentado permite comprender el ciclo completo de gestión de datos: creación de bases de datos y tablas, inserción de registros, consulta de información y modificación o eliminación de datos.
Este tipo de práctica es fundamental para entender cómo se organiza y manipula la información en aplicaciones reales que utilizan bases de datos.