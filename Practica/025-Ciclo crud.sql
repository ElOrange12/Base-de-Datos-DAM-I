-- Create

INSERT INTO clientes VALUES(
	NULL,
	'Daniel',
	'Oliveira Vidal',
	'info@elorange12'
)

-- Read

SELECT * FROM clientes;

-- Update

UPDATE clientes
SET email = 'info@elorange12.com'
WHERE Identificador = 1;

-- Delete

DELETE clientes
WHERE Identificador = 1;
