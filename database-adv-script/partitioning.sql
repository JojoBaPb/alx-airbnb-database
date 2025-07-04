-- 1: Create the new partitioned parent table
DROP TABLE IF EXISTS bookings CASCADE;

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    created_at TIMESTAMP,
    -- other columns as needed...
    CONSTRAINT bookings_user_fk FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT bookings_property_fk FOREIGN KEY (property_id) REFERENCES properties(id)
) PARTITION BY RANGE (start_date);

-- 2: Create partitions for specific date ranges
CREATE TABLE bookings_2022 PARTITION OF bookings
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- 3: (Optional) Create indexes on the partitions for filtering
CREATE INDEX idx_bookings_2022_user_id ON bookings_2022(user_id);
CREATE INDEX idx_bookings_2023_user_id ON bookings_2023(user_id);
CREATE INDEX idx_bookings_2024_user_id ON bookings_2024(user_id);

-- 4: Example performance query on a specific partition range
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2023-06-01' AND '2023-07-01';

