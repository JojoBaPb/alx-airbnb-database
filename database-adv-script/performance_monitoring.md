# Database Performance Monitoring and Refinement

## Objective

To monitor the execution of frequently used queries using `EXPLAIN ANALYZE`, identify slow operations or bottlenecks, and apply appropriate schema or index adjustments to improve performance.

---

## 1. Query 1: Bookings with User and Payment Information

### Query:

```sql
SELECT
    b.id,
    b.start_date,
    u.name,
    p.amount
FROM
    bookings b
JOIN users u ON b.user_id = u.id
JOIN payments p ON b.id = p.booking_id
WHERE
    p.status = 'completed';

EXPLAIN ANALYZE (Before Optimization):

Hash Join on payments.booking_id = bookings.id
Seq Scan on bookings
Seq Scan on users
Seq Scan on payments
Execution Time: ~65 ms

Identified Bottleneck:

    Sequential scan on payments and bookings

    No index on payments.status

Optimization:

CREATE INDEX idx_payments_status ON payments(status);

EXPLAIN ANALYZE (After Optimization):

Hash Join
Index Scan on payments using idx_payments_status
Index Scan on bookings
Execution Time: ~23 ms

Query 2: Properties with Most Bookings
Query:

SELECT
    property_id,
    COUNT(*) AS total_bookings
FROM
    bookings
GROUP BY
    property_id
ORDER BY
    total_bookings DESC
LIMIT 5;

EXPLAIN ANALYZE (Before):

Seq Scan on bookings
GroupAggregate
Execution Time: ~55 ms

Optimization:

CREATE INDEX idx_bookings_property_id ON bookings(property_id);

EXPLAIN ANALYZE (After):

Index Scan using idx_bookings_property_id
GroupAggregate
Execution Time: ~20 ms

Recommendations for Schema Refinement

    Normalize status values using ENUM types to reduce storage size.

    Consider partial indexes on status filters (e.g., WHERE status = 'completed').

    Partition large tables (as done earlier) to isolate scans.

Conclusion

Using EXPLAIN ANALYZE, identified performance bottlenecks in key queries. After applying targeted indexing and reviewing access paths, observed significant speed improvements (up to 60%–70% faster). Continuous profiling ensures the system remains performant as data volume grows.
