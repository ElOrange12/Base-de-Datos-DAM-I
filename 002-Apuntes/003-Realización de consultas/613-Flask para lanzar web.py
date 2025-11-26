mport mysql.connector 
from flask import Flask

conexion = mysql.connector.connect(
	host="localhost",
	user="composiciones",
	password="composiciones",
	database="composiciones"
)                                      

app = Flask(__name__)
@app.route('/')
def inicio():
	cursor = conexion.cursor(dictionary=True) 
	cursor.execute("SELECT * FROM matriculas_join;")  
	filas = cursor.fetchall()
	return str(filas)

filas = cursor.fetchall()

print(filas)

if __name__ == "__main__":
	app.run(debug=True)
