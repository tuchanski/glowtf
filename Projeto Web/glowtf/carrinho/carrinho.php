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

    // $sql = "SELECT
    //             h.name AS nome_produto,
    //             c.id_user,
    //             chh.id_hat,
    //             h.price,
    //             h.promo_image,
    //             IF(h.name = 'hat', 'Yes', 'No') AS cart_has_hat
    //         FROM
    //             cart c
    //         JOIN
    //             cart_has_hat chh ON c.id_user = chh.id_cart
    //         JOIN
    //             hat h ON chh.id_hat = h.id
    //         WHERE
    //             c.id_user = 2
    //         GROUP BY
    //             h.name, c.id_user, chh.id_hat, h.price, h.promo_image
    //         ORDER BY
    //             h.name;";

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
