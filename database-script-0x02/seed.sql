
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
('a1b2c3d4-e5f6-7890-1234-567890abcdef', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '123-456-7890', 'guest'),
('b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '987-654-3210', 'host'),
('c3d4e5f6-a7b8-9012-3456-7890abcdef12', 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password_3', '555-123-4567', 'admin');


INSERT INTO properties (property_id, host_id, name, description, location, price_per_night) VALUES
('d4e5f6a7-b8c9-0123-4567-890abcdef123', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Cozy Apartment', 'A cozy apartment in the city center.', 'City Center', 100.00),
('e5f6a7b8-c9d0-1234-5678-90abcdef1234', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Luxury Villa', 'A luxury villa with a private pool.', 'Beachfront', 500.00);


INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('f6a7b8c9-d0e1-2345-6789-0abcdef12345', 'd4e5f6a7-b8c9-0123-4567-890abcdef123', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2024-01-01', '2024-01-05', 400.00, 'confirmed'),
('a7b8c9d0-e1f2-3456-7890-abcdef123456', 'e5f6a7b8-c9d0-1234-5678-90abcdef1234', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2024-02-15', '2024-02-22', 3500.00, 'confirmed');


INSERT INTO payments (payment_id, booking_id, amount, payment_method) VALUES
('b8c9d0e1-f2a3-4567-890a-bcdef1234567', 'f6a7b8c9-d0e1-2345-6789-0abcdef12345', 400.00, 'credit_card'),
('c9d0e1f2-a3b4-5678-90ab-cdef12345678', 'a7b8c9d0-e1f2-3456-7890-abcdef123456', 3500.00, 'paypal');


INSERT INTO reviews (review_id, property_id, user_id, rating, comment) VALUES
('d0e1f2a3-b4c5-6789-0abc-def123456789', 'd4e5f6a7-b8c9-0123-4567-890abcdef123', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 5, 'Great place to stay!'),
('e1f2a3b4-c5d6-7890-abcd-ef1234567890', 'e5f6a7b8-c9d0-1234-5678-90abcdef1234', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 4, 'Amazing villa with a great view.');


INSERT INTO messages (message_id, sender_id, recipient_id, message_body) VALUES
('f2a3b4c5-d6e7-890a-bcde-f1234567890a', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Hello, I have a question about your property.'),
('a3b4c5d6-e7f8-90ab-cdef-1234567890ab', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 'Sure, what would you like to know?');
