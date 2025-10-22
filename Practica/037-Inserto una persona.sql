INSERT INTO personas VALUES(
	NULL,
	'Daniel',
	'Oliveira Vidal'
);

-- Borrar una tabla (recodatorio)
DROP TABLE personas;
-- Cuidado

SELECT * FROM personas;
+---------------+--------+----------------+
| identificador | nombre | apellidos      |
+---------------+--------+----------------+
|             1 | Daniel | Oliveira Vidal |
+---------------+--------+----------------+

DESCRIBE personas;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| nombre        | varchar(50)  | YES  |     | NULL    |                |
| apellidos     | varchar(255) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+

