-- Crea usuario nuevo con contraseña
-- Creamos el nombre de usuario que queramos
CREATE USER 
'daniel'@'localhost' 
IDENTIFIED  BY 'Empresadam2526$';

-- Permite acceso a ese usuario
GRANT USAGE ON *.* TO 'daniel'@'localhost';

--[tuservidor] == localhost
-- La contraseña puede requerir Mayus, minus, numeros, caracteres, min len

-- Quitale todos los limites que tenga
ALTER USER 'daniel'@'localhost' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;

-- Dale acceso a la base de datos empresadam
GRANT ALL PRIVILEGES ON `empresadam`.* 
TO 'daniel'@'localhost';

-- Recarga la tabla de privilegios
FLUSH PRIVILEGES;
