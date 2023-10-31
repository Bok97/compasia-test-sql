-- Create the brands table
CREATE TABLE brands (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the categories table
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price INTEGER NOT NULL DEFAULT 0,
    brand_id INTEGER REFERENCES brands(id),
    category_id INTEGER REFERENCES categories(id)
);

-- Create the product_colors table
CREATE TABLE product_colors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Create the product_variants table
CREATE TABLE product_variants (
    id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES products(id),
    color_id INTEGER REFERENCES product_colors(id)
);

-- Create the orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    document_number UUID NOT NULL DEFAULT gen_random_uuid(),
    transaction_date_time TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    total_amount INTEGER NOT NULL DEFAULT 0
);

-- Create the order_details table
CREATE TABLE order_details (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    product_variant_id INTEGER REFERENCES product_variants(id),
    color_id INTEGER REFERENCES product_colors(id),
    price INTEGER NOT NULL DEFAULT 0
);
