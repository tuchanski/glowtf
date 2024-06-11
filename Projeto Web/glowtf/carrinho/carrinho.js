const listaProdutos = document.getElementsByClassName('corpo')[0];

function comprar(){
  console.log("Compra Invalida");
  if(!urlParams.has('user')){
    window.location.href = '../login/login.html';
    alert("Você precisa estar logado para realizar compras.");
  }
}

function corEstrela(element) {
  if (element.style.color === 'white') {
    element.style.color = '#282828';
  } else {
    element.style.color = 'white';
  }
}

function carregarProdutos(query) {
  const listaProdutos = document.getElementsByClassName("itens")[0];
  fetch("carrinho.php")
    .then((response) => {
      if (!response.ok) {
        throw new Error("Erro na conexão");
      }
      return response.json();
    })
    .then((data) => {
      console.log(data);
      data.forEach((data) => {
        const item = `<tr>
          <td class="imagens">
          <a href="../produto/produto.html?hat_id=${data.hat_id}" class="imagens">
            <img class="card-imagem-produto" src="../dados/imagens/itens_do_jogo/${data.hat_promo_image}">
            <img class="card-splash" src="../dados/imagens/tintas/${data.paint_promo_image}">
          </a>
          </td>
          <td class="dados-produto">
            <div class="dados-produto">
            <div class="card-titulo">${data.hat_name}</div>
                <div class="tinta">
                <div class="cor-da-tinta" style="background-color: #${data.hex_color};"></div>
                  <div class="nome-tinta">${data.paint_name}</div>
                </div>
            </div>
          </td>
          <td class="preco">
              R$ ${(data.price / 100).toFixed(2).replace('.', ',')}
          </td>
          <td class="btn-comprar">
            <button class="comprar-btn" type="button">
              Comprar
            </button>
          </td>
          <td class="btn-deletar">
            <button class="remover-carrinho-btn" type="button">
              <span class="material-symbols-outlined">
                delete
              </span>
            </button>
          </td>
        </tr>
        `
        listaProdutos.insertAdjacentHTML("beforeend", item);
        
      });
    })
    .catch((error) => console.error("Error:", error));
}

document.addEventListener("DOMContentLoaded", () => carregarProdutos(""));




