import sqlite3

conexion = sqlite3.connect("empresa.db")
cursor = conexion.cursor()

print('Programa agenta SQLite v0.1 Daniel Oliveira Vidal')
while True:
	print('Escoge un opción:\n1.-Crear cliente\n2.-Listar clientes')
	opcion = int(input('Selecciona una opción: '))
	
	if opcion == 1:
		nombre = input('Introduce el nombre del nuevo cliente: ')
		apellidos = input('Introduce los apellidos del nuevo cliente: ')
		email = input('Introduce el email del nuevo cliente: ')
		cursor.execute("""
			INSERT INTO clientes VALUES(
				NULL,'"""+nombre+"""','"""+apellidos+"""','"""+email+"""'
			);""")
		conexion.commit()
		
	elif opcion == 2:
		cursor.execute('''
			SELECT * FROM clientes;
		''')
		
		filas = cursor.fetchall()
		
		for fila in filas:
			print(fila)
