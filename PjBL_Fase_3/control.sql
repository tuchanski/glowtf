-- control.sql
-- Arquivo contendo as instruções de segurança e controle de acesso

-- Verificar se o usuário já existe e, se sim, removê-lo
DROP USER IF EXISTS 'novo_usuario'@'localhost';

-- Criar um novo usuário para acesso ao banco de dados
CREATE USER 'novo_usuario'@'localhost' IDENTIFIED BY 'senha_segura';

-- Conceder permissões ao novo usuário
GRANT SELECT, INSERT, UPDATE, DELETE ON glowtfdb.* TO 'novo_usuario'@'localhost';

-- Aplicar alterações de permissões
FLUSH PRIVILEGES;

-- Criar uma nova role (papel) para gerenciar permissões de forma centralizada
CREATE ROLE IF NOT EXISTS 'role_gerente';

-- Atribuir permissões à role criada
GRANT SELECT, INSERT, UPDATE, DELETE ON glowtfdb.* TO 'role_gerente';

-- Atribuir a role ao novo usuário
GRANT 'role_gerente' TO 'novo_usuario'@'localhost';

-- Implementar auditoria
-- Criar uma tabela para registrar logs de acesso e operações realizadas pelos usuários
CREATE TABLE IF NOT EXISTS glowtfdb.audit_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user VARCHAR(50),
    operation VARCHAR(100),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Exemplo de trigger para registrar operações de inserção na tabela 'paint'
DROP TRIGGER IF EXISTS log_insert_paint;
CREATE TRIGGER log_insert_paint
AFTER INSERT ON glowtfdb.paint
FOR EACH ROW
INSERT INTO glowtfdb.audit_log (user, operation) VALUES (USER(), 'INSERT INTO paint');
