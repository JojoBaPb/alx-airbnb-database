-- seed.sql

-- Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  ('uuid-user-001', 'Alice', 'Smith', 'alice@example.com', 'hashedpassword1', '1234567890', 'guest'),
  ('uuid-user-002', 'Bob', 'Johnson', 'bob@example.com', 'hashedpassword2', '0987654321', 'host'),
  ('uuid-user-003', 'Carol', 'Brown', 'carol@example.com', 'hashedpassword3', NULL, 'admin');

-- Properties
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES 
  ('uuid-prop-001', 'uuid-user-002', 'Cozy Cabin', 'A peaceful cabin in the woods.', 'Lusaka, Zambia', 75.00),
  ('uuid-prop-002', 'uuid-user-002', 'City Apartment', 'Modern apartment in downtown.', 'Kitwe, Zambia', 100.00);

-- Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
  ('uuid-book-001', 'uuid-prop-001', 'uuid-user-001', '2025-07-01', '2025-07-05', 300.00, 'confirmed'),
  ('uuid-book-002', 'uuid-prop-002', 'uuid-user-001', '2025-07-10', '2025-07-12', 200.00, 'pending');

-- Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES 
  ('uuid-pay-001', 'uuid-book-001', 300.00, 'credit_card'),
  ('uuid-pay-002', 'uuid-book-002', 200.00, 'paypal');

-- Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES 
  ('uuid-rev-001', 'uuid-prop-001', 'uuid-user-001', 5, 'Amazing place, highly recommended!'),
  ('uuid-rev-002', 'uuid-prop-002', 'uuid-user-001', 4, 'Great stay but noisy at night.');

-- Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES 
  ('uuid-msg-001', 'uuid-user-001', 'uuid-user-002', 'Hi Bob, is your cabin available for next weekend?'),
  ('uuid-msg-002', 'uuid-user-002', 'uuid-user-001', 'Hi Alice, yes it is! Feel free to book it.');

