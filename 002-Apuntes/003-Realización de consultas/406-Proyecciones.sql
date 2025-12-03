SELECT COUNT(color)
FROM productos; -- resumen

+--------------+
| COUNT(color) |
+--------------+
|           35 |
+--------------+

SELECT COUNT(color) AS numero, 
color
FROM productos
GROUP BY color
ORDER BY color ASC;

+--------------+----------+
| COUNT(color) | color    |
+--------------+----------+
|            1 | Amarillo |
|            1 | Naranja  |
|            1 | Gris     |
|            2 | Marrón   |
|            3 | Verde    |
|            4 | Rojo     |
|            4 | Azul     |
|            9 | Blanco   |
|           10 | Negro    |
+--------------+----------+

