## Joins Queries

In this section, it is demonstrated how the use of SQL joins to combine data across related tables in the Airbnb database:

1. **INNER JOIN**: Used to fetch only the bookings that are linked to existing users. This ensures that only complete relationships (bookings with valid users) are retrieved.

2. **LEFT JOIN**: Retrieves all properties and their associated reviews. Properties without reviews are still included in the result, showcasing how we can preserve data from the left table even if no match is found on the right.

3. **FULL OUTER JOIN**: Combines the entire users and bookings tables. This query ensures we also capture users who haven't made any bookings and bookings that may not be linked to a user (e.g., due to data issues or anonymized history).

Each query is crafted to mirror realistic scenarios encountered in production database systems where insights must be extracted from incomplete or partially related datasets.

