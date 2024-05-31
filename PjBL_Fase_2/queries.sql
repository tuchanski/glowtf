USE glowtfdb;

SELECT gender, COUNT(*) AS total_users FROM user GROUP BY gender;

SELECT state, COUNT(*) AS total_users FROM user GROUP BY state;

SELECT AVG(price) AS average_spending_per_customer FROM sale;

SELECT id_user, COUNT(*) AS purchase_frequency FROM sale GROUP BY id_user;

SELECT c.class_name, COUNT(*) AS total_purchases 
FROM class c
JOIN hat_has_class h ON c.class_id = h.class_id
JOIN sale_has_hat sh ON h.hat_id = sh.id_hat
GROUP BY c.class_name
ORDER BY total_purchases DESC
LIMIT 1;

SELECT AVG(price) AS average_transaction_amount FROM sale;

SELECT YEAR(date) AS year, MONTH(date) AS month, COUNT(*) AS transaction_count 
FROM sale 
GROUP BY year, month;

SELECT YEAR(date) AS year, 
       QUARTER(date) AS quarter, 
       COUNT(*) AS transaction_count 
FROM sale 
GROUP BY year, quarter;

SELECT p.name AS paint_name, COUNT(sh.id) AS total_sales 
FROM paint p 
JOIN hat h ON p.paint = h.paint 
JOIN sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY paint_name 
ORDER BY total_sales DESC 
LIMIT 1;

SELECT p.name AS paint_name, COUNT(*) AS total_sales 
FROM paint p 
JOIN hat h ON p.paint = h.paint 
JOIN sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY paint_name 
ORDER BY total_sales ASC 
LIMIT 1;

SELECT h.name AS hat_name, COUNT(*) AS total_sales 
FROM hat h 
JOIN sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY hat_name 
ORDER BY total_sales DESC 
LIMIT 1;

SELECT h.name AS hat_name, COUNT(*) AS total_sales 
FROM hat h 
JOIN sale_has_hat sh ON h.id = sh.id_hat 
GROUP BY hat_name 
ORDER BY total_sales ASC 
LIMIT 1;

SELECT code_name, COUNT(*) AS usage_count 
FROM sale 
JOIN coupons ON sale.id_coupon = coupons.id 
GROUP BY code_name 
ORDER BY usage_count DESC 
LIMIT 1;

SELECT code_name, COUNT(*) AS usage_count 
FROM sale 
JOIN coupons ON sale.id_coupon = coupons.id 
GROUP BY code_name 
ORDER BY usage_count ASC 
LIMIT 1;

SELECT DAY(date) AS day_of_month, COUNT(*) AS transaction_count 
FROM sale 
GROUP BY day_of_month 
ORDER BY transaction_count DESC 
LIMIT 1;

SELECT DAY(date) AS day_of_month, COUNT(*) AS transaction_count 
FROM sale 
GROUP BY day_of_month 
ORDER BY transaction_count ASC 
LIMIT 1;

SELECT 
    (1 - (COUNT(s.id) / (SELECT COUNT(*) FROM cart))) * 100 AS abandoned_cart_percentage
FROM cart c
LEFT JOIN sale s ON c.id_user = s.id_user;

SELECT YEAR(date) AS year, 
       MONTH(date) AS month, 
       COUNT(*) AS transaction_count 
FROM sale 
GROUP BY year, month 
ORDER BY transaction_count DESC 
LIMIT 1;

SELECT u.name AS user_name, COUNT(s.id) AS transaction_count
FROM user u
LEFT JOIN sale s ON u.id = s.id_user
GROUP BY u.id;

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
