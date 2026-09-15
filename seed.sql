-- Seed data for Ecommerce-Prithi295

-- Admin account (password is BCrypt hash of "admin123")
INSERT INTO users (name, email, password_hash, role) VALUES
('Admin User', 'admin@ecommerce.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ADMIN');

-- Sample Buyers and Sellers
INSERT INTO users (name, email, password_hash, role) VALUES
('John Buyer', 'buyer@test.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'BUYER'),
('Sarah Seller', 'seller@test.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'SELLER');

-- Sample Products
INSERT INTO products (name, description, price, stock_qty, category, image_url, seller_id) VALUES
('Wireless Mouse', 'Ergonomic wireless mouse with USB receiver', 499.00, 50, 'Electronics', 'https://via.placeholder.com/150', 3),
('Cotton T-Shirt', 'Comfortable cotton t-shirt, multiple sizes', 299.00, 100, 'Clothing', 'https://via.placeholder.com/150', 3),
('Notebook Set', 'Pack of 5 ruled notebooks', 199.00, 80, 'Stationery', 'https://via.placeholder.com/150', 3),
('Bluetooth Headphones', 'Over-ear wireless headphones with noise cancellation', 1999.00, 30, 'Electronics', 'https://via.placeholder.com/150', 3),
('Water Bottle', '1 Litre stainless steel water bottle', 349.00, 60, 'Home', 'https://via.placeholder.com/150', 3);
