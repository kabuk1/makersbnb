CREATE TABLE property(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(200), price INT, location VARCHAR(60));
ALTER TABLE property ADD COLUMN from_date DATE;
ALTER TABLE property ADD COLUMN to_date DATE;