<?php
include_once 'baseDatosModel.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

function procesarLogin($email, $password) {
    $conn = AbrirBaseDatos();

    if ($conn === false) {
        return [
            'error_message' => "ERROR: No se pudo conectar a la base de datos."
        ];
    }

    $sql = "SELECT id, email, password, rol_id, nombre FROM usuarios WHERE email = ?";
    if ($stmt = $conn->prepare($sql)) {
        $stmt->bind_param("s", $email);

        if ($stmt->execute()) {
            $stmt->store_result();

            if ($stmt->num_rows == 1) {
                $stmt->bind_result($id, $email, $hashed_password, $rol_id, $nombre);
                if ($stmt->fetch()) {
                    if (password_verify($password, $hashed_password)) {
                        $_SESSION['id'] = $id;
                        $_SESSION['email'] = $email;
                        $_SESSION['rol_id'] = $rol_id;
                        $_SESSION['nombre'] = $nombre;
                        return [
                            'id' => $id,
                            'email' => $email,
                            'rol_id' => $rol_id,
                            'nombre' => $nombre
                        ];
                    } else {
                        return [
                            'error_message' => "La contraseña ingresada es incorrecta."
                        ];
                    }
                }
            } else {
                return [
                    'error_message' => "No se encontró una cuenta con ese correo electrónico."
                ];
            }
        } else {
            return [
                'error_message' => "ERROR: No se pudo ejecutar la consulta."
            ];
        }

        $stmt->close();
    } else {
        return [
            'error_message' => "ERROR: No se pudo preparar la declaración: " . $conn->error
        ];
    }

    $conn->close();
    return [
        'error_message' => "ERROR: Algo salió mal. Por favor, inténtelo de nuevo."
    ];
}
?>
