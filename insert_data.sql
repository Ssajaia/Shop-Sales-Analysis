USE shop;
GO

DELETE FROM orders;
DELETE FROM customers;
DELETE FROM products;
DBCC CHECKIDENT ('orders', RESEED, 0);
DBCC CHECKIDENT ('customers', RESEED, 0);
DBCC CHECKIDENT ('products', RESEED, 0);
GO

INSERT INTO products (name, category, price) VALUES
('iPhone 15 Pro', 'Electronics', 1199.99),
('Samsung Galaxy S24', 'Electronics', 899.99),
('MacBook Air M2', 'Electronics', 1299.99),
('Sony WH-1000XM5 Headphones', 'Electronics', 399.99),
('iPad Air', 'Electronics', 599.99),
('Dell XPS 13 Laptop', 'Electronics', 999.99),
('Nintendo Switch OLED', 'Electronics', 349.99),
('PlayStation 5', 'Electronics', 499.99),
('Canon EOS R6 Camera', 'Electronics', 2499.99),
('Bose QuietComfort Earbuds', 'Electronics', 279.99),
('Levi''s 501 Original Jeans', 'Clothing', 89.99),
('Nike Air Force 1 Shoes', 'Footwear', 110.00),
('Adidas Ultraboost Running Shoes', 'Footwear', 189.99),
('Patagonia Nano Puff Jacket', 'Clothing', 229.99),
('Ralph Lauren Polo Shirt', 'Clothing', 98.50),
('Under Armour Sports Shorts', 'Clothing', 34.99),
('Dr. Martens 1460 Boots', 'Footwear', 169.99),
('North Face Rain Jacket', 'Clothing', 199.99),
('Lululemon Yoga Pants', 'Clothing', 118.00),
('Tommy Hilfiger Sweater', 'Clothing', 79.99),
('IKEA Billy Bookcase', 'Furniture', 89.99),
('Tempur-Pedic Pillow', 'Home', 79.99),
('KitchenAid Stand Mixer', 'Home Appliances', 429.99),
('Dyson V11 Vacuum', 'Home Appliances', 699.99),
('West Elm Sofa', 'Furniture', 1299.99),
('Cuisinart Coffee Maker', 'Home Appliances', 149.99),
('All-Clad Cookware Set', 'Kitchen', 899.99),
('Yankee Candle Large Jar', 'Home', 24.99),
('Sealy Queen Mattress', 'Furniture', 899.99),
('Ninja Air Fryer', 'Home Appliances', 119.99);

INSERT INTO products (name, category, price) VALUES
('Apple Watch Series 9', 'Electronics', 399.99),
('Samsung 4K Smart TV', 'Electronics', 799.99),
('Google Pixel 8 Pro', 'Electronics', 999.99),
('Amazon Echo Dot', 'Electronics', 49.99),
('Fitbit Charge 6', 'Electronics', 159.99),
('HP OfficeJet Printer', 'Electronics', 129.99),
('Logitech Webcam', 'Electronics', 79.99),
('Anker Power Bank', 'Electronics', 45.99),
('JBL Flip Speaker', 'Electronics', 129.99),
('Kindle Paperwhite', 'Electronics', 139.99),
('Calvin Klein Underwear Pack', 'Clothing', 35.99),
('Vans Old Skool Shoes', 'Footwear', 75.00),
('Converse Chuck Taylor', 'Footwear', 65.00),
('Columbia Winter Jacket', 'Clothing', 199.99),
('H&M Basic T-Shirts', 'Clothing', 12.99),
('Zara Blazer', 'Clothing', 89.99),
('Puma Running Shorts', 'Clothing', 29.99),
('Skechers Walking Shoes', 'Footwear', 79.99),
('Timberland Boots', 'Footwear', 199.99),
('Gap Hoodie', 'Clothing', 49.99),
('Target Throw Pillow', 'Home', 19.99),
('Bed Bath Table Lamp', 'Home', 39.99),
('Rubbermaid Storage Bins', 'Home', 24.99),
('Scotch Brite Sponges', 'Home', 5.99),
('Dawn Dish Soap', 'Home', 4.99),
('Tide Laundry Detergent', 'Home', 12.99),
('Bounty Paper Towels', 'Home', 8.99),
('Charmin Toilet Paper', 'Home', 15.99),
('Crest Toothpaste', 'Home', 4.49),
('Dove Body Wash', 'Home', 6.99);


DECLARE @i INT = 1;
WHILE @i <= 140
BEGIN
    INSERT INTO products (name, category, price)
    VALUES (
        'Product ' + CAST(@i + 60 AS VARCHAR),
        CASE (ABS(CHECKSUM(NEWID())) % 8)
            WHEN 0 THEN 'Electronics'
            WHEN 1 THEN 'Clothing'
            WHEN 2 THEN 'Footwear'
            WHEN 3 THEN 'Home'
            WHEN 4 THEN 'Kitchen'
            WHEN 5 THEN 'Sports'
            WHEN 6 THEN 'Books'
            ELSE 'Accessories'
        END,
        CAST((ABS(CHECKSUM(NEWID())) % 1000 + 1) AS NUMERIC(10,2)) + 0.99
    );
    SET @i = @i + 1;
END;


