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
  let urlParams2 = new URLSearchParams(window.location.search);
  const listaProdutos = document.getElementsByClassName("itens")[0];
  fetch("carrinho.php", {
      method: 'POST',
      headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: new URLSearchParams({
          'id': urlParams2.get('user')
      })
  })
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
                <div class="cor-da-tinta-carrinho" style="background-color: #${data.paint_hex_color};"></div>
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

function identificaUsuario() {
  let urlParams2 = new URLSearchParams(window.location.search);
  fetch('../bibliotecas/get_user_data.php', {
      method: 'POST',
      headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: new URLSearchParams({
          'id': urlParams2.get('user')
      })
  })
  .then(response => response.json()) // Converter a resposta para JSON
  .then(data => {
    console.log(data)
      document.getElementsByClassName("title")[0].innerText = "Seu carrinho, " + data[0].name;
  })
  .catch(error => {
      console.error('Erro:', error);
  });
}
document.addEventListener("DOMContentLoaded", () => identificaUsuario());
