-- sudo mysql -u root -p

USE clientes;

SELECT nombre
FROM clientes;

SELECT 
nombre,
apellidos,
edad,
edad < 30 AS '¿Es menor que 30?'
FROM clientes;



