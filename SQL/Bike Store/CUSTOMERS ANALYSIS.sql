/* ANALISIS PELANGGAN */
-- 1. Pelanggan terbanyak berdasarkan negara
SELECT
    c.state, 
    COUNT(c.customer_id) AS number_of_customers
FROM
    customers c
GROUP BY
    c.state
ORDER BY
    number_of_customers DESC;
    
-- 2. Pelanggan terbanyak berdasarkan kota
SELECT
    c.city, 
    COUNT(c.customer_id) AS number_of_customers
FROM
    customers c
GROUP BY
    c.city
ORDER BY
    number_of_customers DESC;
    
-- 3. Pelanggan dengan total belanja tertinggi
SELECT 
	c.first_name, 
    c.last_name, 
    SUM(oi.quantity * (oi.list_price - oi.discount)) AS total_expenditure
FROM 
	orders o
JOIN 
	order_items oi ON o.order_id = oi.order_id
JOIN 
	customers c ON o.customer_id = c.customer_id
GROUP BY 
	c.first_name, 
    c.last_name
ORDER BY 
	total_expenditure DESC
LIMIT 10;