-- 既存のテーブルがあれば削除する（依存関係も含む）
DROP TABLE IF EXISTS inventory CASCADE;
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
    jan_code VARCHAR(30),
    production_date DATE,
    expiration_date DATE,
    stock_quantity INT CHECK (stock_quantity >= 0)  
);

-- ユーザーテーブル
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    role VARCHAR(10) CHECK (role IN ('admin', 'user')),
    is_deleted BOOLEAN DEFAULT false
);

-- 売上テーブル（ここが重要）
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,  -- ✅ 自動採番に変更
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


-- 天気情報テーブル（拡張済み）
CREATE TABLE weather (
    weather_date DATE PRIMARY KEY,
    weather_info VARCHAR(100),         -- 天気（例：晴れ・曇りなど）
    weather_water DECIMAL(5,2),        -- 降水量（mm）
    weather_wind DECIMAL(5,2),         -- 風速（m/s）
    weather_temperature DECIMAL(5,2)   -- 気温（℃）
);

--在庫数テーブル-- 
CREATE TABLE inventory ( 

    product_id INT PRIMARY KEY, 
    product_name VARCHAR(100), 
    stock_count INT CHECK (stock_count >= 0), 
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (product_id) REFERENCES products(product_id) 

); 

