<?php
include 'functions.php';
$message = ''; // Inicializar la variable $message

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['nombre'];
    $surname = $_POST['apellidos'];
    $email = $_POST['correo_electronico'];
    $phone = $_POST['telefono'];
    $messageText = $_POST['mensaje']; // Renombrar variable para evitar conflicto con $message
    if (addContact($name, $surname, $email, $phone, $messageText)) {
        $message = "Contacto agregado exitosamente.";
    } else {
        $message = "Error al agregar el contacto.";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agregar Contacto</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
    <h1>Agregar Contacto</h1>
    <?php if ($message): ?>
        <div><?php echo $message; ?></div>
    <?php endif; ?>
    <form name="contactForm" method="POST" onsubmit="return validateForm()">
        <label>Nombre: <input type="text" name="nombre" required></label><br>
        <label>Apellidos: <input type="text" name="apellidos" required></label><br>
        <label>Correo Electrónico: <input type="email" name="correo_electronico" required></label><br>
        <label>Teléfono: <input type="text" name="telefono"></label><br>
        <label>Mensaje: <textarea name="mensaje" required></textarea></label><br>
        <button type="submit"><i class="fas fa-save"></i> Agregar</button>
    </form>
    <a href="index.php"><i class="fas fa-arrow-left"></i> Regresar</a>
</body>
</html>
