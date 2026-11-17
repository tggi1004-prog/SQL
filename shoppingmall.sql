
-- 1. 카테고리 테이블
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    description TEXT
);

-- 2. 상품 테이블
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    price INTEGER NOT NULL CHECK (price >= 0),
    stock INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
    category_id INTEGER REFERENCES categories(category_id),
    description TEXT
);

-- 3. 장바구니 테이블
CREATE TABLE buckets (
    bucket_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL REFERENCES products(product_id),
    qty INTEGER NOT NULL CHECK (qty > 0),
    UNIQUE (user_id, product_id)
);
