<?php
session_start();
include_once '../Model/procesar_login.php';

function verificarRol($rol_permiso) {
    if (!isset($_SESSION['rol_id']) || $_SESSION['rol_id'] !== $rol_permiso) {
        header("Location: ../View/login.php");
        exit();
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $login_result = procesarLogin($email, $password);

    if (is_array($login_result) && array_key_exists('error_message', $login_result)) {
        $_SESSION['error_message'] = $login_result['error_message'];
        header("Location: ../View/login.php");
        exit();
    } else {
        $_SESSION['rol_id'] = $login_result['rol_id'];

        switch ($_SESSION['rol_id']) {
            case 1:
                verificarRol(1);
                header("Location: ../View/homePacientes.php");
                exit();
            case 2:
                verificarRol(2);
                header("Location: ../View/homeMedicos.php");
                exit();
            case 3:
                verificarRol(3);
                header("Location: ../View/dashboard_admin.php");
                exit();
            default:
                $_SESSION['error_message'] = "ERROR: Rol desconocido.";
                header("Location: ../View/login.php");
                exit();
        }
    }
}
?>
