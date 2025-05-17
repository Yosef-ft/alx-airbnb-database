
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
('a1b2c3d4-e5f6-7890-1234-567890abcdef', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '123-456-7890', 'guest'),
('b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '987-654-3210', 'host'),
('c3d4e5f6-a7b8-9012-3456-7890abcdef12', 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password_3', '555-123-4567', 'admin'),
('d5e6f7a8-b9c0-1122-3344-556677889900', 'Carlos', 'Gomez', 'carlos.gomez@example.com', 'hashed_password_4', '111-222-3333', 'guest'),
('e6f7a8b9-c0d1-2233-4455-667788990011', 'Emily', 'Wang', 'emily.wang@example.com', 'hashed_password_5', '444-555-6666', 'host'),
('f7a8b9c0-d1e2-3344-5566-778899001122', 'Mohammed', 'Ali', 'mohammed.ali@example.com', 'hashed_password_6', '777-888-9999', 'admin');

INSERT INTO properties (property_id, host_id, name, description, location, price_per_night) VALUES
('d4e5f6a7-b8c9-0123-4567-890abcdef123', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Cozy Apartment', 'A cozy apartment in the city center.', 'City Center', 100.00),
('e5f6a7b8-c9d0-1234-5678-90abcdef1234', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Luxury Villa', 'A luxury villa with a private pool.', 'Beachfront', 500.00),
('a8b9c0d1-e2f3-4455-6677-889900112233', 'e6f7a8b9-c0d1-2233-4455-667788990011', 'Mountain Cabin', 'A quiet cabin in the mountains.', 'Mountain View', 150.00),
('b9c0d1e2-f3a4-5566-7788-990011223344', 'e6f7a8b9-c0d1-2233-4455-667788990011', 'Modern Loft', 'Stylish loft in the heart of downtown.', 'Downtown', 200.00);


INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('f6a7b8c9-d0e1-2345-6789-0abcdef12345', 'd4e5f6a7-b8c9-0123-4567-890abcdef123', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2024-01-01', '2024-01-05', 400.00, 'confirmed'),
('f6a7b8c9-d0e1-2345-6789-0abcdef12346', 'd4e5f6a7-b8c9-0123-4567-890abcdef123', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2024-01-01', '2024-01-05', 400.00, 'confirmed'),
('f6a7b8c9-d0e1-2345-6789-0abcdef12348', 'd4e5f6a7-b8c9-0123-4567-890abcdef123', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2024-01-01', '2024-01-05', 400.00, 'confirmed'),
('f6a7b8c9-d0e1-2345-6789-0abcdef12347', 'd4e5f6a7-b8c9-0123-4567-890abcdef123', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2024-01-01', '2024-01-05', 400.00, 'confirmed'),
('a7b8c9d0-e1f2-3456-7890-abcdef123456', 'e5f6a7b8-c9d0-1234-5678-90abcdef1234', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2024-02-15', '2024-02-22', 3500.00, 'confirmed'),
('c0d1e2f3-a4b5-6677-8899-001122334455', 'a8b9c0d1-e2f3-4455-6677-889900112233', 'd5e6f7a8-b9c0-1122-3344-556677889900', '2024-03-10', '2024-03-15', 750.00, 'confirmed'),
('d1e2f3a4-b5c6-7788-9900-112233445566', 'b9c0d1e2-f3a4-5566-7788-990011223344', 'd5e6f7a8-b9c0-1122-3344-556677889900', '2024-04-05', '2024-04-10', 1000.00, 'pending'),
('a6a7b8c9-d0e1-2345-6789-0abcdef12346', 'd4e5f6a7-b8c9-0123-4567-890abcdef123', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2022-03-01', '2022-03-05', 400.00, 'confirmed'),
('a6a7b8c9-d0e1-2345-6789-0abcdef12347', 'e5f6a7b8-c9d0-1234-5678-90abcdef1234', 'd5e6f7a8-b9c0-1122-3344-556677889900', '2022-06-10', '2022-06-17', 3500.00, 'confirmed'),
('a6a7b8c9-d0e1-2345-6789-0abcdef12348', 'a8b9c0d1-e2f3-4455-6677-889900112233', 'e6f7a8b9-c0d1-2233-4455-667788990011', '2022-09-15', '2022-09-20', 750.00, 'confirmed'),

-- 2023 bookings
('a6a7b8c9-d0e1-2345-6789-0abcdef12334', 'b9c0d1e2-f3a4-5566-7788-990011223344', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2023-01-10', '2023-01-15', 1000.00, 'confirmed'),
('a6a7b8c9-d0e1-2345-6789-0abcdef12359', 'e5f6a7b8-c9d0-1234-5678-90abcdef1234', 'c3d4e5f6-a7b8-9012-3456-7890abcdef12', '2023-04-05', '2023-04-12', 3500.00, 'confirmed'),
('a6a7b8c9-d0e1-2345-6789-0abcdef12369', 'a8b9c0d1-e2f3-4455-6677-889900112233', 'f7a8b9c0-d1e2-3344-5566-778899001122', '2023-07-01', '2023-07-08', 1050.00, 'pending'),

-- 2024 bookings (existing + new)
('a6a7b8c9-d0e1-2345-6789-0abcdef12345', 'd4e5f6a7-b8c9-0123-4567-890abcdef123', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2024-01-01', '2024-01-05', 400.00, 'confirmed'),
('a6a7b8c9-d0e1-2345-6789-0abcdef12344', 'e5f6a7b8-c9d0-1234-5678-90abcdef1234', 'e6f7a8b9-c0d1-2233-4455-667788990011', '2024-05-20', '2024-05-25', 2500.00, 'confirmed'),
('a6a7b8c9-d0e1-2345-6789-0abcdef12343', 'a8b9c0d1-e2f3-4455-6677-889900112233', 'd5e6f7a8-b9c0-1122-3344-556677889900', '2024-08-12', '2024-08-16', 600.00, 'confirmed'),

-- 2025 bookings
('a6a7b8c9-d0e1-2345-6789-0abcdef12342', 'b9c0d1e2-f3a4-5566-7788-990011223344', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', '2025-01-03', '2025-01-08', 1200.00, 'pending'),
('a6a7b8c9-d0e1-2345-6789-0abcdef12341', 'e5f6a7b8-c9d0-1234-5678-90abcdef1234', 'f7a8b9c0-d1e2-3344-5566-778899001122', '2025-04-14', '2025-04-20', 3300.00, 'confirmed'),
('a6a7b8c9-d0e1-2345-6789-0abcdef12340', 'a8b9c0d1-e2f3-4455-6677-889900112233', 'c3d4e5f6-a7b8-9012-3456-7890abcdef12', '2025-10-01', '2025-10-07', 900.00, 'confirmed');


INSERT INTO payments (payment_id, booking_id, amount, payment_method) VALUES
('b8c9d0e1-f2a3-4567-890a-bcdef1234567', 'f6a7b8c9-d0e1-2345-6789-0abcdef12345', 400.00, 'credit_card'),
('c9d0e1f2-a3b4-5678-90ab-cdef12345678', 'a7b8c9d0-e1f2-3456-7890-abcdef123456', 3500.00, 'paypal'),
('e2f3a4b5-c6d7-8899-0011-223344556677', 'c0d1e2f3-a4b5-6677-8899-001122334455', 750.00, 'credit_card'),
('f3a4b5c6-d7e8-9900-1122-334455667788', 'd1e2f3a4-b5c6-7788-9900-112233445566', 1000.00, 'paypal');


INSERT INTO reviews (review_id, property_id, user_id, rating, comment) VALUES
('d0e1f2a3-b4c5-6789-0abc-def123456789', 'd4e5f6a7-b8c9-0123-4567-890abcdef123', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 5, 'Great place to stay!'),
('e1f2a3b4-c5d6-7890-abcd-ef1234567890', 'e5f6a7b8-c9d0-1234-5678-90abcdef1234', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 4, 'Amazing villa with a great view.'),
('a4b5c6d7-e8f9-0011-2233-445566778899', 'a8b9c0d1-e2f3-4455-6677-889900112233', 'd5e6f7a8-b9c0-1122-3344-556677889900', 5, 'Absolutely loved the mountain views!'),
('b5c6d7e8-f9a0-1122-3344-556677889900', 'b9c0d1e2-f3a4-5566-7788-990011223344', 'd5e6f7a8-b9c0-1122-3344-556677889900', 3, 'The loft was modern but a bit noisy at night.');


INSERT INTO messages (message_id, sender_id, recipient_id, message_body) VALUES
('f2a3b4c5-d6e7-890a-bcde-f1234567890a', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Hello, I have a question about your property.'),
('a3b4c5d6-e7f8-90ab-cdef-1234567890ab', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 'Sure, what would you like to know?'),
('c6d7e8f9-a0b1-2233-4455-667788990011', 'd5e6f7a8-b9c0-1122-3344-556677889900', 'e6f7a8b9-c0d1-2233-4455-667788990011', 'Is your cabin available for next weekend?'),
('d7e8f9a0-b1c2-3344-5566-778899001122', 'e6f7a8b9-c0d1-2233-4455-667788990011', 'd5e6f7a8-b9c0-1122-3344-556677889900', 'Yes, it is available from Friday to Sunday.');
