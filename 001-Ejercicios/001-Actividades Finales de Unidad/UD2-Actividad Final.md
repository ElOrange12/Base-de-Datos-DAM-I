El proyecto consiste en la creación de una base de datos llamada biblioteca25 en MySQL, diseñada para gestionar la información de autores, libros, socios y préstamos. A través de la definición de claves primarias, foráneas, restricciones e índices, se busca representar de forma estructurada y coherente el funcionamiento de una biblioteca real.

---

Primero de todo iniciamos sesión en MySQL:

```
sudo mysql -u root -u
```

Ahora creamos nuestra base de datos y la utilizamos, esto lo hacemos de la siguiente manera:

```
CREATE DATABASE biblioteca25;

USE biblioteca25;
```

Ante la duda comprobaremos si estamos utilizando la adecuada:

```
SELECT DATABASE();

+--------------+
| DATABASE()   |
+--------------+
| biblioteca25 |
+--------------+
1 row in set (0,00 sec)
```

Ya asegurados crearemos la primera tabla, que se llamará `autores`, lo realizaremos de la siguiente manera:

```
CREATE TABLE autores(
	nombre VARCHAR(100),
	pais VARCHAR(80)
);
```

Ahora a esta tabla le añadimos una primiry key con el nombre de `identificador`, esto se hará de la siguiente manera:

```
ALTER TABLE autores
ADD COLUMN identificador INT AUTO_INCREMENT PRIMARY KEY FIRST;
```

Comprobemos que todo funciona utilizando la función `DESCRIBE`:

```
DESCRIBE autores;

+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| nombre        | varchar(100) | YES  |     | NULL    |                |
| pais          | varchar(80)  | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
```

Ahora otra tabla que tenga relación con la anterior:

```
CREATE TABLE libros(
	titulo VARCHAR(200) NOT NULL,
	isbn VARCHAR(20) NOT NULL UNIQUE,
	precio DECIMAL(8,2) NOT NULL CHECK (precio>=0),
	autor_id VARCHAR(255) NOT NULL
);
```

Ponemos otra clave primaria a la tabla:

```
ALTER TABLE libros
ADD COLUMN identificador INT AUTO_INCREMENT PRIMARY KEY FIRST;
```

Ahora teniendola ya creada la relacionamos con la tabla `autores`, esto lo haremos de la siguiente manera:

```
ALTER TABLE libros
MODIFY COLUMN autor_id INT;


ALTER TABLE libros
ADD CONSTRAINT fk_libros_autores
FOREIGN KEY (autor_id) REFERENCES autores(identificador)
ON DELETE CASCADE
ON UPDATE CASCADE;
```

Para tener una forma de buscar en la base de datos vamos a añadir un indice en la tabla de `libros` en la caracteristica de titulo

```
CREATE INDEX idx_titulo ON libros(titulo);
```

Verifiquemos que funciona todo:

```
SHOW INDEX FROM libros;

+--------+------------+-------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name          | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+-------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| libros |          0 | PRIMARY           |            1 | identificador | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| libros |          0 | isbn              |            1 | isbn          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| libros |          1 | fk_libros_autores |            1 | autor_id      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| libros |          1 | idx_titulo        |            1 | titulo        | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+-------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| titulo        | varchar(200) | NO   | MUL | NULL    |                |
| isbn          | varchar(20)  | NO   | UNI | NULL    |                |
| precio        | decimal(8,2) | NO   |     | NULL    |                |
| autor_id      | int          | YES  | MUL | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
```

Vamos a comprobar tambien que el check tambien funcione:

```
INSERT INTO libros VALUES(
	NULL,
	'Libro1',
	'9788401352836',
	'-50',
	'1'
);

ERROR 3819 (HY000): Check constraint 'libros_chk_1' is violated.
```

Ahora creamos una que se llame socios:

```
CREATE TABLE socios(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	email VARCHAR(120) NOT NULL UNIQUE,
	fecha_alta DATE NOT NULL DEFAULT (CURRENT_DATE)
);
```
Le añadimos un `CHECK` que compruebe si el email tiene la configuración correcta:

```
ALTER TABLE socios
	ADD CONSTRAINT chk_email_format
	CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');
```	

Y verifiquemos que esto funciona:

```
DESCRIBE socios;

+------------+--------------+------+-----+-----------+-------------------+
| Field      | Type         | Null | Key | Default   | Extra             |
+------------+--------------+------+-----+-----------+-------------------+
| id         | int          | NO   | PRI | NULL      | auto_increment    |
| nombre     | varchar(100) | NO   |     | NULL      |                   |
| email      | varchar(120) | NO   | UNI | NULL      |                   |
| fecha_alta | date         | NO   |     | curdate() | DEFAULT_GENERATED |
+------------+--------------+------+-----+-----------+-------------------+
```

Ahora vamos hacer una tabla llamada `prestamos`, esta estará relacionada con las anteriores tablas:

```
CREATE TABLE prestamos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	socio_id INT NOT NULL,
	libro_id INT NOT NULL,
	fecha_prestamo DATE NOT NULL DEFAULT (CURRENT_DATE),
	fecha_devolucion DATE NULL
);
```
Agregamos un check que compruebe que la fecha de devolución del prestamo no sea menor a la de cuando se hizo el prestamo:

```
ALTER TABLE prestamos
ADD CONSTRAINT chk_fecha_devolucion 
CHECK (fecha_devolucion IS NULL OR fecha_devolucion >= fecha_prestamo);
```

Ahora agreguemos un indice compuesto con el socio y los libros:

