-- ✅ テスト用ユーザーの追加（幂等）
INSERT INTO users (name, email, password, role)
SELECT 'testuser', 'test@example.com', 'testpass', 'staff'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE user_id = 1);

INSERT INTO users (name, email, password, role)
SELECT 'admin', 'admin@example.com', 'admin', 'admin'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE user_id = 2);

-- ✅ 製品データの追加
INSERT INTO products (product_id, name, price, jan_code)
SELECT 1, 'ホワイトビール', 900, '4901234567894'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_id = 1);

INSERT INTO products (product_id, name, price, jan_code)
SELECT 2, 'ラガー', 800, '4512345678907'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_id = 2);

INSERT INTO products (product_id, name, price, jan_code)
SELECT 3, 'ペールエール', 1000, '4987654321097'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_id = 3);

INSERT INTO products (product_id, name, price, jan_code)
SELECT 4, 'フルーツビール', 1000, '4545678901234'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_id = 4);

INSERT INTO products (product_id, name, price, jan_code)
SELECT 5, '黒ビール', 1200, '4999999999996'
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

-- 予測データ（月曜・木曜のみ）
INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
SELECT 1, '2025-06-19', 50, 60, 1
WHERE NOT EXISTS (SELECT 1 FROM forecast WHERE forecast_id = 1);

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
SELECT 2, '2025-06-20', 40, 50, 2
WHERE NOT EXISTS (SELECT 1 FROM forecast WHERE forecast_id = 2);

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
SELECT 3, '2025-06-23', 70, 80, 1
WHERE NOT EXISTS (SELECT 1 FROM forecast WHERE forecast_id = 3);

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
SELECT 4, '2025-06-24', 30, 35, 3
WHERE NOT EXISTS (SELECT 1 FROM forecast WHERE forecast_id = 4);
