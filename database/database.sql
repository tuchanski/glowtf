CREATE DATABASE IF NOT EXISTS glowtfdb;
USE glowtfdb;

CREATE TABLE paint (
    paint INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    promo_image VARCHAR(256) NOT NULL,
    hex_color VARCHAR(6),
    PRIMARY KEY (paint)
);

CREATE TABLE hat_class (
    hat_id INTEGER NOT NULL AUTO_INCREMENT,
    scout INTEGER NOT NULL,
    soldier INTEGER NOT NULL,
    pyro INTEGER NOT NULL,
    demoman INTEGER NOT NULL,
    heavy INTEGER NOT NULL,
    engineer INTEGER NOT NULL,
    medic INTEGER NOT NULL,
    sniper INTEGER NOT NULL,
    spy INTEGER NOT NULL,
    PRIMARY KEY (hat_id)
);

CREATE TABLE hat (
    id INTEGER NOT NULL AUTO_INCREMENT,
    inventory INTEGER NOT NULL,
    price INTEGER NOT NULL,
    promo_image VARCHAR(256) NOT NULL,
    name VARCHAR(256) NOT NULL,
    paint INTEGER,
    description VARCHAR(1024) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (paint) REFERENCES paint (paint)
);

CREATE TABLE user (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    gender ENUM('Male','Female','Other') NOT NULL,
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
    PRIMARY KEY (id),
    FOREIGN KEY (id_sale) REFERENCES sale (id),
    FOREIGN KEY (id_hat) REFERENCES hat (id)
);

CREATE TABLE wishlist_has_hat (
    id INTEGER NOT NULL AUTO_INCREMENT,
    id_wishlist INTEGER NOT NULL,
    id_hat INTEGER NOT NULL,
    id_product_game INTEGER NOT NULL,
    id_product_steam_api INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_wishlist) REFERENCES wishlist (id_user),
    FOREIGN KEY (id_hat) REFERENCES hat (id)
);