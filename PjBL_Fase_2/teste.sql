CREATE DATABASE IF NOT EXISTS glowtfdb;
USE glowtfdb;

CREATE TABLE paint (
    paint_id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    promo_image VARCHAR(256) NOT NULL,
    hex_color VARCHAR(6),
    PRIMARY KEY (paint_id)
);

CREATE TABLE class(
	class_id INTEGER NOT NULL AUTO_INCREMENT,
    class_name VARCHAR(50),
    PRIMARY KEY(class_id)
);

CREATE TABLE hat_has_class (
	hat_id INTEGER NOT NULL,
    class_id INTEGER NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
);

CREATE TABLE hat (
    id INTEGER NOT NULL AUTO_INCREMENT,
    inventory INTEGER NOT NULL,
    price INTEGER NOT NULL,
    promo_image VARCHAR(256) NOT NULL,
    name VARCHAR(256) NOT NULL,
    paint_id INTEGER,
    description VARCHAR(1024) NOT NULL,
    wiki VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (paint_id) REFERENCES paint (paint_id)
);

CREATE TABLE user (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    gender ENUM('Masculino','Feminino','Outro') NOT NULL,
    state CHAR(2) NOT NULL,
    cpf CHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(30) NOT NULL,
    `admin` BOOL NOT NULL,
    id_steam CHAR(17) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (cpf),
    UNIQUE (email)
);

CREATE TABLE coupons (
    id INTEGER NOT NULL AUTO_INCREMENT,
    expiration_date DATE NOT NULL,
    discount INTEGER NOT NULL,
    uses BIGINT NOT NULL,
    start_date DATE NOT NULL,
    code_name VARCHAR(20) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (code_name)
);

CREATE TABLE cart (
    id_user INTEGER NOT NULL,
    date DATETIME NOT NULL,
    PRIMARY KEY (id_user),
    FOREIGN KEY (id_user) REFERENCES user (id)
);

CREATE TABLE wishlist (
    id_user INTEGER NOT NULL,
    PRIMARY KEY (id_user),
    FOREIGN KEY (id_user) REFERENCES user (id)
);

CREATE TABLE sale (
    id INTEGER NOT NULL AUTO_INCREMENT,
    date DATE NOT NULL,
    id_user INTEGER NOT NULL,
    id_coupon INTEGER NOT NULL,
    price INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_user) REFERENCES user (id),
    FOREIGN KEY (id_coupon) REFERENCES coupons (id)
);

CREATE TABLE cart_has_hat (
    id INTEGER NOT NULL AUTO_INCREMENT,
    id_cart INTEGER NOT NULL,
    id_hat INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cart) REFERENCES cart (id_user),
    FOREIGN KEY (id_hat) REFERENCES hat (id)
);

CREATE TABLE sale_has_hat (
    id INTEGER NOT NULL AUTO_INCREMENT,
    id_sale INTEGER NOT NULL,
    id_hat INTEGER NOT NULL,
    price INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_sale) REFERENCES sale (id),
    FOREIGN KEY (id_hat) REFERENCES hat (id)
);

CREATE TABLE wishlist_has_hat (
    id INTEGER NOT NULL AUTO_INCREMENT,
    id_wishlist INTEGER NOT NULL,
    id_hat INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_wishlist) REFERENCES wishlist (id_user),
    FOREIGN KEY (id_hat) REFERENCES hat (id)
);

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

