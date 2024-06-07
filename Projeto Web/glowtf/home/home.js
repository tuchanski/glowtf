const appListContainer = document.getElementById('corpo');

function PullItems(query) {
  fetch("home.php")
    .then((response) => {
      if (!response.ok) {
        throw new Error("Erro na conexão");
      }
      return response.json();
    })
    .then((data) => {
      var count = 0;
      data.forEach((app) => {
        $produto;
        $tinta;
        const card = `
    <div class="card">
        <div class="card-titulo">${produto.name}</div>
        <div class="card-tinta">
          <div class="cor-da-tinta"></div>
          <div class="card-nome-tinta">${tinta.name}</div>
        </div>
        <a href="../produto/produto.html" class="imagens">
          <img class="card-imagem-produto" src="../dados/imagens/itens_do_jogo/${
            produto.promo_image
          }.png">
          <img class="card-splash" src="../dados/imagens/tintas/${
            tinta.promo_image
          }.png">
        </a>
        <div class="preco-botao">
          <div class="card-preco">R$ ${produto.price / 100}</div>
          <button class="carrinho-btn" type="button">
            <span class="material-symbols-outlined">
              add_shopping_cart
            </span>
            <div>adicionar ao carrinho</div>
          </button>
        </div>
		</div>`;
        appListContainer.insertAdjacentHTML("beforeend", card);
        count += 1;
      });
    })
    .catch((error) => console.error("Error:", error));
}

document.addEventListener("DOMContentLoaded", PullItems(""));
