'''
	Portafolio
	v1.0 Daniel Oliveira Vidal

'''
import mysql.connector

conexion = mysql.connector.connect(
	host='localhost',
	user='danielo',
	password='Portafolio2526$',
	database='portafolio'
)
cursor = conexion.cursor()

def insertarPieza(titulo, descripcion, imagen, url, id_categoria):
	cursor.execute('''
  INSERT INTO pieza
  VALUES(
    NULL,
    "'''+titulo+'''",
    "'''+descripcion+'''",
    "'''+imagen+'''",
    "'''+url+'''",
    '''+id_categoria+'''
  );
''')

def mostrarTabla(tabla):
	cursor.execute('SELECT * FROM '+tabla+';')
	resultado = cursor.fetchall()
	return resultado
	
def eliminarEnTabla(tabla, identificador):
	cursor.execute('''
	DELETE FROM '''+tabla+'''
	WHERE identificador = '''+identficador+'''
''')

conexion.commit()

print('')
print('Hola buenas al portafolio')
print('')

while True:
	print('1.-Insertar en tabla.\n2.-Mostrar tabla\n3.-Actualizar tabla\n4.-Eliminar en tabla.\n5.-Salir')
	respuesta = int(input('Escoge una opción: '))
	print('')
	
	if respuesta == 1:
		titulo = input('Dime el titulo de la pieza: ')
		descripcion = input('Dime la descripción de la pieza: ')
		imagen = input('Dime el nombre de la imagen de la pieza: ')
		url = input('Dime la url de la pieza: ')
		id_categoria = input('Dime el ID de la categoría: ')
	
		insertarPieza(titulo, descripcion, imagen, url, id_categoria)
		print('')

	elif respuesta == 2:
		tabla = input('Qué tabla quieres ver?: ')
		print('')
		
		resultado = mostrarTabla(tabla)
		for fila in resultado:
			print(fila)
		print('')
		
	elif respuesta == 3:
		identificador = input("Introduce el Identificador a actualizar: ")
		titulo = input("Introduce el titulo de la nueva pieza: ")
		descripcion = input("Introduce la descripcion de la nueva pieza: ")
		fecha = input("Introduce la fecha de la nueva pieza: ")
		imagen = input("Introduce el nombre de la imagen de la nueva pieza: ")
		cursor.execute('''
		  UPDATE piezas 
		  SET
		  titulo = "'''+titulo+'''",
		  descripcion = "'''+descripcion+'''",
		  fecha = "'''+fecha+'''",
		  imagen = "'''+imagen+'''"
		  WHERE Identificador = '''+identificador+'''
		''')
		print('')

	elif respuesta == 4:
		tabla = input('De que tabla quieres borrar: ')
		identificador = input('Dime el idenficador de la cosa que quieres borrar: ')
		
		eliminarEnTabla(tabla, identificador)		
		
	elif respuesta == 5:
		print('Adiós')
		print('')
		break
		
	else:
		print('Esa no es una opción correcta.')
		print('')

