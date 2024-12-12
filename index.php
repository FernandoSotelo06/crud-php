<?php
include 'functions.php';
$contacts = getContacts();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Contactos</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <h1>Contactos</h1>
    <a href="add.php" class="button"><i class="fas fa-plus"></i> Agregar</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre Completo</th>
            <th>Teléfono</th>
            <th>Correo Electrónico</th>
            <th>Mensaje</th>
            <th>Acciones</th>
        </tr>
        <?php while($row = $contacts->fetch_assoc()): ?>
            <tr>
                <td><?php echo $row['ID']; ?></td>
                <td><?php echo $row['nombre_completo']; ?></td>
                <td><?php echo $row['telefono']; ?></td>
                <td><?php echo $row['correo_electronico']; ?></td>
                <td><?php echo $row['mensaje']; ?></td>
                <td>
                    <a href="edit.php?id=<?php echo $row['ID']; ?>"><i class="fas fa-edit"></i></a>
                    <a href="delete.php?id=<?php echo $row['ID']; ?>" onclick="return confirm('¿Estás seguro de que deseas eliminar este contacto?');"><i class="fas fa-trash-alt"></i></a>
                </td>
            </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>
