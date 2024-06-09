const listaProdutos = document.getElementsByClassName('corpo')[0];

function corEstrela(element) {
  if (element.style.color === 'white') {
      element.style.color = '#282828';
  } else {
      element.style.color = 'white';
  }
}

function PullItems(query) {
  fetch("home.php")
    .then((response) => {
      if (!response.ok) {
        throw new Error("Erro na conexão");
      }
      return response.json();
    })
    .then((data) => {
      console.log(data);
      var count = 0;
      data.forEach((data) => {
        const card = `
        <div class="card">
        <span class="material-symbols-outlined estrela" onclick="corEstrela(this)">star</span>
          <div class="card-titulo">${data.hat_name}</div>
          <div class="card-tinta">
          <div class="cor-da-tinta" style="background-color: #${data.hex_color};"></div>
            <div class="card-nome-tinta">${data.paint_name}</div>
          </div>
          <a href="../produto/produto.html" class="imagens">
            <img class="card-imagem-produto" src="../dados/imagens/itens_do_jogo/${
              data.hat_promo_image
            }">
            <img class="card-splash" src="../dados/imagens/tintas/${
              data.paint_promo_image
            }">
          </a>
          <div class="preco-botao">
            <div class="card-preco">R$ ${(data.price / 100).toFixed(2).replace('.', ',')}</div>
            <button class="carrinho-btn" type="button">
              <span class="material-symbols-outlined">
                add_shopping_cart
              </span>
              <div>adicionar ao carrinho</div>
            </button>
          </div>
      </div>`;
        listaProdutos.insertAdjacentHTML("beforeend", card);
        count += 1;
      });
     })
    .catch((error) => console.error("Error:", error));
}

document.addEventListener("DOMContentLoaded", () => PullItems(""));
