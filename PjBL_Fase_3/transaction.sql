-- transactions.sql
-- Arquivo contendo as transações do sistema

SET SQL_SAFE_UPDATES = 0;

-- 1)
START TRANSACTION;
INSERT INTO glowtfdb.paint (name, promo_image, hex_color) VALUES ('Blue Sky', 'blue_sky.png', '0000FF');
UPDATE glowtfdb.hat SET inventory = 100 WHERE name = 'Cowboy Hat';
UPDATE glowtfdb.paint SET hex_color = 'FF00FF' WHERE name = 'Red Paint';
SAVEPOINT add_products;
INSERT INTO glowtfdb.class (class_name) VALUES ('Warrior');
INSERT INTO glowtfdb.hat (inventory, price, promo_image, name, paint_id, description, wiki) VALUES 
(10, 500, 'hat1.png', 'Fancy Hat', 1, 'A very fancy hat', 'http://wiki.example.com/Fancy_Hat');
DELETE FROM glowtfdb.paint WHERE name = 'Blue Paint';
ROLLBACK TO SAVEPOINT add_products;
COMMIT;

-- 2)
START TRANSACTION;
INSERT INTO glowtfdb.user (name, gender, state, cpf, email, password, `admin`, id_steam) VALUES 
('John Doe', 'Masculino', 'SP', '76324817590', 'john.doe@example.com', 'securepassword', FALSE, '12345678901234567');
INSERT INTO glowtfdb.cart (id_user, date) VALUES (LAST_INSERT_ID(), NOW());
INSERT INTO glowtfdb.cart_has_hat (id_cart, id_hat) VALUES (LAST_INSERT_ID(), 1);
COMMIT;

-- 3)
START TRANSACTION;
INSERT INTO glowtfdb.sale (date, id_user, id_coupon, price) VALUES ('2024-06-01', 1, 1, 480);
INSERT INTO glowtfdb.sale_has_hat (id_sale, id_hat, price) VALUES (LAST_INSERT_ID(), 1, 480);
INSERT INTO glowtfdb.wishlist (id_user) VALUES (7);
INSERT INTO glowtfdb.wishlist_has_hat (id_wishlist, id_hat) VALUES (7, 1);
COMMIT;

-- 4)
START TRANSACTION;
INSERT INTO glowtfdb.coupons (expiration_date, discount, uses, start_date, code_name) VALUES 
('2024-12-31', 20, 100, '2024-01-01', 'NEWYEAR20');
COMMIT;

-- 5)
START TRANSACTION;
SELECT * FROM glowtfdb.user;
INSERT INTO glowtfdb.user (name, gender, state, cpf, email, password, admin, id_steam) VALUES
('Emily Stone', 'Feminino', 'RJ', '11111111111', 'emily@example.com', 'password101', FALSE, '12345678901234568'),
('Daniel Craig', 'Masculino', 'SP', '22222222222', 'daniel@example.com', 'password102', FALSE, '12345678901234569');
INSERT INTO glowtfdb.cart (id_user, date) VALUES
(10, NOW()), (11, NOW());
INSERT INTO glowtfdb.wishlist (id_user) VALUES
(10), (11);
INSERT INTO glowtfdb.cart_has_hat (id_cart, id_hat) VALUES
(2, 1), (2, 2), (3, 1);
DELETE FROM glowtfdb.user WHERE name = 'Joao Afonso';
ROLLBACK;

-- 6)
START TRANSACTION;
INSERT INTO glowtfdb.hat (name, inventory, price, promo_image, description, wiki) VALUES
('Top Hat', 50, 2999, 'top_hat.png', 'A fancy top hat.', 'https://wiki.example.com/top_hat'),
('Cowboy Hat', 75, 1999, 'cowboy_hat.png', 'A stylish cowboy hat.', 'https://wiki.example.com/cowboy_hat');
INSERT INTO glowtfdb.paint (name, promo_image, hex_color) VALUES
('Red Paint', 'red_paint.png', 'FF0000'),
('Blue Paint', 'blue_paint.png', '0000FF');
SAVEPOINT insert_hats;
DELETE FROM glowtfdb.hat WHERE name = 'Cowboy Hat';
UPDATE glowtfdb.hat SET price = 2599 WHERE name = 'Top Hat';
UPDATE glowtfdb.hat SET description = 'A fancy and elegant top hat.' WHERE name = 'Top Hat';
ROLLBACK TO SAVEPOINT insert_hats;
COMMIT;

-- 7)
START TRANSACTION;
SELECT p.name AS paint_name, COUNT(sh.id) AS total_sales 
FROM glowtfdb.paint p 
JOIN glowtfdb.hat h ON p.paint_id = h.paint_id 
JOIN glowtfdb.sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY paint_name 
ORDER BY total_sales DESC 
LIMIT 1;
UPDATE glowtfdb.paint SET hex_color = 'FF0000' WHERE paint_id = 3;
INSERT INTO glowtfdb.paint (name, promo_image, hex_color) VALUES ('Green Paint', 'green_paint.png', '00FF00');
ROLLBACK;

-- 8)
START TRANSACTION;
INSERT INTO glowtfdb.hat (name, inventory, price, promo_image, description, wiki) VALUES
('Beanie', 40, 1599, 'beanie.png', 'A warm beanie.', 'https://wiki.example.com/beanie');
UPDATE glowtfdb.hat SET inventory = 80 WHERE name = 'Top Hat';
UPDATE glowtfdb.user SET password = 'newpassword123' WHERE name = 'Alice Smith';
DELETE FROM glowtfdb.wishlist_has_hat WHERE id_wishlist = 2;
COMMIT;

-- 9)
START TRANSACTION;
DELETE FROM glowtfdb.cart_has_hat WHERE id_cart = 2 AND id_hat = 2;
DELETE FROM glowtfdb.wishlist_has_hat WHERE id_wishlist = 3 AND id_hat = 2;
UPDATE glowtfdb.user SET name = 'Charlie Brown Jr.' WHERE id = 3;
UPDATE glowtfdb.hat SET price = 130 WHERE id = 2;
ROLLBACK;

-- 10)
START TRANSACTION;
UPDATE glowtfdb.coupons SET discount = 25 WHERE id = 1;
UPDATE glowtfdb.class SET class_name = 'Sniper Elite' WHERE class_id = 9;
DELETE FROM glowtfdb.coupons WHERE id = 7;
SELECT * FROM glowtfdb.coupons;
DELETE FROM glowtfdb.hat_has_class WHERE class_id = 7;
ROLLBACK;
