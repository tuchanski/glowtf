document.addEventListener("DOMContentLoaded", function() {
    // Obtenha o ID do usuário da URL
    const params = new URLSearchParams(window.location.search);
    const userId = params.get("id_user");

    if (userId) {
        fetch(`perfil_usuario.php?id_user=${userId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Erro na rede');
                }
                return response.json();
            })
            .then(data => {
                if (data.error) {
                    document.getElementById("user-data").innerHTML = `Erro: ${data.error}`;
                } else {
                    if (data.length > 0) {
                        let htmlContent = "<table border='1'>";
                        htmlContent += "<tr><th>Data</th><th>Preço da Venda</th><th>Nome do Chapéu</th><th>Descrição do Chapéu</th></tr>";
                        data.forEach(item => {
                            htmlContent += `<tr>
                                <td>${item.date}</td>
                                <td>R$ ${item.sale_price}</td>
                                <td>${item.hat_name}</td>
                                <td>${item.hat_description}</td>
                            </tr>`;
                        });
                        htmlContent += "</table>";
                        document.getElementById("user-data").innerHTML = htmlContent;
                    } else {
                        document.getElementById("user-data").innerHTML = "Nenhuma informação encontrada.";
                    }
                }
            })
            .catch(error => {
                document.getElementById("user-data").innerHTML = `Erro ao buscar dados: ${error.message}`;
                console.error("Erro ao buscar dados:", error);
            });
    } else {
        document.getElementById("user-data").innerHTML = "ID do usuário não fornecido.";
    }
});