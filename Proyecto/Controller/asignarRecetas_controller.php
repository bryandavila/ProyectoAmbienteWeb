<?php
include_once '../Model/asignarRecetas_model.php';

if(isset($_POST["AsignarReceta"])) {
    $identificacion = $_POST['identificacion'];
    $cita_id = $_POST['cita_id'];
    $medicamento = $_POST['medicamento'];
    $dosis = $_POST['dosis'];
    $instrucciones = $_POST['instrucciones'];

    $resultado = AsignarRecetas($identificacion, $cita_id, $medicamento, $dosis, $instrucciones);

    if ($resultado) {
        // Redirigir o mostrar mensaje de éxito
        echo "Receta asignada exitosamente.";
    } else {
        // Manejar el error
        echo "Error al asignar la receta.";

        //hola
    }
}
?>