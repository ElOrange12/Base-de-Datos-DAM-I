INSERT INTO clientes VALUES(
	NULL,
	'12345678A',
	'Daniel',
	'Oliveira Vidal',
	'info@elorange.com'
);

ERROR 3819 (HY000): Check constraint 'comprobar_dni_nie_letra' is violated.

INSERT INTO clientes VALUES(
	NULL,
	'12345678Z',
	'Daniel',
	'Oliveira Vidal',
	'algo'
);

ERROR 3819 (HY000): Check constraint 'comprobar_email' is violated.

INSERT INTO clientes VALUES(
	NULL,
	'12345678Z',
	'Daniel',
	'Oliveira Vidal',
	'info@elorange.com'
);

SELECT * FROM clientes;
+---------------+-----------+--------+----------------+-------------------------------+
| identificador | dni       | nombre | apellidos      | email                         |
+---------------+-----------+--------+----------------+-------------------------------+
|             4 | 26639136F | Daniel | Oliveira Vidal | danieloliveiravidal@gmail.com |
+---------------+-----------+--------+----------------+-------------------------------+
1 row in set (0,00 sec)
