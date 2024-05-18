function cadastraProduto() {

    const formulario = document.getElementById('loginForm');

    const formData = new
    FormData(formulario);

    if (document.getElementById('nome-produto').value != '' &&
    document.getElementById('preco-produto').value != '' &&
    document.getElementById('estoque').value != '' &&
    document.getElementById('descricao').value != '' &&
    document.getElementById('wiki-produto').value != '' &&
    document.getElementById('classe').value != '') {

        fetch('adicionar_produto.php', {
            method: 'POST',
            body: formData
        })
            
            .then(response => response.text())
            .then(data => {
            console.log(data); // Mostra a resposta do servidor no console
            alert(data); // Mostra uma mensagem com a resposta do servidor
        })
            .catch(error => {
            console.error('Erro', error);
            alert('Ocorreu um erro ao enviar os dados do formulário.');
        });

    alert("Dados inseridos com sucesso!");

} else {
    
    alert("Por favor preencha todos os campos!");
};
    // window.location.href = "../lista_de_produtos/lista_de_produtos.html";
}

