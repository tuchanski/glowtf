function criarProdutos() {
    fetch("lista_de_produtos.php")
    .then(response => response.json())
    .then(data => {
        data.forEach((data) => {
            const card = `
            <div class="card-admin">
                <div class="card-titulo">${data.hat_name}</div>
                <div class="card-tinta">
                    <div class="cor-da-tinta"></div>
                    <div class="card-nome-tinta">${data.paint_name}</div>
                </div>
                <div class="imagens">
                    <img class="card-imagem-produto" src="../../dados/imagens/itens_do_jogo/${data.hat_promo_image}">
                    <img class="card-splash" src="../../dados/imagens/tintas/${data.paint_promo_image}">
                </div>
                <div class="preco-botao">
                    <div class="card-preco">R$${(data.price / 100).toFixed(2).replace('.', ',')}</div>
                    <div class="botoes">
                        <button class="editar-btn" type="button">
                            <span class="material-symbols-outlined">edit</span>
                            Editar
                        </button>
                        <button class="deletar-btn" type="button">
                            <span class="material-symbols-outlined">delete</span>
                            Deletar
                        </button>
                    </div>
                </div>
            </div>
            `;
            document.getElementsByClassName("corpo")[0].insertAdjacentHTML("beforeend", card);
        });
    });
}

document.addEventListener("DOMContentLoaded", () => criarProdutos());
