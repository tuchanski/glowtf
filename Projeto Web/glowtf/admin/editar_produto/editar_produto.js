// document.addEventListener('DOMContentLoaded', function () {
//   // const inputUploadImagem = document.getElementById('upload-imagem');
//   // const divImagens = document.querySelector('.imagens');
//   // // const imgProduto = document.querySelector('.imagem-produto');
//   // const selectTinta = document.getElementById('tinta');
//   // const imgSplash = document.querySelector('.splash');

//   // // Esconde ou mostra o splash da tinta conforme o valor do input
//   // selectTinta.addEventListener('change', function () {
//   //   const tintaSelecionada = selectTinta.value;
//   //   if (tintaSelecionada !== "Nenhuma" && tintaSelecionada !== "") {
//   //     imgSplash.src = `../../dados/imagens/tintas/${tintaSelecionada.replace(/ /g, '_')}.png`;
//   //     imgSplash.style.display = 'block';
//   //     console.log(imgSplash.src);
//   //   } else {
//   //     imgSplash.style.display = 'none';
//   //   }
//   // });

//   // document.getElementById('estoque').addEventListener('keydown', validarTecla);
//   carregaTintas();
//   carregaClasses()
// });

function validarTecla(event) {
  const tecla = event.key;
  if (
    tecla === 'Backspace' || tecla === 'Delete' || tecla === 'ArrowLeft' || tecla === 'ArrowRight' ||
    tecla === 'Tab' || tecla === 'Enter'
  ) {
    return;
  }
  // Impedir qualquer tecla que não seja um número
  if (!/^[0-9]$/.test(tecla)) {
    event.preventDefault();
  }
}

function cadastraProduto() {
  const formulario = document.getElementById('formProduto');
  const formData = new FormData(formulario);

  fetch('../adicionar_produto/adicionar_produto.php', {
    method: 'POST',
    body: formData
  })
    .then(response => response.text())
    .then(data => {
      console.log(data);
      // alert('Produto adicionado com sucesso!');
      // MoverPagina('../lista_de_produtos.html');
    })
    .catch(error => {
      console.error('Erro:', error);
      alert('Ocorreu um erro ao enviar o formulário.');
    });
}

const mostraProduto = document.getElementsByClassName("fundo-adiciona-produto")[0];

function carregaProduto() {
  const produtoPromise = fetch("produto.php")
    .then((response) => {
      if (!response.ok) {
        throw new Error("Erro na conexão");
      }
      return response.json();
    })

  const tintasPromise = fetch("tintas.php")
    .then((response) => {
      if (!response.ok) {
        throw new Error("Erro na conexão");
      }
      return response.json();
    })

    const classesPromise = fetch("classes.php")
    .then((response) => {
      if (!response.ok) {
        throw new Error("Erro na conexão");
      }
      return response.json();
    })

  Promise.all([produtoPromise, tintasPromise, classesPromise])
    .then(([produto, tintas, classes]) => {

    let tintasOptions = "<option value=\"\">Nenhuma</option>\n"
    tintasOptions += tintas.map((tinta) => `<option value='${tinta.paint_id}'>${tinta.name}</option>`).join("\n")

    const classesOptions = classes.map((classe) => `<option value='${classe.class_id}'>${classe.class_name}</option>`).join("\n")

    const produtoHtml = `
    <div class="dados-produto">
      <form id="formProduto" class="login-layout">
        <div class="input-produto">
          <div>
            <label for="nome-produto">Nome:</label>
          </div>
          <div>
            <input type="text" value="${produto.hat_name}" id="nome-produto" name="nome-produto" placeholder="Digite seu nome do produto" required>
          </div>
        </div>
        <div class="input-produto">
          <div>
            <label for="preco-produto">Preço:</label>
          </div>
          <div>
            <input type="number" value="${(produto.price / 100).toFixed(2)}" id="preco-produto" name="preco-produto" placeholder="Digite o preço do produto" required>
          </div>
        </div>
        <div class="input-produto">
          <div>
            <label for="estoque-produto">Estoque:</label>
          </div>
          <div>
            <input type="text" value="${produto.inventory}" id="estoque" name="estoque" placeholder="Insira o estoque do produto" required>
          </div>
        </div>
        <div class="input-produto">
          <div>
            <label for="descricao">Descrição:</label>
          </div>
          <div>
            <input type="text" value="${produto.description}" id="descricao" name="descricao" placeholder="Insira a descrição do produto" required>
          </div>
        </div>
        <div class="input-produto">
          <div>
            <label for="wiki-produto">Wiki:</label>
          </div>
          <div>
            <input type="text" value="${produto.wiki}" id="wiki-produto" name="wiki-produto" placeholder="Insira o link da wiki do produto" required>
          </div>
        </div>
        <div class="input-imagem">
          <label for="imagem">Selecione a imagem do chapéu:</label>
          <input type="file" value="${produto.hat_promo_image}" name="upload-imagem" class="upload-imagem" id="upload-imagem">
        </div>
        <div class="input-produto">
          <div>
            <label for="tinta">Tinta:</label><br>
          </div>
          <div>
            <select value="${produto.paint_id}" class="tinta" name="tinta" id="tinta">
            ${tintasOptions}
            </select>
          </div>
        </div>
        <div class="input-produto">
          <div>
            <label for="classe">Selecione a classe do chapéu (Ctrl + click para selecionar múltiplas): </label><br>
          </div>
          <div>
            <select value="${produto.class_id}" class="classe" name="classe" multiple id="classe">
            ${classesOptions}
            </select>
          </div>
        </div>
        <div class="imagem-botao">
          <div class="imagens">
            <img class="imagem-produto" src="../../dados/imagens/itens_do_jogo/${produto.hat_promo_image}">
              <img class="splash" src="../../dados/imagens/tintas/${produto.paint_promo_image}">
          </div>
        </div>
      </form>
      <button class="button btn-input" type="button" action="./index.html" onclick="cadastraProduto()">Cadastrar produto</button>
    </div>`;

    mostraProduto.insertAdjacentHTML("beforeend", produtoHtml);
  })
  .catch((error) => console.error("Error:", error));
}

document.addEventListener("DOMContentLoaded", () => carregaProduto());
