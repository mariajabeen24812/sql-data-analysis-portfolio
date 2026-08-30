-- concept : data type( text data type, numeric data type, time data type, boolean data type,advance data type)

CREATE TYPE product_status AS ENUM ('active', 'inactive', 'out_of_stock');
CREATE TABLE Product (
    product_id SERIAL PRIMARY KEY,
    product_uuid UUID DEFAULT gen_random_uuid(),
    product_code CHAR(6),
    product_name VARCHAR(100),
    description TEXT,
    quantity SMALLINT,
    stock_count INTEGER,
    total_units_sold BIGINT,
    price NUMERIC(10,2),
    rating REAL,
    exact_rating DOUBLE PRECISION,
    launch_date DATE,
    launch_time TIME,
    created_at TIMESTAMP,
    updated_at TIMESTAMPTZ,
    warranty_period INTERVAL,
    is_available BOOLEAN,
    specifications JSON,
    extra_details JSONB,
    tags TEXT[],
    status product_status
);
DROP TABLE if exists products;
INSERT INTO Product (
    product_code, product_name, description, quantity,
    stock_count, total_units_sold, price, rating, exact_rating,
    launch_date, launch_time, created_at, updated_at,
    warranty_period, is_available, specifications, extra_details,
    tags, status
)
VALUES (
    'PRD001',
    'Wireless Mouse',
    'A wireless mouse for office and home use.',
    25,
    25,
    150000,
    2499.99,
    4.5,
    4.567891,
    '2026-08-24',
    '10:30:00',
    '2026-08-24 10:30:00',
    '2026-08-24 10:30:00+05',
    '1 year',
    TRUE,
    '{"color":"black","connection":"wireless"}',
    '{"brand":"TechPro","material":"plastic"}',
    ARRAY['mouse', 'wireless', 'office'],
    'active'
);
SELECT * FROM Product;