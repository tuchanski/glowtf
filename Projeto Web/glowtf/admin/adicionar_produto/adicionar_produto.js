document.addEventListener('DOMContentLoaded', function () {
  const inputUploadImagem = document.getElementById('upload-imagem');
  const divImagens = document.querySelector('.imagens');
  const imgProduto = document.querySelector('.imagem-produto');
  const selectTinta = document.getElementById('tinta');
  const imgSplash = document.querySelector('.splash');

  // Imagem do produto e splash são inicialmente escondidas
  divImagens.style.display = 'none';
  imgSplash.style.display = 'none';

  // Esconde ou mostra a imagem do produto conforme input ter ou não imagem
  inputUploadImagem.addEventListener('change', function () {
    if (inputUploadImagem.files.length > 0) {
      divImagens.style.display = 'block';
      const arquivo = inputUploadImagem.files[0];
      const nomeImagemProduto = arquivo.name;
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

// function cadastraProduto() {
//   const nomeProduto = document.getElementById('nome-produto').value;
//   const precoProduto = document.getElementById('preco-produto').value;
//   const estoqueProduto = document.getElementById('estoque').value;
//   const descricaoProduto = document.getElementById('descricao').value;
//   const wikiProduto = document.getElementById('wiki-produto').value;
//   const tintaProduto = document.getElementById('tinta').value;
//   const inputUploadImagem = document.getElementById('upload-imagem');
//   const regex = /wiki.teamfortress.com/;
//   // const nomeImagem = inputUploadImagem.files[0].name;
//   const classeProduto = document.getElementById('classe');
//   classeProduto.addEventListener('change', function () {
//     const classesSelecionadas = Array.from(this.selectedOptions).map(option => option.value);
//     console.log('Opções selecionadas:', classesSelecionadas);
//   });

//   console.log(nomeProduto);
//   console.log(precoProduto);
//   console.log(estoqueProduto);
//   console.log(descricaoProduto);
//   console.log(wikiProduto);
//   console.log(tintaProduto);
//   const arquivo = inputUploadImagem.files[0];
//   const nomeImagemProduto = arquivo.name;
//   console.log(nomeImagemProduto);
  
//   const formulario = document.getElementById('formProduto');

//   fetch('adicionar_produto.php', {
//     method: 'POST',
//     headers: {
//       'Content-Type': 'application/x-www-form-urlencoded'
//     },
//     body: new formData({
//       'nome-produto': nomeProduto,
//       'preco-produto': precoProduto,
//       'estoque': estoqueProduto,
//       'descricao': descricaoProduto,
//       'wiki-produto': wikiProduto,
//       'classe': classeProduto,
//       'tinta': tintaProduto,
//       'upload-imagem': nomeImagemProduto
//     })
//   })
//     .then(response => response.json())
//     .then(data => {
//       console.log(data);

      
//     })
//     .catch(error => {
//       console.log(data);
//       console.error('Error:', error);
//   });
// }



  
function cadastraProduto() {

  const formulario = document.getElementById('formProduto');

  const formData = new FormData(formulario);

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
      alert('Ocorreu um erro ao enviar o formulário.');
  });

  // window.location.href = "./atualiza_cadastro.html";
}


