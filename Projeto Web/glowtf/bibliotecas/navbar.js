const urlParams = new URLSearchParams(window.location.search);

//Cria o HTML para a navbar unificada.
function createNavbar(target_id){
    const html = `<nav>
    <ul class="conjunto-nav">
      <li class="logo">
        <a onclick="MoverPagina('../home/home.html')">
          <span class="material-symbols-outlined">
            stylus_laser_pointer
          </span>
          GLOW.<b>TF</b>
        </a>
      </li>
      <li class="searchbar">
        <input class="searchbar" type="text" id="searchbar" placeholder="O que você está buscando hoje?">
        <button type="button" class="search-btn" onclick="buscaNavBar()">
          <span class="material-symbols-outlined">
            search
          </span>
        </button>
      </li>
      <li class="login">
        <!-- <a class="usuario" href="javascript:void(0)" onclick="MoverPagina('../login/login.html')"><span class="material-symbols-outlined">person</span>Entrar</a>
        <button type="button" class="login_steam">
          <img src="../dados/imagens/ícones/Steam.png">
          Entrar
        </button> -->
      </li>
    </ul>
  </nav>`
  document.getElementById(target_id).insertAdjacentHTML("beforeend", html);
  criarLogin();
}

//Cria botões de navegação na direita.
function criarLogin() {
  const classeLogin = document.getElementsByClassName('login')[0];
  let isLogged = urlParams.has('user');
  let result = `ERROR`;
  if (isLogged) {
    fetch(
      fixPastaAdmin('../bibliotecas/get_user_data.php', '../../bibliotecas/get_user_data.php'),
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
          id: urlParams.get('user')
        })
      }
    )
      .then(response => response.json())
      .then(data => {
        let pathLista = !isAdminPage()
          ? '../lista_de_produtos/lista_de_produtos.html'
          : '../admin/lista_de_produtos/lista_de_produtos.html';
        let pathAdicionar = !isAdminPage()
          ? '../adicionar_produto/adicionar_produto.html'
          : '../admin/adicionar_produto/adicionar_produto.html';

        let additionalLinks = `
          <li class="additional-link">
            <a onclick="MoverPagina('../lista_de_desejos/lista_de_desejos.html')">
              <span class="material-symbols-outlined" id="span-nav">bookmark</span>
              Lista de desejos
            </a>
          </li>
          <li class="additional-link">
            <a onclick="MoverPagina('../carrinho/carrinho.html')">
              <span class="material-symbols-outlined" id="span-nav">shopping_cart</span>
              Carrinho
            </a>
          </li>
        `;

        if (data[0].admin == 0) {
          result = `
              <div class="usuario-autenticado">
                  <li>
                      <a onclick="MoverPagina('../lista_de_desejos/lista_de_desejos.html')">
                          <span class="material-symbols-outlined" id="span-nav">bookmark</span>
                      </a>
                  </li>
                  <li>
                      <a onclick="MoverPagina('../carrinho/carrinho.html')">
                          <span class="material-symbols-outlined" id="span-nav">shopping_cart</span>
                      </a>
                  </li>
                  <li>
                      <a class="usuario">
                          <span class="material-symbols-outlined">person</span>${data[0].name}
                      </a>
                      <ul class="dropdown">
                          <li class="dropdown">
                              <a onclick="MoverPagina('../perfil_usuario/perfil_usuario.html')">Perfil</a>
                          </li>
                          <li class="dropdown">
                              <a onclick="deslogar()">Sair</a>
                          </li>
                      </ul>
                  </li>
                  <li>
                      <img src="../dados/imagens/ícones/steam_verde.png">
                  </li>
              </div>
          `;
        } else {
          result = `
              <div class="usuario-autenticado">
                  <li>
                      <a class="usuario">
                          <span class="material-symbols-outlined">person</span>${data[0].name} | Admin
                      </a>
                      <ul class="dropdown">
                          <li class="dropdown">
                              <a onclick="MoverPagina('${pathLista}')">Lista de produtos</a>
                          </li>
                          <li class="dropdown">
                              <a onclick="MoverPagina('${pathAdicionar}')">Adicionar produto</a>
                          </li>
                          <li class="dropdown">
                              <a onclick="deslogar()">Sair</a>
                          </li>
                      </ul>
                  </li>
                  <li>
                      <img src="../dados/imagens/ícones/steam_verde.png">
                  </li>
              </div>
          `;
        }

        classeLogin.insertAdjacentHTML('beforeend', result);

        // Check screen width and append additional links to dropdown if necessary
        const dropdown = classeLogin.querySelector('.dropdown');
        if (window.innerWidth <= 600) {
          dropdown.insertAdjacentHTML('beforeend', additionalLinks);
        }
      })
      .catch(error => {
        console.error(error);
      });
  } else {
    result = `
        <a class="usuario" href="javascript:void(0)" onclick="MoverPagina('../login/login.html')">
            <span class="material-symbols-outlined">person</span>Entrar
        </a>
        <button type="button" class="login_steam">
            <img src="../dados/imagens/ícones/Steam.png">Entrar
        </button>
    `;
    classeLogin.insertAdjacentHTML('beforeend', result);
  }
}




document.addEventListener("DOMContentLoaded", () => createNavbar("create-navbar"));

//Desloga do Website
function deslogar(){
  window.location.replace(fixPastaAdmin("../bibliotecas/deslogar.html",  "../../bibliotecas/deslogar.html"))
}


//Utilidades Navbar


//Retorna true se a página atual está dentro da pasta admin
function isAdminPage(){
  return window.location.pathname.split('/').length < 7;
}

//Retorna o diretorio correto para arquivos que executem este script em Root ou uma Subpasta
function fixPastaAdmin(root, subpasta){
  return isAdminPage()? root : subpasta
}


function buscaNavBar(){
  let search = document.getElementById('searchbar').value;
  MoverPagina(fixPastaAdmin("../busca/busca.html",  "../../busca/busca.html"), 'search', search);
}