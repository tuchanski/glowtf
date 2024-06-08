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
    $sql = "SELECT
                hat.id AS hat_id,
                hat.name AS hat_name,
                hat.inventory,
                hat.price,
                hat.promo_image AS hat_promo_image,
                hat.description,
                hat.wiki,
                paint.paint_id,
                paint.name AS paint_name,
                paint.promo_image AS paint_promo_image,
                paint.hex_color
            FROM
                hat
            LEFT JOIN
                paint ON hat.paint_id = paint.paint_id
            WHERE
                hat.inventory > 0;";

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
