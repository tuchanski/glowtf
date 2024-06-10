<?php
// Incluir o arquivo de conexão
include 'adicionar_produto.php';

// Consultar os dados
$sql = "SELECT paint, name FROM paint";
$result = $conn->query($sql);

?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Adiciona Produto</title>
  <link rel="stylesheet" href="../../estilos/styles.css">
  <link rel="stylesheet" href="./adicionar_produto.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>

<body>
  <nav>
    <ul class="conjunto-nav">
      <li class="logo">
        <a href="../../home/home.html">
          <span class="material-symbols-outlined">
            stylus_laser_pointer
          </span>
          GLOW.<b>TF</b>
        </a>
      </li>
      <li class="searchbar">
        <input type="text" id="searchbar" placeholder="O que você está buscando hoje?">
        <button type="button" class="search-btn">
          <span class="material-symbols-outlined">
            search
          </span>
        </button>
      </li>
      <li>
        <a class="usuario" href="#"><span class="material-symbols-outlined">person</span>Rommeo | Admin</a>
        <ul class="dropdown">
          <li class="dropdown"><a href="../lista_de_produtos/lista_de_produtos.html">Lista de produtos</a></li><br>
          <li class="dropdown"><a>Sair</a></li>
        </ul>
      </li>
    </ul>
  </nav>
  <div class="wrapper">
    <h1 class="title">Cadastrar novo produto</h1>
    <div class="corpo">
      <div class="fundo-adiciona-produto">
        <div class="dados-produto">
          <form id="loginForm" class="login-layout">
            <div class="input-produto">
              <div>
                <label for="nome-produto">Nome:</label>
              </div>
              <div>
                <input type="text" id="nome-produto" name="nome-produto" placeholder="Digite seu nome do produto"
                  required>
              </div>
            </div>
            <div class="input-produto">
              <div>
                <label for="preco-produto">Preço:</label>
              </div>
              <div>
                <input type="number" id="preco-produto" name="preco-produto" placeholder="Digite o preço do produto"
                  required>
              </div>
            </div>
            <div class="input-produto">
              <div>
                <label for="estoque-produto">Estoque:</label>
              </div>
              <div>
                <input type="number" id="estoque" name="estoque" placeholder="Insira o estoque do produto" required>
              </div>
            </div>
            <div class="input-produto">
              <div>
                <label for="descricao">Descrição:</label>
              </div>
              <div>
                <input type="text" id="descricao" name="descricao" placeholder="Insira a descrição do produto" required>
              </div>
            </div>
            <div class="input-produto">
              <div>
                <label for="wiki-produto">Wiki:</label>
              </div>
              <div>
                <input type="text" id="wiki-produto" name="wiki-produto" placeholder="Insira o link da wiki do produto"
                  required>
              </div>
            </div>
            <div class="input-produto">
              <div>
                <label for="tinta">Tinta:</label><br>
              </div>
              <div>
                <select name="tinta" id="tinta">
                  <option value="" disabled selected>Selecione o nome da tinta</option>
                  <option value="0">Nenhuma</option>
                  <?php
                  if ($result->num_rows > 0) {
                      // Saída de dados de cada linha
                      while($row = $result->fetch_assoc()) {
                          echo '<option value="'.$row["paint"].'">'.$row["name"].'</option>';
                      }
                  } else {
                      echo '<option value="">Nenhuma tinta disponível</option>';
                  }
                  $conn->close();
                  ?>
                </select>
                <script>
                  function obterValorTinta() {
                    const tintaProduto = document.getElementById('tinta').value;
                    console.log(tintaProduto);
                    alert(tintaProduto); // Adicionando um alerta para verificar o valor
                  }
                </script>
                <button onclick="obterValorTinta()">Obter Valor da Tinta</button>
              </div>
            </div>
            <div class="input-produto">
              <div>
                <label for="classe">Selecione a classe do chapéu:<br>
                  Ctrl + click para selecionar múltiplas</label><br>
              </div>
              <div> 
                <select name="classe" id="classe" multiple>
                  <option value="Scout">Scout</option>
                  <option value="Soldier">Soldier</option>
                  <option value="Pyro">Pyro</option>
                  <option value="Demoman">Demoman</option>
                  <option value="Heavy">Heavy</option>
                  <option value="Engineer">Engineer</option>
                  <option value="Medic">Medic</option>
                  <option value="Sniper">Sniper</option>
                  <option value="Spy">Spy</option>
                </select>
              </div>
            </div>
            <button type="button" action="./index.html" onclick="cadastraProduto()">Cadastrar produto</button>
        </div>
        <div class="linha-vertical"></div>
        <div class="imagem js-upload">
          <div>
            <input type="file" name="upload-imagem-produto">
            <img class="card-imagem-produto" src="../../dados/imagens/imagens/adicionar_imagem.png">
          </div>
        </div>
      </form>
      </div>
    </div>
  </div>
  <script src="./adicionar_produto.js"></script>
</body>

</html>