const urlParams = new URLSearchParams(window.location.search);

function createNavbar(target_id){
    const html = `<nav>
    <ul class="conjunto-nav">
      <li class="logo">
        <a href="../home/home.html">
          <span class="material-symbols-outlined">
            stylus_laser_pointer
          </span>
          GLOW.<b>TF</b>
        </a>
      </li>
      <li class="searchbar">
        <input type="text" id="searchbar" placeholder="O que você está buscando hoje?">
        <button type="button" class="search-btn">
          <span class="material-symbols-outlined">
            search
          </span>
        </button>
      </li>
      <li class="login">
        <!-- <a class="usuario" href="../login/login.html"><span class="material-symbols-outlined">person</span>Entrar</a>
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
function criarLogin() {
    const classeLogin = document.getElementsByClassName('login')[0];
    let isLogged = urlParams.has('user');
    let result = `ERRROR`;
    if(isLogged){
      let username = '';
      fetch('get_user_data.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
          'id': urlParams.get('user')
        })
      })
      .then(response => response.json())
      .then(data =>{
        console.log(data);
        if(data[0].admin == 0){
          result = `
      <div class="usuario-autenticado">
        <li>
          <a href="../lista_de_desejos/lista_de_desejos.html">
            <span class="material-symbols-outlined" id="span-nav">
              bookmark
            </span>
          </a>
        </li>
        <li>
          <a href="../carrinho/carrinho.html">
            <span class="material-symbols-outlined" id="span-nav">
              shopping_cart
            </span>
          </a>
        </li>
        <li>
          <a class="usuario" href="#"><span class="material-symbols-outlined">person</span>${data[0].name}</a>
          <ul class="dropdown">
            <li class="dropdown"><a href="../perfil_usuario/perfil_usuario.html">Perfil</a></li><br>
            <li class="dropdown"><a >Sair</a></li>
          </ul>
        </li>
        <li>
          <img src="../dados/imagens/ícones/steam_verde.png">
        </li>
      </div>
    </ul>`
        }
        else{
          result = `
      <div class="usuario-autenticado">
        <li>
        <a class="usuario" href="#"><span class="material-symbols-outlined">person</span>${data[0].name} | Admin</a>
        <ul class="dropdown">
          <li class="dropdown"><a href="../lista_de_produtos/lista_de_produtos.html">Lista de produtos</a></li><br>
          <li class="dropdown"><a href="../lista_de_produtos/lista_de_produtos.html">Adicionar produto</a></li><br>
          <li class="dropdown"><a>Sair</a></li>
        </ul>
      </li>
        <li>
          <img src="../dados/imagens/ícones/steam_verde.png">
        </li>
      </div>
    </ul>`
        }
        classeLogin.insertAdjacentHTML("beforeend", result);
      })
      .catch(error =>{
        console.error(error);
      })
    }
    else{
      result = `<a class="usuario" href="../login/login.html"><span class="material-symbols-outlined">person</span>Entrar</a>
          <button type="button" class="login_steam">
            <img src="../dados/imagens/ícones/Steam.png">
            Entrar
          </button>`
          classeLogin.insertAdjacentHTML("beforeend", result);
    }
  }

document.addEventListener("DOMContentLoaded", () => createNavbar("create-navbar"));