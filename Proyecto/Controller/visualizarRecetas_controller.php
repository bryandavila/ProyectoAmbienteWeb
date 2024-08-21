<?php
include_once '../Model/visualizarRecetas_model.php';

function ConsultarRecetas() {
    $respuesta = ConsultarRecetasDB();

    if ($respuesta->num_rows > 0) {
        while ($row = mysqli_fetch_array($respuesta)) {
            echo "<tr>";
            echo "<td>" . $row["nombre"] . "</td>"; 
            echo "<td>" . $row["dosis"] . "</td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='5'>No hay recetas </td></tr>";
    }
}
?>