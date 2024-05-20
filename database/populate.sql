INSERT INTO user (name, gender, state, cpf, email, password, admin, id_steam) VALUES
('Alice Smith', 'Female', 'RS', '12345678901', 'alice@example.com', 'password123', FALSE, '12345678901234567'),
('Bob Johnson', 'Male', 'PR', '23456789012', 'bob@example.com', 'password456', FALSE, '23456789012345678'),
('Charlie Brown', 'Male', 'SC', '34567890123', 'charlie@example.com', 'password789', FALSE, '34567890123456789'),
('Admin User', 'Female', 'SP', '45678901234', 'admin@example.com', 'adminpass', TRUE, '45678901234567890');

INSERT INTO paint (name, promo_image, hex_color) VALUES
('O Amargo Sabor de Derrota e Limão', 'O_Amargo_Sabor_de_Derrota_e_Limão.png', 'A8A9AA'),
('Uma Extraordinária Abundância de Matiz', 'Uma_Extraordinária_Abundância_de_Matiz.png', '7D4071'),
('Um Distinto Toque de Cinza', 'Um_Distinto_Toque_de_Cinza.png', 'B0B3BE'),
('Distorção Violeta Perversa', 'Distorção_Violeta_Perversa.png', '38F3AB'),
('Peculiarmente Agradável ao Paladar', 'Peculiarmente_Agradável_ao_Paladar.png', 'A57545'),
('Ausência de Amarelo', 'Ausência_de_Amarelo.png', '787878'),
('A Cor dos Sonhos', 'A_Cor_dos_Sonhos.png', '39CCCC'),
('Apenas Distração', 'Apenas_Distração.png', '0F0F0F'),
('Escória dos Deuses', 'Escória_dos_Deuses.png', 'FFF700'),
('O Gentil Despertar da Primavera', 'O_Gentil_Despertar_da_Primavera.png', 'FAD201'),
('Laranja Bonita', 'Laranja_Bonita.png', 'FF8C00'),
('Cor Incomum', 'Cor_Incomum.png', 'C0C0C0'),
('Notavelmente Distinto', 'Notavelmente_Distinto.png', 'A52A2A'),
('O Primeiro Sinal de Primavera', 'O_Primeiro_Sinal_de_Primavera.png', '00FF00'),
('O Negro da Meia-Noite Após uma Janta Especial', 'O_Negro_da_Meia-Noite_Após_uma_Janta_Especial.png', '000000'),
('Um Delicado Balaço de Caramelo', 'Um_Delicado_Balaço_de_Caramelo.png', 'EDC9AF'),
('Comercializável Raro', 'Comercializável_Raro.png', 'FFD700'),
('Grito de Guerra', 'Grito_de_Guerra.png', 'C51F22'),
('Um Distinto Toco de Água', 'Um_Distinto_Toco_de_Água.png', '5ED4FF'),
('Vermelho 40', 'Vermelho_40.png', 'FF0040'),
('Rosto Pálido de Alguém', 'Rosto_Pálido_de_Alguém.png', 'FFDAB9'),
('Pergaminho do Carteiro', 'Pergaminho_do_Carteiro.png', 'F0E68C'),
('Espírito de Equipamento', 'Espírito_de_Equipamento.png', 'A4A4A4'),
('Forma da Cabeça de Cabelo', 'Forma_da_Cabeça_de_Cabelo.png', 'FF4500'),
('Aroma de Destino', 'Aroma_de_Destino.png', '40E0D0'),
('Noites de Fortaleza Negra', 'Noites_de_Fortaleza_Negra.png', '0A0A0A'),
('Reino Marinho do Mercenário', 'Reino_Marinho_do_Mercenário.png', '306EFF'),
('Tons de Equinócio', 'Tons_de_Equinócio.png', '007FFF'),
('Esquadrão dos Estames Estilhaçados', 'Esquadrão_dos_Estames_Estilhaçados.png', 'DA70D6');

INSERT INTO hat_class (hat_id, scout, soldier, pyro, demoman, heavy, engineer, medic, sniper, spy) VALUES
(1, 0, 1, 0, 0, 0, 0, 0, 0, 0), -- Fedora (Soldier)
(2, 0, 0, 0, 0, 1, 0, 0, 0, 0), -- Mercenary's Helmet (Heavy)
(3, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- Brigade Helm (Pyro)
(4, 0, 0, 0, 0, 0, 0, 0, 1, 0), -- Aristocrat's Hat (Sniper)
(5, 1, 0, 0, 0, 0, 0, 0, 0, 0), -- Batter's Helmet (Scout)
(6, 0, 0, 0, 0, 0, 1, 0, 0, 0), -- Engineer's Cap (Engineer)
(7, 0, 0, 0, 0, 0, 0, 1, 0, 0), -- Baker Boy (Medic)
(8, 0, 0, 0, 0, 0, 0, 0, 0, 1); -- Modest Pile of Hat (Spy)

-- INSERT INTO hat_class (class_name) VALUES 
-- ('Soldier'),
-- ('Heavy'),
-- ('Pyro'),
-- ('Sniper'),
-- ('Scout'),
-- ('Engineer'),
-- ('Medic'),
-- ('Spy');

INSERT INTO hat (inventory, price, promo_image, name, paint, description, wiki) VALUES 
(50, 100, 'soldier_helmet_large.png', 'Chapéu Fedora', null, 'Um elegante chapéu fedora.', 'https://wiki.teamfortress.com/wiki/Fedora'),
(40, 120, 'heavy_helmet_large.png', 'Capacete Mercenário', null, 'Um capacete resistente usado pelos mercenários.', 'https://wiki.teamfortress.com/wiki/Mercenary_Helmet'),
(30, 80, 'pyro_hat_large.png', 'Boné Brigadeiro', null, 'Um boné usado pelos oficiais de brigada.', 'https://wiki.teamfortress.com/wiki/Brigade_Helm'),
(20, 150, 'sniper_hat_large.png', 'Cartola Aristocrata', null, 'Uma cartola usada pelos aristocratas.', 'https://wiki.teamfortress.com/wiki/Aristocrat%27s_Hat'),
(25, 90, 'scout_hat_large.png', 'Boina Béret', null, 'Uma boina estilosa para os soldados.', 'https://wiki.teamfortress.com/wiki/Beret'),
(60, 70, 'engineer_hat_large.png', 'Chapéu de Palha', null, 'Um chapéu de palha perfeito para o verão.', 'https://wiki.teamfortress.com/wiki/Straw_Hat'),
(45, 110, 'spy_hat_large.png', 'Elmet Costureiro', null, 'Um capacete usado por costureiros de elite.', 'https://wiki.teamfortress.com/wiki/Costume_helmet'),
(35, 130, 'demo_helmet_large.png', 'Capacete Medieval', null, 'Um capacete usado por cavaleiros medievais.', 'https://wiki.teamfortress.com/wiki/Medieval_Helmet');

INSERT INTO coupons (expiration_date, discount, uses, start_date, code_name) VALUES
('2024-06-30', 20, 100, '2024-05-17', 'PAOTASTICO2024'),
('2024-07-31', 15, 200, '2024-05-17', 'VERDEAMARGO');

