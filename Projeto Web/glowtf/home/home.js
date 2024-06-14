const listaProdutos = document.getElementsByClassName('corpo')[0];

function toggleWishlist(element, current, hat) {
    console.log("current: " +  current + " | " + hat);
    let urlParams = new URLSearchParams(window.location.search);

    if (urlParams.has("user")) {
        let userId = urlParams.get("user");

        // Update the star color based on the new status
        let starColor = !current? 'white' : '#282828';
        element.style.color = starColor;

        // Update the wishlist status on the server
        fetch('wishlist.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                'user_id': userId,
                'hat_id': hat,
                'action': !current? 'a' : 'r' // Include an action parameter to indicate add/remove
            })
        })
        .then(response => response.text())
        .then(data => {
            console.log(data); // Log response from wishlist.php if needed
        })
        .catch(error => {
            console.error('Error toggling wishlist status:', error);
            // Handle error as needed
        });

        // Update the onclick function to toggle back to the opposite of newStatus
        element.onclick = function () {
            toggleWishlist(element, !current, hat);
        };
    } else {
        window.location.href = '../login/login.html';
        alert("Você precisa estar logado para ter uma lista de desejos.");
    }
}

function carregarProdutos(query) {
    let urlParams = new URLSearchParams(window.location.search);

    let wishlistList = [];

    if (urlParams.has("user")) {
        getWishlist(urlParams.get("user"))
            .then(hatIds => {
                wishlistList = hatIds; // Assign hatIds to wishlistList when promise resolves
                console.log('Wishlist:', wishlistList); // Verify wishlistList here

                // After fetching wishlist, load products
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
                            let colorHex = "";
                            let colorSplash = "";
                            let inWishlist = wishlistList.includes(String(data.hat_id));
                            let starColor = inWishlist ? 'white' : '#282828';
                            console.log(inWishlist);

                            if (data.hex_color != undefined) {
                                colorHex = `
                                    <div class="cor-da-tinta" style="background-color: ${data.hex_color};"></div>
                                    <div class="card-nome-tinta">${data.paint_name}</div>
                                `;
                                colorSplash = `<img class="card-splash" src="../dados/imagens/tintas/${data.paint_promo_image}" />`;
                            }

                            let card = `
                                <div class="card">
                                    <span class="material-symbols-outlined estrela" style="color: ${starColor}" onclick="toggleWishlist(this, ${inWishlist}, ${data.hat_id})">star</span>
                                    <div class="card-titulo">${data.hat_name}</div>
                                    <div class="card-tinta">
                                        ${colorHex}
                                    </div>
                                    <a onclick='MoverPagina("../produto/produto.html", "hat_id", "${data.hat_id}")' class="imagens">
                                        <img class="card-imagem-produto" src="../dados/imagens/itens_do_jogo/${data.hat_promo_image}">
                                        ${colorSplash}
                                    </a>
                                    <div class="preco-botao">
                                        <div class="card-preco">R$ ${(data.price / 100).toFixed(2).replace('.', ',')}</div>
                                        <button class="carrinho-btn" type="button" onclick="adicionaProduto(${data.hat_id}, '${urlParams.get("user")}')">
                                            <span class="material-symbols-outlined">add_shopping_cart</span>
                                            <div>Adicionar ao carrinho</div>
                                        </button>
                                    </div>
                                </div>
                            `;

                            listaProdutos.insertAdjacentHTML("beforeend", card);
                            count += 1;
                        });
                    })
                    .catch((error) => console.error("Error:", error));
            })
            .catch(error => {
                console.error('Failed to fetch wishlist:', error);
            });
    } else {
        window.location.href = '../login/login.html';
        alert("Você precisa estar logado para ter uma lista de desejos.");
    }
}

document.addEventListener("DOMContentLoaded", () => carregarProdutos(""));

function adicionaProduto(hatId, userId) {
    let urlParams = new URLSearchParams(window.location.search);
    if (!urlParams.has('user')) {
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

function getWishlist(userId) {
    return fetch('get_wishlist.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: new URLSearchParams({
            user_id: userId
        })
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json(); // Parse response as JSON
    })
    .catch(error => {
        console.error('Error fetching wishlist:', error);
        throw error; // Re-throw the error to propagate it further if needed
    });
}
