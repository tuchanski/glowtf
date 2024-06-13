<?php
session_start();

if(isset($_POST['submit']) && !empty($_POST['nome']) && !empty($_POST['email']) && !empty($_POST['cpf']) && !empty($_POST['genero']) && !empty($_POST['estado']) && !empty($_POST['senha']) && !empty($_POST['steam']) && !empty($_POST['confirma-senha'])) {
    include_once('config.php');
    
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $cpf = $_POST['cpf'];
    $genero = $_POST['genero'];
    $estado = $_POST['estado'];
    $senha = $_POST['senha'];
    $confirma_senha = $_POST['confirma-senha'];
    $steam = $_POST['steam'];

    if ($senha !== $confirma_senha) {
        $_SESSION['cadastro_status'] = 'senha_diferente';
        header('Location: cadastro.html?cadastro_status=senha_diferente');
        exit();
    }

    $sql = "SELECT * FROM user WHERE email = '$email' OR cpf = '$cpf'";
    $result = $conn->query($sql);

    if(mysqli_num_rows($result) < 1) {
        $adicionaUsuario = mysqli_query($conn, "INSERT INTO user (name, gender, state, cpf, email, password, admin, id_steam) VALUES ('$nome', '$genero', '$estado', '$cpf', '$email', '$senha', 'FALSE', '$steam')");
        $_SESSION['cadastro_status'] = 'sucesso'; 
        header('Location: ../login/login.html?cadastro_status=sucesso');
        exit();
    } else {
        $_SESSION['cadastro_status'] = 'erro'; 
        header('Location: cadastro.html?cadastro_status=erro');
        exit();
    }
} else {
    header('Location: cadastro.html');
    exit();
}
?>
