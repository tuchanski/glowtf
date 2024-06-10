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
function isInteger($input) {
    return ctype_digit(strval($input));
}

// Recebendo dados do formulário
$productName = isset($_POST['nome-produto']) ? $_POST['nome-produto'] : '';
$productPrice = isset($_POST['preco-produto']) ? $_POST['preco-produto'] : '';
$inventory = isset($_POST['estoque:']) ? $_POST['estoque:'] : '';
$description = isset($_POST['descricao']) ? $_POST['descricao'] : '';
$productWiki = isset($_POST['wiki-produto']) ? $_POST['wiki-produto'] : '';
$hatClass = isset($_POST['classe']) ? $_POST['classe'] : '';
$paint = isset($_POST['tinta']) ? $_POST['tinta'] : '';
$productImage = isset($_FILES['upload-imagem']) ? $_FILES['upload-imagem'] : null;

// Expressão regular para validar o link da wiki
$wikiRegex = "/^https:\/\/wiki\.teamfortress\.com\/.*$/";

echo $productName;
echo $productPrice;
echo $inventory;
echo $description;
echo $productWiki;
echo $hatClass;
echo $paint;
echo $productImage;


// // Verificações de validação
// if (empty($productName) || 
//     empty($productPrice) || 
//     empty($inventory) || 
//     empty($description) || 
//     empty($productWiki) || 
//     empty($hatClass) || 
//     $productImage['error'] == UPLOAD_ERR_NO_FILE) {

//     echo "Preencha todos os campos!";
// } elseif (!isInteger($inventory)) {
//     echo "Insira apenas números inteiros no estoque do produto.";
// } elseif (strlen($productName) < 3) {
//     echo "O nome precisa ter no mínimo três caracteres.";
// } elseif (strlen($description) < 20) {
//     echo "A descrição precisa ter no mínimo 20 caracteres.";
// } elseif (!preg_match($wikiRegex, $productWiki)) {
//     echo "O link precisa ser da wiki do produto.";
// } else {
//     // Aqui você pode adicionar o código para processar o upload do arquivo e salvar os dados no banco de dados

//     // Exemplo de como mover o arquivo para o diretório desejado
//     $uploadDirectory = '../uploads/';
//     $uploadFile = $uploadDirectory . basename($productImage['name']);

//     if (move_uploaded_file($productImage['tmp_name'], $uploadFile)) {
//         echo "ok";
//     } else {
//         echo "Falha no upload da imagem.";
//     }
// }



// // Insere os dados no banco de dados
// $sql = "INSERT INTO hat (inventory, price, promo_image, name, paint, description) VALUES ('$inventory', '$productPrice', '$productImage', '$productName', $paint, '$description')";


// if ($conn->query($sql) === TRUE) {
//     echo "Produto inserido com sucesso!\n";
// } else {
//     echo "Erro ao inserir novo produto." . $conn->error;
    
// }
 
// Fecha a conexão
$conn->close();
?>
 