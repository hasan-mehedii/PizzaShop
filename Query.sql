CREATE database Pizza_Shop;
use Pizza_Shop;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE Food_Items (
    food_id VARCHAR(10) PRIMARY KEY,
    food_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    food_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (food_id) REFERENCES Food_Items(food_id)
);

INSERT INTO Users (phone_number, password, name, address)
VALUES 
('1234567890', 'password123', 'John Doe', '123 Main Street'),
('0987654321', 'password456', 'Jane Smith', '456 Elm Street'),
('1122334455', 'password789', 'Alice Johnson', '789 Oak Avenue');

INSERT INTO Food_Items (food_id, food_name, price)
VALUES 
('piz-101', 'Pizza', 15.99),
('bur-305', 'Burger', 8.99),
('sand-201', 'Sandwich', 5.49),
('drm-578', 'Drumstick', 7.99);

INSERT INTO Orders (user_id, order_date)
VALUES 
(1, '2025-06-23 12:30:00'),
(2, '2025-06-23 13:00:00'),
(3, '2025-06-23 14:15:00');

INSERT INTO Order_Items (order_id, food_id, quantity)
VALUES 
(1, 'piz-101', 2),  -- User 1 orders 2 pizzas
(1, 'bur-305', 1),  -- User 1 orders 1 burger
(2, 'sand-201', 3), -- User 2 orders 3 sandwiches
(3, 'drm-578', 2);  -- User 3 orders 2 drumsticks

select * from Users;
