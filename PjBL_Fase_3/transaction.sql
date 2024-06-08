-- transactions.sql
-- Arquivo contendo as transações do sistema

-- Iniciar uma transação para inserir um novo item de pintura
START TRANSACTION;
INSERT INTO glowtfdb.paint (name, promo_image, hex_color) VALUES ('Blue Sky', 'blue_sky.png', '0000FF');
COMMIT;

-- Iniciar uma transação para inserir uma nova classe
START TRANSACTION;
INSERT INTO glowtfdb.class (class_name) VALUES ('Warrior');
COMMIT;

-- Iniciar uma transação para inserir um novo chapéu
START TRANSACTION;
INSERT INTO glowtfdb.hat (inventory, price, promo_image, name, paint_id, description, wiki) VALUES 
(10, 500, 'hat1.png', 'Fancy Hat', 1, 'A very fancy hat', 'http://wiki.example.com/Fancy_Hat');
COMMIT;

-- Iniciar uma transação para registrar um novo usuário
START TRANSACTION;
INSERT INTO glowtfdb.user (name, gender, state, cpf, email, password, `admin`, id_steam) VALUES 
('John Doe', 'Masculino', 'SP', '76324817590', 'john.doe@example.com', 'securepassword', FALSE, '12345678901234567');
COMMIT;

-- Iniciar uma transação para criar um novo cupom
START TRANSACTION;
INSERT INTO glowtfdb.coupons (expiration_date, discount, uses, start_date, code_name) VALUES 
('2024-12-31', 20, 100, '2024-01-01', 'NEWYEAR20');
COMMIT;

-- Iniciar uma transação para adicionar itens ao carrinho de um usuário
START TRANSACTION;
INSERT INTO glowtfdb.cart (id_user, date) VALUES (7, NOW());
INSERT INTO glowtfdb.cart_has_hat (id_cart, id_hat) VALUES (7, 1);
COMMIT;

-- Iniciar uma transação para registrar uma venda
START TRANSACTION;
INSERT INTO glowtfdb.sale (date, id_user, id_coupon, price) VALUES ('2024-06-01', 1, 1, 480);
INSERT INTO glowtfdb.sale_has_hat (id_sale, id_hat, price) VALUES (1, 1, 480);
COMMIT;

-- Iniciar uma transação para adicionar um item à wishlist de um usuário
START TRANSACTION;
INSERT INTO glowtfdb.wishlist (id_user) VALUES (7);
INSERT INTO glowtfdb.wishlist_has_hat (id_wishlist, id_hat) VALUES (7, 1);
COMMIT;
