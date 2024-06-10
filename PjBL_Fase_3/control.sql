USE glowtfdb;

-- control.sql
-- Arquivo contendo as instruções de segurança e controle de acesso

-- Cria os usuários
CREATE USER 'giovanni'@'localhost' IDENTIFIED BY '12345';
CREATE USER 'ana'@'localhost' IDENTIFIED BY '98765';
CREATE USER 'guilherme'@'localhost' IDENTIFIED BY '98453';
CREATE USER 'bot_tf'@'localhost' IDENTIFIED BY '32157';
CREATE USER 'gustavo'@'localhost' IDENTIFIED BY 'supergusta';
CREATE USER 'antonio'@'localhost' IDENTIFIED BY '32057';

-- Cria os papéis
CREATE ROLE IF NOT EXISTS 'administrador';
CREATE ROLE IF NOT EXISTS 'estagiario';
CREATE ROLE IF NOT EXISTS 'bot_da_steam';
CREATE ROLE IF NOT EXISTS 'cliente';

-- Atribuir permissões aos papéis

-- Administrador: todas as permissões no banco de dados.
GRANT ALL PRIVILEGES ON *.* TO 'administrador' WITH GRANT OPTION;

-- Estagiário: Modificar e inserir dados em tabelas sem deletar dados.
GRANT SELECT, INSERT, UPDATE ON glowtfdb.hat TO 'estagiario';
GRANT SELECT, INSERT, UPDATE ON glowtfdb.user TO 'estagiario';

-- Bot: Checar e atualizar estoques de chapéus, assim como criar sales novas.
GRANT INSERT ON glowtfdb.sale TO 'bot_da_steam';
GRANT SELECT, UPDATE ON glowtfdb.hat TO 'bot_da_steam';

-- Cliente: Ler dados dos produtos e de si mesmo, assim como criar um usuário novo ao se cadastrar, além de visualizar tabelas hat, hat_has_class, sale, paint e hat.
GRANT SELECT, INSERT, UPDATE ON glowtfdb.user TO 'cliente';
GRANT SELECT ON glowtfdb.hat TO 'cliente';
GRANT SELECT ON glowtfdb.hat_has_class TO 'cliente';
GRANT SELECT ON glowtfdb.sale TO 'cliente';
GRANT SELECT ON glowtfdb.paint TO 'cliente';
GRANT SELECT ON glowtfdb.hat TO 'cliente';

-- Atribui os papéis aos usuários
GRANT 'administrador' TO 'ana'@'localhost';
GRANT 'estagiario' TO 'guilherme'@'localhost';
GRANT 'bot_da_steam' TO 'bot_tf'@'localhost';
GRANT 'cliente' TO 'giovanni'@'localhost';
GRANT 'cliente' TO 'gustavo'@'localhost';
GRANT 'cliente' TO 'antonio'@'localhost';
