-- ✅ テスト用ユーザーの追加（幂等）
INSERT INTO users (name, email, password, role)
SELECT 'testuser', 'test@example.com', 'testpass', 'staff'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE user_id = 1);

INSERT INTO users (name, email, password, role)
SELECT 'admin', 'admin@example.com', 'admin', 'admin'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE user_id = 2);

-- ✅ 製品データの追加（幂等・新しい列に対応）
INSERT INTO products (product_id, name, price, jan_code, production_date, expiration_date, stock_quantity)
SELECT 1, 'ホワイトビール', 900, '4901234567894', CURRENT_DATE, CURRENT_DATE + INTERVAL '15 days', 100
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_id = 1);

INSERT INTO products (product_id, name, price, jan_code, production_date, expiration_date, stock_quantity)
SELECT 2, 'ラガー', 800, '4512345678907', CURRENT_DATE, CURRENT_DATE + INTERVAL '15 days', 120
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_id = 2);

INSERT INTO products (product_id, name, price, jan_code, production_date, expiration_date, stock_quantity)
SELECT 3, 'ペールエール', 1000, '4987654321097', CURRENT_DATE, CURRENT_DATE + INTERVAL '15 days', 150
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_id = 3);

INSERT INTO products (product_id, name, price, jan_code, production_date, expiration_date, stock_quantity)
SELECT 4, 'フルーツビール', 1000, '4545678901234', CURRENT_DATE, CURRENT_DATE + INTERVAL '15 days', 80
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_id = 4);

INSERT INTO products (product_id, name, price, jan_code, production_date, expiration_date, stock_quantity)
SELECT 5, '黒ビール', 1200, '4999999999996', CURRENT_DATE, CURRENT_DATE + INTERVAL '15 days', 90
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_id = 5);

-- ✅ 販売実績データの追加（sale_id省略）
INSERT INTO sales (sale_date, quantity, product_id, user_id)
SELECT '2025-06-15', 12, 1, 1
WHERE NOT EXISTS (SELECT 1 FROM sales WHERE sale_date = '2025-06-15' AND product_id = 1);

INSERT INTO sales (sale_date, quantity, product_id, user_id)
SELECT '2025-06-16', 8, 2, 1
WHERE NOT EXISTS (SELECT 1 FROM sales WHERE sale_date = '2025-06-16' AND product_id = 2);

INSERT INTO sales (sale_date, quantity, product_id, user_id)
SELECT '2025-06-17', 15, 3, 2
WHERE NOT EXISTS (SELECT 1 FROM sales WHERE sale_date = '2025-06-17' AND product_id = 3);
