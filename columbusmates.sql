CREATE DATABASE columbusmates;

CREATE TABLE trips (
  id serial4 PRIMARY KEY,
  destination VARCHAR(400),
  start_date TEXT,
  duration TEXT,
  trip_type_id INTEGER,
  image_url TEXT,
  min_mate_number INTEGER,
  max_mate_number INTEGER,
  second_image_url TEXT,
  user_id INTEGER

);

CREATE TABLE users (
  id serial4 PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INTEGER,
  nationality TEXT,
  email VARCHAR(300),
  password_digest VARCHAR (400),
  username VARCHAR(100) NOT NULL,
  surname VARCHAR (100) NOT NULL

);

CREATE TABLE trip_types (
  id serial4 PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);




-- Insert trip types to start

INSERT INTO trip_types (name) VALUES ('Backpacking');
INSERT INTO trip_types (name) VALUES ('Adventure');
INSERT INTO trip_types (name) VALUES ('Luxory');

-- Insert a second picture in the trip table

ALTER TABLE trips ADD COLUMN second_image_url TEXT;

-- Insert 1 trips to start

INSERT INTO trips (destination, start_date, duration,
trip_type_id, image_url, min_mate_number,max_mate_number,trip_mate_id, second_image_url, user_id )
VALUES ('Thailand', '01/12/2016', '15 days', 1, 'http://www2.padi.com/blog/wp-content/uploads/2015/07/thailand-krabi.jpg', 3, 6, 3, 'http://newmedia.thomson.co.uk/live/vol/0/921d4b57639916341dfa76e38310ff7bc13b11e2/1080x608/web/ASIAFAREASTTHAILANDTHAILANDDES_000423KHAOLAKRES_002378.jpg', 1);

CREATE TABLE comments (
  id SERIAL4 PRIMARY KEY,
  body TEXT,
  user_id INTEGER
);
