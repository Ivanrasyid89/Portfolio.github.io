/* ANALISIS TOKO & STAF */
-- 1. Toko dengan total penjualan tertinggi
SELECT 
    s.store_name, 
    SUM(oi.quantity * (oi.list_price - oi.discount)) AS revenue
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    stores s ON o.store_id = s.store_id
GROUP BY 
    s.store_name
ORDER BY 
    revenue DESC;

-- 2. Staf dengan transaksi terbanyak
WITH top_staff_per_total_transaction AS (
	SELECT
	    s.staff_id,
            st.store_id,
            s.first_name,
            s.last_name,
            st.store_name,
            SUM(oi.quantity * (oi.list_price - oi.discount)) AS total_transaction
	FROM
	    order_items oi
	JOIN
	    orders o ON oi.order_id = o.order_id
	JOIN
	    staffs s ON o.staff_id = s.staff_id
	JOIN
	    stores st ON s.store_id = st.store_id
	GROUP BY
	    s.staff_id,
            st.store_id,
            s.first_name, 
            s.last_name
)
SELECT 
    staff_id,
    store_id,
    first_name,
    last_name,
    store_name,
    total_transaction
FROM 
    top_staff_per_total_transaction
ORDER BY 
    total_transaction DESC;
