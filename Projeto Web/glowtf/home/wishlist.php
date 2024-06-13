<?php
$host = "localhost";
$port = "3307";
$usuario = "root";
$senha = "";
$banco = "glowtfdb";

$conn = new mysqli($host, $usuario, $senha, $banco, $port);

if ($conn->connect_error) {
    die("Erro na conexão com o banco de dados: " . $conn->connect_error);
}

$user_id = $conn->real_escape_string($_POST['user_id']);
$hat_id = $conn->real_escape_string($_POST['hat_id']);

$sql = "SELECT 1 FROM wishlist_has_hat WHERE id_wishlist = '$user_id' AND id_hat = '$hat_id'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "O usuário tem o chapéu na lista de desejos.";
} else {
    echo "O usuário não tem o chapéu na lista de desejos.";
}

$conn->close();
?>
