-- Create
INSERT INTO clientes VALUES(
	'12345678A',
	'Daniel',
	'Oliveira Vidal',
	'info@elorange12.com'
);

Query OK, 1 row affected (0,02 sec)

-- Read

SELECT * FROM clientes;
+-----------+--------+----------------+---------------------+
| dni       | nombre | apellidos      | email               |
+-----------+--------+----------------+---------------------+
| 12345678A | Daniel | Oliveira Vidal | info@elorange12.com |
+-----------+--------+----------------+---------------------+
1 row in set (0,00 sec)

-- Update

UPDATE clientes
SET dni = '11111111A'
WHERE nombre = 'Daniel';

Query OK, 1 row affected (0,01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

-- Delete

DELETE FROM clientes
WHERE dni = '11111111A'