INSERT INTO hat (inventory, price, promo_image, name, paint_id, description, wiki) VALUES 
(50, 100, 'soldier_helmet_large.png', 'Chapéu Fedora', 1, 'Um elegante chapéu fedora.', 'https://wiki.teamfortress.com/wiki/Fedora'),
(40, 120, 'heavy_helmet_large.png', 'Capacete Mercenário', 2, 'Um capacete resistente usado pelos mercenários.', 'https://wiki.teamfortress.com/wiki/Mercenary_Helmet'),
(30, 80, 'pyro_hat_large.png', 'Boné Brigadeiro', 3, 'Um boné usado pelos oficiais de brigada.', 'https://wiki.teamfortress.com/wiki/Brigade_Helm'),
(20, 150, 'sniper_hat_large.png', 'Cartola Aristocrata', 4, 'Uma cartola usada pelos aristocratas.', 'https://wiki.teamfortress.com/wiki/Aristocrat%27s_Hat'),
(25, 90, 'scout_hat_large.png', 'Boina Béret', 5, 'Uma boina estilosa para os soldados.', 'https://wiki.teamfortress.com/wiki/Beret'),
(60, 70, 'engineer_hat_large.png', 'Chapéu de Palha', 6, 'Um chapéu de palha perfeito para o verão.', 'https://wiki.teamfortress.com/wiki/Straw_Hat'),
(45, 110, 'spy_hat_large.png', 'Elmet Costureiro', 7, 'Um capacete usado por costureiros de elite.', 'https://wiki.teamfortress.com/wiki/Costume_helmet'),
(35, 130, 'demo_helmet_large.png', 'Capacete Medieval', 8, 'Um capacete usado por cavaleiros medievais.', 'https://wiki.teamfortress.com/wiki/Medieval_Helmet');

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
(1, 2),
(1, 5),
(2, 5),
(2, 4),
(3, 3),
(3, 4),
(4, 8),
(4, 9),
(5, 1),
(5, 3),
(6, 6),
(6, 7),
(7, 7),
(7, 8),
(8, 9),
(8, 2);

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
('2023-01-01', 2, 1, 500),
('2022-11-20', 3, 5, 800),
('2023-05-15', 4, 3, 300),
('2022-12-30', 3, 2, 200),
('2023-02-28', 2, 4, 600),
('2022-09-05', 5, 6, 900),
('2023-04-10', 3, 1, 400),
('2022-08-25', 5, 3, 200),
('2023-03-18', 4, 2, 800),
('2023-05-28', 5, 6, 600),
('2023-01-05', 4, 1, 300),
('2022-07-12', 5, 4, 700),
('2022-10-30', 4, 5, 200),
('2023-04-20', 3, 2, 400),
('2022-11-08', 2, 3, 900),
('2023-02-15', 4, 6, 600),
('2023-06-10', 5, 1, 500),
('2022-09-20', 2, 5, 400),
('2023-03-25', 3, 4, 700),
('2022-08-10', 3, 6, 300),
('2023-01-20', 5, 2, 200),
('2022-12-05', 2, 1, 800),
('2023-05-02', 4, 5, 600),
('2022-07-22', 2, 4, 300),
('2023-04-05', 3, 3, 500),
('2023-03-01', 4, 6, 400),
('2022-10-15', 5, 2, 700),
('2023-01-10', 3, 1, 200),
('2022-09-25', 4, 4, 900),
('2023-06-15', 2, 5, 300),
('2022-08-05', 3, 6, 600),
('2022-11-25', 5, 3, 400),
('2023-02-20', 2, 2, 800),
('2023-04-30', 3, 5, 700),
('2022-07-02', 4, 6, 500),
('2022-12-15', 3, 1, 200),
('2023-05-10', 5, 4, 600),
('2022-10-25', 4, 5, 300),
('2023-03-15', 2, 6, 800),
('2023-06-20', 3, 3, 500),
('2022-08-15', 5, 2, 400),
('2022-11-02', 3, 1, 700),
('2023-01-15', 2, 4, 200),
('2023-05-05', 4, 5, 900),
('2022-09-12', 2, 6, 300),
('2023-04-25', 5, 3, 600),
('2022-07-05', 4, 2, 400),
('2023-03-10', 2, 5, 700),
('2022-10-20', 3, 6, 500),
('2023-01-25', 5, 1, 800),
('2022-12-10', 4, 4, 200),
('2023-06-05', 2, 3, 900),
('2022-08-20', 3, 5, 300),
('2022-11-10', 2, 6, 600),
('2023-02-05', 4, 1, 400),
('2023-04-15', 3, 4, 700),
('2022-07-30', 5, 5, 800),
('2023-03-20', 2, 2, 300),
('2022-09-15', 4, 3, 600),
('2023-01-01', 3, 6, 900),
('2023-05-20', 5, 1, 200),
('2022-12-02', 3, 2, 700),
('2023-06-10', 2, 5, 400),
('2022-08-07', 4, 6, 200),
('2023-02-25', 2, 1, 900),
('2022-10-12', 3, 4, 300),
('2023-01-20', 5, 5, 600),
('2022-07-10', 4, 1, 400),
('2023-04-05', 2, 6, 700),
('2022-11-30', 5, 3, 800),
('2023-03-15', 3, 2, 500),
('2022-09-05', 4, 5, 600),
('2023-01-30', 2, 6, 200),
('2023-06-15', 3, 1, 900),
('2022-08-25', 5, 4, 300),
('2022-11-15', 3, 5, 600),
('2023-02-10', 2, 6, 400),
('2023-04-20', 4, 3, 700),
('2022-07-15', 5, 2, 800),
('2023-03-05', 3, 5, 300),
('2022-10-02', 2, 4, 600),
('2023-01-10', 4, 1, 900),
('2023-05-25', 3, 6, 200),
('2022-12-15', 5, 3, 500),
('2022-09-20', 4, 2, 800),
('2023-02-15', 2, 5, 300),
('2023-06-20', 3, 4, 600),
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
(2, 2, 120),
(3, 3, 80),
(4, 4, 150),
(5, 5, 90),
(6, 6, 70),
(7, 7, 130), 
(8, 1, 800),
(9, 2, 300),
(10, 3, 200),
(11, 4, 600),
(12, 5, 900),
(13, 6, 400),
(14, 1, 200),
(15, 2, 800),
(16, 3, 600),
(17, 4, 500),
(18, 5, 400),
(19, 6, 700),
(20, 7, 300),
(21, 8, 200),
(22, 1, 800),
(23, 2, 600),
(24, 3, 102),
(25, 4, 72),
(26, 5, 112),
(27, 6, 63),
(28, 7, 35),
(29, 1, 500),
(30, 2, 800),
(31, 3, 300),
(32, 4, 200),
(33, 5, 600),
(34, 6, 900),
(35, 7, 400),
(36, 8, 200),
(37, 1, 800),
(38, 2, 600),
(39, 3, 500),
(40, 4, 400),
(41, 5, 700),
(42, 6, 300),
(43, 7, 200),
(44, 8, 800),
(45, 1, 600),
(46, 2, 900),
(47, 3, 200),
(48, 4, 400),
(49, 5, 700),
(50, 6, 300),
(51, 7, 200),
(52, 8, 800),
(53, 1, 600),
(54, 2, 900),
(55, 3, 200),
(56, 4, 400),
(57, 5, 700),
(58, 6, 300),
(59, 7, 200),
(60, 8, 800),
(61, 1, 600),
(62, 2, 900),
(63, 3, 200),
(64, 4, 400),
(65, 5, 700),
(66, 6, 300),
(67, 7, 200),
(68, 8, 800),
(69, 1, 600),
(70, 2, 900),
(71, 3, 200),
(72, 4, 400),
(73, 5, 700),
(74, 6, 300),
(75, 7, 200),
(76, 8, 800),
(77, 1, 600),
(78, 2, 900),
(79, 3, 200),
(80, 4, 400),
(81, 5, 700),
(82, 6, 300),
(83, 7, 200),
(84, 8, 800),
(85, 1, 600),
(86, 2, 900),
(87, 3, 200),
(88, 4, 400),
(89, 5, 700),
(90, 6, 300),
(91, 7, 200),
(92, 8, 800);


