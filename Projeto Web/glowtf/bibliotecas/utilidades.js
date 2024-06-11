// Define the MoverPagina function to replace the path and keep all params
function MoverPagina(destino) {
    // Get the current URL parameters
    const currentParams = window.location.search;
    
    // If the destination starts with '/', remove it to prevent root replacement
    if (destino.startsWith('/')) {
        destino = destino.substring(1);
    }
    
    // Create a new URL object using the current origin and the new path
    const currentPath = window.location.pathname;
    const newPath = currentPath.substring(0, currentPath.lastIndexOf('/') + 1) + destino;
    const newUrl = window.location.origin + newPath + currentParams;
    
    // Navigate to the new URL
    window.location.href = newUrl;
}
