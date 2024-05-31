use glowtfdb;

-- Mudanças: Removido idade por usuário.
-- Adicionado: Número de transações por usuário

-- Gênero do usuário:
SELECT gender, COUNT(*) AS total_users FROM user GROUP BY gender;

-- Local do usuário:
SELECT state, COUNT(*) AS total_users FROM user GROUP BY state;

-- Média de gasto por cliente:
SELECT AVG(price) AS average_spending_per_customer FROM sale;

-- Frequência de compras por cliente:
SELECT id_user, COUNT(*) AS purchase_frequency FROM sale GROUP BY id_user;

-- Classe com mais compras associadas:
SELECT c.class_name, COUNT(*) AS total_purchases 
FROM class c
JOIN hat_has_class h ON c.class_id = h.class_id
JOIN sale_has_hat sh ON h.hat_id = sh.id_hat
GROUP BY c.class_name
ORDER BY total_purchases DESC
LIMIT 1;

-- Média gasta por transação:
SELECT AVG(price) AS average_transaction_amount FROM sale;

-- Média de transações por mês:
SELECT YEAR(date) AS year, MONTH(date) AS month, COUNT(*) AS transaction_count 
FROM sale 
GROUP BY year, month;

-- Média de transações por trimestre:
SELECT YEAR(date) AS year, 
       QUARTER(date) AS quarter, 
       COUNT(*) AS transaction_count 
FROM sale 
GROUP BY year, quarter;

-- Tinta mais vendida:
SELECT p.name AS paint_name, COUNT(sh.id) AS total_sales 
FROM paint p 
JOIN hat h ON p.paint = h.paint 
JOIN sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY paint_name 
ORDER BY total_sales DESC 
LIMIT 1;

-- Tinta menos vendida:
SELECT p.name AS paint_name, COUNT(*) AS total_sales 
FROM paint p 
JOIN hat h ON p.paint = h.paint 
JOIN sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY paint_name 
ORDER BY total_sales ASC 
LIMIT 1;

-- Chapéu mais vendido:
SELECT h.name AS hat_name, COUNT(*) AS total_sales 
FROM hat h 
JOIN sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY hat_name 
ORDER BY total_sales DESC 
LIMIT 1;

-- Chapéu menos vendido:
SELECT h.name AS hat_name, COUNT(*) AS total_sales 
FROM hat h 
JOIN sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY hat_name 
ORDER BY total_sales ASC 
LIMIT 1;

-- Cupom mais popular:
SELECT code_name, COUNT(*) AS usage_count 
FROM sale 
JOIN coupons ON sale.id_coupon = coupons.id 
GROUP BY code_name 
ORDER BY usage_count DESC 
LIMIT 1;

-- Cupom menos popular:
SELECT code_name, COUNT(*) AS usage_count 
FROM sale 
JOIN coupons ON sale.id_coupon = coupons.id 
GROUP BY code_name 
ORDER BY usage_count ASC 
LIMIT 1;

-- Dia do mês com maior número de vendas:
SELECT DAY(date) AS day_of_month, COUNT(*) AS transaction_count 
FROM sale 
GROUP BY day_of_month 
ORDER BY transaction_count DESC 
LIMIT 1;

-- Dia do mês com menor número de vendas:
SELECT DAY(date) AS day_of_month, COUNT(*) AS transaction_count 
FROM sale 
GROUP BY day_of_month 
ORDER BY transaction_count ASC 
LIMIT 1;

-- Porcentagem de carrinhos abandonados:
SELECT 
    (1 - (COUNT(s.id) / (SELECT COUNT(*) FROM cart))) * 100 AS abandoned_cart_percentage
FROM cart c
LEFT JOIN sale s ON c.id_user = s.id_user;

-- Mês do ano com o maior número de vendas:
SELECT YEAR(date) AS year, 
       MONTH(date) AS month, 
       COUNT(*) AS transaction_count 
FROM sale 
GROUP BY year, month 
ORDER BY transaction_count DESC 
LIMIT 1;

-- Número de transações por usuário:
SELECT u.name AS user_name, COUNT(s.id) AS transaction_count
FROM user u
LEFT JOIN sale s ON u.id = s.id_user
GROUP BY u.id;

-- View para informações dos usuários:
CREATE VIEW user_total_info AS
SELECT id, name, gender, state, email, `admin` AS is_admin
FROM user;

-- View para informações das transações:
CREATE VIEW transaction_info AS
SELECT s.id AS transaction_id, u.name AS user_name, s.date AS transaction_date, s.price AS transaction_price, c.code_name AS coupon_code
FROM sale s
JOIN user u ON s.id_user = u.id
LEFT JOIN coupons c ON s.id_coupon = c.id;

-- View para informações dos cupons:
CREATE VIEW coupon_info AS
SELECT id, expiration_date, discount, uses, start_date, code_name
FROM coupons;
