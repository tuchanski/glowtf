const listaProdutos = document.getElementsByClassName('corpo')[0];

function comprar() {
  console.log("Compra Invalida");
  if (!urlParams.has('user')) {
    window.location.href = '../login/login.html';
    alert("Você precisa estar logado para realizar compras.");
  }
}

function corEstrela(element) {
  if (urlParams.has("user")) {
    if (element.style.color === 'white') {
      element.style.color = '#282828';
    } else {
      element.style.color = 'white';
    }
  }
  else {
    window.location.href = '../login/login.html';
    alert("Você precisa estar logado para ter uma lista de desejos.");
  }
}

function carregarProdutos(query) {
  let inputBusca = document.getElementsByClassName('searchbar')[0].value

  fetch('busca.php', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: new URLSearchParams({
      'searchbar': inputBusca
    })
  })
    .then((data) => {
      console.log(data);
      var count = 0;
      data.forEach((data) => {
        let card = `<h1>ERRO FATAL</h1>`;
        if (data.hex_color != undefined) {
          card = `
        <div class="card">
          <span class="material-symbols-outlined estrela" onclick="corEstrela(this)">star</span>
          <div class="card-titulo">${data.hat_name}</div>
          <div class="card-tinta">
          <div class="cor-da-tinta" style="background-color: #${data.hex_color};"></div>
            <div class="card-nome-tinta">${data.paint_name}</div>
          </div>
          <a href="../produto/produto.html?hat_id=${data.hat_id}" class="imagens">
            <img class="card-imagem-produto" src="../dados/imagens/itens_do_jogo/${data.hat_promo_image
            }">
            <img class="card-splash" src="../dados/imagens/tintas/${data.paint_promo_image
            }">
          </a>
          <div class="preco-botao">
            <div class="card-preco">R$ ${(data.price / 100).toFixed(2).replace('.', ',')}</div>
            <button class="carrinho-btn" type="button" onclick="comprar()">
              <span class="material-symbols-outlined">
                add_shopping_cart
              </span>
              <div>adicionar ao carrinho</div>
            </button>
          </div>
        </div>`;
        }
        else {
          card = `
        <div class="card">
          <span class="material-symbols-outlined estrela" onclick="corEstrela(this)">star</span>
          <div class="card-titulo">${data.hat_name}</div>
          <a href="../produto/produto.html?hat_id=${data.hat_id}" class="imagens">
            <img class="card-imagem-produto" src="../dados/imagens/itens_do_jogo/${data.hat_promo_image
            }">
          </a>
          <div class="preco-botao">
            <div class="card-preco">R$ ${(data.price / 100).toFixed(2).replace('.', ',')}</div>
            <button class="carrinho-btn" type="button" onclick="comprar()">
              <span class="material-symbols-outlined">
                add_shopping_cart
              </span>
              <div>adicionar ao carrinho</div>
            </button>
          </div>
        </div>`;
        }
        listaProdutos.insertAdjacentHTML("beforeend", card);
        count += 1;
      });
    })
    .catch((error) => console.error("Error:", error));
}

document.addEventListener("DOMContentLoaded", () => carregarProdutos(""));

function buscar(query) {

}