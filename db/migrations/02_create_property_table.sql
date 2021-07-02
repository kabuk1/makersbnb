CREATE TABLE property(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(200), price INT, location VARCHAR(60));
ALTER TABLE property ADD COLUMN from_date DATE;
ALTER TABLE property ADD COLUMN to_date DATE;
ALTER TABLE property ADD COLUMN user_id INTEGER;
ALTER TABLE property ADD FOREIGN KEY (user_id) REFERENCES users (id);



UPDATE property SET description = 'Studio on the beach', location = 'Ocean City', price = 200, from_date = '2021-01-08', to_date = '2021-10-08' WHERE id=3;
UPDATE property SET description = 'Cabin on the lake with a boat', location = 'Lake City', price = 150, from_date = '2021-01-09', to_date = '2021-10-09' WHERE id=2;
INSERT INTO property(name, description, price, location, from_date, to_date) VALUES ('Riverside','Cabin with a river view', 100, 'River City', '2021-01-11', '2021-10-11'; 
INSERT INTO property(name, description, price, location, from_date, to_date) VALUES ('Oceanside','Studio on the beach', 200, 'Ocean City', '2021-01-08', '2021-10-08');