```
CREATE INDEX idx_socio_libre ON prestamos(socio_id, libro_id);
```
 
Verifiquemos que esto funciona:

```
SHOW INDEX FROM prestamos;

+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name        | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| prestamos |          0 | PRIMARY         |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | idx_socio_libre |            1 | socio_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | idx_socio_libre |            2 | libro_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0,02 sec)
```

Ahora vamos a insertar los datos en la tablas.

Empezemos con los autores:

```
INSERT INTO autores VALUES(
	NULL,
	'Isabel Allende',
	'Chile'
);

INSERT INTO autores VALUES(
	NULL,
	'Gabriel García Márquez',
	'Colombia'
);

INSERT INTO autores VALUES(
	NULL,
	'Haruki Murakami',
	'Japón'
);
```

Verifiquemos que se han añadido correctamente:

```
SELECT * FROM autores;

+---------------+--------------------------+----------+
| identificador | nombre                   | pais     |
+---------------+--------------------------+----------+
|             1 | Isabel Allende           | Chile    |
|             2 | Gabriel García Márquez   | Colombia |
|             3 | Haruki Murakami          | Japón    |
+---------------+--------------------------+----------+
```

Ahora vayamos con los libros:

```
INSERT INTO libros VALUES(
	NULL,
	'La casa de los espíritus',
	'9788401352836',
	'20.5',
	'1'
);

INSERT INTO libros VALUES(
	NULL,
	'Cien años de soledad',
	'9780307474728',
	'21.5',
	'2'
);

INSERT INTO libros VALUES(
	NULL,
	'Kafka en la orilla',
	'9788499082478',
	'22.5',
	'3'
);
```

Comprobemos que vaya todo bien:

```
SELECT * FROM libros;

+---------------+---------------------------+---------------+--------+----------+
| identificador | titulo                    | isbn          | precio | autor_id |
+---------------+---------------------------+---------------+--------+----------+
|             1 | La casa de los espíritus  | 9788401352836 |  20.50 |        1 |
|             2 | Cien años de soledad      | 9780307474728 |  21.50 |        2 |
|             3 | Kafka en la orilla        | 9788499082478 |  22.50 |        3 |
+---------------+---------------------------+---------------+--------+----------+
```

Insertemos a continuación los socios:

```
INSERT INTO socios VALUES(
	NULL,
	'Ana Ruiz',
	'ana.ruiz@example.com',
	'2025-10-31'
);

INSERT INTO socios VALUES(
	NULL,
	'Luis Pérez',
	'luis.perez@example.com',
	'2025-10-31'
);
```

Y comprobemos de nuevo que se hayan añadido:

```
SELECT * FROM socios;

+----+-------------+------------------------+------------+
| id | nombre      | email                  | fecha_alta |
+----+-------------+------------------------+------------+
|  1 | Ana Ruiz    | ana.ruiz@example.com   | 2025-10-31 |
|  2 | Luis Pérez  | luis.perez@example.com | 2025-10-31 |
+----+-------------+------------------------+------------+
```

Por ultimo añadamos los datos de los prestamos:

```
INSERT INTO prestamos VALUES(
	NULL,
	'1',
	'1',
	'2025-10-31',
	NULL
);

INSERT INTO prestamos VALUES(
	NULL,
	'2',
	'2',
	'2025-10-31',
	'2035-10-31'
);
```

Y de nuevo comprobemos que se añadieron correctamente:

```
SELECT * FROM prestamos;

+----+----------+----------+----------------+------------------+
| id | socio_id | libro_id | fecha_prestamo | fecha_devolucion |
+----+----------+----------+----------------+------------------+
|  1 |        2 |        1 | 2025-10-31     | 2035-10-31       |
|  2 |        2 |        2 | 2025-10-31     | 2035-10-31       |
+----+----------+----------+----------------+------------------+
```

Teniendo todo añadido veamos un resumen de todo y comprobemos que todo funcionó:

```
SHOW TABLES;
DESCRIBE autores;
DESCRIBE libros;
DESCRIBE socios;

+------------------------+
| Tables_in_biblioteca25 |
+------------------------+
| autores                |
| libros                 |
| prestamos              |
| socios                 |
+------------------------+

+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| nombre        | varchar(100) | YES  |     | NULL    |                |
| pais          | varchar(80)  | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+

+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| titulo        | varchar(200) | NO   | MUL | NULL    |                |
| isbn          | varchar(20)  | NO   | UNI | NULL    |                |
| precio        | decimal(8,2) | NO   |     | NULL    |                |
| autor_id      | int          | YES  | MUL | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+

+------------+--------------+------+-----+-----------+-------------------+
| Field      | Type         | Null | Key | Default   | Extra             |
+------------+--------------+------+-----+-----------+-------------------+
| id         | int          | NO   | PRI | NULL      | auto_increment    |
| nombre     | varchar(100) | NO   |     | NULL      |                   |
| email      | varchar(120) | NO   | UNI | NULL      |                   |
| fecha_alta | date         | NO   |     | curdate() | DEFAULT_GENERATED |
+------------+--------------+------+-----+-----------+-------------------+
```

**Notas:**

- Los datos de precios son inventados

---

En conclusión la base de datos biblioteca25 demuestra la correcta aplicación de conceptos esenciales de MySQL, como las claves, relaciones, restricciones y validaciones. Este ejercicio permite comprender la importancia de la integridad referencial y la normalización, reforzando los conocimientos sobre el diseño eficiente de bases de datos relacionales y su utilidad en sistemas de gestión reales.
