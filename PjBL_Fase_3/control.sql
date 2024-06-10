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
GRANT * ON *.* TO 'administrador' WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON glowtfdb.hat, glowtfdb.user TO 'estagiario';
GRANT INSERT, ON glowtfdb.sale TO 'bot_da_steam';
GRANT SELECT, UPDATE, ON glowtfdb.hat TO 'bot_da_steam';
GRANT SELECT, INSERT, UPDATE ON glowtfdb.user TO 'cliente';
GRANT SELECT ON glowtfdb.hat, glowtfdb.hat_has_class, glowtfdb.sale, glowtfdb.paint, glowtfdb.hat_class TO 'cliente';

-- Atribui os papéis aos usuários
GRANT 'administrador' TO 'ana'@'localhost';
GRANT 'cliente' TO 'giovanni'@'localhost';
GRANT 'estagiario' TO 'guilherme'@'localhost';
GRANT 'bot_da_steam' TO 'bot_tf'@'localhost';

