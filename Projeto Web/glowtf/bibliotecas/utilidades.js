//Move para a página destino sem perder os parametros
function MoverPagina(destino, admin = false, extraParam = "", extraParamValue = "") {
    if(extraParam != ""){
        let tempurl = new URLSearchParams(window.location.search);
        tempurl.set(extraParam, extraParamValue);
    }

    const currentParams = window.location.search;
    
    if (destino.startsWith('/')) {
        destino = destino.substring(1);
    }
    
    const currentPath = window.location.pathname;
    const newPath = currentPath.substring(0, currentPath.lastIndexOf('/') + 1) + destino;
    let newUrl = window.location.origin + newPath + currentParams;
    
    if(admin){
        newUrl = newUrl.replace("/admin", "");
    }   
    console.log("called");

    window.location.href = newUrl;
}
