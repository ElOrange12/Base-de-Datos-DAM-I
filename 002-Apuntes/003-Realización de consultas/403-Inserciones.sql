CREATE TABLE productos(
	nombre VARCHAR(255),
	precio DECIMAL(10, 2),
	categoria VARCHAR(255),
	peso DECIMAL(10, 2),
	stock INT,
	color VARCHAR(100)
);

INSERT INTO productos (nombre, precio, categoria, peso, stock, color) VALUES
('Manzana Roja', 1.20, 'Fruta', 0.15, 100, 'Rojo'),
('Manzana Verde', 1.10, 'Fruta', 0.14, 80, 'Verde'),
('Plátano', 0.90, 'Fruta', 0.12, 120, 'Amarillo'),
('Pera Conferencia', 1.30, 'Fruta', 0.16, 100, 'Verde'),
('Naranja Valenciana', 1.00, 'Fruta', 0.20, 150, 'Naranja'),

('Camiseta Básica', 9.99, 'Ropa', 0.25, 50, 'Negro'),
('Camiseta Blanca', 8.99, 'Ropa', 0.25, 70, 'Blanco'),
('Pantalón Vaquero', 24.99, 'Ropa', 0.60, 40, 'Azul'),
('Sudadera Hoodie', 29.99, 'Ropa', 0.80, 50, 'Negro'),
('Chaqueta Deportiva', 39.99, 'Ropa', 0.90, 30, 'Rojo'),

('Ratón Inalámbrico', 15.99, 'Electrónica', 0.10, 25, 'Negro'),
('Teclado Mecánico', 49.99, 'Electrónica', 0.80, 15, 'Negro'),
('Monitor 24"', 129.99, 'Electrónica', 3.50, 10, 'Negro'),
('Auriculares Bluetooth', 19.99, 'Electrónica', 0.20, 30, 'Blanco'),
('Altavoz Portátil', 29.99, 'Electrónica', 0.50, 20, 'Azul'),

('Silla de Oficina', 89.99, 'Muebles', 7.00, 12, 'Negro'),
('Mesa de Madera', 149.99, 'Muebles', 20.00, 5, 'Marrón'),
('Lámpara LED', 25.99, 'Muebles', 1.50, 25, 'Blanco'),
('Estantería 5 Niveles', 59.99, 'Muebles', 10.00, 8, 'Blanco'),
('Cajonera Plástica', 19.99, 'Muebles', 3.00, 12, 'Azul'),

('Café Molido', 4.50, 'Supermercado', 0.50, 100, 'Marrón'),
('Arroz Largo', 1.20, 'Supermercado', 1.00, 200, 'Blanco'),
('Azúcar Blanco', 0.90, 'Supermercado', 1.00, 150, 'Blanco'),
('Harina de Trigo', 1.10, 'Supermercado', 1.00, 150, 'Blanco'),
('Aceite de Oliva', 5.99, 'Supermercado', 1.00, 80, 'Verde'),

('Sofá 3 Plazas', 299.99, 'Muebles', 30.00, 4, 'Gris'),
('Televisor 55"', 499.99, 'Electrónica', 12.00, 6, 'Negro'),
('Tablet 10"', 149.99, 'Electrónica', 0.50, 20, 'Blanco'),
('Teclado Low Profile', 39.99, 'Electrónica', 0.60, 15, 'Negro'),
('Ratón Gamer', 29.99, 'Electrónica', 0.15, 25, 'Rojo'),

('Cazadora Vaquera', 39.99, 'Ropa', 0.90, 35, 'Azul'),
('Zapatillas Deportivas', 59.99, 'Ropa', 0.70, 60, 'Blanco'),
('Gorra Deportiva', 12.99, 'Ropa', 0.10, 100, 'Negro'),
('Bufanda de Lana', 14.99, 'Ropa', 0.20, 80, 'Rojo'),
('Pantalón Deportivo', 19.99, 'Ropa', 0.50, 90, 'Negro');

