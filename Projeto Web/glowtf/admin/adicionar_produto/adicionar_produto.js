function cadastraProduto() {
    const nomeProduto = document.getElementById('nome-produto').value;
    const precoProduto = document.getElementById('preco-produto').value;
    const estoqueProduto = document.getElementById('estoque').value;
    const descricaoProduto = document.getElementById('descricao').value;
    const wikiProduto = document.getElementById('wiki-produto').value;
    const tintaProduto = document.getElementById('tinta').value;
    const classeProduto = document.getElementById('classe').value;
    // const imagemProduto = document.getElementById('upload-imagem-produto').value;

    console.log(nomeProduto);
    console.log(precoProduto);
    console.log(estoqueProduto);
    console.log(descricaoProduto);
    console.log(wikiProduto);
    // console.log(imagemProduto);
    // console.log(tintaProduto);
    // console.log(classeProduto);

//     const formulario = document.getElementById('loginForm');
//     const formData = new FormData(formulario);

//     if (nomeProduto &&
//         precoProduto &&
//         estoqueProduto &&
//         descricaoProduto &&
//         wikiProduto &&
//         imagemProduto) {

//         fetch('adicionar_produto.php', {
//             method: 'POST',
//             body: formData
//         })
//             .then(response => response.text())
//             .then(data => {
//             console.log(data); // Mostra a resposta do servidor no console
//             alert(data); // Mostra uma mensagem com a resposta do servidor
//         })
//             .catch(error => {
//             console.error('Erro', error);
//             alert('Ocorreu um erro ao enviar os dados do formulário.');
//         });

//     alert("Dados inseridos com sucesso!");

// } else {

//     alert("Por favor preencha todos os campos!");
// };
    // window.location.href = "../lista_de_produtos/lista_de_produtos.html";
}

