CREATE DATABASE glockgems;

USE glockgems;

CREATE TABLE IF NOT EXISTS user (
    id PRIMARY KEY AUTO_INCREMENT,
    id_steam CHAR(17) NOT NULL,
    name VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(30) NOT NULL,
    admin TINYINT NOT NULL,
);

CREATE TABLE IF NOT EXISTS cart (
    id_user PRIMARY KEY,
    date DATE NOT NULL
    FOREIGN KEY (id_user) REFERENCES user (id),
);

CREATE TABLE IF NOT EXISTS wishlist (
    id_user PRIMARY KEY,
    FOREIGN KEY (id_user) REFERENCES user (id),
);

CREATE TABLE IF NOT EXISTS coupons (
    id PRIMARY KEY AUTO_INCREMENT,
    expiration_date DATE NOT NULL,
    discount DOUBLE NOT NULL,
    uses BIGINT DEFAULT 1,
    start_date DATE,
    code_name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS sale (
    id PRIMARY KEY AUTO_INCREMENT,
    date DATE NOT NULL,
    id_user INTEGER NOT NULL,
    id_coupon INTEGER,
    FOREIGN KEY (id_user) REFERENCES user (id),
    FOREIGN KEY (id_coupon) REFERENCES coupons (id)
);

CREATE TABLE IF NOT EXISTS hat (
    id PRIMARY KEY AUTO_INCREMENT,
    inventory INTEGER NOT NULL UNIQUE,
    price FLOAT NOT NULL,
    promo_image VARCHAR(256) NOT NULL,
    name VARCHAR(256) NOT NULL,
    paint TINYINT,
    description VARCHAR(1024) NOT NULL,
    FOREIGN KEY (paint) REFERENCES paint (paint)
);

CREATE TABLE IF NOT EXISTS hat_class (
    id_hat INTEGER PRIMARY KEY,
    scout TINYINT,
    soldier TINYINT,
    pyro TINYINT,
    demoman TINYINT,
    heavy TINYINT,
    engineer TINYINT,
    medic TINYINT,
    sniper TINYINT,
    spy TINYINT,
    FOREIGN KEY (id_hat) REFERENCES hat (id)
);

CREATE TABLE IF NOT EXISTS paint (
    paint TINYINT PRIMARY KEY,
    name VARCHAR(128) NOT NULL,
    promo_image VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS cart_has_hat (
    id_cart INTEGER PRIMARY KEY,
    id_hat INTEGER,
    FOREIGN KEY (id_cart) REFERENCES cart (id),
    FOREIGN KEY (id_hat) REFERENCES hat (id)
);

CREATE TABLE IF NOT EXISTS sale_has_hat (
    id_sale INTEGER PRIMARY KEY,
    id_hat INTEGER NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES sale (id),
    FOREIGN KEY (hat_id) REFERENCES hat (id)
);

CREATE TABLE IF NOT EXISTS wishlist_has_hat (
    id_wishlist INTEGER PRIMARY KEY,
    id_hat INTEGER UNIQUE,
    id_product_game INTEGER,
    id_product_steam_api INTEGER,
    FOREIGN KEY (id_wishlist) REFERENCES wishlist (id),
    FOREIGN KEY (id_hat) REFERENCES hat (id)
);