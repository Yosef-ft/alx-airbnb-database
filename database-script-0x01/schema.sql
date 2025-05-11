
CREATE TYPE role_type AS ENUM ('guest', 'host', 'admin');
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');
CREATE TYPE payment_method_type AS ENUM ('credit_card', 'paypal', 'stripe');



CREATE TABLE users (
  user_id uuid PRIMARY KEY NOT NULL,
  first_name varchar NOT NULL,
  last_name varchar NOT NULL,
  email varchar UNIQUE NOT NULL,
  password_hash varchar NOT NULL,
  phone_number varchar NOT NULL,
  role role_type NOT NULL
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL
);


CREATE TABLE properties (
  property_id uuid PRIMARY KEY NOT NULL,
  host_id uuid NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  name varchar NOT NULL,
  description text NOT NULL,
  location varchar NOT NULL,
  price_per_night decimal NOT NULL,
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMPTZ
);


CREATE TABLE bookings (
  booking_id uuid PRIMARY KEY NOT NULL,
  property_id uuid NOT NULL REFERENCES properties(property_id) ON DELETE CASCADE,
  user_id uuid NOT NULL REFERENCES users(user_id) ON DELETE RESTRICT,
  start_date date NOT NULL,
  end_date date NOT NULL,
  total_price decimal NOT NULL,
  status booking_status NOT NULL,
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CHECK (end_date > start_date)
);


CREATE TABLE payments (
  payment_id uuid PRIMARY KEY NOT NULL,
  booking_id uuid NOT NULL REFERENCES bookings(booking_id) ON DELETE CASCADE,
  amount decimal NOT NULL,
  payment_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
  payment_method payment_method_type NOT NULL
);


CREATE TABLE reviews (
  review_id uuid PRIMARY KEY NOT NULL,
  property_id uuid NOT NULL REFERENCES properties(property_id) ON DELETE CASCADE,
  user_id uuid NOT NULL REFERENCES users(user_id) ON DELETE RESTRICT,
  rating integer NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment text NOT NULL,
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL
);


CREATE TABLE messages (
  message_id uuid PRIMARY KEY NOT NULL,
  sender_id uuid NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  recipient_id uuid NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  message_body text NOT NULL,
  sent_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL
);


CREATE INDEX idx_email ON users(email);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_payment_booking_id ON payments(booking_id);
CREATE INDEX idx_booking_dates ON bookings(start_date, end_date);