document.addEventListener('DOMContentLoaded', function() {
    const inputUploadImagem = document.getElementById('upload-imagem');
    const divImagens = document.querySelector('.imagens');
    const imgProduto = document.querySelector('.card-imagem-produto');
    const selectTinta = document.getElementById('tinta');
    const imgSplash = document.querySelector('.card-splash');
  
    divImagens.style.display = 'none';
    imgSplash.style.display = 'none';
  
    inputUploadImagem.addEventListener('change', function() {
      if (inputUploadImagem.files.length > 0) {
        divImagens.style.display = 'block';
        const arquivo = inputUploadImagem.files[0];
        const nomeArquivo = arquivo.name;
        console.log(`Arquivo selecionado: ${nomeArquivo}`);
        
        const leitor = new FileReader();
        leitor.onload = function(e) {
          imgProduto.src = e.target.result;
        };
        leitor.readAsDataURL(arquivo);
      } else {
        divImagens.style.display = 'none';
      }
    });
  
    selectTinta.addEventListener('change', function() {
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
  

function cadastraProduto() {
    const nomeProduto = document.getElementById('nome-produto').value;
    const precoProduto = document.getElementById('preco-produto').value;
    const estoqueProduto = document.getElementById('estoque').value;
    const descricaoProduto = document.getElementById('descricao').value;
    const wikiProduto = document.getElementById('wiki-produto').value;
    const tintaProduto = document.getElementById('tinta').value;
    const inputUploadImagem = document.getElementById('upload-imagem');
    // const nomeImagem = inputUploadImagem.files[0].name;
    const classeProduto = document.getElementById('classe');
    
    //função com erro se adiciona somente uma classe
    classeProduto.addEventListener('change', function() {
      const classesSelecionadas = Array.from(this.classesSelecionadas).map(option => option.value);
    
      console.log('Opções selecionadas:', classesSelecionadas);

    });

    console.log(nomeProduto);
    console.log(precoProduto);
    console.log(estoqueProduto);
    console.log(descricaoProduto);
    console.log(wikiProduto);
    console.log(tintaProduto);
    // console.log(nomeImagem);

    if (!nomeProduto && 
        !precoProduto && 
        !estoqueProduto && 
        !descricaoProduto && 
        !wikiProduto && 
        classeProduto.value === "" &&
        inputUploadImagem.files.length === 0
      ) {
      alert("Preencha todos os campos!");
    }

}

