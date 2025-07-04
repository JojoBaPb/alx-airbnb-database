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

-- 2. Window Function: Rank properties based on total number of bookings
SELECT
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM
    bookings
GROUP BY
    property_id;

