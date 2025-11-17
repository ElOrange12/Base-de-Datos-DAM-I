-- sudo mysql -u root -p

USE clientes;

SELECT nombre
FROM clientes;

SELECT 
nombre,
apellidos,
edad,
edad < 30 AS '¿Es menor que 30?',
edad >= 30 && edad < 40 AS 'Entre 30 y 40';
edad > 40 AS 'Mayor de 40 años'
FROM clientes;
