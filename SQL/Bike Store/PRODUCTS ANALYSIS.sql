/* ANALISIS PRODUK */
-- 1. Produk Terlaris
SELECT 
    p.product_name, 
    SUM(oi.quantity) AS total_sold
FROM 
    order_items oi
JOIN 
    products p ON oi.product_id = p.product_id
GROUP BY 
    p.product_name
ORDER BY 
    total_sold DESC
LIMIT 10;

-- 2. Rata-rata jumlah produk per transaksi
SELECT AVG(total_quantity) AS avg_products_per_transaction
FROM (
    SELECT 
	order_id, 
        SUM(quantity) AS total_quantity
    FROM 
	order_items
    GROUP BY 
	order_id
) AS transaction_summary;
