-- ✅ テスト用ユーザーの追加（幂等）
-- テスト用のパスワードはハッシュ化しているがそれぞれ、testpass、admin
INSERT INTO users (name, email, password, role)
SELECT 'testuser', 'test@example.com', '$2a$10$6759kTy4FapY760XQrSINOQEImP8Noi05fD0UEQNEiPcRAos1VIVO', 'staff'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE user_id = 1);

INSERT INTO users (name, email, password, role)
SELECT 'admin', 'admin@example.com', '$2a$10$zw10zZRSoeGEVcEImJYGU.vSCMP7lqAvVFlD81iJCaIeMa1WUBoS6', 'admin'
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

INSERT INTO products (product_id, name, price, jan_code, production_date, expiration_date, stock_quantity)
SELECT 6, 'IPA', 1100, '4922222222221', CURRENT_DATE, CURRENT_DATE + INTERVAL '15 days', 70
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_id = 6);


INSERT INTO weather (weather_date, weather_info, weather_water, weather_wind, weather_temperature)
VALUES ('2025-01-01', '晴れ', 0.0, 1.0, 5.0)
ON CONFLICT (weather_date) DO NOTHING;

INSERT INTO weather (weather_date, weather_info, weather_water, weather_wind, weather_temperature)
VALUES ('2025-01-02', '曇り', 1.2, 2.0, 4.0)
ON CONFLICT (weather_date) DO NOTHING;

INSERT INTO weather (weather_date, weather_info, weather_water, weather_wind, weather_temperature)
VALUES ('2025-01-03', '雨', 8.5, 3.5, 3.0)
ON CONFLICT (weather_date) DO NOTHING;

INSERT INTO weather (weather_date, weather_info, weather_water, weather_wind, weather_temperature)
VALUES ('2025-01-04', '雪', 4.5, 2.2, -2.0)
ON CONFLICT (weather_date) DO NOTHING;

INSERT INTO weather (weather_date, weather_info, weather_water, weather_wind, weather_temperature)
VALUES ('2025-01-05', '晴れ', 0.0, 1.0, 5.0)
ON CONFLICT (weather_date) DO NOTHING;

INSERT INTO weather (weather_date, weather_info, weather_water, weather_wind, weather_temperature)
VALUES ('2025-01-06', '曇り', 1.2, 2.0, 4.0)
ON CONFLICT (weather_date) DO NOTHING;

INSERT INTO weather (weather_date, weather_info, weather_water, weather_wind, weather_temperature)
VALUES ('2025-01-07', '雨', 8.5, 3.5, 3.0)
ON CONFLICT (weather_date) DO NOTHING;

INSERT INTO weather (weather_date, weather_info, weather_water, weather_wind, weather_temperature)
VALUES ('2025-01-08', '雪', 4.5, 2.2, -2.0)
ON CONFLICT (weather_date) DO NOTHING;

INSERT INTO weather (weather_date, weather_info, weather_water, weather_wind, weather_temperature)
VALUES ('2025-01-09', '晴れ', 0.0, 1.0, 5.0)
ON CONFLICT (weather_date) DO NOTHING;

INSERT INTO weather (weather_date, weather_info, weather_water, weather_wind, weather_temperature)
VALUES ('2025-01-10', '曇り', 1.2, 2.0, 4.0)
ON CONFLICT (weather_date) DO NOTHING;


