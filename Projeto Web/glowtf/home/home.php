<?php
$servername = "localhost"; 
$username = "root";
$password = "root";
$database = "glowtfdb";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Failed Connection: " . $conn->connect_error);
}

// Consulta SQL para recuperar lista de aplicativos
$sql = "SELECT * FROM hat";
$result = $conn->query($sql);

$hatList = array();
header('Content-Type: application/json');
echo json_encode($hatList);

// Fechando conexão
$conn->close();
?>
