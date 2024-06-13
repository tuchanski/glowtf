// document.addEventListener('DOMContentLoaded', function () {
//   const inputUploadImagem = document.getElementById('upload-imagem');
//   const divImagens = document.querySelector('.imagens');
//   const imgProduto = document.querySelector('.imagem-produto');
//   const selectTinta = document.getElementById('tinta');
//   const imgSplash = document.querySelector('.splash');

//   // Imagem do produto e splash são inicialmente escondidas
//   divImagens.style.display = 'none';
//   imgSplash.style.display = 'none';

//   // Esconde ou mostra a imagem do produto conforme input ter ou não imagem
//   inputUploadImagem.addEventListener('change', function () {
//     if (inputUploadImagem.files.length > 0) {
//       divImagens.style.display = 'block';
//       const arquivo = inputUploadImagem.files[0];
//       const leitor = new FileReader();
//       leitor.onload = function (e) {
//         imgProduto.src = e.target.result;
//       };
//       leitor.readAsDataURL(arquivo);
//     } else {
//       divImagens.style.display = 'none';
//     }
//   });

//   // Esconde ou mostra o splash da tinta conforme o valor do input
//   selectTinta.addEventListener('change', function () {
//     const tintaSelecionada = selectTinta.value;
//     if (tintaSelecionada !== "Nenhuma" && tintaSelecionada !== "") {
//       imgSplash.src = `../../dados/imagens/tintas/${tintaSelecionada.replace(/ /g, '_')}.png`;
//       imgSplash.style.display = 'block';
//       console.log(imgSplash.src);
//     } else {
//       imgSplash.style.display = 'none';
//     }
//   });

//   document.getElementById('estoque').addEventListener('keydown', validarTecla);
//   carregaTintas();
//   carregaClasses()
// });

// function validarTecla(event) {
//   const tecla = event.key;
//   if (
//     tecla === 'Backspace' || tecla === 'Delete' || tecla === 'ArrowLeft' || tecla === 'ArrowRight' ||
//     tecla === 'Tab' || tecla === 'Enter'
//   ) {
//     return;
//   }
//   // Impedir qualquer tecla que não seja um número
//   if (!/^[0-9]$/.test(tecla)) {
//     event.preventDefault();
//   }
// }

// function cadastraProduto() {
//   const formulario = document.getElementById('formProduto');
//   const formData = new FormData(formulario);

//   fetch('adicionar_produto.php', {
//     method: 'POST',
//     body: formData
//   })
//   .then(response => response.text())
//   .then(data => {
//       console.log(data);
//       // alert('Produto adicionado com sucesso!');
//       // MoverPagina('../lista_de_produtos.html');
//   })
//   .catch(error => {
//       console.error('Erro:', error);
//       alert('Ocorreu um erro ao enviar o formulário.');
//   });
// }

// function carregaTintas() {
//   const listaTintas = document.getElementsByClassName("tinta")[0];
    
//   fetch("tintas.php")
//     .then((response) => {
//       if (!response.ok) {
//         throw new Error("Erro na conexão");
//       }
//       return response.json();
//     })
//     .then((data) => {
//       console.log(data);
//       listaTintas.insertAdjacentHTML("beforeend", "<option value=\"\">Nenhuma</option>");
//       data.forEach((data) => {
//         const paintHtml = `<option value='${data.paint_id}'>${data.name}</option>`
//         listaTintas.insertAdjacentHTML("beforeend", paintHtml);
//       });
//     })
//     .catch((error) => console.error("Error:", error));
// }

const mostraProduto = document.getElementsByClassName("fundo-adiciona-produto")[0];

function carregaProduto() {
  fetch("produto.php")
    .then((response) => {
      if (!response.ok) {
        throw new Error("Erro na conexão");
      }
      return response.json();
    })
    .then((data) => {
      console.log("dados: ", data);

      let produto = `
      <div class="dados-produto">
        <form id="formProduto" class="login-layout">
          <div class="input-produto">
            <div>
              <label for="nome-produto">Nome:</label>
            </div>
            <div>
              <input type="text" value="${data.hat_name}" id="nome-produto" name="nome-produto" placeholder="Digite seu nome do produto" required>
            </div>
          </div>
          <div class="input-produto">
            <div>
              <label for="preco-produto">Preço:</label>
            </div>
            <div>
              <input type="number" value="${data.price}" id="preco-produto" name="preco-produto" placeholder="Digite o preço do produto" required>
            </div>
          </div>
          <div class="input-produto">
            <div>
              <label for="estoque-produto">Estoque:</label>
            </div>
            <div>
              <input type="text" value="${data.inventory}" id="estoque" name="estoque" placeholder="Insira o estoque do produto" required>
            </div>
          </div>
          <div class="input-produto">
            <div>
              <label for="descricao">Descrição:</label>
            </div>
            <div>
              <input type="text" value="${data.description}" id="descricao" name="descricao" placeholder="Insira a descrição do produto" required>
            </div>
          </div>
          <div class="input-produto">
            <div>
              <label for="wiki-produto">Wiki:</label>
            </div>
            <div>
              <input type="text" value="${data.wiki}" id="wiki-produto" name="wiki-produto" placeholder="Insira o link da wiki do produto" required>
            </div>
          </div>
          <div class="input-imagem">
            <label for="imagem">Selecione a imagem do chapéu:</label>
            <input type="file" value="${data.hat_promo_image}" name="upload-imagem" class="upload-imagem" id="upload-imagem">
          </div>
          <div class="input-produto">
            <div>
              <label for="tinta">Tinta:</label><br>
            </div>
            <div>
              <select class="tinta" name="tinta" id="tinta">
              </select>
            </div>
          </div>
          <div class="input-produto">
            <div>
              <label for="classe">Selecione a classe do chapéu (Ctrl + click para selecionar múltiplas): </label><br>
            </div>
            <div>
              <select class="classe" name="classe" multiple id="classe">
              </select>
            </div>
          </div>
          <div class="imagem-botao">
            <div class="imagens">
              <img class="imagem-produto">
              <img class="splash">
            </div>
          </div>
        </form>
        <button class="button btn-input" type="button" action="./index.html" onclick="cadastraProduto()">Cadastrar produto</button>
      </div>`;

      mostraProduto.insertAdjacentHTML("beforeend", produto);
    })
  .catch((error) => console.error("Error:", error));
}

document.addEventListener("DOMContentLoaded", () => carregaProduto());
