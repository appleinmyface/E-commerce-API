-- file directory: /db/schema.sql

-- DROP DATABASE
DROP DATABASE IF EXISTS ecommerce_db;

-- CREATE DATABASE
CREATE DATABASE ecommerce_db;

-- Connect to the database
\connect ecommerce_db;

-- CREATE TABLES
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 10,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE SET NULL
);

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    tag_name VARCHAR(30)
);

CREATE TABLE product_tag (
  id SERIAL PRIMARY KEY,
  product_id INTEGER REFERENCES product(id),
  tag_id INTEGER REFERENCES tag(id)
    FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE SET NULL
);

-- INSERT INTO TABLES
INSERT INTO categories (name) VALUES ('Electronics'), ('Clothing'), ('Books');

-- CATEGORIES
-- 1 -- Electronics
INSERT INTO products (product_name, price, stock, category_id) VALUES 
    ('Laptop', 799.99, 10, 1),
    ('Smartphone', 699.99, 10, 1),
    ('Tablet', 299.99, 10, 1);

-- 2 -- Clothing
INSERT INTO products (product_name, price, stock, category_id) VALUES 
    ('T-Shirt', 9.99, 10, 2),
    ('Dress Shirt', 19.99, 10, 2),
    ('Jeans', 29.99, 10, 2);

-- 3 -- Books
INSERT INTO products (product_name, price, stock, category_id) VALUES 
    ('Python Programming', 29.99, 10, 3),
    ('JavaScript Programming', 29.99, 10, 3),
    ('HTML & CSS', 19.99, 10, 3);

-- TAGS
INSERT INTO tags (tag_name) VALUES 
    ('New'),
    ('On Sale'),
    ('Clearance');

-- PRODUCT TAGS
INSERT INTO product_tags (product_id, tag_id) VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2),
    (6, 3),
    (7, 1),
    (8, 2),
    (9, 3);
