
-- All properties where the average rating is greater than 4.0


SELECT * from properties 
where properties.property_id IN(
  SELECT property_id
  from reviews 
  GROUP BY property_id
  HAVING avg(rating) > 4
);

-- Users who have made more than 3 bookings

SELECT * FROM users
where user_id IN (
  SELECT  user_id
  from bookings
  group by user_id
  having count(user_id) > 3
);