-- ✅ 販売実績データの追加（sale_idはSERIAL）
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-04-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-04-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-04-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-04-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-04-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-04-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-04-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-04-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-04-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-04-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-04-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-04-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-04-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-04-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-04-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-04-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-04-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-04-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-04-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-04-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-04-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-04-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-04-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-04-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-04-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-04-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-04-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-04-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-04-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 11, '2024-04-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 8, '2024-04-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-04-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-04-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 7, '2024-04-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-04-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-04-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-04-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-04-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-04-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-04-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-04-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-04-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-04-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-04-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-04-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-04-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-04-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-04-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-04-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-04-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-04-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-04-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-04-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-04-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-04-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-04-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-04-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-04-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-04-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-04-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-04-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 6, '2024-04-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-04-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-04-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-04-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 8, '2024-04-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-04-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-04-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2024-04-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-04-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 10, '2024-04-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-04-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-04-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 6, '2024-04-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-04-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-04-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-04-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-04-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-04-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-04-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-04-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-04-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-04-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-04-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-04-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-04-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-04-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-04-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-04-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-04-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-04-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-04-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-04-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-04-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 9, '2024-04-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 9, '2024-04-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-04-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-04-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-04-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-04-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-04-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-04-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-04-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-04-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-04-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-04-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-04-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-04-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-04-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-04-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-04-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-04-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 8, '2024-04-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-04-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-04-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-04-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-04-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-04-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-04-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-04-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-04-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-04-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-04-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-04-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-04-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-04-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-04-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-04-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-04-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 10, '2024-04-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-04-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-04-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-04-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-04-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-04-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-04-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-04-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-04-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-04-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-04-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-04-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-04-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-04-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-04-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-04-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-04-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-04-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-04-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-04-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-04-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-04-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-04-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-04-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-05-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-05-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-05-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-05-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-05-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-05-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-05-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-05-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-05-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-05-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 9, '2024-05-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 12, '2024-05-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-05-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 7, '2024-05-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 7, '2024-05-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-05-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-05-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-05-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-05-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-05-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-05-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-05-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-05-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-05-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-05-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-05-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-05-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-05-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-05-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-05-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-05-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-05-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-05-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-05-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-05-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-05-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-05-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-05-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-05-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-05-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-05-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-05-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-05-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-05-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-05-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 10, '2024-05-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 10, '2024-05-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 8, '2024-05-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 7, '2024-05-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2024-05-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 7, '2024-05-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-05-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-05-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-05-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-05-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-05-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-05-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-05-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-05-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-05-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-05-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-05-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-05-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-05-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-05-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-05-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-05-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-05-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-05-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-05-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-05-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-05-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-05-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-05-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-05-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-05-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-05-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-05-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-05-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 10, '2024-05-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-05-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-05-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-05-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-05-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-05-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-05-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-05-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-05-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-05-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-05-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 9, '2024-05-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-05-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-05-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-05-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-05-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-05-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-05-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-05-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-05-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-05-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-05-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-05-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-05-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-05-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-05-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-05-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-05-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-05-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-05-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-05-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-05-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-05-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-05-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-05-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-05-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 10, '2024-05-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 9, '2024-05-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 8, '2024-05-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 6, '2024-05-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2024-05-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 10, '2024-05-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-05-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-05-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-05-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-05-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-05-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-05-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-05-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-05-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-05-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-05-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-05-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-05-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-05-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-05-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-05-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-05-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-05-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-05-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-05-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-05-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-05-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-05-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-05-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 6, '2024-05-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-05-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-05-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-05-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-05-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-05-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-05-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-05-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-05-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-05-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-05-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-05-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-05-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-06-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-06-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-06-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-06-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-06-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-06-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-06-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-06-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-06-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-06-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-06-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-06-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-06-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-06-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-06-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-06-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-06-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-06-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-06-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-06-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-06-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-06-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-06-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-06-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-06-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-06-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-06-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-06-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-06-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 20, '2024-06-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 14, '2024-06-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 9, '2024-06-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 10, '2024-06-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 8, '2024-06-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-06-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-06-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-06-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-06-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-06-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-06-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-06-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-06-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-06-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-06-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-06-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-06-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-06-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-06-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-06-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-06-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-06-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-06-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-06-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-06-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-06-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-06-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-06-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-06-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-06-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-06-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-06-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-06-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-06-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-06-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-06-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-06-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 10, '2024-06-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 7, '2024-06-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 7, '2024-06-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-06-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-06-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-06-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-06-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-06-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-06-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-06-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-06-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-06-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 10, '2024-06-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-06-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 9, '2024-06-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-06-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 7, '2024-06-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-06-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-06-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-06-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-06-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-06-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-06-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-06-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-06-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-06-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-06-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-06-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-06-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-06-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-06-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 6, '2024-06-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-06-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-06-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-06-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-06-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-06-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-06-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-06-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-06-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-06-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-06-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-06-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-06-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-06-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 8, '2024-06-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-06-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-06-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-06-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-06-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-06-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-06-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-06-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-06-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-06-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-06-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-06-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-06-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-06-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-06-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-06-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-06-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-06-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-06-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-06-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-06-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-06-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-06-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-06-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-06-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-06-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-06-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-06-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-06-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-06-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-06-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-06-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-06-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-06-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-06-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-07-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-07-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-07-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-07-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-07-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-07-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-07-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-07-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-07-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-07-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-07-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-07-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-07-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 10, '2024-07-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-07-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 7, '2024-07-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-07-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 8, '2024-07-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-07-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-07-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-07-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 6, '2024-07-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-07-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-07-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 11, '2024-07-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 17, '2024-07-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 10, '2024-07-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 14, '2024-07-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-07-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 7, '2024-07-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-07-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-07-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-07-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-07-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-07-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-07-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 13, '2024-07-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-07-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 9, '2024-07-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-07-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-07-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-07-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-07-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-07-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-07-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-07-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-07-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-07-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 9, '2024-07-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-07-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-07-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-07-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-07-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-07-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-07-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-07-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-07-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-07-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-07-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-07-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-07-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-07-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-07-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-07-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-07-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-07-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-07-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-07-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-07-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-07-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-07-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-07-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 9, '2024-07-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-07-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-07-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-07-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-07-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-07-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-07-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-07-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-07-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-07-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-07-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-07-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-07-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-07-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-07-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-07-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-07-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 12, '2024-07-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 7, '2024-07-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 7, '2024-07-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-07-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 8, '2024-07-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-07-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 12, '2024-07-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-07-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 6, '2024-07-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-07-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-07-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-07-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-07-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-07-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-07-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-07-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-07-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-07-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 8, '2024-07-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-07-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 7, '2024-07-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-07-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-07-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-07-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-07-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-07-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-07-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-07-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-07-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-07-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-07-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-07-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-07-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-07-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-07-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-07-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-07-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-07-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-07-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-07-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 10, '2024-07-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 15, '2024-07-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 10, '2024-07-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 12, '2024-07-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2024-07-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-07-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-07-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-07-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-07-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-07-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-07-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-07-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-07-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 8, '2024-07-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-07-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 6, '2024-07-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-07-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-07-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-07-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-07-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-07-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-07-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-07-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-07-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-07-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-07-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-07-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-07-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-07-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-07-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-08-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-08-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-08-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-08-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-08-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-08-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-08-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 17, '2024-08-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 11, '2024-08-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 8, '2024-08-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-08-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-08-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-08-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-08-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-08-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-08-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-08-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-08-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-08-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-08-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-08-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-08-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-08-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-08-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-08-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-08-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-08-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-08-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-08-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-08-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-08-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-08-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-08-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-08-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-08-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-08-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-08-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 9, '2024-08-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-08-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-08-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-08-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-08-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 9, '2024-08-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 12, '2024-08-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-08-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 7, '2024-08-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-08-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 6, '2024-08-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-08-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-08-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-08-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-08-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-08-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-08-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-08-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 8, '2024-08-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-08-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-08-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-08-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-08-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-08-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-08-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-08-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-08-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-08-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-08-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-08-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-08-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-08-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-08-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-08-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-08-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-08-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-08-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-08-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-08-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-08-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-08-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-08-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-08-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-08-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-08-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-08-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-08-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-08-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-08-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-08-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-08-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-08-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-08-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-08-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-08-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-08-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-08-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-08-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-08-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 10, '2024-08-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-08-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-08-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-08-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 6, '2024-08-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-08-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-08-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-08-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-08-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-08-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-08-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-08-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-08-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-08-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-08-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-08-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-08-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 12, '2024-08-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 12, '2024-08-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 7, '2024-08-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 8, '2024-08-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-08-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-08-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-08-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-08-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-08-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-08-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-08-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-08-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-08-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-08-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-08-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-08-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-08-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-08-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-08-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-08-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-08-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-08-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-08-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-08-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-08-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-08-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-08-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-08-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-08-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-08-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-08-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-08-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-08-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-08-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-08-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-08-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-08-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-08-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-08-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-08-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-08-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-08-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-08-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-08-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-08-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-08-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-08-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-09-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-09-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-09-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 6, '2024-09-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-09-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-09-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-09-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-09-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-09-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-09-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-09-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-09-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-09-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 9, '2024-09-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-09-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-09-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-09-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-09-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-09-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-09-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-09-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-09-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-09-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-09-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 12, '2024-09-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 13, '2024-09-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 8, '2024-09-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 10, '2024-09-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-09-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 9, '2024-09-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-09-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 10, '2024-09-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-09-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-09-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-09-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-09-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-09-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-09-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-09-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-09-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-09-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-09-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-09-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-09-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-09-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-09-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-09-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-09-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 8, '2024-09-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-09-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 6, '2024-09-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-09-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-09-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-09-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-09-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 7, '2024-09-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-09-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-09-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-09-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 10, '2024-09-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-09-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-09-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-09-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 6, '2024-09-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-09-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-09-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-09-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-09-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-09-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-09-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-09-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-09-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-09-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-09-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-09-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-09-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-09-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-09-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-09-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-09-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-09-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-09-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-09-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-09-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-09-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-09-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-09-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-09-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-09-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-09-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-09-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-09-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-09-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-09-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-09-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 10, '2024-09-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 9, '2024-09-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 7, '2024-09-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-09-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 6, '2024-09-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-09-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-09-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-09-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-09-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-09-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-09-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-09-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-09-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-09-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-09-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-09-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-09-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-09-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-09-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-09-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-09-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-09-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-09-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-09-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-09-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-09-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-09-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-09-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-09-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-09-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-09-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-09-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-09-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-09-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-09-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-09-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 8, '2024-09-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-09-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-09-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2024-09-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-09-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-09-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-09-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-09-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-09-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2024-09-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-09-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-09-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-09-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-09-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-09-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-09-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-09-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-10-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-10-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-10-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-10-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-10-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-10-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-10-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-10-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-10-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-10-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-10-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 7, '2024-10-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-10-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-10-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-10-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-10-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-10-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-10-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-10-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-10-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-10-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-10-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-10-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-10-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-10-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-10-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-10-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-10-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-10-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-10-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-10-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-10-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-10-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-10-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-10-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 7, '2024-10-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-10-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-10-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-10-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-10-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-10-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-10-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-10-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-10-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-10-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-10-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-10-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-10-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-10-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-10-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-10-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-10-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-10-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-10-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 8, '2024-10-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-10-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-10-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-10-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-10-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-10-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-10-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-10-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 6, '2024-10-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-10-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-10-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-10-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-10-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-10-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-10-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-10-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-10-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-10-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-10-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-10-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-10-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-10-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-10-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-10-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-10-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-10-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-10-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-10-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-10-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-10-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-10-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-10-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-10-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-10-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-10-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-10-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-10-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-10-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-10-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-10-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-10-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-10-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-10-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-10-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-10-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-10-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-10-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-10-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-10-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-10-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-10-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-10-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-10-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-10-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-10-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-10-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 6, '2024-10-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-10-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-10-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-10-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-10-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-10-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-10-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-10-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-10-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-10-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-10-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-10-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-10-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-10-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-10-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 9, '2024-10-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 10, '2024-10-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 7, '2024-10-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-10-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 7, '2024-10-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-10-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-10-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-10-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-10-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-10-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-10-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-10-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-10-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-10-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-10-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-10-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-10-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-10-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-10-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-10-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-10-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-10-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-10-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-10-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-10-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-10-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-10-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-10-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-10-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-10-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-10-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-10-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-10-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-10-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-10-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 11, '2024-11-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 14, '2024-11-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 9, '2024-11-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 8, '2024-11-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-11-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-11-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2024-11-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-11-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-11-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-11-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-11-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-11-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-11-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-11-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-11-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-11-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-11-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-11-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-11-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-11-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-11-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 6, '2024-11-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-11-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-11-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-11-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-11-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-11-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-11-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-11-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-11-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-11-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-11-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2024-11-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-11-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-11-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 8, '2024-11-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-11-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-11-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-11-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-11-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-11-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-11-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-11-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-11-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-11-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-11-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-11-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-11-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-11-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-11-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-11-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 9, '2024-11-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-11-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-11-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-11-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-11-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-11-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-11-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-11-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-11-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-11-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 9, '2024-11-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 8, '2024-11-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 7, '2024-11-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-11-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2024-11-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 7, '2024-11-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-11-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-11-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-11-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-11-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-11-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 6, '2024-11-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-11-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-11-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-11-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-11-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-11-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-11-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-11-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-11-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-11-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-11-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 6, '2024-11-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 9, '2024-11-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-11-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-11-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-11-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 7, '2024-11-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-11-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-11-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-11-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-11-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-11-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-11-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-11-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-11-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-11-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-11-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-11-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-11-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-11-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-11-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-11-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-11-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-11-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2024-11-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-11-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-11-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-11-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-11-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-11-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-11-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-11-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-11-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-11-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-11-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-11-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-11-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-11-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-11-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-11-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-11-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-11-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-11-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-11-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2024-11-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-11-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-11-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2024-11-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-11-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-11-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-11-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-11-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-11-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 13, '2024-11-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 9, '2024-11-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 8, '2024-11-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 7, '2024-11-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 11, '2024-11-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-11-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-11-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-11-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-11-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-11-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-11-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 6, '2024-11-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-12-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-12-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-12-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-12-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-12-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-12-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-12-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-12-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-12-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-12-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-12-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-12-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-12-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-12-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 7, '2024-12-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-12-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2024-12-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-12-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-12-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-12-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-12-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-12-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-12-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-12-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 10, '2024-12-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 11, '2024-12-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 8, '2024-12-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 7, '2024-12-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 9, '2024-12-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-12-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-12-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-12-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-12-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-12-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-12-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-12-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-12-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-12-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-12-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-12-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-12-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2024-12-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-12-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 7, '2024-12-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-12-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2024-12-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-12-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-12-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-12-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-12-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-12-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-12-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-12-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-12-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-12-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-12-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-12-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-12-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2024-12-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 9, '2024-12-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-12-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-12-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-12-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 7, '2024-12-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-12-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-12-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-12-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-12-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-12-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-12-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-12-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-12-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-12-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-12-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-12-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-12-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-12-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-12-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2024-12-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2024-12-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-12-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-12-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2024-12-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-12-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-12-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-12-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-12-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-12-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-12-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-12-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-12-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-12-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-12-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-12-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-12-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-12-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 7, '2024-12-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2024-12-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-12-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-12-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-12-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-12-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2024-12-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-12-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-12-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2024-12-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2024-12-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-12-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-12-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-12-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2024-12-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2024-12-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-12-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-12-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-12-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-12-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2024-12-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-12-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2024-12-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-12-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-12-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-12-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2024-12-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-12-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2024-12-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2024-12-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2024-12-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2024-12-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-12-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-12-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2024-12-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2024-12-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2024-12-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2024-12-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 8, '2024-12-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-12-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-12-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2024-12-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2024-12-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-12-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2024-12-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2024-12-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2024-12-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2024-12-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2024-12-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2024-12-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2024-12-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-12-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 11, '2024-12-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2024-12-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 8, '2024-12-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2024-12-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 7, '2024-12-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2024-12-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-01-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-01-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-01-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-01-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-01-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-01-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2025-01-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2025-01-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2025-01-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2025-01-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-01-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2025-01-02', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2025-01-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-01-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2025-01-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-01-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-01-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2025-01-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-01-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-01-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-01-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-01-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-01-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2025-01-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2025-01-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2025-01-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2025-01-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-01-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2025-01-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-01-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2025-01-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-01-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-01-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-01-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-01-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-01-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2025-01-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-01-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2025-01-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-01-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-01-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2025-01-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2025-01-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-01-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-01-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-01-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-01-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-01-09', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2025-01-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-01-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2025-01-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2025-01-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-01-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2025-01-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2025-01-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-01-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-01-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-01-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-01-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2025-01-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2025-01-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-01-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-01-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-01-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-01-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2025-01-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2025-01-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-01-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2025-01-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2025-01-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2025-01-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2025-01-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-01-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-01-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-01-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-01-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-01-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2025-01-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-01-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-01-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-01-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-01-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-01-16', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2025-01-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2025-01-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-01-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2025-01-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-01-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 6, '2025-01-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-01-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-01-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-01-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-01-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-01-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2025-01-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-01-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-01-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2025-01-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-01-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2025-01-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-01-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2025-01-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-01-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2025-01-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2025-01-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2025-01-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2025-01-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2025-01-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-01-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-01-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-01-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-01-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2025-01-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-01-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-01-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2025-01-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-01-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 6, '2025-01-23', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2025-01-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2025-01-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2025-01-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 5, '2025-01-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2025-01-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 6, '2025-01-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2025-01-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-01-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2025-01-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2025-01-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-01-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2025-01-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2025-01-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2025-01-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2025-01-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-01-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-01-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-01-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-01-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-01-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-01-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-01-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-01-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2025-01-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2025-01-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2025-01-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-01-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2025-01-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-01-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-01-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-01-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-01-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-01-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-01-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2025-01-30', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2025-01-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2025-01-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-01-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-01-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-01-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2025-01-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-02-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-02-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-02-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-02-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-02-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2025-02-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2025-02-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2025-02-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-02-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-02-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2025-02-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-02-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-02-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-02-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-02-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-02-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-02-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2025-02-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-02-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2025-02-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-02-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-02-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-02-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-02-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-02-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-02-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-02-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-02-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2025-02-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2025-02-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2025-02-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-02-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2025-02-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2025-02-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2025-02-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-02-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-02-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-02-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-02-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-02-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2025-02-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2025-02-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 9, '2025-02-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2025-02-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2025-02-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-02-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 6, '2025-02-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2025-02-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-02-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2025-02-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-02-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-02-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2025-02-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2025-02-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-02-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-02-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-02-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-02-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2025-02-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2025-02-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-02-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2025-02-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-02-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2025-02-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-02-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2025-02-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2025-02-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2025-02-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-02-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-02-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2025-02-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2025-02-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-02-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2025-02-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-02-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-02-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-02-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-02-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-02-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-02-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-02-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-02-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2025-02-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-02-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-02-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-02-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-02-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-02-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-02-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2025-02-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-02-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2025-02-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-02-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-02-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-02-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-02-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-02-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-02-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-02-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2025-02-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2025-02-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2025-02-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2025-02-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-02-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-02-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2025-02-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2025-02-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-02-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-02-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-02-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-02-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-02-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-02-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-02-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-02-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-02-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2025-02-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2025-02-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2025-02-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-02-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-02-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-02-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2025-02-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-02-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 5, '2025-02-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-02-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-02-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2025-02-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 9, '2025-02-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 5, '2025-02-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2025-02-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2025-02-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 6, '2025-02-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2025-02-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 10, '2025-02-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 11, '2025-02-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 7, '2025-02-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2025-02-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 7, '2025-02-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2025-02-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-03-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-03-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-03-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-03-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-03-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 5, '2025-03-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-03-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-03-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-03-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-03-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-03-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-03-03', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2025-03-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2025-03-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2025-03-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-03-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2025-03-04', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2025-03-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2025-03-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2025-03-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-03-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2025-03-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-03-05', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2025-03-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-03-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-03-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-03-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-03-06', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2025-03-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2025-03-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2025-03-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2025-03-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-03-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-03-07', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-03-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-03-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-03-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-03-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-03-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2025-03-08', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2025-03-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-03-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2025-03-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-03-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2025-03-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2025-03-10', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2025-03-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-03-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-03-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2025-03-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 4, '2025-03-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-03-11', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-03-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-03-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-03-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-03-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-03-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-03-12', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 8, '2025-03-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2025-03-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2025-03-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2025-03-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 8, '2025-03-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 7, '2025-03-13', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2025-03-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 4, '2025-03-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-03-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2025-03-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-03-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2025-03-14', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2025-03-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2025-03-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2025-03-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-03-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-03-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-03-15', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 7, '2025-03-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 6, '2025-03-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-03-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 3, '2025-03-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-03-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-03-17', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2025-03-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-03-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2025-03-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-03-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2025-03-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-03-18', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2025-03-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-03-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-03-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-03-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-03-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-03-19', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2025-03-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2025-03-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2025-03-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-03-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2025-03-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-03-20', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 14, '2025-03-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 8, '2025-03-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 6, '2025-03-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2025-03-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 8, '2025-03-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2025-03-21', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2025-03-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-03-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 4, '2025-03-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-03-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-03-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 4, '2025-03-22', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2025-03-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-03-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-03-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-03-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-03-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-03-24', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 3, '2025-03-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-03-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-03-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-03-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2025-03-25', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 5, '2025-03-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-03-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-03-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-03-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-03-26', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2025-03-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 3, '2025-03-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-03-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-03-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 2, '2025-03-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2025-03-27', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 6, '2025-03-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 7, '2025-03-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 3, '2025-03-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 4, '2025-03-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 5, '2025-03-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 3, '2025-03-28', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 2, '2025-03-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-03-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2025-03-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-03-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2025-03-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-03-29', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 4, '2025-03-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 2, '2025-03-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 2, '2025-03-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 2, '2025-03-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 3, '2025-03-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 2, '2025-03-31', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (3, 1, '2025-04-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (2, 1, '2025-04-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (6, 1, '2025-04-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (1, 1, '2025-04-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (5, 1, '2025-04-01', 1);
INSERT INTO sales (product_id, quantity, sale_date, user_id) VALUES (4, 1, '2025-04-01', 1);



-- 予測データ（月曜・木曜のみ）
INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-01', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-01', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-01', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-01', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-01', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-02', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-02', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-02', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-02', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-02', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-03', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-03', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-03', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-03', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-03', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-04', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-04', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-04', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-04', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-04', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-05', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-05', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-05', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-05', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-05', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-06', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-06', 8, 18, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-06', 11, 21, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-06', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-06', 7, 17, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-08', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-08', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-08', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-08', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-08', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-09', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-09', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-09', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-09', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-09', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-10', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-10', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-10', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-10', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-10', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-11', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-11', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-11', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-11', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-11', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-12', 6, 16, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-12', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-12', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-12', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-12', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-13', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-13', 8, 18, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-13', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-13', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-13', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-15', 6, 16, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-15', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-15', 10, 20, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-15', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-15', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-16', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-16', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-16', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-16', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-16', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-17', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-17', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-17', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-17', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-17', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-18', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-18', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-18', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-18', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-18', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-19', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-19', 9, 19, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-19', 9, 19, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-19', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-19', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-20', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-20', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-20', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-20', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-20', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-22', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-22', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-22', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-22', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-22', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-23', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-23', 8, 18, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-23', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-23', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-23', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-24', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-24', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-24', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-24', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-24', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-25', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-25', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-25', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-25', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-25', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-26', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-26', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-26', 10, 20, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-26', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-26', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-27', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-27', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-27', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-27', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-27', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-29', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-29', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-29', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-29', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-29', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-30', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-30', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-30', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-30', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-04-30', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-01', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-01', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-01', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-01', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-01', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-02', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-02', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-02', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-02', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-02', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-03', 7, 17, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-03', 12, 22, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-03', 9, 19, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-03', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-03', 7, 17, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-04', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-04', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-04', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-04', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-04', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-06', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-06', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-06', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-06', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-06', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-07', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-07', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-07', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-07', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-07', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-08', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-08', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-08', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-08', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-08', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-09', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-09', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-09', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-09', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-09', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-10', 7, 17, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-10', 10, 20, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-10', 10, 20, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-10', 7, 17, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-10', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-11', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-11', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-11', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-11', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-11', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-13', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-13', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-13', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-13', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-13', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-14', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-14', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-14', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-14', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-14', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-15', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-15', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-15', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-15', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-15', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-16', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-16', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-16', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-16', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-16', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-17', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-17', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-17', 10, 20, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-17', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-17', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-18', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-18', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-18', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-18', 9, 19, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-18', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-20', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-20', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-20', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-20', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-20', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-21', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-21', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-21', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-21', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-21', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-22', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-22', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-22', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-22', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-22', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-23', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-23', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-23', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-23', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-23', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-24', 6, 16, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-24', 9, 19, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-24', 10, 20, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-24', 10, 20, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-24', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-25', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-25', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-25', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-25', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-25', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-27', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-27', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-27', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-27', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-27', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-28', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-28', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-28', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-28', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-28', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-29', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-29', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-29', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-29', 6, 16, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-29', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-30', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-30', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-30', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-30', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-30', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-31', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-31', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-31', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-31', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-05-31', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-01', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-01', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-01', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-01', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-01', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-03', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-03', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-03', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-03', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-03', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-04', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-04', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-04', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-04', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-04', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-05', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-05', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-05', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-05', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-05', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-06', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-06', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-06', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-06', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-06', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-07', 10, 20, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-07', 14, 24, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-07', 20, 30, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-07', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-07', 8, 18, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-08', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-08', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-08', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-08', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-08', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-10', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-10', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-10', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-10', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-10', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-11', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-11', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-11', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-11', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-11', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-12', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-12', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-12', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-12', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-12', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-13', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-13', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-13', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-13', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-13', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-14', 7, 17, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-14', 10, 20, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-14', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-14', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-14', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-15', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-15', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-15', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-15', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-15', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-17', 9, 19, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-17', 10, 20, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-17', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-17', 7, 17, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-17', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-18', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-18', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-18', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-18', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-18', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-19', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-19', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-19', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-19', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-19', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-20', 6, 16, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-20', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-20', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-20', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-20', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-21', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-21', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-21', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-21', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-21', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-22', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-22', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-22', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-22', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-22', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-24', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-24', 8, 18, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-24', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-24', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-24', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-25', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-25', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-25', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-25', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-25', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-26', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-26', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-26', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-26', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-26', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-27', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-27', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-27', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-27', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-27', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-28', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-28', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-28', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-28', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-28', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-29', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-29', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-29', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-29', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-06-29', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-01', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-01', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-01', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-01', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-01', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-02', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-02', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-02', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-02', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-02', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-03', 7, 17, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-03', 10, 20, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-03', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-03', 8, 18, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-03', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-04', 6, 16, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-04', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-04', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-04', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-04', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-05', 14, 24, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-05', 17, 27, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-05', 11, 21, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-05', 7, 17, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-05', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-06', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-06', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-06', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-06', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-06', 0, 10, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-08', 9, 19, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-08', 13, 23, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-08', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-08', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-08', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-09', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-09', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-09', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-09', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-09', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-10', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-10', 9, 19, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-10', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-10', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-10', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-11', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-11', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-11', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-11', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-11', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-12', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-12', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-12', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-12', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-12', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-13', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-13', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-13', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-13', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-13', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-15', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-15', 9, 19, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-15', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-15', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-15', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-16', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-16', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-16', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-16', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-16', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-17', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-17', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-17', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-17', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-17', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-18', 7, 17, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-18', 12, 22, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-18', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-18', 8, 18, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-18', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-19', 6, 16, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-19', 12, 22, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-19', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-19', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-19', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-20', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-20', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-20', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-20', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-20', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-22', 7, 17, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-22', 8, 18, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-22', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-22', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-22', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-23', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-23', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-23', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-23', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-23', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-24', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-24', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-24', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-24', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-24', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-25', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-25', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-25', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-25', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-25', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-26', 12, 22, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-26', 15, 25, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-26', 10, 20, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-26', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-26', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-27', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-27', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-27', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-27', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-27', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-29', 6, 16, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-29', 8, 18, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-29', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-29', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-29', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-30', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-30', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-30', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-30', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-30', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-31', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-31', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-31', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-31', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-07-31', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-01', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-01', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-01', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-01', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-01', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-02', 8, 18, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-02', 17, 27, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-02', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-02', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-02', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-03', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-03', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-03', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-03', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-03', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-05', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-05', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-05', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-05', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-05', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-06', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-06', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-06', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-06', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-06', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-07', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-07', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-07', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-07', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-07', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-08', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-08', 9, 19, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-08', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-08', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-08', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-09', 7, 17, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-09', 12, 22, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-09', 9, 19, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-09', 6, 16, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-09', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-10', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-10', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-10', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-10', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-10', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-12', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-12', 8, 18, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-12', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-12', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-12', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-13', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-13', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-13', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-13', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-13', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-14', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-14', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-14', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-14', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-14', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-15', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-15', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-15', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-15', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-15', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-16', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-16', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-16', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-16', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-16', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-17', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-17', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-17', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-17', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-17', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-19', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-19', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-19', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-19', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-19', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-20', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-20', 10, 20, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-20', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-20', 6, 16, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-20', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-21', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-21', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-21', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-21', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-21', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-22', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-22', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-22', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-22', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-22', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-23', 8, 18, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-23', 12, 22, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-23', 12, 22, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-23', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-23', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-24', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-24', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-24', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-24', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-24', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-26', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-26', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-26', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-26', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-26', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-27', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-27', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-27', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-27', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-27', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-28', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-28', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-28', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-28', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-28', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-29', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-29', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-29', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-29', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-29', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-30', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-30', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-30', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-30', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-30', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-31', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-31', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-31', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-31', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-08-31', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-02', 6, 16, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-02', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-02', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-02', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-02', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-03', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-03', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-03', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-03', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-03', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-04', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-04', 9, 19, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-04', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-04', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-04', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-05', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-05', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-05', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-05', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-05', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-06', 10, 20, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-06', 13, 23, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-06', 12, 22, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-06', 9, 19, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-06', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-07', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-07', 10, 20, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-07', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-07', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-07', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-09', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-09', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-09', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-09', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-09', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-10', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-10', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-10', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-10', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-10', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-11', 6, 16, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-11', 8, 18, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-11', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-11', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-11', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-12', 7, 17, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-12', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-12', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-12', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-12', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-13', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-13', 10, 20, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-13', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-13', 6, 16, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-13', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-14', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-14', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-14', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-14', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-14', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-16', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-16', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-16', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-16', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-16', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-17', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-17', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-17', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-17', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-17', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-18', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-18', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-18', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-18', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-18', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-19', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-19', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-19', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-19', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-19', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-20', 7, 17, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-20', 10, 20, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-20', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-20', 6, 16, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-20', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-21', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-21', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-21', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-21', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-21', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-23', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-23', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-23', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-23', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-23', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-24', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-24', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-24', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-24', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-24', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-25', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-25', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-25', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-25', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-25', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-26', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-26', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-26', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-26', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-26', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-27', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-27', 8, 18, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-27', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-27', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-27', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-28', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-28', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-28', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-28', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-28', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-30', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-30', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-30', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-30', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-09-30', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-01', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-01', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-01', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-01', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-01', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-02', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-02', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-02', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-02', 7, 17, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-02', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-03', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-03', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-03', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-03', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-03', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-04', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-04', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-04', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-04', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-04', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-05', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-05', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-05', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-05', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-05', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-07', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-07', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-07', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-07', 7, 17, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-07', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-08', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-08', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-08', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-08', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-08', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-09', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-09', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-09', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-09', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-09', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-10', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-10', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-10', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-10', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-10', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-11', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-11', 8, 18, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-11', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-11', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-11', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-12', 6, 16, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-12', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-12', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-12', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-12', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-14', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-14', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-14', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-14', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-14', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-15', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-15', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-15', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-15', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-15', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-16', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-16', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-16', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-16', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-16', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-17', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-17', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-17', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-17', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-17', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-18', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-18', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-18', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-18', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-18', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-19', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-19', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-19', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-19', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-19', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-21', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-21', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-21', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-21', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-21', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-22', 6, 16, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-22', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-22', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-22', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-22', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-23', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-23', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-23', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-23', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-23', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-24', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-24', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-24', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-24', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-24', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-25', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-25', 10, 20, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-25', 9, 19, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-25', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-25', 7, 17, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-26', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-26', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-26', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-26', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-26', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-28', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-28', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-28', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-28', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-28', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-29', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-29', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-29', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-29', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-29', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-30', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-30', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-30', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-30', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-30', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-31', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-31', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-31', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-31', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-10-31', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-01', 8, 18, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-01', 14, 24, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-01', 11, 21, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-01', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-01', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-02', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-02', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-02', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-02', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-02', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-04', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-04', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-04', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-04', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-04', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-05', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-05', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-05', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-05', 6, 16, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-05', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-06', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-06', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-06', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-06', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-06', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-07', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-07', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-07', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-07', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-07', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-08', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-08', 8, 18, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-08', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-08', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-08', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-09', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-09', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-09', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-09', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-09', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-11', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-11', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-11', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-11', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-11', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-12', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-12', 9, 19, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-12', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-12', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-12', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-13', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-13', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-13', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-13', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-13', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-14', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-14', 8, 18, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-14', 9, 19, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-14', 7, 17, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-14', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-15', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-15', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-15', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-15', 6, 16, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-15', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-16', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-16', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-16', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-16', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-16', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-18', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-18', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-18', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-18', 6, 16, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-18', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-19', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-19', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-19', 9, 19, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-19', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-19', 7, 17, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-20', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-20', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-20', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-20', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-20', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-21', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-21', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-21', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-21', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-21', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-22', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-22', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-22', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-22', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-22', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-23', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-23', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-23', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-23', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-23', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-25', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-25', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-25', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-25', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-25', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-26', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-26', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-26', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-26', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-26', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-27', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-27', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-27', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-27', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-27', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-28', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-28', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-28', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-28', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-28', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-29', 7, 17, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-29', 9, 19, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-29', 13, 23, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-29', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-29', 11, 21, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-30', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-30', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-30', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-30', 6, 16, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-11-30', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-02', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-02', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-02', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-02', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-02', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-03', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-03', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-03', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-03', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-03', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-04', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-04', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-04', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-04', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-04', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-05', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-05', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-05', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-05', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-05', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-06', 7, 17, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-06', 11, 21, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-06', 10, 20, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-06', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-06', 9, 19, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-07', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-07', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-07', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-07', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-07', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-09', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-09', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-09', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-09', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-09', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-10', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-10', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-10', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-10', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-10', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-11', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-11', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-11', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-11', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-11', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-12', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-12', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-12', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-12', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-12', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-13', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-13', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-13', 9, 19, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-13', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-13', 7, 17, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-14', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-14', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-14', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-14', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-14', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-16', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-16', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-16', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-16', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-16', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-17', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-17', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-17', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-17', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-17', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-18', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-18', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-18', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-18', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-18', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-19', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-19', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-19', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-19', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-19', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-20', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-20', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-20', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-20', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-20', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-21', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-21', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-21', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-21', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-21', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-23', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-23', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-23', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-23', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-23', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-24', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-24', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-24', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-24', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-24', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-25', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-25', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-25', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-25', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-25', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-26', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-26', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-26', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-26', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-26', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-27', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-27', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-27', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-27', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-27', 8, 18, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-28', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-28', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-28', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-28', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-28', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-30', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-30', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-30', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-30', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-30', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-31', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-31', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-31', 11, 21, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-31', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2024-12-31', 7, 17, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-01', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-01', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-01', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-01', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-01', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-02', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-02', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-02', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-02', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-02', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-03', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-03', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-03', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-03', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-03', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-04', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-04', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-04', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-04', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-04', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-06', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-06', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-06', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-06', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-06', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-07', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-07', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-07', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-07', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-07', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-08', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-08', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-08', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-08', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-08', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-09', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-09', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-09', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-09', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-09', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-10', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-10', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-10', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-10', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-10', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-11', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-11', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-11', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-11', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-11', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-13', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-13', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-13', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-13', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-13', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-14', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-14', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-14', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-14', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-14', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-15', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-15', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-15', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-15', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-15', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-16', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-16', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-16', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-16', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-16', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-17', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-17', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-17', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-17', 6, 16, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-17', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-18', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-18', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-18', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-18', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-18', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-20', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-20', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-20', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-20', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-20', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-21', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-21', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-21', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-21', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-21', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-22', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-22', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-22', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-22', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-22', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-23', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-23', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-23', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-23', 6, 16, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-23', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-24', 5, 15, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-24', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-24', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-24', 6, 16, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-24', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-25', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-25', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-25', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-25', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-25', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-27', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-27', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-27', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-27', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-27', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-28', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-28', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-28', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-28', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-28', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-29', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-29', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-29', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-29', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-29', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-30', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-30', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-30', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-30', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-30', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-31', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-31', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-31', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-31', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-01-31', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-01', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-01', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-01', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-01', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-01', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-03', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-03', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-03', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-03', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-03', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-04', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-04', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-04', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-04', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-04', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-05', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-05', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-05', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-05', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-05', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-06', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-06', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-06', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-06', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-06', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-07', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-07', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-07', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-07', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-07', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-08', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-08', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-08', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-08', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-08', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-10', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-10', 9, 19, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-10', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-10', 6, 16, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-10', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-11', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-11', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-11', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-11', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-11', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-12', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-12', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-12', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-12', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-12', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-13', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-13', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-13', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-13', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-13', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-14', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-14', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-14', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-14', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-14', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-15', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-15', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-15', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-15', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-15', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-17', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-17', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-17', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-17', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-17', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-18', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-18', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-18', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-18', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-18', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-19', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-19', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-19', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-19', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-19', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-20', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-20', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-20', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-20', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-20', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-21', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-21', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-21', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-21', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-21', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-22', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-22', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-22', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-22', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-22', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-24', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-24', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-24', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-24', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-24', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-25', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-25', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-25', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-25', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-25', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-26', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-26', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-26', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-26', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-26', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-27', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-27', 5, 15, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-27', 9, 19, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-27', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-27', 6, 16, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-28', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-28', 11, 21, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-28', 10, 20, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-28', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-02-28', 7, 17, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-01', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-01', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-01', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-01', 5, 15, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-01', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-03', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-03', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-03', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-03', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-03', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-04', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-04', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-04', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-04', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-04', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-05', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-05', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-05', 1, 11, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-05', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-05', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-06', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-06', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-06', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-06', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-06', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-07', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-07', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-07', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-07', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-07', 3, 13, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-08', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-08', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-08', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-08', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-08', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-10', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-10', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-10', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-10', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-10', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-11', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-11', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-11', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-11', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-11', 4, 14, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-12', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-12', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-12', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-12', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-12', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-13', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-13', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-13', 8, 18, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-13', 7, 17, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-13', 8, 18, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-14', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-14', 4, 14, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-14', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-14', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-14', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-15', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-15', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-15', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-15', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-15', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-17', 3, 13, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-17', 6, 16, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-17', 7, 17, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-17', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-17', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-18', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-18', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-18', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-18', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-18', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-19', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-19', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-19', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-19', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-19', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-20', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-20', 1, 11, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-20', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-20', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-20', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-21', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-21', 8, 18, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-21', 14, 24, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-21', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-21', 8, 18, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-22', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-22', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-22', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-22', 4, 14, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-22', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-24', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-24', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-24', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-24', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-24', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-25', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-25', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-25', 3, 13, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-25', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-25', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-26', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-26', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-26', 5, 15, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-26', 0, 10, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-26', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-27', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-27', 3, 13, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-27', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-27', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-27', 2, 12, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-28', 4, 14, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-28', 7, 17, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-28', 6, 16, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-28', 3, 13, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-28', 5, 15, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-29', 1, 11, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-29', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-29', 2, 12, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-29', 1, 11, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-29', 1, 11, 5);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-31', 2, 12, 1);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-31', 2, 12, 2);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-31', 4, 14, 3);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-31', 2, 12, 4);




INSERT INTO forecast (forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES('2025-03-31', 3, 13, 5);
