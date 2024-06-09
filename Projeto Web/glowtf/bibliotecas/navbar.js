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
        result = `<h1>Logged as ${data[0].name}</h1>`
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