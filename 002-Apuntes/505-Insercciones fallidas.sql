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

ERROR 3819 (HY000): Check constraint 'comprobar_email' is violated
