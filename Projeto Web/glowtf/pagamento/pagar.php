<?php

session_start();
date_default_timezone_set('America/Sao_Paulo');

if (!empty($_POST['meio_pagamento']) && !empty($_POST['hat_price']) && !empty($_POST['user_id']) && !empty($_POST['hat_id'])) {
    include_once('config.php');

    $meio_pagamento_full = $_POST['meio_pagamento'];
    $preco_chapeu = $_POST['hat_price'];
    $usuario = $_POST['user_id'];
    $id_chapeu = $_POST['hat_id'];
    $dataAtual = date('Y-m-d');

    $meio_pagamento_map = [
        'Pix' => 'p',
        'Debito' => 'd',
        'Credito' => 'c',
        'Boleto' => 'b'
    ];

    if (array_key_exists($meio_pagamento_full, $meio_pagamento_map)) {
        $meio_pagamento = $meio_pagamento_map[$meio_pagamento_full];
    } else {
        echo "Meio de pagamento inválido.";
        exit;
    }

    $meio_pagamento = mysqli_real_escape_string($conn, $meio_pagamento);
    $preco_chapeu = mysqli_real_escape_string($conn, $preco_chapeu);
    $usuario = mysqli_real_escape_string($conn, $usuario);
    $id_chapeu = mysqli_real_escape_string($conn, $id_chapeu);

    $query = "INSERT INTO sale (date, id_user, price, payment_method) VALUES ('$dataAtual', '$usuario', '$preco_chapeu', '$meio_pagamento')";

    $result = mysqli_query($conn, $query);

    if ($result) {
        $sale_id = mysqli_insert_id($conn); // Recupera o ID da venda recém-criada

        $query_hat = "INSERT INTO sale_has_hat (id_sale, id_hat, price) VALUES ('$sale_id', '$id_chapeu', '$preco_chapeu')";
        $result_hat = mysqli_query($conn, $query_hat);

        if ($result_hat) {
            header("Location: ../home/home.html?user=$usuario");
        } else {
            echo "Erro ao inserir dados na tabela sale_has_hat: " . mysqli_error($conn);
        }
    } else {
        echo "Erro ao inserir dados na tabela sale: " . mysqli_error($conn);
    }

    mysqli_close($conn);
} else {
    echo "Preencha todos os campos obrigatórios.";
}

?>
