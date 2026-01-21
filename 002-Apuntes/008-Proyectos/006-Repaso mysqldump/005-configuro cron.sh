En el cron, añado esta linea:

Terminal:
crontab -e

* * * * * /usr/bin/python3 /var/www/html/generadorapuntesv3/informe.py 

y luego
Control + O = Guardar
Control + X = Salir


