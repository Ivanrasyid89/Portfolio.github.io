/* ANALISIS PENJUALAN */
-- 1. Total Penjualan per tahun
SELECT 
	YEAR(order_date) AS year, 
    MONTH(order_date) AS month, 
    SUM(quantity * (list_price - discount)) AS total_sales
FROM 
	orders o
JOIN 
	order_items oi ON o.order_id = oi.order_id
GROUP BY 
	YEAR(order_date), 
    MONTH(order_date)
ORDER BY 
	year, 
    month;
    
-- 2. Produk terlaris tiap tahun
WITH top_product_per_year AS (
	SELECT
		YEAR(o.order_date) AS sales_year,
        oi.product_id,
        SUM(oi.quantity) AS total_sold
	FROM
		order_items oi
	JOIN 
		orders o ON oi.order_id = o.order_id
	GROUP BY 
		YEAR(o.order_date),
        oi.product_id
),
ranked_products AS (
    SELECT 
        t.sales_year,
        t.product_id,
        p.product_name,
        t.total_sold,
        RANK() OVER (PARTITION BY t.sales_year ORDER BY t.total_sold DESC) AS ranking
    FROM 
		top_product_per_year t
    JOIN 
		products p ON t.product_id = p.product_id
)
SELECT 
    sales_year, 
    product_name, 
    total_sold
FROM 
	ranked_products
WHERE 
	rangking = 1
ORDER BY 
	sales_year DESC;

-- 3. Produk terlaris tiap kategori
WITH top_product_per_category AS (
    SELECT
        p.category_id,
        oi.product_id,
        SUM(oi.quantity) AS total_sold
    FROM 
		order_items oi
    JOIN 
		orders o ON oi.order_id = o.order_id
    JOIN 
		products p ON oi.product_id = p.product_id
    GROUP BY 
		p.category_id, oi.product_id
),
ranked_products AS (
    SELECT 
        t.category_id,
        t.product_id,
        p.product_name,
        c.category_name,
        t.total_sold,
        RANK() OVER (PARTITION BY t.category_id ORDER BY t.total_sold DESC) AS ranking
    FROM 
		top_product_per_category t
    JOIN 
		products p ON t.product_id = p.product_id
    JOIN 
		categories c ON t.category_id = c.category_id
)
SELECT 
    category_name,
    category_id,
    product_name, 
    total_sold
FROM 
	ranked_products
WHERE 
	ranking = 1;

-- 4. Produk terlaris tiap brand
WITH top_product_per_brand AS (
    SELECT
        p.brand_id,
        oi.product_id,
        SUM(oi.quantity) AS total_sold
    FROM 
		order_items oi
    JOIN 
		orders o ON oi.order_id = o.order_id
    JOIN 
		products p ON oi.product_id = p.product_id
    GROUP BY 
		p.brand_id, 
        oi.product_id
),
ranked_products AS (
    SELECT 
        t.brand_id,
        t.product_id,
        p.product_name,
        b.brand_name,
        t.total_sold,
        RANK() OVER (PARTITION BY t.brand_id ORDER BY t.total_sold DESC) AS ranking
    FROM 
		top_product_per_brand t
    JOIN 
		products p ON t.product_id = p.product_id
    JOIN 
		brands b ON t.brand_id = b.brand_id
)
SELECT 
    brand_name,
    brand_id,
    product_name, 
    total_sold
FROM 
	ranked_products
WHERE 
	ranking = 1;