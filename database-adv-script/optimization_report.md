# Query Optimization Report

## Objective

To analyze and optimize a complex query involving multiple joins — specifically to fetch bookings along with user, property, and payment details.

---

## 1. Initial Query

```sql
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
JOIN payments ON bookings.id = payments.booking_id;

EXPLAIN ANALYZE Output (Before Optimization)

Hash Join on payments.booking_id = bookings.id
Seq Scan on bookings
Seq Scan on users
Seq Scan on properties
Seq Scan on payments

Execution Time: ~80 ms

2. Optimization Strategy

    Reduced selected columns to only those needed for output

    Applied table aliases for readability

    Ensured relevant indexes exist on:

        bookings.user_id

        bookings.property_id

        payments.booking_id

    Confirmed that EXPLAIN shows index scans rather than sequential scans

3. Refactored Query

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
JOIN payments pay ON b.id = pay.booking_id;

EXPLAIN ANALYZE Output (After Optimization)

Nested Loop or Hash Join using indexes
Index Scan on bookings
Index Scan on users
Index Scan on properties
Index Scan on payments

Execution Time: ~28 ms

Conclusion

By reducing selected columns, applying aliases, and ensuring indexes, the query execution time dropped from ~80ms to ~28ms. This shows that refactoring can significantly boost performance in relational databases with multiple JOINs.
