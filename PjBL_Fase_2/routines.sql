DELIMITER //


#Procedures
CREATE PROCEDURE update_hat_price(IN hat_id INT, IN percentage_increase DECIMAL(5, 2))
BEGIN
    UPDATE hat
    SET price = price + (price * (percentage_increase / 100))
    WHERE id = hat_id;
END //

CREATE PROCEDURE user_sales_report(IN user_id INT)
BEGIN
    SELECT s.id AS transaction_id, s.date AS transaction_date, s.price AS transaction_price, c.code_name AS coupon_code
    FROM sale s
    LEFT JOIN coupons c ON s.id_coupon = c.id
    WHERE s.id_user = user_id;
END //

CREATE PROCEDURE recalculate_sales_by_state()
BEGIN
    SELECT u.state, SUM(s.price) AS total_sales
    FROM sale s
    JOIN user u ON s.id_user = u.id
    GROUP BY u.state;
END //


#Functions
CREATE FUNCTION average_spending_by_user(user_id INT) RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE avg_spending DECIMAL(10, 2);

    SELECT AVG(price) INTO avg_spending
    FROM sale
    WHERE id_user = user_id;

    RETURN avg_spending;
END //


CREATE FUNCTION count_hats_by_color(color_name VARCHAR(255)) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE hat_count INT;

    SELECT COUNT(*) INTO hat_count
    FROM hat h
    JOIN sale_has_hat sh ON h.id = sh.id_hat
    WHERE h.paint = (SELECT paint FROM paint WHERE name = color_name);

    RETURN hat_count;
END //

CREATE FUNCTION get_user_name(user_id INT) RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
    DECLARE user_name VARCHAR(255);

    SELECT name INTO user_name
    FROM user
    WHERE id = user_id;

    RETURN user_name;
END //

#Triggers
CREATE TRIGGER after_sale_insert
AFTER INSERT ON sale
FOR EACH ROW
BEGIN
    UPDATE user
    SET transaction_count = (SELECT COUNT(*) FROM sale WHERE id_user = NEW.id_user)
    WHERE id = NEW.id_user;
END //

CREATE TRIGGER before_hat_price_update BEFORE UPDATE ON hat FOR EACH ROW
BEGIN
    IF OLD.price <> NEW.price THEN
        INSERT INTO hat_price_change_log (hat_id, old_price, new_price, change_date)
        VALUES (OLD.id, OLD.price, NEW.price, NOW());
    END IF;
END //

CREATE TRIGGER after_hat_delete
AFTER DELETE ON hat
FOR EACH ROW
BEGIN
    DELETE FROM hat_has_class WHERE hat_id = OLD.id;
END //

DELIMITER ;