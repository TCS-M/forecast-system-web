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

INSERT INTO products (product_id, name, price, jan_code, production_date, expiration_date, stock_quantity)
SELECT 6, 'IPA', 1100, '4922222222221', CURRENT_DATE, CURRENT_DATE + INTERVAL '15 days', 70
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_id = 6);

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


-- 予測データ（月曜・木曜のみ）
INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1, '2024-04-01', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (2, '2024-04-01', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (3, '2024-04-01', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (4, '2024-04-01', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (5, '2024-04-01', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (6, '2024-04-02', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (7, '2024-04-02', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (8, '2024-04-02', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (9, '2024-04-02', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (10, '2024-04-02', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (11, '2024-04-03', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (12, '2024-04-03', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (13, '2024-04-03', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (14, '2024-04-03', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (15, '2024-04-03', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (16, '2024-04-04', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (17, '2024-04-04', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (18, '2024-04-04', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (19, '2024-04-04', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (20, '2024-04-04', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (21, '2024-04-05', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (22, '2024-04-05', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (23, '2024-04-05', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (24, '2024-04-05', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (25, '2024-04-05', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (26, '2024-04-06', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (27, '2024-04-06', 8, 18, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (28, '2024-04-06', 11, 21, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (29, '2024-04-06', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (30, '2024-04-06', 7, 17, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (31, '2024-04-08', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (32, '2024-04-08', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (33, '2024-04-08', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (34, '2024-04-08', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (35, '2024-04-08', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (36, '2024-04-09', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (37, '2024-04-09', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (38, '2024-04-09', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (39, '2024-04-09', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (40, '2024-04-09', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (41, '2024-04-10', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (42, '2024-04-10', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (43, '2024-04-10', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (44, '2024-04-10', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (45, '2024-04-10', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (46, '2024-04-11', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (47, '2024-04-11', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (48, '2024-04-11', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (49, '2024-04-11', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (50, '2024-04-11', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (51, '2024-04-12', 6, 16, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (52, '2024-04-12', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (53, '2024-04-12', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (54, '2024-04-12', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (55, '2024-04-12', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (56, '2024-04-13', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (57, '2024-04-13', 8, 18, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (58, '2024-04-13', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (59, '2024-04-13', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (60, '2024-04-13', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (61, '2024-04-15', 6, 16, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (62, '2024-04-15', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (63, '2024-04-15', 10, 20, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (64, '2024-04-15', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (65, '2024-04-15', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (66, '2024-04-16', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (67, '2024-04-16', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (68, '2024-04-16', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (69, '2024-04-16', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (70, '2024-04-16', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (71, '2024-04-17', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (72, '2024-04-17', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (73, '2024-04-17', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (74, '2024-04-17', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (75, '2024-04-17', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (76, '2024-04-18', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (77, '2024-04-18', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (78, '2024-04-18', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (79, '2024-04-18', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (80, '2024-04-18', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (81, '2024-04-19', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (82, '2024-04-19', 9, 19, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (83, '2024-04-19', 9, 19, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (84, '2024-04-19', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (85, '2024-04-19', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (86, '2024-04-20', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (87, '2024-04-20', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (88, '2024-04-20', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (89, '2024-04-20', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (90, '2024-04-20', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (91, '2024-04-22', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (92, '2024-04-22', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (93, '2024-04-22', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (94, '2024-04-22', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (95, '2024-04-22', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (96, '2024-04-23', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (97, '2024-04-23', 8, 18, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (98, '2024-04-23', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (99, '2024-04-23', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (100, '2024-04-23', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (101, '2024-04-24', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (102, '2024-04-24', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (103, '2024-04-24', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (104, '2024-04-24', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (105, '2024-04-24', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (106, '2024-04-25', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (107, '2024-04-25', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (108, '2024-04-25', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (109, '2024-04-25', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (110, '2024-04-25', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (111, '2024-04-26', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (112, '2024-04-26', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (113, '2024-04-26', 10, 20, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (114, '2024-04-26', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (115, '2024-04-26', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (116, '2024-04-27', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (117, '2024-04-27', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (118, '2024-04-27', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (119, '2024-04-27', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (120, '2024-04-27', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (121, '2024-04-29', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (122, '2024-04-29', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (123, '2024-04-29', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (124, '2024-04-29', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (125, '2024-04-29', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (126, '2024-04-30', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (127, '2024-04-30', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (128, '2024-04-30', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (129, '2024-04-30', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (130, '2024-04-30', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (131, '2024-05-01', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (132, '2024-05-01', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (133, '2024-05-01', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (134, '2024-05-01', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (135, '2024-05-01', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (136, '2024-05-02', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (137, '2024-05-02', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (138, '2024-05-02', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (139, '2024-05-02', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (140, '2024-05-02', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (141, '2024-05-03', 7, 17, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (142, '2024-05-03', 12, 22, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (143, '2024-05-03', 9, 19, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (144, '2024-05-03', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (145, '2024-05-03', 7, 17, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (146, '2024-05-04', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (147, '2024-05-04', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (148, '2024-05-04', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (149, '2024-05-04', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (150, '2024-05-04', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (151, '2024-05-06', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (152, '2024-05-06', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (153, '2024-05-06', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (154, '2024-05-06', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (155, '2024-05-06', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (156, '2024-05-07', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (157, '2024-05-07', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (158, '2024-05-07', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (159, '2024-05-07', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (160, '2024-05-07', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (161, '2024-05-08', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (162, '2024-05-08', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (163, '2024-05-08', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (164, '2024-05-08', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (165, '2024-05-08', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (166, '2024-05-09', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (167, '2024-05-09', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (168, '2024-05-09', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (169, '2024-05-09', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (170, '2024-05-09', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (171, '2024-05-10', 7, 17, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (172, '2024-05-10', 10, 20, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (173, '2024-05-10', 10, 20, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (174, '2024-05-10', 7, 17, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (175, '2024-05-10', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (176, '2024-05-11', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (177, '2024-05-11', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (178, '2024-05-11', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (179, '2024-05-11', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (180, '2024-05-11', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (181, '2024-05-13', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (182, '2024-05-13', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (183, '2024-05-13', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (184, '2024-05-13', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (185, '2024-05-13', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (186, '2024-05-14', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (187, '2024-05-14', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (188, '2024-05-14', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (189, '2024-05-14', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (190, '2024-05-14', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (191, '2024-05-15', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (192, '2024-05-15', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (193, '2024-05-15', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (194, '2024-05-15', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (195, '2024-05-15', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (196, '2024-05-16', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (197, '2024-05-16', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (198, '2024-05-16', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (199, '2024-05-16', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (200, '2024-05-16', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (201, '2024-05-17', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (202, '2024-05-17', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (203, '2024-05-17', 10, 20, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (204, '2024-05-17', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (205, '2024-05-17', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (206, '2024-05-18', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (207, '2024-05-18', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (208, '2024-05-18', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (209, '2024-05-18', 9, 19, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (210, '2024-05-18', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (211, '2024-05-20', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (212, '2024-05-20', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (213, '2024-05-20', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (214, '2024-05-20', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (215, '2024-05-20', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (216, '2024-05-21', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (217, '2024-05-21', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (218, '2024-05-21', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (219, '2024-05-21', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (220, '2024-05-21', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (221, '2024-05-22', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (222, '2024-05-22', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (223, '2024-05-22', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (224, '2024-05-22', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (225, '2024-05-22', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (226, '2024-05-23', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (227, '2024-05-23', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (228, '2024-05-23', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (229, '2024-05-23', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (230, '2024-05-23', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (231, '2024-05-24', 6, 16, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (232, '2024-05-24', 9, 19, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (233, '2024-05-24', 10, 20, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (234, '2024-05-24', 10, 20, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (235, '2024-05-24', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (236, '2024-05-25', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (237, '2024-05-25', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (238, '2024-05-25', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (239, '2024-05-25', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (240, '2024-05-25', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (241, '2024-05-27', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (242, '2024-05-27', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (243, '2024-05-27', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (244, '2024-05-27', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (245, '2024-05-27', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (246, '2024-05-28', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (247, '2024-05-28', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (248, '2024-05-28', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (249, '2024-05-28', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (250, '2024-05-28', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (251, '2024-05-29', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (252, '2024-05-29', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (253, '2024-05-29', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (254, '2024-05-29', 6, 16, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (255, '2024-05-29', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (256, '2024-05-30', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (257, '2024-05-30', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (258, '2024-05-30', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (259, '2024-05-30', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (260, '2024-05-30', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (261, '2024-05-31', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (262, '2024-05-31', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (263, '2024-05-31', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (264, '2024-05-31', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (265, '2024-05-31', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (266, '2024-06-01', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (267, '2024-06-01', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (268, '2024-06-01', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (269, '2024-06-01', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (270, '2024-06-01', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (271, '2024-06-03', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (272, '2024-06-03', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (273, '2024-06-03', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (274, '2024-06-03', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (275, '2024-06-03', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (276, '2024-06-04', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (277, '2024-06-04', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (278, '2024-06-04', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (279, '2024-06-04', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (280, '2024-06-04', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (281, '2024-06-05', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (282, '2024-06-05', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (283, '2024-06-05', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (284, '2024-06-05', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (285, '2024-06-05', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (286, '2024-06-06', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (287, '2024-06-06', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (288, '2024-06-06', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (289, '2024-06-06', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (290, '2024-06-06', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (291, '2024-06-07', 10, 20, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (292, '2024-06-07', 14, 24, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (293, '2024-06-07', 20, 30, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (294, '2024-06-07', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (295, '2024-06-07', 8, 18, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (296, '2024-06-08', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (297, '2024-06-08', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (298, '2024-06-08', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (299, '2024-06-08', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (300, '2024-06-08', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (301, '2024-06-10', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (302, '2024-06-10', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (303, '2024-06-10', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (304, '2024-06-10', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (305, '2024-06-10', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (306, '2024-06-11', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (307, '2024-06-11', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (308, '2024-06-11', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (309, '2024-06-11', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (310, '2024-06-11', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (311, '2024-06-12', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (312, '2024-06-12', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (313, '2024-06-12', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (314, '2024-06-12', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (315, '2024-06-12', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (316, '2024-06-13', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (317, '2024-06-13', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (318, '2024-06-13', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (319, '2024-06-13', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (320, '2024-06-13', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (321, '2024-06-14', 7, 17, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (322, '2024-06-14', 10, 20, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (323, '2024-06-14', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (324, '2024-06-14', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (325, '2024-06-14', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (326, '2024-06-15', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (327, '2024-06-15', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (328, '2024-06-15', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (329, '2024-06-15', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (330, '2024-06-15', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (331, '2024-06-17', 9, 19, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (332, '2024-06-17', 10, 20, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (333, '2024-06-17', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (334, '2024-06-17', 7, 17, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (335, '2024-06-17', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (336, '2024-06-18', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (337, '2024-06-18', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (338, '2024-06-18', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (339, '2024-06-18', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (340, '2024-06-18', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (341, '2024-06-19', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (342, '2024-06-19', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (343, '2024-06-19', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (344, '2024-06-19', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (345, '2024-06-19', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (346, '2024-06-20', 6, 16, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (347, '2024-06-20', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (348, '2024-06-20', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (349, '2024-06-20', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (350, '2024-06-20', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (351, '2024-06-21', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (352, '2024-06-21', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (353, '2024-06-21', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (354, '2024-06-21', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (355, '2024-06-21', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (356, '2024-06-22', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (357, '2024-06-22', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (358, '2024-06-22', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (359, '2024-06-22', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (360, '2024-06-22', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (361, '2024-06-24', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (362, '2024-06-24', 8, 18, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (363, '2024-06-24', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (364, '2024-06-24', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (365, '2024-06-24', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (366, '2024-06-25', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (367, '2024-06-25', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (368, '2024-06-25', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (369, '2024-06-25', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (370, '2024-06-25', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (371, '2024-06-26', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (372, '2024-06-26', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (373, '2024-06-26', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (374, '2024-06-26', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (375, '2024-06-26', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (376, '2024-06-27', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (377, '2024-06-27', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (378, '2024-06-27', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (379, '2024-06-27', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (380, '2024-06-27', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (381, '2024-06-28', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (382, '2024-06-28', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (383, '2024-06-28', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (384, '2024-06-28', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (385, '2024-06-28', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (386, '2024-06-29', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (387, '2024-06-29', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (388, '2024-06-29', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (389, '2024-06-29', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (390, '2024-06-29', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (391, '2024-07-01', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (392, '2024-07-01', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (393, '2024-07-01', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (394, '2024-07-01', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (395, '2024-07-01', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (396, '2024-07-02', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (397, '2024-07-02', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (398, '2024-07-02', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (399, '2024-07-02', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (400, '2024-07-02', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (401, '2024-07-03', 7, 17, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (402, '2024-07-03', 10, 20, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (403, '2024-07-03', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (404, '2024-07-03', 8, 18, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (405, '2024-07-03', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (406, '2024-07-04', 6, 16, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (407, '2024-07-04', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (408, '2024-07-04', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (409, '2024-07-04', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (410, '2024-07-04', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (411, '2024-07-05', 14, 24, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (412, '2024-07-05', 17, 27, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (413, '2024-07-05', 11, 21, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (414, '2024-07-05', 7, 17, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (415, '2024-07-05', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (416, '2024-07-06', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (417, '2024-07-06', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (418, '2024-07-06', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (419, '2024-07-06', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (420, '2024-07-06', 0, 10, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (421, '2024-07-08', 9, 19, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (422, '2024-07-08', 13, 23, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (423, '2024-07-08', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (424, '2024-07-08', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (425, '2024-07-08', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (426, '2024-07-09', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (427, '2024-07-09', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (428, '2024-07-09', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (429, '2024-07-09', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (430, '2024-07-09', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (431, '2024-07-10', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (432, '2024-07-10', 9, 19, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (433, '2024-07-10', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (434, '2024-07-10', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (435, '2024-07-10', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (436, '2024-07-11', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (437, '2024-07-11', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (438, '2024-07-11', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (439, '2024-07-11', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (440, '2024-07-11', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (441, '2024-07-12', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (442, '2024-07-12', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (443, '2024-07-12', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (444, '2024-07-12', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (445, '2024-07-12', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (446, '2024-07-13', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (447, '2024-07-13', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (448, '2024-07-13', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (449, '2024-07-13', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (450, '2024-07-13', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (451, '2024-07-15', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (452, '2024-07-15', 9, 19, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (453, '2024-07-15', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (454, '2024-07-15', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (455, '2024-07-15', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (456, '2024-07-16', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (457, '2024-07-16', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (458, '2024-07-16', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (459, '2024-07-16', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (460, '2024-07-16', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (461, '2024-07-17', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (462, '2024-07-17', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (463, '2024-07-17', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (464, '2024-07-17', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (465, '2024-07-17', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (466, '2024-07-18', 7, 17, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (467, '2024-07-18', 12, 22, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (468, '2024-07-18', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (469, '2024-07-18', 8, 18, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (470, '2024-07-18', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (471, '2024-07-19', 6, 16, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (472, '2024-07-19', 12, 22, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (473, '2024-07-19', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (474, '2024-07-19', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (475, '2024-07-19', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (476, '2024-07-20', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (477, '2024-07-20', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (478, '2024-07-20', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (479, '2024-07-20', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (480, '2024-07-20', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (481, '2024-07-22', 7, 17, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (482, '2024-07-22', 8, 18, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (483, '2024-07-22', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (484, '2024-07-22', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (485, '2024-07-22', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (486, '2024-07-23', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (487, '2024-07-23', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (488, '2024-07-23', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (489, '2024-07-23', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (490, '2024-07-23', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (491, '2024-07-24', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (492, '2024-07-24', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (493, '2024-07-24', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (494, '2024-07-24', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (495, '2024-07-24', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (496, '2024-07-25', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (497, '2024-07-25', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (498, '2024-07-25', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (499, '2024-07-25', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (500, '2024-07-25', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (501, '2024-07-26', 12, 22, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (502, '2024-07-26', 15, 25, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (503, '2024-07-26', 10, 20, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (504, '2024-07-26', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (505, '2024-07-26', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (506, '2024-07-27', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (507, '2024-07-27', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (508, '2024-07-27', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (509, '2024-07-27', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (510, '2024-07-27', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (511, '2024-07-29', 6, 16, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (512, '2024-07-29', 8, 18, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (513, '2024-07-29', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (514, '2024-07-29', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (515, '2024-07-29', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (516, '2024-07-30', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (517, '2024-07-30', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (518, '2024-07-30', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (519, '2024-07-30', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (520, '2024-07-30', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (521, '2024-07-31', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (522, '2024-07-31', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (523, '2024-07-31', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (524, '2024-07-31', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (525, '2024-07-31', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (526, '2024-08-01', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (527, '2024-08-01', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (528, '2024-08-01', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (529, '2024-08-01', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (530, '2024-08-01', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (531, '2024-08-02', 8, 18, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (532, '2024-08-02', 17, 27, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (533, '2024-08-02', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (534, '2024-08-02', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (535, '2024-08-02', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (536, '2024-08-03', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (537, '2024-08-03', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (538, '2024-08-03', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (539, '2024-08-03', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (540, '2024-08-03', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (541, '2024-08-05', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (542, '2024-08-05', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (543, '2024-08-05', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (544, '2024-08-05', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (545, '2024-08-05', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (546, '2024-08-06', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (547, '2024-08-06', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (548, '2024-08-06', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (549, '2024-08-06', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (550, '2024-08-06', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (551, '2024-08-07', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (552, '2024-08-07', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (553, '2024-08-07', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (554, '2024-08-07', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (555, '2024-08-07', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (556, '2024-08-08', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (557, '2024-08-08', 9, 19, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (558, '2024-08-08', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (559, '2024-08-08', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (560, '2024-08-08', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (561, '2024-08-09', 7, 17, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (562, '2024-08-09', 12, 22, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (563, '2024-08-09', 9, 19, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (564, '2024-08-09', 6, 16, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (565, '2024-08-09', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (566, '2024-08-10', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (567, '2024-08-10', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (568, '2024-08-10', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (569, '2024-08-10', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (570, '2024-08-10', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (571, '2024-08-12', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (572, '2024-08-12', 8, 18, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (573, '2024-08-12', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (574, '2024-08-12', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (575, '2024-08-12', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (576, '2024-08-13', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (577, '2024-08-13', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (578, '2024-08-13', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (579, '2024-08-13', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (580, '2024-08-13', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (581, '2024-08-14', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (582, '2024-08-14', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (583, '2024-08-14', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (584, '2024-08-14', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (585, '2024-08-14', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (586, '2024-08-15', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (587, '2024-08-15', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (588, '2024-08-15', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (589, '2024-08-15', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (590, '2024-08-15', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (591, '2024-08-16', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (592, '2024-08-16', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (593, '2024-08-16', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (594, '2024-08-16', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (595, '2024-08-16', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (596, '2024-08-17', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (597, '2024-08-17', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (598, '2024-08-17', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (599, '2024-08-17', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (600, '2024-08-17', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (601, '2024-08-19', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (602, '2024-08-19', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (603, '2024-08-19', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (604, '2024-08-19', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (605, '2024-08-19', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (606, '2024-08-20', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (607, '2024-08-20', 10, 20, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (608, '2024-08-20', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (609, '2024-08-20', 6, 16, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (610, '2024-08-20', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (611, '2024-08-21', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (612, '2024-08-21', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (613, '2024-08-21', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (614, '2024-08-21', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (615, '2024-08-21', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (616, '2024-08-22', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (617, '2024-08-22', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (618, '2024-08-22', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (619, '2024-08-22', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (620, '2024-08-22', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (621, '2024-08-23', 8, 18, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (622, '2024-08-23', 12, 22, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (623, '2024-08-23', 12, 22, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (624, '2024-08-23', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (625, '2024-08-23', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (626, '2024-08-24', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (627, '2024-08-24', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (628, '2024-08-24', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (629, '2024-08-24', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (630, '2024-08-24', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (631, '2024-08-26', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (632, '2024-08-26', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (633, '2024-08-26', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (634, '2024-08-26', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (635, '2024-08-26', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (636, '2024-08-27', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (637, '2024-08-27', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (638, '2024-08-27', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (639, '2024-08-27', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (640, '2024-08-27', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (641, '2024-08-28', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (642, '2024-08-28', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (643, '2024-08-28', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (644, '2024-08-28', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (645, '2024-08-28', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (646, '2024-08-29', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (647, '2024-08-29', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (648, '2024-08-29', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (649, '2024-08-29', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (650, '2024-08-29', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (651, '2024-08-30', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (652, '2024-08-30', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (653, '2024-08-30', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (654, '2024-08-30', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (655, '2024-08-30', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (656, '2024-08-31', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (657, '2024-08-31', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (658, '2024-08-31', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (659, '2024-08-31', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (660, '2024-08-31', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (661, '2024-09-02', 6, 16, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (662, '2024-09-02', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (663, '2024-09-02', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (664, '2024-09-02', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (665, '2024-09-02', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (666, '2024-09-03', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (667, '2024-09-03', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (668, '2024-09-03', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (669, '2024-09-03', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (670, '2024-09-03', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (671, '2024-09-04', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (672, '2024-09-04', 9, 19, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (673, '2024-09-04', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (674, '2024-09-04', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (675, '2024-09-04', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (676, '2024-09-05', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (677, '2024-09-05', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (678, '2024-09-05', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (679, '2024-09-05', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (680, '2024-09-05', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (681, '2024-09-06', 10, 20, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (682, '2024-09-06', 13, 23, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (683, '2024-09-06', 12, 22, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (684, '2024-09-06', 9, 19, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (685, '2024-09-06', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (686, '2024-09-07', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (687, '2024-09-07', 10, 20, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (688, '2024-09-07', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (689, '2024-09-07', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (690, '2024-09-07', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (691, '2024-09-09', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (692, '2024-09-09', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (693, '2024-09-09', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (694, '2024-09-09', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (695, '2024-09-09', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (696, '2024-09-10', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (697, '2024-09-10', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (698, '2024-09-10', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (699, '2024-09-10', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (700, '2024-09-10', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (701, '2024-09-11', 6, 16, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (702, '2024-09-11', 8, 18, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (703, '2024-09-11', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (704, '2024-09-11', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (705, '2024-09-11', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (706, '2024-09-12', 7, 17, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (707, '2024-09-12', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (708, '2024-09-12', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (709, '2024-09-12', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (710, '2024-09-12', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (711, '2024-09-13', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (712, '2024-09-13', 10, 20, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (713, '2024-09-13', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (714, '2024-09-13', 6, 16, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (715, '2024-09-13', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (716, '2024-09-14', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (717, '2024-09-14', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (718, '2024-09-14', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (719, '2024-09-14', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (720, '2024-09-14', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (721, '2024-09-16', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (722, '2024-09-16', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (723, '2024-09-16', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (724, '2024-09-16', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (725, '2024-09-16', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (726, '2024-09-17', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (727, '2024-09-17', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (728, '2024-09-17', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (729, '2024-09-17', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (730, '2024-09-17', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (731, '2024-09-18', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (732, '2024-09-18', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (733, '2024-09-18', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (734, '2024-09-18', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (735, '2024-09-18', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (736, '2024-09-19', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (737, '2024-09-19', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (738, '2024-09-19', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (739, '2024-09-19', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (740, '2024-09-19', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (741, '2024-09-20', 7, 17, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (742, '2024-09-20', 10, 20, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (743, '2024-09-20', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (744, '2024-09-20', 6, 16, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (745, '2024-09-20', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (746, '2024-09-21', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (747, '2024-09-21', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (748, '2024-09-21', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (749, '2024-09-21', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (750, '2024-09-21', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (751, '2024-09-23', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (752, '2024-09-23', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (753, '2024-09-23', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (754, '2024-09-23', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (755, '2024-09-23', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (756, '2024-09-24', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (757, '2024-09-24', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (758, '2024-09-24', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (759, '2024-09-24', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (760, '2024-09-24', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (761, '2024-09-25', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (762, '2024-09-25', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (763, '2024-09-25', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (764, '2024-09-25', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (765, '2024-09-25', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (766, '2024-09-26', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (767, '2024-09-26', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (768, '2024-09-26', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (769, '2024-09-26', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (770, '2024-09-26', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (771, '2024-09-27', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (772, '2024-09-27', 8, 18, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (773, '2024-09-27', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (774, '2024-09-27', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (775, '2024-09-27', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (776, '2024-09-28', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (777, '2024-09-28', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (778, '2024-09-28', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (779, '2024-09-28', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (780, '2024-09-28', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (781, '2024-09-30', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (782, '2024-09-30', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (783, '2024-09-30', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (784, '2024-09-30', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (785, '2024-09-30', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (786, '2024-10-01', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (787, '2024-10-01', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (788, '2024-10-01', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (789, '2024-10-01', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (790, '2024-10-01', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (791, '2024-10-02', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (792, '2024-10-02', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (793, '2024-10-02', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (794, '2024-10-02', 7, 17, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (795, '2024-10-02', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (796, '2024-10-03', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (797, '2024-10-03', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (798, '2024-10-03', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (799, '2024-10-03', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (800, '2024-10-03', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (801, '2024-10-04', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (802, '2024-10-04', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (803, '2024-10-04', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (804, '2024-10-04', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (805, '2024-10-04', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (806, '2024-10-05', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (807, '2024-10-05', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (808, '2024-10-05', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (809, '2024-10-05', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (810, '2024-10-05', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (811, '2024-10-07', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (812, '2024-10-07', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (813, '2024-10-07', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (814, '2024-10-07', 7, 17, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (815, '2024-10-07', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (816, '2024-10-08', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (817, '2024-10-08', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (818, '2024-10-08', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (819, '2024-10-08', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (820, '2024-10-08', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (821, '2024-10-09', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (822, '2024-10-09', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (823, '2024-10-09', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (824, '2024-10-09', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (825, '2024-10-09', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (826, '2024-10-10', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (827, '2024-10-10', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (828, '2024-10-10', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (829, '2024-10-10', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (830, '2024-10-10', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (831, '2024-10-11', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (832, '2024-10-11', 8, 18, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (833, '2024-10-11', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (834, '2024-10-11', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (835, '2024-10-11', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (836, '2024-10-12', 6, 16, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (837, '2024-10-12', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (838, '2024-10-12', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (839, '2024-10-12', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (840, '2024-10-12', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (841, '2024-10-14', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (842, '2024-10-14', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (843, '2024-10-14', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (844, '2024-10-14', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (845, '2024-10-14', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (846, '2024-10-15', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (847, '2024-10-15', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (848, '2024-10-15', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (849, '2024-10-15', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (850, '2024-10-15', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (851, '2024-10-16', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (852, '2024-10-16', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (853, '2024-10-16', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (854, '2024-10-16', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (855, '2024-10-16', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (856, '2024-10-17', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (857, '2024-10-17', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (858, '2024-10-17', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (859, '2024-10-17', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (860, '2024-10-17', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (861, '2024-10-18', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (862, '2024-10-18', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (863, '2024-10-18', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (864, '2024-10-18', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (865, '2024-10-18', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (866, '2024-10-19', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (867, '2024-10-19', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (868, '2024-10-19', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (869, '2024-10-19', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (870, '2024-10-19', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (871, '2024-10-21', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (872, '2024-10-21', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (873, '2024-10-21', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (874, '2024-10-21', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (875, '2024-10-21', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (876, '2024-10-22', 6, 16, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (877, '2024-10-22', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (878, '2024-10-22', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (879, '2024-10-22', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (880, '2024-10-22', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (881, '2024-10-23', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (882, '2024-10-23', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (883, '2024-10-23', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (884, '2024-10-23', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (885, '2024-10-23', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (886, '2024-10-24', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (887, '2024-10-24', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (888, '2024-10-24', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (889, '2024-10-24', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (890, '2024-10-24', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (891, '2024-10-25', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (892, '2024-10-25', 10, 20, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (893, '2024-10-25', 9, 19, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (894, '2024-10-25', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (895, '2024-10-25', 7, 17, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (896, '2024-10-26', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (897, '2024-10-26', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (898, '2024-10-26', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (899, '2024-10-26', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (900, '2024-10-26', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (901, '2024-10-28', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (902, '2024-10-28', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (903, '2024-10-28', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (904, '2024-10-28', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (905, '2024-10-28', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (906, '2024-10-29', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (907, '2024-10-29', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (908, '2024-10-29', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (909, '2024-10-29', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (910, '2024-10-29', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (911, '2024-10-30', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (912, '2024-10-30', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (913, '2024-10-30', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (914, '2024-10-30', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (915, '2024-10-30', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (916, '2024-10-31', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (917, '2024-10-31', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (918, '2024-10-31', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (919, '2024-10-31', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (920, '2024-10-31', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (921, '2024-11-01', 8, 18, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (922, '2024-11-01', 14, 24, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (923, '2024-11-01', 11, 21, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (924, '2024-11-01', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (925, '2024-11-01', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (926, '2024-11-02', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (927, '2024-11-02', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (928, '2024-11-02', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (929, '2024-11-02', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (930, '2024-11-02', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (931, '2024-11-04', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (932, '2024-11-04', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (933, '2024-11-04', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (934, '2024-11-04', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (935, '2024-11-04', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (936, '2024-11-05', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (937, '2024-11-05', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (938, '2024-11-05', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (939, '2024-11-05', 6, 16, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (940, '2024-11-05', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (941, '2024-11-06', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (942, '2024-11-06', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (943, '2024-11-06', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (944, '2024-11-06', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (945, '2024-11-06', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (946, '2024-11-07', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (947, '2024-11-07', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (948, '2024-11-07', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (949, '2024-11-07', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (950, '2024-11-07', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (951, '2024-11-08', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (952, '2024-11-08', 8, 18, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (953, '2024-11-08', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (954, '2024-11-08', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (955, '2024-11-08', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (956, '2024-11-09', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (957, '2024-11-09', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (958, '2024-11-09', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (959, '2024-11-09', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (960, '2024-11-09', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (961, '2024-11-11', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (962, '2024-11-11', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (963, '2024-11-11', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (964, '2024-11-11', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (965, '2024-11-11', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (966, '2024-11-12', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (967, '2024-11-12', 9, 19, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (968, '2024-11-12', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (969, '2024-11-12', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (970, '2024-11-12', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (971, '2024-11-13', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (972, '2024-11-13', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (973, '2024-11-13', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (974, '2024-11-13', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (975, '2024-11-13', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (976, '2024-11-14', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (977, '2024-11-14', 8, 18, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (978, '2024-11-14', 9, 19, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (979, '2024-11-14', 7, 17, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (980, '2024-11-14', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (981, '2024-11-15', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (982, '2024-11-15', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (983, '2024-11-15', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (984, '2024-11-15', 6, 16, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (985, '2024-11-15', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (986, '2024-11-16', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (987, '2024-11-16', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (988, '2024-11-16', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (989, '2024-11-16', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (990, '2024-11-16', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (991, '2024-11-18', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (992, '2024-11-18', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (993, '2024-11-18', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (994, '2024-11-18', 6, 16, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (995, '2024-11-18', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (996, '2024-11-19', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (997, '2024-11-19', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (998, '2024-11-19', 9, 19, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (999, '2024-11-19', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1000, '2024-11-19', 7, 17, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1001, '2024-11-20', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1002, '2024-11-20', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1003, '2024-11-20', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1004, '2024-11-20', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1005, '2024-11-20', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1006, '2024-11-21', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1007, '2024-11-21', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1008, '2024-11-21', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1009, '2024-11-21', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1010, '2024-11-21', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1011, '2024-11-22', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1012, '2024-11-22', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1013, '2024-11-22', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1014, '2024-11-22', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1015, '2024-11-22', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1016, '2024-11-23', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1017, '2024-11-23', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1018, '2024-11-23', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1019, '2024-11-23', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1020, '2024-11-23', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1021, '2024-11-25', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1022, '2024-11-25', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1023, '2024-11-25', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1024, '2024-11-25', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1025, '2024-11-25', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1026, '2024-11-26', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1027, '2024-11-26', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1028, '2024-11-26', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1029, '2024-11-26', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1030, '2024-11-26', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1031, '2024-11-27', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1032, '2024-11-27', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1033, '2024-11-27', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1034, '2024-11-27', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1035, '2024-11-27', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1036, '2024-11-28', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1037, '2024-11-28', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1038, '2024-11-28', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1039, '2024-11-28', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1040, '2024-11-28', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1041, '2024-11-29', 7, 17, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1042, '2024-11-29', 9, 19, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1043, '2024-11-29', 13, 23, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1044, '2024-11-29', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1045, '2024-11-29', 11, 21, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1046, '2024-11-30', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1047, '2024-11-30', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1048, '2024-11-30', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1049, '2024-11-30', 6, 16, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1050, '2024-11-30', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1051, '2024-12-02', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1052, '2024-12-02', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1053, '2024-12-02', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1054, '2024-12-02', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1055, '2024-12-02', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1056, '2024-12-03', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1057, '2024-12-03', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1058, '2024-12-03', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1059, '2024-12-03', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1060, '2024-12-03', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1061, '2024-12-04', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1062, '2024-12-04', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1063, '2024-12-04', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1064, '2024-12-04', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1065, '2024-12-04', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1066, '2024-12-05', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1067, '2024-12-05', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1068, '2024-12-05', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1069, '2024-12-05', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1070, '2024-12-05', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1071, '2024-12-06', 7, 17, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1072, '2024-12-06', 11, 21, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1073, '2024-12-06', 10, 20, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1074, '2024-12-06', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1075, '2024-12-06', 9, 19, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1076, '2024-12-07', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1077, '2024-12-07', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1078, '2024-12-07', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1079, '2024-12-07', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1080, '2024-12-07', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1081, '2024-12-09', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1082, '2024-12-09', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1083, '2024-12-09', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1084, '2024-12-09', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1085, '2024-12-09', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1086, '2024-12-10', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1087, '2024-12-10', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1088, '2024-12-10', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1089, '2024-12-10', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1090, '2024-12-10', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1091, '2024-12-11', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1092, '2024-12-11', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1093, '2024-12-11', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1094, '2024-12-11', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1095, '2024-12-11', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1096, '2024-12-12', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1097, '2024-12-12', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1098, '2024-12-12', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1099, '2024-12-12', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1100, '2024-12-12', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1101, '2024-12-13', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1102, '2024-12-13', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1103, '2024-12-13', 9, 19, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1104, '2024-12-13', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1105, '2024-12-13', 7, 17, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1106, '2024-12-14', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1107, '2024-12-14', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1108, '2024-12-14', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1109, '2024-12-14', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1110, '2024-12-14', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1111, '2024-12-16', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1112, '2024-12-16', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1113, '2024-12-16', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1114, '2024-12-16', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1115, '2024-12-16', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1116, '2024-12-17', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1117, '2024-12-17', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1118, '2024-12-17', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1119, '2024-12-17', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1120, '2024-12-17', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1121, '2024-12-18', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1122, '2024-12-18', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1123, '2024-12-18', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1124, '2024-12-18', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1125, '2024-12-18', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1126, '2024-12-19', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1127, '2024-12-19', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1128, '2024-12-19', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1129, '2024-12-19', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1130, '2024-12-19', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1131, '2024-12-20', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1132, '2024-12-20', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1133, '2024-12-20', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1134, '2024-12-20', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1135, '2024-12-20', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1136, '2024-12-21', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1137, '2024-12-21', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1138, '2024-12-21', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1139, '2024-12-21', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1140, '2024-12-21', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1141, '2024-12-23', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1142, '2024-12-23', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1143, '2024-12-23', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1144, '2024-12-23', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1145, '2024-12-23', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1146, '2024-12-24', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1147, '2024-12-24', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1148, '2024-12-24', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1149, '2024-12-24', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1150, '2024-12-24', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1151, '2024-12-25', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1152, '2024-12-25', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1153, '2024-12-25', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1154, '2024-12-25', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1155, '2024-12-25', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1156, '2024-12-26', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1157, '2024-12-26', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1158, '2024-12-26', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1159, '2024-12-26', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1160, '2024-12-26', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1161, '2024-12-27', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1162, '2024-12-27', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1163, '2024-12-27', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1164, '2024-12-27', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1165, '2024-12-27', 8, 18, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1166, '2024-12-28', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1167, '2024-12-28', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1168, '2024-12-28', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1169, '2024-12-28', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1170, '2024-12-28', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1171, '2024-12-30', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1172, '2024-12-30', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1173, '2024-12-30', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1174, '2024-12-30', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1175, '2024-12-30', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1176, '2024-12-31', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1177, '2024-12-31', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1178, '2024-12-31', 11, 21, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1179, '2024-12-31', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1180, '2024-12-31', 7, 17, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1181, '2025-01-01', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1182, '2025-01-01', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1183, '2025-01-01', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1184, '2025-01-01', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1185, '2025-01-01', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1186, '2025-01-02', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1187, '2025-01-02', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1188, '2025-01-02', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1189, '2025-01-02', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1190, '2025-01-02', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1191, '2025-01-03', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1192, '2025-01-03', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1193, '2025-01-03', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1194, '2025-01-03', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1195, '2025-01-03', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1196, '2025-01-04', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1197, '2025-01-04', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1198, '2025-01-04', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1199, '2025-01-04', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1200, '2025-01-04', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1201, '2025-01-06', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1202, '2025-01-06', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1203, '2025-01-06', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1204, '2025-01-06', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1205, '2025-01-06', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1206, '2025-01-07', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1207, '2025-01-07', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1208, '2025-01-07', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1209, '2025-01-07', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1210, '2025-01-07', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1211, '2025-01-08', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1212, '2025-01-08', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1213, '2025-01-08', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1214, '2025-01-08', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1215, '2025-01-08', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1216, '2025-01-09', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1217, '2025-01-09', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1218, '2025-01-09', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1219, '2025-01-09', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1220, '2025-01-09', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1221, '2025-01-10', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1222, '2025-01-10', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1223, '2025-01-10', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1224, '2025-01-10', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1225, '2025-01-10', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1226, '2025-01-11', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1227, '2025-01-11', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1228, '2025-01-11', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1229, '2025-01-11', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1230, '2025-01-11', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1231, '2025-01-13', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1232, '2025-01-13', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1233, '2025-01-13', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1234, '2025-01-13', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1235, '2025-01-13', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1236, '2025-01-14', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1237, '2025-01-14', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1238, '2025-01-14', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1239, '2025-01-14', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1240, '2025-01-14', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1241, '2025-01-15', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1242, '2025-01-15', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1243, '2025-01-15', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1244, '2025-01-15', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1245, '2025-01-15', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1246, '2025-01-16', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1247, '2025-01-16', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1248, '2025-01-16', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1249, '2025-01-16', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1250, '2025-01-16', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1251, '2025-01-17', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1252, '2025-01-17', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1253, '2025-01-17', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1254, '2025-01-17', 6, 16, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1255, '2025-01-17', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1256, '2025-01-18', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1257, '2025-01-18', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1258, '2025-01-18', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1259, '2025-01-18', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1260, '2025-01-18', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1261, '2025-01-20', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1262, '2025-01-20', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1263, '2025-01-20', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1264, '2025-01-20', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1265, '2025-01-20', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1266, '2025-01-21', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1267, '2025-01-21', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1268, '2025-01-21', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1269, '2025-01-21', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1270, '2025-01-21', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1271, '2025-01-22', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1272, '2025-01-22', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1273, '2025-01-22', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1274, '2025-01-22', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1275, '2025-01-22', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1276, '2025-01-23', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1277, '2025-01-23', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1278, '2025-01-23', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1279, '2025-01-23', 6, 16, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1280, '2025-01-23', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1281, '2025-01-24', 5, 15, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1282, '2025-01-24', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1283, '2025-01-24', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1284, '2025-01-24', 6, 16, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1285, '2025-01-24', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1286, '2025-01-25', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1287, '2025-01-25', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1288, '2025-01-25', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1289, '2025-01-25', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1290, '2025-01-25', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1291, '2025-01-27', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1292, '2025-01-27', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1293, '2025-01-27', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1294, '2025-01-27', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1295, '2025-01-27', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1296, '2025-01-28', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1297, '2025-01-28', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1298, '2025-01-28', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1299, '2025-01-28', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1300, '2025-01-28', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1301, '2025-01-29', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1302, '2025-01-29', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1303, '2025-01-29', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1304, '2025-01-29', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1305, '2025-01-29', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1306, '2025-01-30', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1307, '2025-01-30', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1308, '2025-01-30', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1309, '2025-01-30', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1310, '2025-01-30', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1311, '2025-01-31', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1312, '2025-01-31', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1313, '2025-01-31', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1314, '2025-01-31', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1315, '2025-01-31', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1316, '2025-02-01', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1317, '2025-02-01', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1318, '2025-02-01', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1319, '2025-02-01', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1320, '2025-02-01', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1321, '2025-02-03', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1322, '2025-02-03', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1323, '2025-02-03', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1324, '2025-02-03', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1325, '2025-02-03', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1326, '2025-02-04', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1327, '2025-02-04', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1328, '2025-02-04', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1329, '2025-02-04', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1330, '2025-02-04', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1331, '2025-02-05', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1332, '2025-02-05', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1333, '2025-02-05', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1334, '2025-02-05', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1335, '2025-02-05', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1336, '2025-02-06', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1337, '2025-02-06', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1338, '2025-02-06', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1339, '2025-02-06', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1340, '2025-02-06', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1341, '2025-02-07', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1342, '2025-02-07', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1343, '2025-02-07', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1344, '2025-02-07', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1345, '2025-02-07', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1346, '2025-02-08', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1347, '2025-02-08', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1348, '2025-02-08', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1349, '2025-02-08', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1350, '2025-02-08', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1351, '2025-02-10', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1352, '2025-02-10', 9, 19, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1353, '2025-02-10', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1354, '2025-02-10', 6, 16, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1355, '2025-02-10', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1356, '2025-02-11', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1357, '2025-02-11', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1358, '2025-02-11', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1359, '2025-02-11', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1360, '2025-02-11', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1361, '2025-02-12', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1362, '2025-02-12', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1363, '2025-02-12', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1364, '2025-02-12', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1365, '2025-02-12', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1366, '2025-02-13', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1367, '2025-02-13', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1368, '2025-02-13', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1369, '2025-02-13', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1370, '2025-02-13', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1371, '2025-02-14', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1372, '2025-02-14', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1373, '2025-02-14', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1374, '2025-02-14', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1375, '2025-02-14', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1376, '2025-02-15', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1377, '2025-02-15', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1378, '2025-02-15', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1379, '2025-02-15', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1380, '2025-02-15', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1381, '2025-02-17', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1382, '2025-02-17', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1383, '2025-02-17', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1384, '2025-02-17', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1385, '2025-02-17', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1386, '2025-02-18', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1387, '2025-02-18', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1388, '2025-02-18', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1389, '2025-02-18', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1390, '2025-02-18', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1391, '2025-02-19', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1392, '2025-02-19', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1393, '2025-02-19', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1394, '2025-02-19', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1395, '2025-02-19', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1396, '2025-02-20', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1397, '2025-02-20', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1398, '2025-02-20', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1399, '2025-02-20', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1400, '2025-02-20', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1401, '2025-02-21', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1402, '2025-02-21', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1403, '2025-02-21', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1404, '2025-02-21', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1405, '2025-02-21', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1406, '2025-02-22', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1407, '2025-02-22', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1408, '2025-02-22', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1409, '2025-02-22', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1410, '2025-02-22', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1411, '2025-02-24', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1412, '2025-02-24', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1413, '2025-02-24', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1414, '2025-02-24', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1415, '2025-02-24', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1416, '2025-02-25', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1417, '2025-02-25', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1418, '2025-02-25', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1419, '2025-02-25', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1420, '2025-02-25', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1421, '2025-02-26', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1422, '2025-02-26', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1423, '2025-02-26', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1424, '2025-02-26', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1425, '2025-02-26', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1426, '2025-02-27', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1427, '2025-02-27', 5, 15, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1428, '2025-02-27', 9, 19, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1429, '2025-02-27', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1430, '2025-02-27', 6, 16, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1431, '2025-02-28', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1432, '2025-02-28', 11, 21, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1433, '2025-02-28', 10, 20, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1434, '2025-02-28', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1435, '2025-02-28', 7, 17, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1436, '2025-03-01', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1437, '2025-03-01', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1438, '2025-03-01', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1439, '2025-03-01', 5, 15, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1440, '2025-03-01', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1441, '2025-03-03', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1442, '2025-03-03', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1443, '2025-03-03', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1444, '2025-03-03', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1445, '2025-03-03', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1446, '2025-03-04', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1447, '2025-03-04', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1448, '2025-03-04', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1449, '2025-03-04', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1450, '2025-03-04', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1451, '2025-03-05', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1452, '2025-03-05', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1453, '2025-03-05', 1, 11, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1454, '2025-03-05', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1455, '2025-03-05', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1456, '2025-03-06', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1457, '2025-03-06', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1458, '2025-03-06', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1459, '2025-03-06', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1460, '2025-03-06', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1461, '2025-03-07', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1462, '2025-03-07', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1463, '2025-03-07', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1464, '2025-03-07', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1465, '2025-03-07', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1466, '2025-03-08', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1467, '2025-03-08', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1468, '2025-03-08', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1469, '2025-03-08', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1470, '2025-03-08', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1471, '2025-03-10', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1472, '2025-03-10', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1473, '2025-03-10', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1474, '2025-03-10', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1475, '2025-03-10', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1476, '2025-03-11', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1477, '2025-03-11', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1478, '2025-03-11', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1479, '2025-03-11', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1480, '2025-03-11', 4, 14, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1481, '2025-03-12', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1482, '2025-03-12', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1483, '2025-03-12', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1484, '2025-03-12', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1485, '2025-03-12', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1486, '2025-03-13', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1487, '2025-03-13', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1488, '2025-03-13', 8, 18, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1489, '2025-03-13', 7, 17, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1490, '2025-03-13', 8, 18, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1491, '2025-03-14', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1492, '2025-03-14', 4, 14, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1493, '2025-03-14', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1494, '2025-03-14', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1495, '2025-03-14', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1496, '2025-03-15', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1497, '2025-03-15', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1498, '2025-03-15', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1499, '2025-03-15', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1500, '2025-03-15', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1501, '2025-03-17', 3, 13, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1502, '2025-03-17', 6, 16, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1503, '2025-03-17', 7, 17, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1504, '2025-03-17', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1505, '2025-03-17', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1506, '2025-03-18', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1507, '2025-03-18', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1508, '2025-03-18', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1509, '2025-03-18', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1510, '2025-03-18', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1511, '2025-03-19', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1512, '2025-03-19', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1513, '2025-03-19', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1514, '2025-03-19', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1515, '2025-03-19', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1516, '2025-03-20', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1517, '2025-03-20', 1, 11, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1518, '2025-03-20', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1519, '2025-03-20', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1520, '2025-03-20', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1521, '2025-03-21', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1522, '2025-03-21', 8, 18, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1523, '2025-03-21', 14, 24, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1524, '2025-03-21', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1525, '2025-03-21', 8, 18, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1526, '2025-03-22', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1527, '2025-03-22', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1528, '2025-03-22', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1529, '2025-03-22', 4, 14, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1530, '2025-03-22', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1531, '2025-03-24', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1532, '2025-03-24', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1533, '2025-03-24', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1534, '2025-03-24', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1535, '2025-03-24', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1536, '2025-03-25', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1537, '2025-03-25', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1538, '2025-03-25', 3, 13, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1539, '2025-03-25', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1540, '2025-03-25', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1541, '2025-03-26', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1542, '2025-03-26', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1543, '2025-03-26', 5, 15, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1544, '2025-03-26', 0, 10, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1545, '2025-03-26', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1546, '2025-03-27', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1547, '2025-03-27', 3, 13, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1548, '2025-03-27', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1549, '2025-03-27', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1550, '2025-03-27', 2, 12, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1551, '2025-03-28', 4, 14, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1552, '2025-03-28', 7, 17, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1553, '2025-03-28', 6, 16, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1554, '2025-03-28', 3, 13, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1555, '2025-03-28', 5, 15, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1556, '2025-03-29', 1, 11, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1557, '2025-03-29', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1558, '2025-03-29', 2, 12, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1559, '2025-03-29', 1, 11, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1560, '2025-03-29', 1, 11, 5)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1561, '2025-03-31', 2, 12, 1)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1562, '2025-03-31', 2, 12, 2)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1563, '2025-03-31', 4, 14, 3)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1564, '2025-03-31', 2, 12, 4)
ON CONFLICT (forecast_id) DO NOTHING;

INSERT INTO forecast (forecast_id, forecast_date, predicted_sale_quantity, predicted_order_quantity, product_id)
VALUES (1565, '2025-03-31', 3, 13, 5)
ON CONFLICT (forecast_id) DO NOTHING;
