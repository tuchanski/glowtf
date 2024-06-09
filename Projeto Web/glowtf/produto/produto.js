const mostraProduto = document.getElementsByClassName('corpo')[0];

function PullItems(query) {
  fetch("produto.php")
    .then((response) => {
      if (!response.ok) {
        throw new Error("Erro na conexão");
      }
      return response.json();
    })
    .then((data) => {
      console.log(data[0]);
      const produto = `
      <div class="fundo-adiciona-produto">
        <div class="dados-produto">
          <div class="titulo">${data[0].hat_name}</div>
            <div class="tinta">
            <div class="cor-da-tinta" style="background-color: #${data[0].hex_color};"></div>
              <div class="nome-tinta">${data[0].paint_name}</div>
            </div>
            <div class="descricao-produto">${data[0].description}</div>
          </div>
          <div class="linha-vertical"></div>
          <div class="imagem-preco">
            <div class="imagens" onclick="window.location.href='${data[0].hat_wiki}';">
              <img class="imagem-produto" src="../dados/imagens/itens_do_jogo/${data[0].hat_promo_image}">
              <img class="splash" src="../dados/imagens/tintas/${data[0].paint_promo_image}">
            </div>
            <div class="preco-botao">
              <div class="preco">R$ ${(data[0].price / 100).toFixed(2).replace('.', ',')}</div>
              <button class="carrinho-btn" type="button">
                <span class="material-symbols-outlined">
                add_shopping_cart
                </span>
                <div>Adicionar ao carrinho</div>
              </button>
            </div>
          </div>
      </div>`;
        mostraProduto.insertAdjacentHTML("beforeend", produto);
      });
    // .catch((error) => console.error("Error:", error));
}

document.addEventListener("DOMContentLoaded", () => PullItems(""));

