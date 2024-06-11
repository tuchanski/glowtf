utilParams = new URLSearchParams(window.location.search);

//Move para uma nova página mas mantendo todos os params. 
function MoverPagina(destino){
    window.location.search = destino + location.search;
}