INSERT INTO wishlist_has_hat (id_wishlist, id_hat) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

UPDATE user SET name = 'Charlie Brown Jr.' WHERE id = 3;

UPDATE hat SET price = 130 WHERE id = 2;

UPDATE coupons SET discount = 25 WHERE id = 1;

UPDATE class SET class_name = 'Sniper Elite' WHERE class_id = 9;

UPDATE paint SET hex_color = 'FF0000' WHERE paint_id = 3;

DELETE FROM cart_has_hat WHERE id = 4;

DELETE FROM sale_has_hat WHERE id = 4;

DELETE FROM coupons WHERE id = 7;

DELETE FROM hat_has_class WHERE class_id = 7;

DELETE FROM wishlist_has_hat WHERE id = 4;

USE glowtfdb;

-- Removidas/ alteradas no PJBL fase 2: 
--- removida idade média dos usuários - não foi adicionada data de nascimento no banco de dados
--- removida porcentagem de carrinhos abandonados - não é possível fazer esta query no momento
--- alterada mês do ano com o maior número de vendas

-- 1) Gênero dos clientes
SELECT gender, COUNT(*) AS total_users FROM user GROUP BY gender;

-- 2) estado onde moram os clientes
SELECT state, COUNT(*) AS total_users FROM user GROUP BY state;

-- 3) Média de gasto por cliente
SELECT AVG(price) AS average_spending_per_customer FROM sale;

-- 4) Frequência de compras de cliente
SELECT id_user, COUNT(*) AS purchase_frequency FROM sale GROUP BY id_user;

