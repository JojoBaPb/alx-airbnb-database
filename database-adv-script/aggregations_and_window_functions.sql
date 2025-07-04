-- 1. Aggregation: Total number of bookings made by each user
SELECT
    users.id AS user_id,
    users.name AS user_name,
    COUNT(bookings.id) AS total_bookings
FROM
    users
LEFT JOIN
    bookings ON users.id = bookings.user_id
GROUP BY
    users.id, users.name
ORDER BY
    total_bookings DESC;

-- 2. Window Function: Rank properties using RANK()
SELECT
    property_id,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT
        property_id,
        COUNT(*) AS total_bookings
    FROM
        bookings
    GROUP BY
        property_id
) AS ranked_properties;

-- 3. Window Function: Rank properties using ROW_NUMBER()
SELECT
    property_id,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_position
FROM (
    SELECT
        property_id,
        COUNT(*) AS total_bookings
    FROM
        bookings
    GROUP BY
        property_id
) AS numbered_properties;

