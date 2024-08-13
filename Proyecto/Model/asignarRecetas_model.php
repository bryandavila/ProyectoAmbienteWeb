<?php
include_once 'baseDatosModel.php';

function AsignarRecetas($identificacion, $cita_id, $medicamento, $dosis, $instrucciones) {
    $conexion = AbrirBaseDatos();

    // Primero, obtener el ID del paciente basado en la identificación
    $stmt = $conexion->prepare("SELECT id FROM Pacientes WHERE identificacion = ?");
    $stmt->bind_param('s', $identificacion);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($paciente_id);
        $stmt->fetch();

        // Luego, insertar la receta médica
        $stmt = $conexion->prepare("INSERT INTO RecetasMedicas (paciente_id, fecha, medicamento, dosis, instrucciones) VALUES (?, NOW(), ?, ?, ?)");
        $stmt->bind_param('isss', $paciente_id, $medicamento, $dosis, $instrucciones);
        $respuesta = $stmt->execute();
    } else {
        $respuesta = false;
    }

    $stmt->close();
    CerrarBaseDatos($conexion);

    return $respuesta;
}
?>