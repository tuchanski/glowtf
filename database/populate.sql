-- Insert data into user table (3 regular users and 1 admin)
INSERT INTO user (name, gender, state, cpf, email, password, admin, id_steam) VALUES
('Alice Smith', 'Female', 'RS', '12345678901', 'alice@example.com', 'password123', FALSE, '12345678901234567'),
('Bob Johnson', 'Male', 'PR', '23456789012', 'bob@example.com', 'password456', FALSE, '23456789012345678'),
('Charlie Brown', 'Male', 'SC', '34567890123', 'charlie@example.com', 'password789', FALSE, '34567890123456789'),
('Admin User', 'Female', 'SP', '45678901234', 'admin@example.com', 'adminpass', TRUE, '45678901234567890');


-- Inserir dados na tabela de tintas
INSERT INTO paint (name, promo_image, hex_color) VALUES
('O Amargo Sabor de Derrota e Limão', 'path/to/image.png', 'A8A9AA'),
('Uma Extraordinária Abundância de Matiz', 'path/to/image.png', '7D4071'),
('Um Distinto Toque de Cinza', 'path/to/image.png', 'B0B3BE'),
('Distorção Violeta Perversa', 'path/to/image.png', '38F3AB'),
('Peculiarmente Agradável ao Paladar', 'path/to/image.png', 'A57545'),
('Ausência de Amarelo', 'path/to/image.png', '787878'),
('A Cor dos Sonhos', 'path/to/image.png', '39CCCC'),
('Apenas Distração', 'path/to/image.png', '0F0F0F'),
('Escória dos Deuses', 'path/to/image.png', 'FFF700'),
('O Gentil Despertar da Primavera', 'path/to/image.png', 'FAD201'),
('Laranja Bonita', 'path/to/image.png', 'FF8C00'),
('Cor Incomum', 'path/to/image.png', 'C0C0C0'),
('Notavelmente Distinto', 'path/to/image.png', 'A52A2A'),
('O Primeiro Sinal de Primavera', 'path/to/image.png', '00FF00'),
('O Negro da Meia-Noite Após uma Janta Especial', 'path/to/image.png', '000000'),
('Um Delicado Balaço de Caramelo', 'path/to/image.png', 'EDC9AF'),
('Comercializável Raro', 'path/to/image.png', 'FFD700'),
('Grito de Guerra', 'path/to/image.png', 'C51F22'),
('Um Distinto Toco de Água', 'path/to/image.png', '5ED4FF'),
('Vermelho 40', 'path/to/image.png', 'FF0040'),
('Rosto Pálido de Alguém', 'path/to/image.png', 'FFDAB9'),
('Pergaminho do Carteiro', 'path/to/image.png', 'F0E68C'),
('Espírito de Equipamento', 'path/to/image.png', 'A4A4A4'),
('Forma da Cabeça de Cabelo', 'path/to/image.png', 'FF4500'),
('Aroma de Destino', 'path/to/image.png', '40E0D0'),
('Noites de Fortaleza Negra', 'path/to/image.png', '0A0A0A'),
('Reino Marinho do Mercenário', 'path/to/image.png', '306EFF'),
('Tons de Equinócio', 'path/to/image.png', '007FFF'),
('Esquadrão dos Estames Estilhaçados', 'path/to/image.png', 'DA70D6');


INSERT INTO hat_class (hat_id, scout, soldier, pyro, demoman, heavy, engineer, medic, sniper, spy) VALUES
(1, 0, 1, 0, 0, 0, 0, 0, 0, 0), -- Fedora (Soldier)
(2, 0, 0, 0, 0, 1, 0, 0, 0, 0), -- Mercenary's Helmet (Heavy)
(3, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- Brigade Helm (Pyro)
(4, 0, 0, 0, 0, 0, 0, 0, 1, 0), -- Aristocrat's Hat (Sniper)
(5, 1, 0, 0, 0, 0, 0, 0, 0, 0), -- Batter's Helmet (Scout)
(6, 0, 0, 0, 0, 0, 1, 0, 0, 0), -- Engineer's Cap (Engineer)
(7, 0, 0, 0, 0, 0, 0, 1, 0, 0), -- Baker Boy (Medic)
(8, 0, 0, 0, 0, 0, 0, 0, 0, 1); -- Modest Pile of Hat (Spy)

INSERT INTO hat (inventory, price, promo_image, name, paint, description) VALUES 
(50, 100, 'dados/imagens/itens_do_jogo/soldier/soldier_helmet_large.png', 'Chapéu Fedora', null, 'Um elegante chapéu fedora.'),
(40, 120, 'dados/imagens/itens_do_jogo/heavy/heavy_helmet_large.png', 'Capacete Mercenário', null, 'Um capacete resistente usado pelos mercenários.'),
(30, 80, 'dados/imagens/itens_do_jogo/pyro/pyro_hat_large.png', 'Boné Brigadeiro', null, 'Um boné usado pelos oficiais de brigada.'),
(20, 150, 'dados/imagens/itens_do_jogo/sniper/sniper_hat_large.png', 'Cartola Aristocrata', null, 'Uma cartola usada pelos aristocratas.'),
(25, 90, 'dados/imagens/itens_do_jogo/scout/scout_hat_large.png', 'Boina Béret', null, 'Uma boina estilosa para os soldados.'),
(60, 70, 'dados/imagens/itens_do_jogo/engineer/engineer_hat_large.png', 'Chapéu de Palha', null, 'Um chapéu de palha perfeito para o verão.'),
(45, 110, 'dados/imagens/itens_do_jogo/spy/spy_hat_large.png', 'Elmet Costureiro', null, 'Um capacete usado por costureiros de elite.'),
(35, 130, 'dados/imagens/itens_do_jogo/demo/demo_helmet_large.png', 'Capacete Medieval', null, 'Um capacete usado por cavaleiros medievais.');



INSERT INTO coupons (expiration_date, discount, uses, start_date, code_name) VALUES
('2024-06-30', 20, 100, '2024-05-17', 'PAOTASTICO2024'),
('2024-07-31', 15, 200, '2024-05-17', 'VERDEAMARGO');

