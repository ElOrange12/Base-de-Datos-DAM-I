CREATE VIEW personas_correos AS 

SELECT
emails.direccion,
personas.nombre,
personas.apellidos
FROM emails
LEFT JOIN personas
ON emails.persona = personas.Identificador;



SELECT * FROM personas_correos; -- Se comporta como una tabla
+------------------------------+--------+----------------+
| direccion                    | nombre | apellidos      |
+------------------------------+--------+----------------+
| info@elorange12.com          | Daniel | Oliveira Vidal |
| info@danieloliveiravidal.com | Daniel | Oliveira Vidal |
| elorange12@gmail.com         | Daniel | Oliveira Vidal |
+------------------------------+--------+----------------+
