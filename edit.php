<?php
include 'functions.php';
$message = '';

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $contact = getContactById($id);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $name = $_POST['nombre_completo'];
    $phone = $_POST['telefono'];
    $email = $_POST['correo_electronico'];
    $message = $_POST['mensaje'];
    if (updateContact($id, $name, $phone, $email, $message)) {
        echo "Contacto actualizado exitosamente.";
    } else {
        echo "Error al actualizar el contacto.";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Contacto</title>
    <link rel="stylesheet" href="styles.css">
    <script>
        function validateForm() {
            const name = document.forms["contactForm"]["nombre"].value;
            const surname = document.forms["contactForm"]["apellidos"].value;
            const email = document.forms["contactForm"]["correo_electronico"].value;
            const phone = document.forms["contactForm"]["telefono"].value;
            const message = document.forms["contactForm"]["mensaje"].value;

            if (name === "" || surname === "" || email === "" || message === "") {
                alert("Todos los campos marcados con * son obligatorios.");
                return false;
            }

            const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
            if (!email.match(emailPattern)) {
                alert("Por favor, introduce una dirección de correo electrónico válida.");
                return false;
            }

            if (phone !== "" && isNaN(phone)) {
                alert("El número de teléfono debe contener solo dígitos.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <h1>Editar Contacto</h1>
    <form method="POST">
        <input type="hidden" name="id" value="<?php echo $contact['ID']; ?>">
        <label>Nombre Completo: <input type="text" name="nombre_completo" value="<?php echo $contact['nombre_completo']; ?>" required></label><br>
        <label>Teléfono: <input type="text" name="telefono" value="<?php echo $contact['telefono']; ?>"></label><br>
        <label>Correo Electrónico: <input type="email" name="correo_electronico" value="<?php echo $contact['correo_electronico']; ?>" required></label><br>
        <label>Mensaje: <textarea name="mensaje" required><?php echo $contact['mensaje']; ?></textarea></label><br>
        <button type="submit">Actualizar</button>
    </form>
    <a href="index.php">Regresar</a>
</body>
</html>