-- 5) Classe de chapéu com mais compras vendas
SELECT c.class_name, COUNT(*) AS total_purchases 
FROM class c
JOIN hat_has_class h ON c.class_id = h.class_id
JOIN sale_has_hat sh ON h.hat_id = sh.id_hat
GROUP BY c.class_name
ORDER BY total_purchases DESC
LIMIT 1;

-- 6) Valor médio gasto por transação
SELECT AVG(price) AS average_transaction_amount FROM sale;

-- 7) Número de vendas agrupadas por mês e ano
SELECT YEAR(date) AS year, MONTH(date) AS month, COUNT(*) AS transaction_count 
FROM sale 
GROUP BY year, month;

-- 8) Número de vendas agrupadas por quadrimestre e ano
SELECT YEAR(date) AS year, QUARTER(date) AS quarter, COUNT(*) AS transaction_count 
FROM sale 
GROUP BY year, quarter;

-- 9) Tinta mais vendida
SELECT p.name AS paint_name, COUNT(sh.id) AS total_sales 
FROM paint p 
JOIN hat h ON p.paint_id = h.paint_id 
JOIN sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY paint_name 
ORDER BY total_sales DESC 
LIMIT 1;

-- 10) Tinta menos vendida
SELECT p.name AS paint_name, COUNT(*) AS total_sales 
FROM paint p 
JOIN hat h ON p.paint_id = h.paint_id 
JOIN sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY paint_name 
ORDER BY total_sales ASC 
LIMIT 1;

-- 11) Chapéu mais vendido
SELECT h.name AS hat_name, COUNT(*) AS total_sales 
FROM hat h 
JOIN sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY hat_name 
ORDER BY total_sales DESC 
LIMIT 1;

-- 12) Chapéu menos vendido
SELECT h.name AS hat_name, COUNT(*) AS total_sales 
FROM hat h 
JOIN sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY hat_name 
ORDER BY total_sales ASC 
LIMIT 1;

-- 13) Cupom com maior número de usos
SELECT code_name, COUNT(*) AS usage_count 
FROM sale 
JOIN coupons ON sale.id_coupon = coupons.id 
GROUP BY code_name 
ORDER BY usage_count DESC 
LIMIT 1;

-- 14) Cupom com menor número de usos
SELECT code_name, COUNT(*) AS usage_count 
FROM sale 
JOIN coupons ON sale.id_coupon = coupons.id 
GROUP BY code_name 
ORDER BY usage_count ASC 
LIMIT 1;

-- 15) Dia do mês com maior número de vendas
SELECT DAY(date) AS day_of_month, COUNT(*) AS transaction_count 
FROM sale 
GROUP BY day_of_month 
ORDER BY transaction_count DESC 
LIMIT 1;

-- 16) Dia do mês com menor número de vendas
SELECT DAY(date) AS day_of_month, COUNT(*) AS transaction_count 
FROM sale 
GROUP BY day_of_month 
ORDER BY transaction_count ASC 
LIMIT 1;

-- 17) Ano (geral) com maior número de vendas -- Nova
SELECT YEAR(date) AS year, COUNT(*) AS total_sales
FROM sale
GROUP BY YEAR(date)
ORDER BY total_sales DESC
LIMIT 1;

-- 18) Mês (geral) com maior número de vendas -- Nova
SELECT YEAR(date) AS year, MONTH(date) AS month, COUNT(*) AS total_sales
FROM sale
GROUP BY year, month
ORDER BY total_sales DESC
LIMIT 1;

-- 19) Dia (geral) com maior número de vendas. -- Nova
SELECT DATE(date) AS day, YEAR(date) AS year, MONTH(date) AS month, COUNT(*) AS total_sales
FROM sale
GROUP BY day
ORDER BY total_sales DESC
LIMIT 1;

-- 20) Número de transações por usuário -- Nova
SELECT u.name AS user_name, COUNT(s.id) AS transaction_count
FROM user u
LEFT JOIN sale s ON u.id = s.id_user
GROUP BY u.id;

# Views
-- Fraca
CREATE VIEW user_total_info AS
SELECT id, name, gender, state, email, `admin` AS is_admin
FROM user;

CREATE VIEW transaction_info AS
SELECT s.id AS transaction_id, u.name AS user_name, s.date AS transaction_date, s.price AS transaction_price, c.code_name AS coupon_code
FROM sale s
JOIN user u ON s.id_user = u.id
LEFT JOIN coupons c ON s.id_coupon = c.id;

CREATE VIEW coupon_info AS
SELECT id, expiration_date, discount, uses, start_date, code_name
FROM coupons;

