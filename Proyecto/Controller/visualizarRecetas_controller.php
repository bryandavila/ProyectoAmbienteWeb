function ConsultarUsuarios()
    {
        $respuesta = ConsultarUsuariosBD();

        if($respuesta -> num_rows > 0)
        {
            while ($row = mysqli_fetch_array($respuesta)) 
            { 
                echo "<tr>";
                echo "<td>" . $row["Identificacion"] . "</td>";
                echo "<td>" . $row["Nombre"] . "</td>";
                echo "<td>" . $row["Correo"] . "</td>";
                echo "<td>" . $row["NombreRol"] . "</td>";
                echo "</tr>";
            }
        }
    }

?>