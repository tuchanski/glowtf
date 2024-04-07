Objetivo:

- Realizar a normalização do modelo relacional do projeto da disciplina.
- Mapear todas as tabelas do banco de dados em classes no Python.
- Especificar todos as colunas de cada uma das tabelas como atributos das classes, respeitando os seus respectivos tipos e restrições (integridade de chave, integridade referencial, nulidade, domínio, etc).
- Especificar os relacionamentos em as diferentes tabelas por meio dos relacionamentos do SQLAlchemy (relationship).

Cenário:

- O Banco de dados modelado e implementado deve corresponder exatamente ao cenário proposto para o PjBL da disciplina.

Requisitos:

- Cada tabela deve ser mapeada em um arquivo diferente no Python, dentro do diretório /models da aplicação.
- A conexão com o banco de dados está no arquivo db.py, no diretório /services.
- O projeto python deve ter dois diretórios:
Por Exemplo:
/application
    /models
        __init__.py 
        person.py
        client.py
        employee.py
        sale.py
        product.py
        sale_products.py
    /services
        db.py
        app.py
O arquivo app.py será responsável por executar a aplicação e criar todas as tabelas do banco de dados.
Envio:

Compactar a pasta application e enviar na tarefa.