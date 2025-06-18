-- ✅ テスト用ユーザーの追加（幂等）
INSERT INTO users (user_id, name, email, password, role)
SELECT 1, 'testuser', 'test@example.com', 'testpass', 'staff'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE user_id = 1);

INSERT INTO users (user_id, name, email, password, role)
SELECT 2, 'admin', 'admin@example.com', 'admin', 'admin'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE user_id = 2);

-- ✅ 製品データの追加（幂等）
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



-- ✅ 天気データの追加（幂等）
INSERT INTO weather (weather_date, weather_info)
SELECT '2024-06-01', '晴れ'
WHERE NOT EXISTS (SELECT 1 FROM weather WHERE weather_date = '2024-06-01');

INSERT INTO weather (weather_date, weather_info)
SELECT '2024-06-02', '曇り'
WHERE NOT EXISTS (SELECT 1 FROM weather WHERE weather_date = '2024-06-02');

-- ✅ 売上データの追加（幂等）
INSERT INTO sales (sale_id, sale_date, quantity, product_id, user_id)
SELECT 1, '2024-06-01', 30, 1, 1
WHERE NOT EXISTS (SELECT 1 FROM sales WHERE sale_id = 1);

INSERT INTO sales (sale_id, sale_date, quantity, product_id, user_id)
SELECT 2, '2024-06-02', 22, 2, 1
WHERE NOT EXISTS (SELECT 1 FROM sales WHERE sale_id = 2);

-- 2024-06-01 の製品別販売データ
INSERT INTO sales (sale_id, sale_date, quantity, product_id, user_id)
SELECT 10, '2024-06-01', 10, 1, 1 WHERE NOT EXISTS (SELECT 1 FROM sales WHERE sale_id = 10);
INSERT INTO sales (sale_id, sale_date, quantity, product_id, user_id)
SELECT 11, '2024-06-01', 5, 2, 1 WHERE NOT EXISTS (SELECT 1 FROM sales WHERE sale_id = 11);
INSERT INTO sales (sale_id, sale_date, quantity, product_id, user_id)
SELECT 12, '2024-06-01', 8, 3, 1 WHERE NOT EXISTS (SELECT 1 FROM sales WHERE sale_id = 12);

-- ✅ 2024-06-03 の売上データ
INSERT INTO sales (sale_id, sale_date, quantity, product_id, user_id)
SELECT 30, '2024-06-03', 10, 1, 1 WHERE NOT EXISTS (SELECT 1 FROM sales WHERE sale_id = 30);
INSERT INTO sales (sale_id, sale_date, quantity, product_id, user_id)
SELECT 31, '2024-06-03', 7, 2, 1 WHERE NOT EXISTS (SELECT 1 FROM sales WHERE sale_id = 31);
INSERT INTO sales (sale_id, sale_date, quantity, product_id, user_id)
SELECT 32, '2024-06-03', 5, 3, 1 WHERE NOT EXISTS (SELECT 1 FROM sales WHERE sale_id = 32);

-- ✅ 天気データ（対応日追加）
INSERT INTO weather (weather_date, weather_info)
SELECT '2024-06-03', '雨'
WHERE NOT EXISTS (SELECT 1 FROM weather WHERE weather_date = '2024-06-03');
