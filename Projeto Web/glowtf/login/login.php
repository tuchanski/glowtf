<?php
// Configurações do banco de dados
$host = "localhost:3307";
$usuario = "root"; 
$senha = "";
$banco = "bd_ex_cliente_servidor";

// Conexão com o banco de dados
$conn = new mysqli($host, $usuario, $senha, $banco);

// Verifica a conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Obtém os dados do formulário
$name = $_POST['nome'];
$pass = $_POST['senha'];

if ($name != True) {
    echo "Por favor, insira seu nome de usuário.\n";
    return;
}

if ($pass != True) {
    echo "Por favor, insira sua senha.\n";
    return;
}

// Insere os dados no banco de dados
$sql = "SELECT COUNT(1) AS count FROM usuarios WHERE nome = '$name' and senha = '$pass'";

$res = $conn->query($sql);
$row = $res->fetch_row();

if ($row[0] > 0) {
    echo "Usuário autenticado com sucesso.\n";

} else {
    echo "Usuário não cadastrado.\n" . $conn->error;
    
}

// Fecha a conexão
$conn->close();
?>
 