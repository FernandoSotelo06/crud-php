<?php
include 'functions.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    if (deleteContact($id)) {
        echo "Contacto eliminado exitosamente.";
    } else {
        echo "Error al eliminar el contacto.";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Contacto</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Eliminar Contacto</h1>
    <a href="index.php">Regresar</a>
</body>
</html>
