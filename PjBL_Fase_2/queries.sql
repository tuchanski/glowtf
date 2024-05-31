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
SELECT YEAR(date) AS year, 
       QUARTER(date) AS quarter, 
       COUNT(*) AS transaction_count 
FROM sale 
GROUP BY year, quarter;

-- 9) Tinta mais vendida ************
SELECT p.name AS paint_name, COUNT(sh.id) AS total_sales 
FROM paint p 
JOIN hat h ON p.paint = h.paint 
JOIN sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY paint_name 
ORDER BY total_sales DESC 
LIMIT 1;

-- 10) Tinta menos vendida ********
SELECT p.name AS paint_name, COUNT(*) AS total_sales 
FROM paint p 
JOIN hat h ON p.paint = h.paint 
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
SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    COUNT(*) AS total_sales
FROM 
    sale
GROUP BY 
    year, month
ORDER BY 
    total_sales DESC
LIMIT 1;

-- 19) Dia (geral) com maior número de vendas. -- Nova
SELECT 
    DATE(date) AS day,
    YEAR(date) AS year,
    MONTH(date) AS month,
    COUNT(*) AS total_sales
FROM 
    sale
GROUP BY 
    day
ORDER BY 
    total_sales DESC
LIMIT 1;

-- 20) Número de transações por usuário -- Nova
SELECT u.name AS user_name, COUNT(s.id) AS transaction_count
FROM user u
LEFT JOIN sale s ON u.id = s.id_user
GROUP BY u.id;

# Views
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
