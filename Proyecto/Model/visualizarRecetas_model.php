<?php
include_once 'baseDatosModel.php';

function ConsultarRecetasDB() {
    $conexion = AbrirBaseDatos();
    $sentencia = "CALL ConsultarRecetas()";
    $respuesta = $conexion->query($sentencia);
    CerrarBaseDatos($conexion);
    return $respuesta;
}
?>
