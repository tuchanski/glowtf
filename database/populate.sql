-- Insert data into user table (3 regular users and 1 admin)
INSERT INTO user (name, gender, state, cpf, email, password, admin, id_steam) VALUES
('Alice Smith', 'Female', 'RS', '12345678901', 'alice@example.com', 'password123', FALSE, '12345678901234567'),
('Bob Johnson', 'Male', 'PR', '23456789012', 'bob@example.com', 'password456', FALSE, '23456789012345678'),
('Charlie Brown', 'Male', 'SC', '34567890123', 'charlie@example.com', 'password789', FALSE, '34567890123456789'),
('Admin User', 'Female', 'SP', '45678901234', 'admin@example.com', 'adminpass', TRUE, '45678901234567890');

-- Insert data into coupons table
INSERT INTO coupons (expiration_date, discount, uses, start_date, code_name) VALUES
('2024-12-31', 20, 100, '2024-01-01', 'NEWYEAR20');

-- Insert data into paint table
INSERT INTO paint (name, promo_image, hex_color) VALUES
('Bright Red', 'path/to/image.jpg', 'FF0000');

-- Insert data into cart table
INSERT INTO cart (id_user, date) VALUES
(1, '2024-05-17 14:30:00'),
(2, '2024-05-17 14:31:00'),
(3, '2024-05-17 14:32:00');

-- Insert data into wishlist table
INSERT INTO wishlist (id_user) VALUES
(1),
(2),
(3);

-- Insert data into sale table
INSERT INTO sale (date, id_user, id_coupon, price) VALUES
('2024-05-17', 1, 1, 150),
('2024-05-17', 2, 1, 200),
('2024-05-17', 3, 1, 250);

-- Insert data into hat table
INSERT INTO hat (inventory, price, promo_image, name, paint, description) VALUES
(100, 50, 'path/to/image1.jpg', 'Cool Hat', 1, 'A very cool hat.'),
(200, 75, 'path/to/image2.jpg', 'Awesome Hat', 1, 'An awesome hat.');

-- Insert data into hat_class table
INSERT INTO hat_class (hat_id, scout, soldier, pyro, demoman, heavy, engineer, medic, sniper, spy) VALUES
(1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 0, 1, 0, 0, 0, 0, 0, 0, 0);

-- Insert data into cart_has_hat table
INSERT INTO cart_has_hat (id_cart, id_hat) VALUES
(1, 1),
(2, 2),
(3, 1);

-- Insert data into sale_has_hat table
INSERT INTO sale_has_hat (id_sale, id_hat) VALUES
(1, 1),
(2, 2),
(3, 1);

-- Insert data into wishlist_has_hat table
INSERT INTO wishlist_has_hat (id_wishlist, id_hat, id_product_game, id_product_steam_api) VALUES
(1, 1, 101, 202),
(2, 2, 103, 204),
(3, 1, 105, 206);