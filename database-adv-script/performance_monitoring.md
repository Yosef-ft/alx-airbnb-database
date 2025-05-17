## Performance monitoring 

This report summarizes the findings and suggestions for optimizing the SQL queries.

### aggregations\_and\_window\_functions.sql

*   The query `SELECT count(booking_id), user_id FROM bookings GROUP BY user_id;` could benefit from an index on the `user_id` column in the `bookings` table.
*   The query that ranks properties based on the total number of bookings joins the `bookings` and `properties` tables. To optimize this, we can add indexes on the join columns, `properties.property_id` and `bookings.property_id`.

### joins\_queries.sql

*   The inner join between `users` and `bookings` on `users.user_id = bookings.user_id` can be optimized by ensuring there are indexes on `users.user_id` and `bookings.user_id`.
*   The left join between `properties` and `reviews` on `reviews.property_id = properties.property_id` can be optimized by ensuring there are indexes on `reviews.property_id` and `properties.property_id`.
*   The full outer join between `users` and `bookings` on `users.user_id = bookings.user_id` can be optimized by ensuring there are indexes on `users.user_id` and `bookings.user_id`.

### subqueries.sql

*   The query that selects properties where the average rating is greater than 4.0 can be optimized by adding an index on the `property_id` column in the `reviews` table.
*   The query that selects users who have made more than 3 bookings can be optimized by adding an index on the `user_id` column in the `bookings` table.

### General Recommendations

*   Creating indexes on:
    * `users.user_id`
    * `bookings.user_id`
*   Selecting only the necessary columns in queries can improve performance.
*   Partitioning large tables by date can improve query performance for date-based queries.
