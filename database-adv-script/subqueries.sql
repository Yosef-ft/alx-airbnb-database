
-- All properties WHERE the average rating is greater than 4.0


SELECT * from properties 
WHERE properties.property_id IN(
  SELECT property_id
  from reviews 
  GROUP BY property_id
  HAVING AVG(rating) > 4
);

-- Users who have made more than 3 bookings

SELECT * FROM users
WHERE user_id IN (
  SELECT  user_id
  from bookings
  group by user_id
  having COUNT(user_id) > 3
);


