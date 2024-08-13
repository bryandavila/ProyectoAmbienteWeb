<?php
include_once 'baseDatosModel.php';

function ConsultarMedicamentosDB() {
    $conexion = AbrirBaseDatos();
    $sentencia = "CALL ConsultarMedicamentos()";
    $respuesta = $conexion->query($sentencia);
    CerrarBaseDatos($conexion);
    return $respuesta;
}
?>
