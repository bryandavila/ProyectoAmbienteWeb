<?php
include_once 'baseDatosModel.php';

function procesarRegistro($nombre, $identificacion, $email, $password, $rol) {
    $conn = AbrirBaseDatos();

    if ($conn === false) {
        return "ERROR: No se pudo conectar a la base de datos. " . mysqli_connect_error();
    }

    $stmt_check = $conn->prepare("SELECT id FROM usuarios WHERE email = ?");
    $stmt_check->bind_param("s", $email);
    $stmt_check->execute();
    $stmt_check->store_result();

    if ($stmt_check->num_rows > 0) {
        $stmt_check->close();
        CerrarBaseDatos($conn);
        return "El email ya está registrado.";
    }

    $password_hash = password_hash($password, PASSWORD_BCRYPT);

    $stmt = $conn->prepare("INSERT INTO usuarios (nombre, identificacion, email, password, rol_id) VALUES (?, ?, ?, ?, ?)");
    if ($stmt) {
        $stmt->bind_param("ssssi", $nombre, $identificacion, $email, $password_hash, $rol);

        if ($stmt->execute()) {
            $stmt->close();
            CerrarBaseDatos($conn);
            return true;
        } else {
            $error = "Error al ejecutar la consulta: " . $stmt->error;
            $stmt->close();
            CerrarBaseDatos($conn);
            return $error;
        }
    } else {
        $error = "Error al preparar la declaración: " . $conn->error;
        CerrarBaseDatos($conn);
        return $error;
    }
}
?>
