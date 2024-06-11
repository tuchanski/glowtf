<?php
$host = "localhost";
$port = "3307";
$usuario = "root";
$senha = "";
$banco = "glowtfdb";

$conn = new mysqli($host, $usuario, $senha, $banco, $port);

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
} else {
    // $sql = "SELECT
    //             hat.id AS hat_id,
    //             hat.name AS hat_name,
    //             hat.inventory,
    //             hat.price,
    //             hat.promo_image AS hat_promo_image,
    //             hat.description,
    //             hat.wiki,
    //             paint.paint_id,
    //             paint.name AS paint_name,
    //             paint.promo_image AS paint_promo_image,
    //             paint.hex_color
    //         FROM
    //             hat
    //         LEFT JOIN
    //             paint ON hat.paint_id = paint.paint_id
    //         WHERE
    //             hat.inventory > 0;";

    $sql = "SELECT
                chh.id AS cart_has_hat_id,
                chh.id_cart AS user_id,
                chh.id_hat,
                h.name AS hat_name,
                h.price,
                h.promo_image AS hat_promo_image,
                p.name AS paint_name,
                p.promo_image AS paint_promo_image,
                p.hex_color AS paint_hex_color
            FROM
                cart_has_hat chh
            JOIN
                hat h ON chh.id_hat = h.id
            LEFT JOIN
                paint p ON h.paint_id = p.paint_id
            WHERE
                chh.id_cart = 4;";

    $result= $conn->query($sql);
   
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

$conn->close();
?>
