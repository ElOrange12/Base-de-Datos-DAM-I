En este ejercicio se trabaja con la base de datos `empresadam` para practicar el manejo de tablas y registros en MySQL. 

Se enfatiza el concepto de clave primaria, la creación y modificación de tablas, la inserción y consulta de datos, y la prevención de entradas duplicadas. Estos son conceptos esenciales para mantener la integridad y consistencia de la información en bases de datos relacionales.

---

Primero entramamos en `mysql`:

```
    sudo mysql -u root -p
```

Listamos y usamos la base de datos `empresadam`:

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
    | empresadam         |
    +--------------------+

    USE empresadam;
```

Vemos que tablas tiene:

```
    SHOW TABLES;

    +----------------------+
    | Tables_in_empresadam |
    +----------------------+
    | clientes             |
    +----------------------+
```

Sabiendo que tabla tenemos, vemos que tiene dentro y la describimos para ver como esta hecha:

```
    ELECT * FROM clientes;

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
```

Al parecer no tiene una llave primaria vamos a añadirsela: 

```
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
```

Ahora ya la tiene, vamos a insertar mas clientes para tener una tabla completa:

```
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
```

```
    INSERT INTO clientes VALUES(2, '12345679A', 'Juan', 'Garcia Lopez', 'juan@jocarsa.com');

    ERROR 1062 (23000): Duplicate entry '2' for key 'PRIMARY'
```

Tambien vemos como al intentar añadir un cliente con un `id` ya usado nos tira error.

---

A continuación se muestra un ejemplo de código del ejercicio resuelto:

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
```

**Notas:**

- Es importante no olvidarse del ";" después de cada acción

---

A través de la práctica con claves primarias y operaciones CRUD, se refuerza la importancia de diseñar tablas que eviten duplicados y garanticen la integridad de los datos. 

Comprender cómo manipular y estructurar la información de manera correcta es fundamental para el desarrollo de aplicaciones confiables y eficientes que dependan de bases de datos relacionales.