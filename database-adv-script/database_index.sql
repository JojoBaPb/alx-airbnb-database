-- Indexes to optimize performance for high-usage columns

-- USERS table indexes
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_users_name ON users(name);

-- BOOKINGS table indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- PROPERTIES table indexes
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_properties_title ON properties(title);

-- Performance test query using EXPLAIN ANALYZE
-- This measures the query performance after indexes are added

EXPLAIN ANALYZE
SELECT
    users.name,
    COUNT(bookings.id) AS total_bookings
FROM
    users
JOIN
    bookings ON users.id = bookings.user_id
GROUP BY
    users.name;
