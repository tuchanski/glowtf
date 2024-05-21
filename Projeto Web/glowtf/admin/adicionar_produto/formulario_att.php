<?php

if(isset($_POST['submit'])) {
    include_once('config.php');

    $email = $_POST['email'];
    $senha = $_POST['senha'];
    $novo_nome = $_POST['novo_nome'];
    $novo_sobrenome = $_POST['novo_sobrenome'];
    $nova_data_nasc = $_POST['nova_data_nasc'];

    if(!empty($email) && !empty($senha)) {
        $query = "SELECT * FROM usuarios WHERE email='$email' AND senha='$senha'";
        $result = mysqli_query($conexao, $query);
        
        if(mysqli_num_rows($result) > 0) {
            // Verifica se o usuário tem mais de 18 anos
            $data_nascimento = new DateTime($nova_data_nasc);
            $data_atual = new DateTime();
            $idade = $data_atual->diff($data_nascimento)->y;

            if($idade < 18) {
                echo "<div id='mensagem-erro'>Usuário deve ser maior de 18 anos!</div>"; 
            } else {
                $update_query = "UPDATE usuarios SET nome='$novo_nome', sobrenome='$novo_sobrenome', data_nasc='$nova_data_nasc' WHERE email='$email' AND senha='$senha'";
                if(mysqli_query($conexao, $update_query)) {
                    echo "<div id='mensagem'>Atualizado com sucesso!!</div>";        
                    echo "<script>setTimeout(function() { window.location.href = 'home.php'; }, 3000);</script>";
                } else {
                    echo "<div id='mensagem-erro'>Erro ao atualizar as informações do usuário.</div>";
                }
            }
        } else {
            echo "<div id='mensagem-erro'>Usuário não encontrado.</div>"; 
        }
    } else {
        echo "<div id='mensagem-erro'>E-mail e senha devem ser preenchidos corretamente!</div>";
    }
} else {
    echo "";
}
?>




<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atualização de Usuário</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-image: linear-gradient(to right, rgb(255, 69, 0), rgb(0, 0, 0));
        }
        .container {
            color: black;
            position: absolute;
            margin: 0 50% 0 30%;
            background-color: black;
            padding: 15px;
            border-radius: 15px;
            width: 30%;
        }
        fieldset {
            border: 3px solid orangered;
        }
        legend {
            border: 1px solid orangered;
            padding: 10px;
            text-align: center;
            background-color: orangered;
            border-radius: 8px;
        }
        .inputBox {
            position: relative;
            color: white;
        }
        .inputUser {
            background: none;
            border: none;
            border-bottom: 1px solid white;
            outline: none;
            color: white;
            font-size: 15px;
            width: 100%;
            letter-spacing: 2px;
        }
        .labelInput {
            position: absolute;
            top: 0px;
            left: 0px;
            pointer-events: none;
            transition: .5s;
        }
        .inputUser:focus ~ .labelInput,
        .inputUser:valid ~ .labelInput {
            top: -20px;
            font-size: 12px;
            color: orangered;
        }
        #submit {
            background-color: orangered;
            width: 100%;
            border: none;
            padding: 15px;
            color: black;
            font-size: 15px;
            cursor: pointer;
            border-radius: 10px;
        }
        #submit:hover {
            background-color: rgb(20, 255, 20);
        }
        #back {
            background-color: black;
            width: 10%;
            padding: 15px;
            color: orangered;
            border-radius: 10px;
        }
        #back:hover {
            color: rgb(20, 255, 20);
        }
        #mensagem {
            color: white;
            background-color: green;
            text-align: center;
            padding: 10px;
            margin-top: 20px;
            border-radius: 5px;
        }
        #mensagem-erro {
            background-color: red;
            text-align: center;
            padding: 10px;
            margin-top: 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <br><br>
    <a id="back" href="home.php">Voltar</a>
    <div class="container">
        <form action="formulario_att.php" method="POST">
            <fieldset>
                <legend><b>Atualização de Usuário</b></legend>
                <br>
                <div class="inputBox">
                    <input type="text" name="email" id="email" class="inputUser" required>
                    <label for="email" class="labelInput">Email</label>
                </div>
                <br><br>
                <div class="inputBox">
                    <input type="password" name="senha" id="senha" class="inputUser" required><br>
                    <label for="senha" class="labelInput">Senha</label>
                <br><br>
                </div>
                <div class="inputBox">
                    <input type="text" name="novo_nome" id="novo_nome" class="inputUser" required>
                    <label for="novo_nome" class="labelInput">Novo Nome</label>
                </div>
                <br><br>
                <div class="inputBox">
                    <input type="text" name="novo_sobrenome" id="novo_sobrenome" class="inputUser" required>
                    <label for="novo_sobrenome" class="labelInput">Novo Sobrenome</label>
                </div>
                <br><br>
                <div class="inputBox">
                    <label for="nova_data_nasc"><b>Nova Data de Nascimento:</b></label><br><br>
                    <input type="date" name="nova_data_nasc" id="nova_data_nasc" required>
                </div>
                <br><br>
                <input type="submit" name="submit" id="submit">
            </fieldset>
        </form>
    </div>
</body>
</html>