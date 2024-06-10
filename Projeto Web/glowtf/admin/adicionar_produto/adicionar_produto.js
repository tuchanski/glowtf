document.addEventListener('DOMContentLoaded', function () {
  const inputUploadImagem = document.getElementById('upload-imagem');
  const divImagens = document.querySelector('.imagens');
  const imgProduto = document.querySelector('.card-imagem-produto');
  const selectTinta = document.getElementById('tinta');
  const imgSplash = document.querySelector('.card-splash');

  divImagens.style.display = 'none';
  imgSplash.style.display = 'none';

  // Esconde ou mostra a imagem do produto conforme input ter ou não imagem
  inputUploadImagem.addEventListener('change', function () {
    if (inputUploadImagem.files.length > 0) {
      divImagens.style.display = 'block';
      const arquivo = inputUploadImagem.files[0];
      const nomeArquivo = arquivo.name;
      console.log(`Arquivo selecionado: ${nomeArquivo}`);

      const leitor = new FileReader();
      leitor.onload = function (e) {
        imgProduto.src = e.target.result;
      };
      leitor.readAsDataURL(arquivo);
    } else {
      divImagens.style.display = 'none';
    }
  });

  // Esconde ou mostra o splash da tinta conforme o valor do input
  selectTinta.addEventListener('change', function () {
    const tintaSelecionada = selectTinta.value;
    if (tintaSelecionada !== "Nenhuma" && tintaSelecionada !== "") {
      imgSplash.src = `../../dados/imagens/tintas/${tintaSelecionada.replace(/ /g, '_')}.png`;
      imgSplash.style.display = 'block';
      console.log(imgSplash.src);
    } else {
      imgSplash.style.display = 'none';
    }
  });
});

function validarTecla(event) {
  const tecla = event.key;
  if (
    tecla === 'Backspace' || tecla === 'Delete' || tecla === 'ArrowLeft' || tecla === 'ArrowRight' ||
    tecla === 'Tab' || tecla === 'Enter'
  ) {
    return;
  }
  // Impedir qualquer tecla que não seja um número
  if (!/^[0-9]$/.test(tecla)) {
    event.preventDefault();
  }
}

document.getElementById('estoque').addEventListener('keydown', validarTecla);

function cadastraProduto() {
  const nomeProduto = document.getElementById('nome-produto').value;
  const precoProduto = document.getElementById('preco-produto').value;
  const estoqueProduto = document.getElementById('estoque').value;
  const descricaoProduto = document.getElementById('descricao').value;
  const wikiProduto = document.getElementById('wiki-produto').value;
  const tintaProduto = document.getElementById('tinta').value;
  const inputUploadImagem = document.getElementById('upload-imagem');
  const regex = /wiki.teamfortress.com/;
  // const nomeImagem = inputUploadImagem.files[0].name;
  const classeProduto = document.getElementById('classe');
  classeProduto.addEventListener('change', function () {
    const classesSelecionadas = Array.from(this.selectedOptions).map(option => option.value);
    console.log('Opções selecionadas:', classesSelecionadas);
  });

  console.log(nomeProduto);
  console.log(precoProduto);
  console.log(estoqueProduto);
  console.log(descricaoProduto);
  console.log(wikiProduto);
  console.log(tintaProduto);

  const arquivo = inputUploadImagem.files[0];
  const nomeArquivo = arquivo.name;
  console.log(nomeArquivo);
  
  // Seleciona o formulário
  const formulario = document.getElementById('loginForm');
  // Obtém os dados do formulário

  fetch('.php', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: new URLSearchParams({
      'nome-produto': nomeProduto,
      'preco-produto': precoProduto,
      'estoque': estoqueProduto,
      'descricao': descricaoProduto,
      'wiki-produto': wikiProduto,
      'classe': inventory,
      'tinta': tintaProduto,
      'upload-imagem': nomeArquivo

    })
  })
    .then(response => response.json())
    .then(data => {
      console.log(data); // Process your data here
      if(data.length == 0){
        alert("Login Inexistente, Por favor confira se o seu Login/Senha estão corretos.")
      }
      else{
        window.location.href = '../home/home.html?user='+ data[0].id;
      }
    })
    .catch(error => {
      console.log(data);
      console.error('Error:', error);
    });
}



  



