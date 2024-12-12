<?php
include 'db.php';

function getContacts() {
    global $conn;
    $sql = "SELECT * FROM contactos";
    $result = $conn->query($sql);
    return $result;
}

function getContactById($id) {
    global $conn;
    $sql = "SELECT * FROM contactos WHERE ID=$id";
    $result = $conn->query($sql);
    return $result->fetch_assoc();
}

function addContact($name, $phone, $email, $message) {
    global $conn;
    $sql = "INSERT INTO contactos (nombre_completo, telefono, correo_electronico, mensaje) VALUES ('$name', '$phone', '$email', '$message')";
    return $conn->query($sql);
}

function updateContact($id, $name, $phone, $email, $message) {
    global $conn;
    $sql = "UPDATE contactos SET nombre_completo='$name', telefono='$phone', correo_electronico='$email', mensaje='$message' WHERE ID=$id";
    return $conn->query($sql);
}

function deleteContact($id) {
    global $conn;
    $sql = "DELETE FROM contactos WHERE ID=$id";
    return $conn->query($sql);
}
?>
