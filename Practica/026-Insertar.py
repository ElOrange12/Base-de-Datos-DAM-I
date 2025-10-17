# Importamos libreria
import sqlite3

# Nos conectamos a la base de datos
conexion = sqlite3.connect('empresa.db')

# Creamos un cursor
cursor = conexion.cursor()

cursor.execute('''
	CREATE TABLE IF NOT EXISTS clientes (
		"Identificador" INTEGER, "nombre" TEXT, "apellidos", "email" TEXT, PRIMARY KEY ("Identificador" AUTOINCREMENT)
	);
''')

# Ejecutamos una sentencia
cursor.execute('''
	INSERT INTO clientes VALUES(
		NULL, 'Pedro', 'Piqueras Perez', 'pedro@piquerasperez.com'
	);
''')

# Lanzamos la peticion
conexion.commit()
