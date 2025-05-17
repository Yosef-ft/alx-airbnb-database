
-- Index User table

EXPLAIN ANALYZE SELECT * FROM users
WHERE email='john.doe@example.com';

-- Seq Scan on users  (cost=0.00..1.07 rows=1 width=188) (actual time=0.009..0.011 rows=1 loops=1)
--   Filter: ((email)::text = 'john.doe@example.com'::text)
--   Rows Removed by Filter: 5
-- Planning Time: 0.330 ms
-- Execution Time: 0.034 ms

CREATE INDEX idx_email ON users(email);


EXPLAIN ANALYZE SELECT * FROM users
WHERE email='john.doe@example.com';

-- Seq Scan on users  (cost=0.00..1.07 rows=1 width=188) (actual time=0.010..0.013 rows=1 loops=1)
--   Filter: ((email)::text = 'john.doe@example.com'::text)
--   Rows Removed by Filter: 5
-- Planning Time: 0.310 ms
-- Execution Time: 0.037 ms


SET enable_seqscan = OFF;
-- Index Scan using idx_email on users  (cost=0.13..8.15 rows=1 width=188) (actual time=0.060..0.061 rows=1 loops=1)
--   Index Cond: ((email)::text = 'john.doe@example.com'::text)
-- Planning Time: 0.359 ms
-- Execution Time: 0.085 ms



-- Index Booking table


EXPLAIN ANALYZE SELECT * FROM bookings
WHERE property_id = 'd4e5f6a7-b8c9-0123-4567-890abcdef123';

-- Seq Scan on bookings  (cost=0.00..1.09 rows=1 width=100) (actual time=0.008..0.010 rows=4 loops=1)
--   Filter: (property_id = 'd4e5f6a7-b8c9-0123-4567-890abcdef123'::uuid)
--   Rows Removed by Filter: 3
-- Planning Time: 0.361 ms
-- Execution Time: 0.036 ms


CREATE INDEX idx_booking_property_id on bookings(property_id);


EXPLAIN ANALYZE SELECT * FROM bookings
WHERE property_id = 'd4e5f6a7-b8c9-0123-4567-890abcdef123';

-- Seq Scan on bookings  (cost=0.00..1.09 rows=1 width=100) (actual time=0.006..0.008 rows=4 loops=1)
--   Filter: (property_id = 'd4e5f6a7-b8c9-0123-4567-890abcdef123'::uuid)
--   Rows Removed by Filter: 3
-- Planning Time: 0.293 ms
-- Execution Time: 0.026 ms


SET enable_seqscan = OFF;
-- Index Scan using idx_booking_property_id on bookings  (cost=0.13..8.15 rows=1 width=100) (actual time=0.056..0.058 rows=4 loops=1)
--   Index Cond: (property_id = 'd4e5f6a7-b8c9-0123-4567-890abcdef123'::uuid)
-- Planning Time: 0.323 ms
-- Execution Time: 0.081 ms


-- Index properties table


EXPLAIN ANALYZE SELECT * FROM properties
WHERE property_id = 'd4e5f6a7-b8c9-0123-4567-890abcdef123';

-- Seq Scan on properties  (cost=0.00..1.05 rows=1 width=176) (actual time=0.008..0.010 rows=1 loops=1)
--   Filter: (property_id = 'd4e5f6a7-b8c9-0123-4567-890abcdef123'::uuid)
--   Rows Removed by Filter: 3
-- Planning Time: 0.292 ms
-- Execution Time: 0.034 ms

CREATE INDEX idx_properties_property_id on properties(property_id);


EXPLAIN ANALYZE SELECT * FROM properties
WHERE property_id = 'd4e5f6a7-b8c9-0123-4567-890abcdef123';

-- Seq Scan on properties  (cost=0.00..1.05 rows=1 width=176) (actual time=0.005..0.006 rows=1 loops=1)
--   Filter: (property_id = 'd4e5f6a7-b8c9-0123-4567-890abcdef123'::uuid)
--   Rows Removed by Filter: 3
-- Planning Time: 0.242 ms
-- Execution Time: 0.022 ms


SET enable_seqscan = OFF;
-- Index Scan using idx_properties_property_id on properties  (cost=0.13..8.15 rows=1 width=176) (actual time=0.067..0.069 rows=1 loops=1)
--   Index Cond: (property_id = 'd4e5f6a7-b8c9-0123-4567-890abcdef123'::uuid)
-- Planning Time: 0.338 ms
-- Execution Time: 0.098 ms
