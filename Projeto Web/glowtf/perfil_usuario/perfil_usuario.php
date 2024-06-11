<?php
$host = "localhost";
$port = "3310"; 
$usuario = "root";
$senha = ""; 
$banco = "glowtfdb";

$conn = new mysqli($host, $usuario, $senha, $banco);

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

if (isset($_GET['id_user'])) {
    $user_id = $_GET['id_user'];

    $sql = "SELECT sale.*, sale_has_hat.* 
            FROM sale 
            INNER JOIN sale_has_hat ON sale_has_hat.id_sale = sale.id 
            WHERE sale.id_user = ?";
    
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    
    $result = $stmt->get_result();
    
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
    $stmt->close();
} else {
    echo json_encode(["error" => "ID do usuário não fornecido"]);
}

$conn->close();
?>
