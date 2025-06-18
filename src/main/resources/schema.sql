-- 既存のテーブルがあれば削除する（依存関係も含む）
DROP TABLE IF EXISTS forecast CASCADE;
DROP TABLE IF EXISTS sales CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS weather CASCADE;

-- 製品テーブル
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price INT,
    jan_code VARCHAR(30)
);

-- ユーザーテーブル
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    role VARCHAR(10) CHECK (role IN ('admin', 'staff'))
);

-- 売上テーブル
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    quantity INT,
    product_id INT,
    user_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 予測テーブル
CREATE TABLE forecast (
    forecast_id INT PRIMARY KEY,
    forecast_date DATE,
    predicted_sale_quantity INT,
    predicted_order_quantity INT,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 天気情報テーブル
CREATE TABLE weather (
    weather_date DATE PRIMARY KEY,
    weather_info VARCHAR(100)
);
