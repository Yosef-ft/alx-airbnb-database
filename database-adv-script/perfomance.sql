
-- Initial query: retrieves all bookings along with the user details, property details, and payment details

SELECT * from bookings
INNER JOIN users on bookings.user_id = users.user_id
INNER JOIN properties on properties.property_id = bookings.property_id
INNER JOIN payments on payments.booking_id = bookings.booking_id;


-- Query performance
EXPLAIN ANALYZE SELECT * from bookings
INNER JOIN users on bookings.user_id = users.user_id
INNER JOIN properties on properties.property_id = bookings.property_id
INNER JOIN payments on payments.booking_id = bookings.booking_id;

-- Output
-- Hash Join  (cost=3.44..24.44 rows=780 width=540) (actual time=0.144..0.149 rows=4 loops=1)
--   Hash Cond: (payments.booking_id = bookings.booking_id)
--   ->  Seq Scan on payments  (cost=0.00..17.80 rows=780 width=76) (actual time=0.006..0.006 rows=4 loops=1)
--   ->  Hash  (cost=3.35..3.35 rows=7 width=464) (actual time=0.084..0.085 rows=7 loops=1)
--         Buckets: 1024  Batches: 1  Memory Usage: 11kB
--         ->  Hash Join  (cost=2.22..3.35 rows=7 width=464) (actual time=0.061..0.071 rows=7 loops=1)
--               Hash Cond: (bookings.property_id = properties.property_id)
--               ->  Hash Join  (cost=1.14..2.23 rows=7 width=288) (actual time=0.035..0.042 rows=7 loops=1)
--                     Hash Cond: (bookings.user_id = users.user_id)
--                     ->  Seq Scan on bookings  (cost=0.00..1.07 rows=7 width=100) (actual time=0.003..0.004 rows=7 loops=1)
--                     ->  Hash  (cost=1.06..1.06 rows=6 width=188) (actual time=0.009..0.010 rows=6 loops=1)
--                           Buckets: 1024  Batches: 1  Memory Usage: 9kB
--                           ->  Seq Scan on users  (cost=0.00..1.06 rows=6 width=188) (actual time=0.003..0.004 rows=6 loops=1)
--               ->  Hash  (cost=1.04..1.04 rows=4 width=176) (actual time=0.010..0.010 rows=4 loops=1)
--                     Buckets: 1024  Batches: 1  Memory Usage: 9kB
--                     ->  Seq Scan on properties  (cost=0.00..1.04 rows=4 width=176) (actual time=0.003..0.004 rows=4 loops=1)
-- Planning Time: 1.327 ms
-- Execution Time: 0.263 ms



-- Refactored Query: Optimized query with indexing

CREATE INDEX idx_user_id ON users(user_id);
CREATE INDEX idx_booking_booking_id on bookings(booking_id);

EXPLAIN ANALYZE SELECT b.booking_id, u.user_id, u.first_name, p.property_id, p.name, pay.payment_id, pay.amount
 from bookings b
INNER JOIN users u on b.user_id = u.user_id
INNER JOIN properties p on p.property_id = b.property_id
INNER JOIN payments pay on pay .booking_id = b.booking_id;


-- Hash Join  (cost=3.44..24.44 rows=780 width=160) (actual time=0.111..0.115 rows=4 loops=1)
--   Hash Cond: (pay.booking_id = b.booking_id)
--   ->  Seq Scan on payments pay  (cost=0.00..17.80 rows=780 width=64) (actual time=0.003..0.004 rows=4 loops=1)
--   ->  Hash  (cost=3.35..3.35 rows=7 width=112) (actual time=0.066..0.067 rows=7 loops=1)
--         Buckets: 1024  Batches: 1  Memory Usage: 9kB
--         ->  Hash Join  (cost=2.22..3.35 rows=7 width=112) (actual time=0.055..0.062 rows=7 loops=1)
--               Hash Cond: (b.property_id = p.property_id)
--               ->  Hash Join  (cost=1.14..2.23 rows=7 width=80) (actual time=0.030..0.035 rows=7 loops=1)
--                     Hash Cond: (b.user_id = u.user_id)
--                     ->  Seq Scan on bookings b  (cost=0.00..1.07 rows=7 width=48) (actual time=0.002..0.003 rows=7 loops=1)
--                     ->  Hash  (cost=1.06..1.06 rows=6 width=48) (actual time=0.009..0.009 rows=6 loops=1)
--                           Buckets: 1024  Batches: 1  Memory Usage: 9kB
--                           ->  Seq Scan on users u  (cost=0.00..1.06 rows=6 width=48) (actual time=0.003..0.004 rows=6 loops=1)
--               ->  Hash  (cost=1.04..1.04 rows=4 width=48) (actual time=0.012..0.012 rows=4 loops=1)
--                     Buckets: 1024  Batches: 1  Memory Usage: 9kB
--                     ->  Seq Scan on properties p  (cost=0.00..1.04 rows=4 width=48) (actual time=0.004..0.006 rows=4 loops=1)
-- Planning Time: 0.935 ms
-- Execution Time: 0.198 ms