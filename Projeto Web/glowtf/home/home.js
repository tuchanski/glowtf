document.addEventListener("DOMContentLoaded", function () {
  const cardContainer = document.getElementById("corpo");

  fetch("home.php").then((response) => {
    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    console.log(response.status);
    console.log(response.json());
  })
  .then((response) => {
    var count = 0;
    response.json().data.forEach((hat) => {
      let card = `<div class="card">
        <div class="card-titulo">Capacete de Soldadinho</div>
        <div class="card-tinta">
          <div class="cor-da-tinta"></div>
          <div class="card-nome-tinta">Cinza Bigode Envelhecido</div>
        </div>
        <a href="../produto/produto.html" class="imagens">
          <img class="card-imagem-produto" src="../dados/imagens/itens_do_jogo/soldier/armored_authority_large.png">
          <img class="card-splash" src="../dados/imagens/tintas/Cinza_Bigode_Envelhecido.png">
        </a>
        <div class="preco-botao">
          <div class="card-preco">R$ 76,45</div>
          <button class="carrinho-btn" type="button">
            <span class="material-symbols-outlined">
              add_shopping_cart
            </span>
            <div>Adicionar ao carrinho</div>
          </button>
        </div>
      </div>`;
      cardContainer.insertAdjacentHTML("beforeend", card);
      count += 1;
    });
  })
});
