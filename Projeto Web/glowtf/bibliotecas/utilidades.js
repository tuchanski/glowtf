
function MoverPagina(destino) {
    const currentParams = window.location.search;
    
    if (destino.startsWith('/')) {
        destino = destino.substring(1);
    }
    
    const currentPath = window.location.pathname;
    const newPath = currentPath.substring(0, currentPath.lastIndexOf('/') + 1) + destino;
    const newUrl = window.location.origin + newPath + currentParams;
    
    window.location.href = newUrl;
}
