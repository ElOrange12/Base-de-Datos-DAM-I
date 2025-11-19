DELETE FROM clientes; 	-- borra todo

INSERT INTO clientes VALUES(
	NULL,
	'12345678Z',
	'Daniel',
	'Oliveira Vidal',
	'info@elorange.com'
);

SELECT * FROM clientes;

TRUNCATE TABLE clientes;	-- resetea la tabla pero no se la carga

INSERT INTO clientes VALUES(
	NULL,
	'12345678Z',
	'Daniel',
	'Oliveira Vidal',
	'info@elorange.com'
);

SELECT * FROM clientes;

DROP TABLE clientes;	-- mucho cuidado con esto porque borra la tabla
