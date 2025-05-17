
-- Inner join: fetch all bookings and respective users 

SELECT users.first_name, users.last_name,
bookings.start_date, bookings.end_date, bookings.status, bookings.total_price
FROM users INNER JOIN bookings
on users.user_id = bookings.user_id;



-- Left Join: retrieve all properties and their reviews

SELECT properties.name, properties.description, properties.location,
properties.location, properties.price_per_night,
reviews.comment, reviews.rating FROM properties
LEFT JOIN reviews on reviews.property_id = properties.property_id
ORDER BY rating DESC;


-- Full outer join: retrieve all users and all bookings

SELECT users.first_name, users.last_name,
bookings.start_date, bookings.end_date, bookings.status, bookings.total_price
FROM users FULL OUTER JOIN bookings
on users.user_id = bookings.user_id;