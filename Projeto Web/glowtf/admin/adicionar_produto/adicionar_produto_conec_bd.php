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
$inventory = $_POST['estoque'];
$paint = $_POST['tinta'];
$productImage = $_POST['imagem'];
$productWiki = $_POST['wiki-produto'];
$description = $_POST['descricao'];
$hatClass = $_POST['classe'];

// Insere os dados no banco de dados
$sql = "INSERT INTO hat (inventory, price, promo_image, name, paint, description) VALUES ('$inventory', '$productPrice', '$productImage', '$productName', $paint, '$description')";

echo $productName;
echo $productPrice;
echo $inventory;
echo $paint;
echo $productWiki;
echo $description;
echo $hatClass;

if ($conn->query($sql) === TRUE) {
    echo "Produto inserido com sucesso!\n";
} else {
    echo "Erro ao inserir novo produto." . $conn->error;
    
}
 
// Fecha a conexão
$conn->close();
?>
 