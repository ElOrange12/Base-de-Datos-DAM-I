<?php

    $host = 'localhost';
    $user = 'futbol';
    $pass = 'Futbol2526$';
    $db   = 'futbol';

    $conexion = new mysqli($host, $user, $pass, $db);

    $sql = 'SELECT * FROM equipos';

    $resultado = $conexion->query($sql);

    while ($fila = $resultado->fetch_assoc()) {
        var_dump($fila);
    }

    $conexion->close();

?>