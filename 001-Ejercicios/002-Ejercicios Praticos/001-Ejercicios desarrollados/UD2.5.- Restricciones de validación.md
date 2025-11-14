En este ejercicio se trabajan las restricciones de validación en bases de datos relacionales utilizando MySQL. Se implementan `constraints` y `CHECK`s para garantizar la integridad de los datos en las tablas `clientes` y `productos`.

Esto incluye validar la estructura de DNI/NIE, asegurar que los precios y el stock sean valores positivos y que los nombres cumplan con una longitud mínima. 

Estas prácticas ayudan a prevenir errores y mantener la coherencia de la información en la base de datos.

---

Primero usamos un `DESCRIBE` para analizar la tabla clientes:

```
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

Analizada la tabla, le añadimos la restricción de los DNIs o NIEs

```
    ALTER TABLE clientes
        ADD CONSTRAINT comprobar_dni_nie_letra
        CHECK (
            (
            -- DNI: 8 dígitos + letra
            dninie REGEXP '^[0-9]{8}[A-Za-z]$'
            AND
            UPPER(SUBSTRING(dninie, 9, 1)) =
            SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE',
                        (CAST(SUBSTRING(dninie, 1, 8) AS UNSIGNED) MOD 23) + 1,
                        1)
            )
            OR
            (
            -- NIE: X/Y/Z + 7 dígitos + letra
            dninie REGEXP '^[XYZxyz][0-9]{7}[A-Za-z]$'
            AND
            UPPER(SUBSTRING(dninie, 9, 1)) =
            SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE',
                        (
                        CAST(CONCAT(
                                CASE UPPER(SUBSTRING(dninie, 1, 1))
                                WHEN 'X' THEN '0'
                                WHEN 'Y' THEN '1'
                                WHEN 'Z' THEN '2'
                                END,
                                SUBSTRING(dninie, 2, 7)
                        ) AS UNSIGNED) MOD 23
                        ) + 1,
                        1)
            )
        );
```

Ahora creemos una tabla `productor`:

```
    CREATE TABLE productos (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(255) NOT NULL,
        descripcion TEXT,
        precio DECIMAL(10,2) NOT NULL CHECK (precio >= 0 AND precio <= 5000),
        stock INT NOT NULL CHECK (stock >= 0)
    );
```

Y le añadimos restricciones a la tabla:

```
    ALTER TABLE productos MODIFY id INT NOT NULL, ADD PRIMARY KEY (id);

    ALTER TABLE productos MODIFY id INT NOT NULL AUTO_INCREMENT;

    ALTER TABLE productos ADD CONSTRAINT chk_stock_no_negativo CHECK (stock >= 0);

    ALTER TABLE productos ADD CONSTRAINT chk_precio_no_negativo CHECK (precio >= 0);

    ALTER TABLE productos ADD CONSTRAINT chk_precio_max_5000 CHECK (precio <= 5000);

    ALTER TABLE productos ADD CONSTRAINT chk_nombre_min_5 CHECK (CHAR_LENGTH(nombre) >= 5);
```

Por ultimo creamos una copia de seguridad:

```
    sudo mysqldump -u root -p empresadam
```

---

```
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

ALTER TABLE clientes
  ADD CONSTRAINT comprobar_dni_nie_letra
  CHECK (
    (
      -- DNI: 8 dígitos + letra
      dninie REGEXP '^[0-9]{8}[A-Za-z]$'
      AND
      UPPER(SUBSTRING(dninie, 9, 1)) =
      SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE',
                (CAST(SUBSTRING(dninie, 1, 8) AS UNSIGNED) MOD 23) + 1,
                1)
    )
    OR
    (
      -- NIE: X/Y/Z + 7 dígitos + letra
      dninie REGEXP '^[XYZxyz][0-9]{7}[A-Za-z]$'
      AND
      UPPER(SUBSTRING(dninie, 9, 1)) =
      SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE',
                (
                  CAST(CONCAT(
                        CASE UPPER(SUBSTRING(dninie, 1, 1))
                          WHEN 'X' THEN '0'
                          WHEN 'Y' THEN '1'
                          WHEN 'Z' THEN '2'
                        END,
                        SUBSTRING(dninie, 2, 7)
                  ) AS UNSIGNED) MOD 23
                ) + 1,
                1)
    )
  );

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL CHECK (precio >= 0 AND precio <= 5000),
    stock INT NOT NULL CHECK (stock >= 0)
);

DESCRIBE productos;

+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| nombre      | varchar(255) | NO   |     | NULL    |                |
| descripcion | text         | YES  |     | NULL    |                |
| precio      | decimal(10,2)| NO   |     | NULL    |                |
| stock       | int          | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+

ALTER TABLE productos MODIFY id INT NOT NULL, ADD PRIMARY KEY (id);

ALTER TABLE productos MODIFY id INT NOT NULL AUTO_INCREMENT;

ALTER TABLE productos ADD CONSTRAINT chk_stock_no_negativo CHECK (stock >= 0);

ALTER TABLE productos ADD CONSTRAINT chk_precio_no_negativo CHECK (precio >= 0);

ALTER TABLE productos ADD CONSTRAINT chk_precio_max_5000 CHECK (precio <= 5000);

ALTER TABLE productos ADD CONSTRAINT chk_nombre_min_5 CHECK (CHAR_LENGTH(nombre) >= 5);

-- sudo mysqldump -u root -p empresadam
```

**Notas:**

- Muy importante no olvidarse del ";" después de las acciones

---

La aplicación de restricciones de validación es fundamental para garantizar que los datos almacenados sean correctos y coherentes.

Al practicar con **CHECKs**, claves primarias y validaciones personalizadas como la de DNI/NIE, se refuerza la comprensión de cómo proteger la integridad de los registros y se adquieren habilidades prácticas para diseñar bases de datos más seguras y confiables.