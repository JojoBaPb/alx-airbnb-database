-- Initial query: retrieve all bookings with user, property, and payment details
SELECT
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    properties.id AS property_id,
    properties.title AS property_title,
    payments.id AS payment_id,
    payments.amount,
    payments.status
FROM
    bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.id = payments.booking_id
WHERE
    payments.status = 'completed' AND bookings.start_date IS NOT NULL;

-- Analyze performance of the above query
EXPLAIN ANALYZE
SELECT
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    properties.id AS property_id,
    properties.title AS property_title,
    payments.id AS payment_id,
    payments.amount,
    payments.status
FROM
    bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.id = payments.booking_id
WHERE
    payments.status = 'completed' AND bookings.start_date IS NOT NULL;

-- Refactored query: removed unnecessary columns and uses explicit JOIN filter
-- Assumes appropriate indexes exist (user_id, property_id, booking_id)
EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.title AS property_title,
    pay.amount,
    pay.status
FROM
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE
    pay.status = 'completed' AND b.start_date IS NOT NULL;
