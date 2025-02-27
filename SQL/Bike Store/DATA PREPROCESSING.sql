/* DATA PREPROCESSING */
-- 1. DEFINING PRIMARY KEYS
ALTER TABLE brands ADD CONSTRAINT pk_brands PRIMARY KEY (brand_id);
ALTER TABLE categories ADD CONSTRAINT pk_categories PRIMARY KEY (category_id);
ALTER TABLE customers ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);
ALTER TABLE products ADD CONSTRAINT pk_products PRIMARY KEY (product_id);
ALTER TABLE orders ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);
ALTER TABLE order_items ADD CONSTRAINT pk_order_items PRIMARY KEY (order_id, item_id);
ALTER TABLE staffs ADD CONSTRAINT pk_staffs PRIMARY KEY (staff_id);
ALTER TABLE stocks ADD CONSTRAINT pk_stocks PRIMARY KEY (store_id, product_id);
ALTER TABLE stores ADD CONSTRAINT pk_stores_store_id PRIMARY KEY (store_id);

-- 2. DEFINING FOREIGN KEYS
ALTER TABLE products 
ADD CONSTRAINT fk_products FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
ADD CONSTRAINT fk_products_category_id FOREIGN KEY (category_id) REFERENCES categories(category_id);

ALTER TABLE orders 
ADD CONSTRAINT fk_order_items_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
ADD CONSTRAINT fk_order_items_store_id FOREIGN KEY (store_id) REFERENCES stores(store_id),
ADD CONSTRAINT fk_order_items_staff_id FOREIGN KEY (staff_id) REFERENCES staffs(staff_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id),
ADD CONSTRAINT fk_order_items_product_id FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE staffs
MODIFY manager_id INT;

ALTER TABLE staffs
ADD CONSTRAINT fk_staffs_store_id FOREIGN KEY (store_id) REFERENCES stores(store_id),
ADD CONSTRAINT fk_staffs_manager_id FOREIGN KEY (manager_id) REFERENCES staffs(staff_id);

ALTER TABLE stocks
ADD CONSTRAINT fk_stocks_store_id FOREIGN KEY (store_id) REFERENCES stores(store_id),
ADD CONSTRAINT fk_stocks_product_id FOREIGN KEY (product_id) REFERENCES products(product_id);

-- 3. MODIFYING COLUMN
ALTER TABLE staffs MODIFY manager_id INT;