INSERT INTO customers (name, email, country) VALUES
('Emma Johnson', 'emma.johnson@gmail.com', 'USA'),
('Liam Chen', 'liam.chen@yahoo.com', 'China'),
('Sophia Rodriguez', 'sophia.rodriguez@hotmail.com', 'Spain'),
('Noah Kim', 'noah.kim@email.com', 'South Korea'),
('Olivia Schmidt', 'olivia.schmidt@outlook.com', 'Germany'),
('William Brown', 'william.brown@gmail.com', 'UK'),
('Ava Tanaka', 'ava.tanaka@yahoo.com', 'Japan'),
('James Wilson', 'james.wilson@hotmail.com', 'Canada'),
('Isabella Martin', 'isabella.martin@email.com', 'France'),
('Benjamin Rossi', 'benjamin.rossi@outlook.com', 'Italy'),
('Mia Andersen', 'mia.andersen@gmail.com', 'Norway'),
('Lucas Silva', 'lucas.silva@yahoo.com', 'Brazil'),
('Charlotte Papadopoulos', 'charlotte.papadopoulos@hotmail.com', 'Greece'),
('Alexander Wong', 'alexander.wong@email.com', 'Singapore'),
('Amelia Kowalski', 'amelia.kowalski@outlook.com', 'Poland'),
('Michael Davis', 'michael.davis@gmail.com', 'Australia'),
('Harper O''Connor', 'harper.oconnor@yahoo.com', 'Ireland'),
('Ethan Muller', 'ethan.muller@hotmail.com', 'Switzerland'),
('Evelyn Van der Berg', 'evelyn.vanderberg@email.com', 'Netherlands'),
('Daniel Johansson', 'daniel.johansson@outlook.com', 'Sweden');

DECLARE @j INT = 1;
WHILE @j <= 280
BEGIN
    INSERT INTO customers (name, email, country)
    VALUES (
        'Customer ' + CAST(@j + 20 AS VARCHAR),
        'customer' + CAST(@j + 20 AS VARCHAR) +
        CASE (@j % 5)
            WHEN 0 THEN '@gmail.com'
            WHEN 1 THEN '@yahoo.com'
            WHEN 2 THEN '@hotmail.com'
            WHEN 3 THEN '@outlook.com'
            ELSE '@email.com'
        END,
        CASE (@j % 15)
            WHEN 0 THEN 'USA'
            WHEN 1 THEN 'Canada'
            WHEN 2 THEN 'UK'
            WHEN 3 THEN 'Australia'
            WHEN 4 THEN 'Germany'
            WHEN 5 THEN 'France'
            WHEN 6 THEN 'Japan'
            WHEN 7 THEN 'China'
            WHEN 8 THEN 'Brazil'
            WHEN 9 THEN 'Spain'
            WHEN 10 THEN 'Italy'
            WHEN 11 THEN 'Mexico'
            WHEN 12 THEN 'India'
            WHEN 13 THEN 'South Korea'
            ELSE 'Netherlands'
        END
    );
    SET @j = @j + 1;
END;


INSERT INTO orders (customer_id, product_id, order_date, quantity) VALUES
(1, 1, '2024-01-15', 1),
(2, 2, '2024-01-16', 1),
(3, 3, '2024-01-17', 1),
(4, 4, '2024-01-18', 2),
(5, 5, '2024-01-19', 1),
(6, 6, '2024-01-20', 1),
(7, 7, '2024-01-21', 1),
(8, 8, '2024-01-22', 1),
(9, 9, '2024-01-23', 1),
(10, 10, '2024-01-24', 2),
(11, 11, '2024-01-25', 1),
(12, 12, '2024-01-26', 1),
(13, 13, '2024-01-27', 1),
(14, 14, '2024-01-28', 1),
(15, 15, '2024-01-29', 2),
(16, 16, '2024-01-30', 1),
(17, 17, '2024-01-31', 1),
(18, 18, '2024-02-01', 1),
(19, 19, '2024-02-02', 2),
(20, 20, '2024-02-03', 1),
(21, 21, '2024-02-04', 1),
(22, 22, '2024-02-05', 1),
(23, 23, '2024-02-06', 1),
(24, 24, '2024-02-07', 1),
(25, 25, '2024-02-08', 2),
(26, 26, '2024-02-09', 1),
(27, 27, '2024-02-10', 1),
(28, 28, '2024-02-11', 1),
(29, 29, '2024-02-12', 1),
(30, 30, '2024-02-13', 2),
(31, 31, '2024-02-14', 1),
(32, 32, '2024-02-15', 1),
(33, 33, '2024-02-16', 1),
(34, 34, '2024-02-17', 1),
(35, 35, '2024-02-18', 2),
(36, 36, '2024-02-19', 1),
(37, 37, '2024-02-20', 1),
(38, 38, '2024-02-21', 1),
(39, 39, '2024-02-22', 1),
(40, 40, '2024-02-23', 2),
(41, 41, '2024-02-24', 1),
(42, 42, '2024-02-25', 1),
(43, 43, '2024-02-26', 1),
(44, 44, '2024-02-27', 1),
(45, 45, '2024-02-28', 2),
(46, 46, '2024-02-29', 1),
(47, 47, '2024-03-01', 1),
(48, 48, '2024-03-02', 1),
(49, 49, '2024-03-03', 1),
(50, 50, '2024-03-04', 2);
DECLARE @k INT = 1;
WHILE @k <= 450
BEGIN
    INSERT INTO orders (customer_id, product_id, order_date, quantity)
    VALUES (
        (ABS(CHECKSUM(NEWID())) % 300 + 1),
        (ABS(CHECKSUM(NEWID())) % 200 + 1),
        DATEADD(day, - (ABS(CHECKSUM(NEWID())) % 365), GETDATE()),
        (ABS(CHECKSUM(NEWID())) % 4 + 1)
    );
    SET @k = @k + 1;
END;

-- ვერიფიკაცია
SELECT
    'Products: ' + CAST(COUNT(*) AS VARCHAR) FROM products
UNION ALL
SELECT
    'Customers: ' + CAST(COUNT(*) AS VARCHAR) FROM customers
UNION ALL
SELECT
    'Orders: ' + CAST(COUNT(*) AS VARCHAR) FROM orders;
