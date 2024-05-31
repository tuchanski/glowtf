USE glowtfdb;

INSERT INTO user (name, gender, state, cpf, email, password, admin, id_steam) VALUES
('Alice Smith', 'Feminino', 'RS', '12345678901', 'alice@example.com', 'password123', FALSE, '12345678901234567'),
('Bob Johnson', 'Masculino', 'PR', '23456789012', 'bob@example.com', 'password456', FALSE, '23456789012345678'),
('Charlie Brown', 'Masculino', 'SC', '34567890123', 'charlie@example.com', 'password789', FALSE, '34567890123456789'),
('Admin User', 'Feminino', 'SP', '45678901234', 'admin@example.com', 'adminpass', TRUE, '45678901234567890'),
('Markus Persson', 'Masculino', 'PB', '84678602234', 'mojang@example.com', 'minepass', FALSE, '85345601734362860'),
('Antonio Galarda', 'Masculino', 'SC', '88856684013', 'galarda@example.com', 'password873', FALSE, '55622902232562495');

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
(50, 100, 'soldier_helmet_large.png', 'Chapéu Fedora', NULL, 'Um elegante chapéu fedora.', 'https://wiki.teamfortress.com/wiki/Fedora'),
(40, 120, 'heavy_helmet_large.png', 'Capacete Mercenário', NULL, 'Um capacete resistente usado pelos mercenários.', 'https://wiki.teamfortress.com/wiki/Mercenary_Helmet'),
(30, 80, 'pyro_hat_large.png', 'Boné Brigadeiro', NULL, 'Um boné usado pelos oficiais de brigada.', 'https://wiki.teamfortress.com/wiki/Brigade_Helm'),
(20, 150, 'sniper_hat_large.png', 'Cartola Aristocrata', NULL, 'Uma cartola usada pelos aristocratas.', 'https://wiki.teamfortress.com/wiki/Aristocrat%27s_Hat'),
(25, 90, 'scout_hat_large.png', 'Boina Béret', NULL, 'Uma boina estilosa para os soldados.', 'https://wiki.teamfortress.com/wiki/Beret'),
(60, 70, 'engineer_hat_large.png', 'Chapéu de Palha', NULL, 'Um chapéu de palha perfeito para o verão.', 'https://wiki.teamfortress.com/wiki/Straw_Hat'),
(45, 110, 'spy_hat_large.png', 'Elmet Costureiro', NULL, 'Um capacete usado por costureiros de elite.', 'https://wiki.teamfortress.com/wiki/Costume_helmet'),
(35, 130, 'demo_helmet_large.png', 'Capacete Medieval', NULL, 'Um capacete usado por cavaleiros medievais.', 'https://wiki.teamfortress.com/wiki/Medieval_Helmet');

INSERT INTO coupons (expiration_date, discount, uses, start_date, code_name) VALUES
('2024-06-30', 20, 100, '2024-05-17', 'PAOTASTICO2024'),
('2024-07-31', 15, 200, '2024-05-17', 'VERDEAMARGO'),
('2024-08-31', 10, 150, '2024-05-17', 'SUMMERDEAL2024'),
('2024-09-30', 25, 50, '2024-05-17', 'FALLSALE2024'),
('2024-10-31', 30, 75, '2024-05-17', 'HALLOWEEN2024'),
('2024-12-31', 50, 25, '2024-05-17', 'YEAREND2024'),
('2024-12-31', 50, 100, '2024-02-02', 'FREEFIRE1000');

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
(5, 1), -- Beret (Scout)
(5, 3), -- Beret (Pyro)
(6, 6), -- Straw Hat (Engineer)
(6, 7), -- Straw Hat (Medic)
(7, 7), -- Costume Helmet (Medic)
(7, 8), -- Costume Helmet (Sniper)
(8, 9), -- Medieval Helmet (Spy)
(8, 2); -- Medieval Helmet (Soldier)

INSERT INTO cart (id_user, date) VALUES
(1, '2024-05-01 10:00:00'),
(2, '2024-05-02 11:00:00'),
(3, '2024-05-03 12:00:00'),
(4, '2024-05-04 13:00:00'),
(5, '2024-05-05 14:00:00'),
(6, '2024-05-06 15:00:00');

INSERT INTO wishlist (id_user) VALUES
(1),
(2),
(3),
(4),
(5),
(6);

INSERT INTO sale (date, id_user, id_coupon, price) VALUES
('2024-05-01', 1, 1, 80),
('2024-05-02', 2, 2, 102),
('2024-05-03', 3, 3, 72),
('2024-05-04', 4, 4, 112),
('2024-05-05', 5, 5, 63),
('2024-05-06', 6, 6, 35);

INSERT INTO cart_has_hat (id_cart, id_hat) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

INSERT INTO sale_has_hat (id_sale, id_hat, price) VALUES
(1, 1, 100),
(2, 2, 200),
(3, 3, 120),
(4, 4, 100),
(5, 5, 100),
(6, 6, 120);

INSERT INTO wishlist_has_hat (id_wishlist, id_hat, id_product_game, id_product_steam_api) VALUES
(1, 1, 101, 1001),
(2, 2, 102, 1002),
(3, 3, 103, 1003),
(4, 4, 104, 1004),
(5, 5, 105, 1005),
(6, 6, 106, 1006);

UPDATE user SET name = 'Charlie Brown Jr.' WHERE id = 3;

UPDATE hat SET price = 130 WHERE id = 2;

UPDATE coupons SET discount = 25 WHERE id = 1;

UPDATE class SET class_name = 'Sniper Elite' WHERE class_id = 9;

UPDATE paint SET hex_color = 'FF0000' WHERE paint = 3;

DELETE FROM cart_has_hat WHERE id = 4;

DELETE FROM sale_has_hat WHERE id = 4;

DELETE FROM coupons WHERE id = 7;

DELETE FROM hat_has_class WHERE class_id = 7;

DELETE FROM wishlist_has_hat WHERE id = 4;
