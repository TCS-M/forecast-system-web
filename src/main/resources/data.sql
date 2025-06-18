-- ✅ テスト用ユーザーの追加
INSERT INTO users (user_id, name, email, password, role)
SELECT 1, 'testuser', 'test@example.com', 'testpass', 'staff'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE user_id = 1);

INSERT INTO users (user_id, name, email, password, role)
SELECT 2, 'admin', 'admin@example.com', 'admin', 'admin'
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

INSERT INTO sales (sale_date, quantity, product_id, user_id)
SELECT '2025-06-17', 12, 4, 2
WHERE NOT EXISTS (SELECT 1 FROM sales WHERE sale_date = '2025-06-17' AND product_id = 4);

-- 天気データの追加（詳細ページがこれを前提に動いている）
INSERT INTO weather (weather_date, weather_info)
SELECT '2025-06-15', '晴れ'
WHERE NOT EXISTS (SELECT 1 FROM weather WHERE weather_date = '2025-06-15');

INSERT INTO weather (weather_date, weather_info)
SELECT '2025-06-16', '曇り'
WHERE NOT EXISTS (SELECT 1 FROM weather WHERE weather_date = '2025-06-16');

INSERT INTO weather (weather_date, weather_info)
SELECT '2025-06-17', '雨'
WHERE NOT EXISTS (SELECT 1 FROM weather WHERE weather_date = '2025-06-17');
