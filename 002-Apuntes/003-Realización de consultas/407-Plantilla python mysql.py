import mysql.connector

conexion = mysql.connector.connect(
	host='localhost',
	user='creadorportafolio',
	password='PortafolioExamen2526$',
	database='portafolioexamen'
)

cursor = conexion.cursor()
cursor.execute(''' SELECT * FROM clientes ''')
filas = cursor.fetchall()

print(filas)
