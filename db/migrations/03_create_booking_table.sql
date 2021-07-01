CREATE TABLE booking(id SERIAL PRIMARY KEY, property_id int NOT NULL, user_id int NOT NULL, check_in DATE, check_out DATE, status boolean DEFAULT FALSE,
CONSTRAINT fk_property_id FOREIGN KEY (property_id) REFERENCES property (id),
CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (id));