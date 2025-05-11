# Database Schema Description

This document describes the database schema for the application.

## Enums

### role_type
- `guest`
- `host`
- `admin`

### booking_status
- `pending`
- `confirmed`
- `canceled`

### payment_method_type
- `credit_card`
- `paypal`
- `stripe`

## Tables

### users

| Column        | Type           | Modifiers                     |
| ------------- | -------------- | ----------------------------- |
| user_id       | uuid           | PRIMARY KEY NOT NULL          |
| first_name    | varchar        | NOT NULL                      |
| last_name     | varchar        | NOT NULL                      |
| email         | varchar        | UNIQUE NOT NULL               |
| password_hash | varchar        | NOT NULL                      |
| phone_number  | varchar        | NOT NULL                      |
| role          | role_type      | NOT NULL                      |
| created_at    | TIMESTAMPTZ    | DEFAULT CURRENT_TIMESTAMP NOT NULL |

**Indexes:**
- `idx_email` on `email`

### properties

| Column        | Type           | Modifiers                     |
| ------------- | -------------- | ----------------------------- |
| property_id   | uuid           | PRIMARY KEY NOT NULL          |
| host_id       | uuid           | NOT NULL REFERENCES users(user_id) ON DELETE CASCADE |
| name          | varchar        | NOT NULL                      |
| description   | text           | NOT NULL                      |
| location      | varchar        | NOT NULL                      |
| price_per_night| decimal        | NOT NULL                      |
| created_at    | TIMESTAMPTZ    | DEFAULT CURRENT_TIMESTAMP NOT NULL |
| updated_at    | TIMESTAMPTZ    |                               |

### bookings

| Column     | Type        | Modifiers                                  |
| ---------- | ----------- | ------------------------------------------ |
| booking_id | uuid        | PRIMARY KEY NOT NULL                       |
| property_id| uuid        | NOT NULL REFERENCES properties(property_id) ON DELETE CASCADE |
| user_id    | uuid        | NOT NULL REFERENCES users(user_id) ON DELETE RESTRICT |
| start_date | date        | NOT NULL                                   |
| end_date   | date        | NOT NULL                                   |
| total_price| decimal     | NOT NULL                                   |
| status     | booking_status| NOT NULL                                   |
| created_at | TIMESTAMPTZ | DEFAULT CURRENT_TIMESTAMP NOT NULL        |


**Indexes:**
- `idx_booking_property_id` on `property_id`
- `idx_booking_dates` on `start_date, end_date`

### payments

| Column       | Type              | Modifiers                               |
| ------------ | ----------------- | --------------------------------------- |
| payment_id  | uuid              | PRIMARY KEY NOT NULL                    |
| booking_id  | uuid              | NOT NULL REFERENCES bookings(booking_id) ON DELETE CASCADE |
| amount      | decimal           | NOT NULL                                |
| payment_date| TIMESTAMPTZ       | DEFAULT CURRENT_TIMESTAMP NOT NULL     |
| payment_method| payment_method_type| NOT NULL                                |

**Indexes:**
- `idx_payment_booking_id` on `booking_id`

### reviews

| Column    | Type     | Modifiers                                  |
| --------- | -------- | ------------------------------------------ |
| review_id | uuid     | PRIMARY KEY NOT NULL                       |
| property_id| uuid     | NOT NULL REFERENCES properties(property_id) ON DELETE CASCADE |
| user_id   | uuid     | NOT NULL REFERENCES users(user_id) ON DELETE RESTRICT |
| rating    | integer  | NOT NULL CHECK (rating >= 1 AND rating <= 5) |
| comment   | text     | NOT NULL                                   |
| created_at| TIMESTAMPTZ| DEFAULT CURRENT_TIMESTAMP NOT NULL        |

### messages

| Column       | Type        | Modifiers                                  |
| ------------ | ----------- | ------------------------------------------ |
| message_id | uuid        | PRIMARY KEY NOT NULL                       |
| sender_id  | uuid        | NOT NULL REFERENCES users(user_id) ON DELETE CASCADE |
| recipient_id| uuid        | NOT NULL REFERENCES users(user_id) ON DELETE CASCADE |
| message_body| text        | NOT NULL                                   |
| sent_at    | TIMESTAMPTZ | DEFAULT CURRENT_TIMESTAMP NOT NULL        |
