<?php
// Configurações do banco de dados
$host = "localhost";
$port = "3307"; // Port should be separated from the host
$usuario = "root";
$senha = ""; // Use the appropriate password here
$banco = "glowtfdb";

// Conexão com o banco de dados
$conn = new mysqli($host, $usuario, $senha, $banco, $port);

// Verifica a conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
} else {
    $sql = "SELECT name, promo_image, price, 
    COALESCE((SELECT name FROM paint p WHERE p.paint_id = h.paint_id), \"\") as \"paint_name\" 
    FROM hat h WHERE h.inventory > 0";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $rows = array();
        while($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }
        header('Content-Type: application/json');
        echo json_encode($rows);
    } else {
        echo json_encode([]);
    }
}

// Fecha a conexão
$conn->close();
?>
