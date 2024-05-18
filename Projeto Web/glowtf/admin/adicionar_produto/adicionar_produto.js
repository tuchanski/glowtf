function cadastraProduto() {

    const formulario = document.getElementById('loginForm');

    const formData = new
    FormData(formulario);

  
    fetch('adicionar_produto.php', {
        method: 'POST',
        body: formData
    })
        .then(response => response.text())
        .then(data => {
            console.log(data); 
    })

    .catch(error => {
        console.error('Erro:', error);
        alert('Ocorreu um erro no envio do formulário.');
    });

    console.log("ok");
    // window.location.href = "../lista_de_produtos/lista_de_produtos.html";
}
