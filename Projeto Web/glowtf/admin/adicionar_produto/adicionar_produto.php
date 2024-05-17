<?php
// Configurações do banco de dados
$host = "localhost:3307";
$usuario = "root"; 
$senha = "";
$banco = "glowtfdb";

// Conexão com o banco de dados
$conn = new mysqli($host, $usuario, $senha, $banco);

// Verifica a conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Obtém os dados do formulário
$productName = $_POST['nome-produto'];
$productPrice = $_POST['preco-produto'];
$stock = $_POST['estoque'];
$paint = $_POST['tinta'];
// $productWiki = $_POST['wiki-produto'];
$hatClass = $_POST['classe'];

// Verifica se os inputs NOT NULL foram inseridos pelo usuário
if ($productName != True) {
    echo "Por favor, insira o nome do produto.\n";
    return;
}

if ($productPrice != True) {
    echo "Por favor, insira o preço do produto.\n";
    return;
}

if ($stock != True) {
    echo "Por favor, insira o estoque do produto.\n";
    return;
}

// Insere os dados no banco de dados
$sql = "INSERT INTO usuarios (nome, senha) VALUES ('$name', '$pass')";

if ($conn->query($sql) === TRUE) {
    echo "Dados inseridos com sucesso!\n";

} else {
    echo "Erro ao inserir novo produto." . $conn->error;
    
}
 
// Fecha a conexão
$conn->close();
?>
 