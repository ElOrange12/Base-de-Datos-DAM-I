SELECT COUNT(color)
FROM productos; -- resumen

+--------------+
| COUNT(color) |
+--------------+
|           35 |
+--------------+

SELECT COUNT(color), color
FROM productos
GROUP BY color;

+--------------+----------+
| COUNT(color) | color    |
+--------------+----------+
|            4 | Rojo     |
|            3 | Verde    |
|            1 | Amarillo |
|            1 | Naranja  |
|           10 | Negro    |
|            9 | Blanco   |
|            4 | Azul     |
|            2 | Marrón   |
|            1 | Gris     |
+--------------+----------+
