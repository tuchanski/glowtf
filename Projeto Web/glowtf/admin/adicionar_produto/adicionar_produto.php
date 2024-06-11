<?php
// Configurações do banco de dados
$host = "localhost:3307";
$usuario = "root"; 
$senha = "";
$banco = "glowtfdb";

$conn = new mysqli($host, $usuario, $senha, $banco);

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}
function isInteger($input) {
    return ctype_digit(strval($input));
}

$productName = isset($_POST['nome-produto']) ? $_POST['nome-produto'] : '';
$productPrice = isset($_POST['preco-produto']) ? $_POST['preco-produto'] : '';
$inventory = isset($_POST['estoque:']) ? $_POST['estoque:'] : '';
$description = isset($_POST['descricao']) ? $_POST['descricao'] : '';
$productWiki = isset($_POST['wiki-produto']) ? $_POST['wiki-produto'] : '';
$hatClass = isset($_POST['classe']) ? $_POST['classe'] : '';
$paint = isset($_POST['tinta']) ? $_POST['tinta'] : '';
$productImage = isset($_FILES['upload-imagem']) ? $_FILES['upload-imagem'] : null;

echo $productName;
echo $productPrice;
echo $inventory;
echo $description;
echo $productWiki;
echo $hatClass;
echo $paint;
// echo $productImage;

$sql = "INSERT INTO hat (inventory, price, promo_image, name, paint_id, description) VALUES ('$inventory', '$productPrice', 'teste.png', '$productName', '1', '$description')";


if ($conn->query($sql) === TRUE) {
    echo "Produto inserido com sucesso!\n";
} else {
    echo "Erro ao inserir novo produto." . $conn->error;
    
}
 
$conn->close();
?>
 