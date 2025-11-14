-- sudo mysql -u root -p

SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test               |
+--------------------+

CREATE DATABASE empresadam;

USE empresadam;

SHOW TABLES;

+----------------------+
| Tables_in_empresadam |
+----------------------+
| clientes             |
| productos            |
| pedidos              |
+----------------------+

INSERT INTO pedidos (numerodepedido, cliente, producto) 
VALUES ('001', 'Juan Pérez', 'Laptop');

SELECT * FROM pedidos;

+----------------+------------+----------+
| numerodepedido | cliente    | producto |
+----------------+------------+----------+
| 001            | Juan Pérez | Laptop   |
+----------------+------------+----------+

INSERT INTO pedidos (numerodepedido, cliente, producto) VALUES ('002', NULL, 'Monitor');

ERROR 1048 (23000): Column 'cliente' cannot be null

EXIT;
