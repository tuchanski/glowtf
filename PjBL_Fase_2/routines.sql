DELIMITER $$
--Procedures

--Soma a porcentagem proprio do preço do chapéu a ele mesmo
CREATE PROCEDURE update_hat_price(IN hat_id INT, IN percentage_increase DECIMAL(5, 2))
BEGIN
    UPDATE hat
    SET price = price + (price * (percentage_increase / 100))
    WHERE id = hat_id;
END $$
#CALL update_hat_price(1, 10.000)$$

--Adiciona classe para chapéu
CREATE PROCEDURE add_class_to_hat(IN hat_id INT, IN class_id INT)
BEGIN
	INSERT INTO hat_has_class (hat_id, class_id)
    values(hat_id, class_id);
END $$
#CALL add_class_to_hat(1,1)$$

--Mostra todas as vendas o periodo escolhido
CREATE PROCEDURE sales_report_by_period(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT s.id AS sale_id, s.date AS sale_date, u.name AS user_name, s.price AS total_price, c.code_name AS coupon_code
    FROM sale s
    LEFT JOIN user u ON s.id_user = u.id
    LEFT JOIN coupons c ON s.id_coupon = c.id
    WHERE s.date BETWEEN start_date AND end_date
    ORDER BY s.date;
END $$
#CALL sales_report_by_period("2024-05-02" ,NOW(0))$$

--Functions
--Pega média de gastos de usuário
CREATE FUNCTION average_spending_by_user(user_id INT) RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE avg_spending DECIMAL(10, 2);

    SELECT AVG(price) INTO avg_spending
    FROM sale
    WHERE id_user = user_id;

    RETURN COALESCE(avg_spending, 0);
END $$

#SELECT average_spending_by_user(0)$$

--Contagem de chapéus com determinada tinta
DROP FUNCTION count_hats_by_color$$
CREATE FUNCTION count_hats_by_color(paint_id INT) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE hat_count INT;

    SELECT COUNT(*) INTO hat_count
    FROM hat h
    WHERE h.paint_id = paint_id;

    RETURN COALESCE(hat_count, 0);
END $$
#SELECT count_hats_by_color(1);

--Pega o nome do usuário pelo Id
CREATE FUNCTION get_user_name(user_id INT) RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
    DECLARE user_name VARCHAR(255);

    SELECT name INTO user_name
    FROM user
    WHERE id = user_id;
    RETURN user_name;
END $$
#SELECT get_user_name(1)$$

#Triggers

--Atualiza o estoque do chapéu após uma venda nova 
CREATE TRIGGER update_after_insert_sale_has_hat 
AFTER INSERT ON sale_has_hat 
FOR EACH ROW 
BEGIN 
    DECLARE hat_id_to_update INT; 
    DECLARE quantity_sold INT; 
    SET hat_id_to_update = NEW.id_hat; 
    SET quantity_sold = 1;
    
    IF quantity_sold > 0 THEN 
        UPDATE hat 
        SET inventory = inventory - quantity_sold 
        WHERE id = hat_id_to_update; 
    END IF; 
END$$

--Altera o preço final da venda quando o item individual tem o preço alterado
CREATE TRIGGER update_sale_price_after_update_sale_has_hat
AFTER UPDATE ON sale_has_hat
FOR EACH ROW
BEGIN
    DECLARE total_price DECIMAL(10,2);

    SELECT SUM(price) INTO total_price
    FROM sale_has_hat
    WHERE id_sale = NEW.id_sale;

    UPDATE sale
    SET price = total_price
    WHERE id = NEW.id_sale;
END$$

--Da um aviso quando um usuário vai ser deletado.
CREATE TRIGGER before_delete_user
BEFORE DELETE ON user
FOR EACH ROW
BEGIN
    -- Emitir uma mensagem de aviso
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Aviso: Você está prestes a excluir um usuário.';
END $$

DELIMITER ;
