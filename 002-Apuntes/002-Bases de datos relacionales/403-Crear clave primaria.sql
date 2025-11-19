ALTER TABLE clientes
ADD COLUMN identificador INT AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER = Altera
TABLE = tabla
clientes = la tabla que quiero alterar
ADD = la operación que quiero realizar
COLUMN = quiero añadir una columna (entero)
AUTO_INCREMENT = el número va a crecer automaticamente
PRIMARY KEY = clave primaria
FIRST = si hay varias, esta tiene la preferencia

DESCRIBE clientes;

INSERT INTO clientes
VALUES(
	NULL,
	'11111111A',
	'Daniel',
	'Oliveira Vidal',
	'info@elorange12.com'
);

SELECT * FROM clientes;

INSERT INTO clientes
VALUES(
	NULL,
	'22222222B',
	'David',
	'García Lopez',
	'info@david.com'
);

SELECT * FROM clientes;

INSERT INTO clientes
VALUES(
	2,
	'22222222B',
	'David',
	'García Lopez',
	'info@david.com'
);

ERROR 1062 (23000): Duplicate entry '2' for key 'clientes.PRIMARY'
mysql> 

INSERT INTO clientes
VALUES(
	2,
	'22222222B',
	'David',
	'García Lopez',
	'info@david.com'
);

Ejemplo:
20260001

INSERT INTO clientes
VALUES(
	NULL,
	'22222222B',
	'David',
	'García Lopez',
	'info@david.com'
);

SELECT * FROM clientes;
