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
$lastname = $_POST['sobrenome'];
$pass = $_POST['senha'];
$email = $_POST['email'];
$birthday_day = $_POST['dia'];
$birthday_month = $_POST['mes'];
$birthday_year = $_POST['ano'];

if ($name != True) {
    echo "Por favor, insira seu nome.\n";
    return;
}

if ($lastname != True) {
    echo "Por favor, insira seu sobrenome.\n";
    return;
}

if ($pass != True) {
    echo "Por favor, insira sua senha.\n";
    return;
}

if ($email != True) {
    echo "Por favor, insira seu email.\n";
    return;
}

if (2024 - $birthday_year <= 18) {
    echo "Usuário deve ter mais que 18 anos.\n";
    return;
}

if (strlen($pass) <= 10) {
    echo "Senha fraca, por favor insira 10 caracteres no mínimo.\n";
    return;
}

// Insere os dados no banco de dados
$sql = "INSERT INTO usuarios (nome, senha) VALUES ('$name', '$pass')";

if ($conn->query($sql) === TRUE) {
    echo "Dados inseridos com sucesso!\n";

} else {
    echo "Erro ao inserir dados: " . $conn->error;
    
}

// Fecha a conexão
$conn->close();
?>
 