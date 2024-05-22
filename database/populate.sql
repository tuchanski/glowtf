INSERT INTO user (name, gender, state, cpf, email, password, admin, id_steam) VALUES
('Alice Smith', 'Feminino', 'RS', '12345678901', 'alice@example.com', 'password123', FALSE, '12345678901234567'),
('Bob Johnson', 'Masculino', 'PR', '23456789012', 'bob@example.com', 'password456', FALSE, '23456789012345678'),
('Charlie Brown', 'Masculino', 'SC', '34567890123', 'charlie@example.com', 'password789', FALSE, '34567890123456789'),
('Admin User', 'Feminino', 'SP', '45678901234', 'admin@example.com', 'adminpass', TRUE, '45678901234567890');

INSERT INTO paint (name, promo_image, hex_color) VALUES
('O Amargo Sabor de Derrota e Limão', 'O_Amargo_Sabor_de_Derrota_e_Limao.png', '2EB52E'),
('Uma Extraordinária Abundância de Matiz', 'Uma_Extraordinaria_Abundancia_de_Matiz.png', 'BCBEBC'),
('A Cor das Calças de Negócios de um Cavalheiro', 'A_Cor_das_Calcas_de_Negocios_de_um_Cavalheiro.png', 'C7C277'),
('Cinza Bigode Envelhecido', 'Cinza_Bigode_Envelhecido.png', '6F716F'),
('Cor 216 190 216', 'Cor_216_190_216.png', 'C4AFC4'),
('Depois das Oito', 'Depois_das_Oito.png', '292922'),
('Ganância do Zepheniah', 'Ganancia_do_Zepheniah.png', '3A4534'),
('Indiscutivelmente Verde', 'Indiscutivelmente_Verde.png', '6A943E'),
('Injustiça Salmão Escuro', 'Injustica_Salmao_Escuro.png', 'DF9176'),
('Laranja Mann Co.', 'Laranja_Mann_Co.png', 'A65F30'),
('Marrom Radigan Conagher', 'Marrom_Radigan_Conagher.png', '5F4735'),
('Menta de Macho', 'Menta_de_Macho.png', 'AFCEA8'),
('Muskelmannbraun', 'Muskelmannbraun.png', '906A3D'),
('Oliva Monótono', 'Oliva_Monotono.png', '757701'),
('Ouro Australiano', 'Ouro_Australiano.png', 'C59D34'),
('Rosa pra Caramba', 'Rosa_pra_Caramba.png', 'D85C9A'),
('Tintura Peculiarmente Amarronzada', 'Tintura_Peculiarmente_Amarronzada.png', 'B19F82'),
('Um Profundo Compromisso com Roxo', 'Um_Profundo_Compromisso_com_Roxo.png', '723C66'),
('Uma Cor Similar à Ardósia', 'Uma_Cor_Similar_a_Ardosia.png', '2B4847'),
('Uma Distinta Falta de Coloração', 'Uma_Distinta_Falta_de_Coloracao.png', '131313'),
('Violeta do Nobre Chapeleiro', 'Violeta_do_Nobre_Chapeleiro.png', '4A3445'),
('Vossa Velha Cor Rústica', 'Vossa_Velha_Cor_Rustica.png', '756853');

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


INSERT INTO class (class_name) VALUES 
('Scout'),
('Soldier'),
('Pyro'),
('Demoman'),
('Heavy'),
('Engineer'),
('Medic'),
('Sniper'),
('Spy');

INSERT INTO hat_has_class (hat_id, class_id) VALUES
(1, 2), -- Fedora (Soldier)
(1, 5), -- Fedora (Heavy)
(2, 5), -- Mercenary's Helmet (Heavy)
(2, 4), -- Mercenary's Helmet (Demoman)
(3, 3), -- Brigade Helm (Pyro)
(3, 4), -- Brigade Helm (Demoman)
(4, 8), -- Aristocrat's Hat (Sniper)
(4, 9), -- Aristocrat's Hat (Spy)
(5, 1), -- Batter's Helmet (Scout)
(5, 3), -- Batter's Helmet (Pyro)
(6, 6), -- Engineer's Cap (Engineer)
(6, 7), -- Engineer's Cap (Medic)
(7, 7), -- Baker Boy (Medic)
(7, 8), -- Baker Boy (Sniper)
(8, 9), -- Modest Pile of Hat (Spy)
(8, 2), -- Modest Pile of Hat (Soldier)
(1, 6), -- Fedora (Engineer)
(2, 7), -- Mercenary's Helmet (Medic)
(3, 2), -- Brigade Helm (Soldier)
(4, 6), -- Aristocrat's Hat (Engineer)
(5, 8), -- Batter's Helmet (Sniper)
(6, 9), -- Engineer's Cap (Spy)
(7, 1), -- Baker Boy (Scout)
(8, 4); -- Modest Pile of Hat (Demoman)