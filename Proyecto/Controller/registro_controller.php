<?php
include_once '../Model/procesar_registro.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre'];
    $identificacion = $_POST['identificacion'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $rol = $_POST['rol'];

    $resultado = procesarRegistro($nombre, $identificacion, $email, $password, $rol);

    if ($resultado === true) {
        header("Location: login.php");
        exit();
    } else {
        $error_registro = "Error en el registro: " . $resultado;
    }
}
?>
