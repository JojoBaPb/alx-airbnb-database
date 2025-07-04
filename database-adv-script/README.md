## Joins Queries

In this section, it is demonstrated how the use of SQL joins to combine data across related tables in the Airbnb database:

1. **INNER JOIN**: Used to fetch only the bookings that are linked to existing users. This ensures that only complete relationships (bookings with valid users) are retrieved.

2. **LEFT JOIN**: Retrieves all properties and their associated reviews. Properties without reviews are still included in the result, showcasing how we can preserve data from the left table even if no match is found on the right.

3. **FULL OUTER JOIN**: Combines the entire users and bookings tables. This query ensures we also capture users who haven't made any bookings and bookings that may not be linked to a user (e.g., due to data issues or anonymized history).

Each query is crafted to mirror realistic scenarios encountered in production database systems where insights must be extracted from incomplete or partially related datasets.

## Subqueries

This section demonstrates the use of subqueries to filter and analyze relational data:

1. **Non-Correlated Subquery**: Retrieves all properties whose average review rating exceeds 4.0. The subquery groups reviews by `property_id` and uses `HAVING AVG(rating) > 4.0` to filter out lower-rated properties. The outer query fetches property details for the filtered IDs.

2. **Correlated Subquery**: Identifies users who have made more than three bookings. The subquery counts the number of bookings for each user by referencing the outer query’s `users.id`, making it correlated. Only users with more than 3 associated bookings are returned.

These subqueries illustrate powerful ways to perform nested analysis, especially when filtering based on aggregates or related entity counts.

## Aggregations and Window Functions

This section explores SQL features that allow for statistical analysis and ranked outputs:

1. **Aggregation with COUNT & GROUP BY**: Calculates the total number of bookings per user. A `LEFT JOIN` ensures even users with zero bookings are included. The `GROUP BY` clause organizes results by user, and the output is ordered by booking count in descending order.

2. **Window Functions with RANK() and ROW_NUMBER()**: We use both `RANK()` and `ROW_NUMBER()` to rank properties based on total bookings. `RANK()` allows ties (same rank for equal counts), while `ROW_NUMBER()` provides a strict sequential order with no duplicates. These techniques help compare popularity among properties.

These techniques are useful for producing leaderboards, reports, and business intelligence dashboards in real-world applications.

