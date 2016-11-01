CREATE DATABASE columbusmates;

CREATE TABLE trips (
  id serial4 PRIMARY KEY,
  destination VARCHAR(400),
  start_date TEXT,
  duration TEXT,
  trip_type_id INTEGER,
  image_url TEXT,
  trip_host_id INTEGER,
  min_mate_number INTEGER,
  max_mate_number INTEGER,
  trip_mate_id INTEGER

);

CREATE TABLE users (
  id serial4 PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INTEGER,
  nationality TEXT,
  email VARCHAR(300),
  -- password_digest VARCHAR (400)

);

CREATE TABLE trip_types (
  id serial4 PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);


-- Insert three users to start

INSERT INTO users (name, age, nationality, email) VALUES ('brunorampi',27,'Italy','brunorampinellirota@gmail.com');
INSERT INTO users (name, age, nationality, email) VALUES ('pedro',30,'Brazil','pedro@gmail.com');
INSERT INTO users (name, age, nationality, email) VALUES ('jason',26,'Mauritius','jason@gmail.com');

-- Insert trip types to start

INSERT INTO trip_types (name) VALUES ('Backpacking');
INSERT INTO trip_types (name) VALUES ('Adventure');
INSERT INTO trip_types (name) VALUES ('Luxory');

-- Insert a second picture in the trip table

ALTER TABLE trips ADD COLUMN second_image_url TEXT;

-- Insert 1 trips to start

INSERT INTO trips (destination, start_date, duration,
trip_type_id, image_url, trip_host_id,min_mate_number,max_mate_number,trip_mate_id, second_image_url )
VALUES ('Thailand', '01/12/2016', '15 days', 1, 'http://www2.padi.com/blog/wp-content/uploads/2015/07/thailand-krabi.jpg', 2, 3, 6, 3, 'http://newmedia.thomson.co.uk/live/vol/0/921d4b57639916341dfa76e38310ff7bc13b11e2/1080x608/web/ASIAFAREASTTHAILANDTHAILANDDES_000423KHAOLAKRES_002378.jpg');
