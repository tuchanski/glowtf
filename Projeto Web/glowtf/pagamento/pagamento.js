const mostraProduto = document.getElementsByClassName('corpo')[0];

function pegarQueryParam(param) {
  let urlParams = new URLSearchParams(window.location.search);
  return urlParams.get(param);
}

let hatId = pegarQueryParam('cart_has_hat_id');
console.log(hatId);

function favorita(element) {
  if (element.style.color === 'white') {
    element.style.color = '#282828';
  } else {
    element.style.color = 'white';
  }
}

function produto() {
  fetch(`pagamento.php?cart_has_hat_id=${hatId}`)
    .then((response) => {
      if (!response.ok) {
        throw new Error("Erro na conexão");
      }
      return response.json();
    })
    .then((data) => {
      console.log(data[0]);
      const userId = pegarQueryParam('user'); // Captura o userId da URL
      const produto = `    
      <div class="fundo">
        <div class="produto">
          <div class="imagem-nome-produto">
            <div class="imagens">
              <img class="imagem-produto" src="../dados/imagens/itens_do_jogo/${data[0].hat_promo_image}">
              <img class="splash" src="../dados/imagens/tintas/${data[0].paint_promo_image}">
            </div>
            <div class="dados-produto">
              <div class="titulo">${data[0].hat_name}</div>
              <div class="tinta">
                <div class="cor-da-tinta" style="background-color: #${data[0].hex_color};"></div>
                <div class="nome-tinta">${data[0].paint_name}</div>
              </div>
            </div>
          </div>
          <div class="preco">
            R$ ${data[0].hat_price}
          </div>
        </div>
        <div class="linha-horizontal"></div>
        <div class="parte-pagamento">
          <div></div>
          <div class="pagamento">
            <div class="botao-input">
              <div class="titulo-pagamento">
                <label for="meio-pagamento">Meio de pagamento:</label>
                <div class="input-usuario">
                  <select id="meio-pagamento">
                    <option value="" disabled selected>Escolha um meio de pagamento</option>
                    <option value="Pix">Pix</option>
                    <option value="Boleto">Boleto</option>
                    <option value="Credito">Cartão de Crédito</option>
                    <option value="Debito">Cartão de Débito</option>
                  </select>
                </div>
              </div>
            </div>
            <button class="pagar-btn" type="button">
              <div>Pagar</div>
            </button>
          </div>
        </div>
      </div>`;
      mostraProduto.insertAdjacentHTML("beforeend", produto);
    })
    .catch((error) => console.error("Erro:", error));
}

document.addEventListener("DOMContentLoaded", produto);

function adicionaProduto(hatId, userId) {
  if (!userId) {
    alert("Você precisa estar logado para realizar compras.");
    window.location.href = '../login/login.html';
  } else {
    let url = '../carrinho/adiciona_item_carrinho.php';
    let params = 'hat_id=' + encodeURIComponent(hatId) + '&id=' + encodeURIComponent(userId);

    let options = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: params
    };

    fetch(url, options)
      .then(response => {
        if (!response.ok) {
          throw new Error('Erro ao adicionar produto');
        }
        return response.text();
      })
      .then(data => {
        console.log(data); 
        alert('Produto adicionado ao carrinho com sucesso.');
        MoverPagina('../carrinho/carrinho.html');
      })
      .catch(error => {
        console.error('Erro:', error);
        alert('Erro ao adicionar produto.');
      });
  }
}
