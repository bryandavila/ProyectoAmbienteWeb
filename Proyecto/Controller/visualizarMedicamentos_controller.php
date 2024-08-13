<?php
include_once '../Model/visualizarMedicamentos_model.php';

function ConsultarMedicamentos() {
    $respuesta = ConsultarMedicamentosDB();

    if ($respuesta->num_rows > 0) {
        while ($row = mysqli_fetch_array($respuesta)) {
            echo "<tr>";
            echo "<td>" . $row["medicamento_id"] . "</td>"; // Asegúrate de que la columna 'medicamento_id' exista si la necesitas
            echo "<td>" . $row["nombre"] . "</td>";
            echo "<td>" . $row["descripcion"] . "</td>";
            echo "<td>" . $row["stock"] . "</td>";
            echo "<td>" . $row["precio"] . "</td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='5'>No hay medicamentos disponibles</td></tr>";
    }
}
?>