SELECT * FROM productos;

+-----------------------+--------+--------------+-------+-------+----------+
| nombre                | precio | categoria    | peso  | stock | color    |
+-----------------------+--------+--------------+-------+-------+----------+
| Manzana Roja          |   1.20 | Fruta        |  0.15 |   100 | Rojo     |
| Manzana Verde         |   1.10 | Fruta        |  0.14 |    80 | Verde    |
| Plátano               |   0.90 | Fruta        |  0.12 |   120 | Amarillo |
| Pera Conferencia      |   1.30 | Fruta        |  0.16 |   100 | Verde    |
| Naranja Valenciana    |   1.00 | Fruta        |  0.20 |   150 | Naranja  |
| Camiseta Básica       |   9.99 | Ropa         |  0.25 |    50 | Negro    |
| Camiseta Blanca       |   8.99 | Ropa         |  0.25 |    70 | Blanco   |
| Pantalón Vaquero      |  24.99 | Ropa         |  0.60 |    40 | Azul     |
| Sudadera Hoodie       |  29.99 | Ropa         |  0.80 |    50 | Negro    |
| Chaqueta Deportiva    |  39.99 | Ropa         |  0.90 |    30 | Rojo     |
| Ratón Inalámbrico     |  15.99 | Electrónica  |  0.10 |    25 | Negro    |
| Teclado Mecánico      |  49.99 | Electrónica  |  0.80 |    15 | Negro    |
| Monitor 24"           | 129.99 | Electrónica  |  3.50 |    10 | Negro    |
| Auriculares Bluetooth |  19.99 | Electrónica  |  0.20 |    30 | Blanco   |
| Altavoz Portátil      |  29.99 | Electrónica  |  0.50 |    20 | Azul     |
| Silla de Oficina      |  89.99 | Muebles      |  7.00 |    12 | Negro    |
| Mesa de Madera        | 149.99 | Muebles      | 20.00 |     5 | Marrón   |
| Lámpara LED           |  25.99 | Muebles      |  1.50 |    25 | Blanco   |
| Estantería 5 Niveles  |  59.99 | Muebles      | 10.00 |     8 | Blanco   |
| Cajonera Plástica     |  19.99 | Muebles      |  3.00 |    12 | Azul     |
| Café Molido           |   4.50 | Supermercado |  0.50 |   100 | Marrón   |
| Arroz Largo           |   1.20 | Supermercado |  1.00 |   200 | Blanco   |
| Azúcar Blanco         |   0.90 | Supermercado |  1.00 |   150 | Blanco   |
| Harina de Trigo       |   1.10 | Supermercado |  1.00 |   150 | Blanco   |
| Aceite de Oliva       |   5.99 | Supermercado |  1.00 |    80 | Verde    |
| Sofá 3 Plazas         | 299.99 | Muebles      | 30.00 |     4 | Gris     |
| Televisor 55"         | 499.99 | Electrónica  | 12.00 |     6 | Negro    |
| Tablet 10"            | 149.99 | Electrónica  |  0.50 |    20 | Blanco   |
| Teclado Low Profile   |  39.99 | Electrónica  |  0.60 |    15 | Negro    |
| Ratón Gamer           |  29.99 | Electrónica  |  0.15 |    25 | Rojo     |
| Cazadora Vaquera      |  39.99 | Ropa         |  0.90 |    35 | Azul     |
| Zapatillas Deportivas |  59.99 | Ropa         |  0.70 |    60 | Blanco   |
| Gorra Deportiva       |  12.99 | Ropa         |  0.10 |   100 | Negro    |
| Bufanda de Lana       |  14.99 | Ropa         |  0.20 |    80 | Rojo     |
| Pantalón Deportivo    |  19.99 | Ropa         |  0.50 |    90 | Negro    |
+-----------------------+--------+--------------+-------+-------+----------+

