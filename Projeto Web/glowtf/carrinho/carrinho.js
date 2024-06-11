const listaProdutos = document.getElementsByClassName('corpo')[0];

function comprar(){
  console.log("Compra Invalida");
  if(!urlParams.has('user')){
    window.location.href = '../login/login.html';
    alert("Você precisa estar logado para realizar compras.");
  }
  else {
    window.location.href = '../pagamento/pagamento.html';
  }
}

function carregaProdutos() {
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
        const item = `
        <tr class="linha-tabela">
          <td class="imagens-carrinho">
          <a href="../produto/produto.html?hat_id=${data.hat_id}" class="imagens">
            <img class="imagem-produto-carrinho" src="../dados/imagens/itens_do_jogo/${data.hat_promo_image}">
            <img class="splash-carrinho" src="../dados/imagens/tintas/${data.paint_promo_image}">
          </a>
          </td>
          <td class="dados-produto-carrino">
            <div class="dados-produto-carrinho">
            <div class="titulo-carrinho">${data.hat_name}</div>
                <div class="tinta-carrinho">
                <div class="cor-da-tinta-carrinho" style="background-color: #${data.hex_color};"></div>
                  <div class="nome-tinta-carrinho">${data.paint_name}</div>
                </div>
            </div>
          </td>
          <td class="preco-carrinho">
            R$ ${(data.price / 100).toFixed(2).replace('.', ',')}
          <td class="btn-carrinho">
            <button class="comprar-btn" type="button"  onclick="comprar()">
              Comprar
            </button>
          </td>
          <td class="btn-carrinho">
            <button class="remover-carrinho-btn" type="button">
              <span class="material-symbols-outlined">
                delete
              </span>
            </button>
          </td>
        </tr>`
        listaProdutos.insertAdjacentHTML("beforeend", item);
        
      });
    })
    .catch((error) => console.error("Error:", error));
}

document.addEventListener("DOMContentLoaded", () => carregaProdutos(""));




