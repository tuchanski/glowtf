DELIMITER //


#Procedures

#Soma a porcentagem proprio do preço do chapéu a ele mesmo
CREATE PROCEDURE update_hat_price(IN hat_id INT, IN percentage_increase DECIMAL(5, 2))
BEGIN
    UPDATE hat
    SET price = price + (price * (percentage_increase / 100))
    WHERE id = hat_id;
END //


#Adiciona classe para chapéu
CREATE PROCEDURE add_class_to_hat(IN hat_id INT, IN class_id INT)
BEGIN
	INSERT INTO hat_has_class (hat_id, class_id)
    values(hat_id, class_id);
END //


#Mostra todas as vendas o periodo escolhido
CREATE PROCEDURE sales_report_by_period(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT s.id AS sale_id, s.date AS sale_date, u.name AS user_name, s.price AS total_price, c.code_name AS coupon_code
    FROM sale s
    LEFT JOIN user u ON s.id_user = u.id
    LEFT JOIN coupons c ON s.id_coupon = c.id
    WHERE s.date BETWEEN start_date AND end_date
    ORDER BY s.date;
END //

#Functions
#Pega média de gastos de usuário
CREATE FUNCTION average_spending_by_user(user_id INT) RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE avg_spending DECIMAL(10, 2);

    SELECT AVG(price) INTO avg_spending
    FROM sale
    WHERE id_user = user_id;

    RETURN COALESCE(avg_spending, 0);
END //


#SELECT average_spending_by_user(0)//

#Contagem de chapéus com determinada cor
DROP FUNCTION count_hats_by_color//
CREATE FUNCTION count_hats_by_color(paint_id INT) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE hat_count INT;

    SELECT COUNT(*) INTO hat_count
    FROM hat h
    WHERE h.paint_id = paint_id;

    RETURN COALESCE(hat_count, 0);
END //

#SELECT count_hats_by_color(1);

#Pega o nome do usuário pelo Id
CREATE FUNCTION get_user_name(user_id INT) RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
    DECLARE user_name VARCHAR(255);

    SELECT name INTO user_name
    FROM user
    WHERE id = user_id;
    RETURN user_name;
END //

#SELECT get_user_name(1)//

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