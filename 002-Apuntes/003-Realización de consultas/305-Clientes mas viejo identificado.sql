-- sudo mysql -u root -p

USE clientes;

SELECT 
nombre,
apellidos,
edad
FROM clientes
GROUP BY edad DESC
LIMIT 1;
