-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;

CREATE TABLE app_user (
  id SERIAL PRIMARY KEY,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32),
  salt varchar(255) NOT NULL
);

CREATE TABLE place(
google_place_id text,
coffee_shop_name varchar(256) NOT NULL,
constraint pk_place primary key(google_place_id)
);

CREATE TABLE coffee(
coffee_id serial,
coffee_name varchar(256) NOT NULL,
origin varchar(256),
roaster varchar(256),
detail text,
constraint pk_coffee primary key(coffee_id)
); 

CREATE TABLE review(
review_id serial,
rating int NOT NULL,
detail text NOT NULL,
review_date Date NOT NULL DEFAULT CURRENT_DATE,
constraint pk_review primary key(review_id)
);

CREATE TABLE place_coffee(
google_place_id text,
coffee_id int,
  CONSTRAINT pk_place_coffee PRIMARY KEY (google_place_id, coffee_id),
  CONSTRAINT fkey_google_place_id FOREIGN KEY (google_place_id)
      REFERENCES place (google_place_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkey_coffee_id FOREIGN KEY (coffee_id)
      REFERENCES coffee (coffee_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION 
);


CREATE TABLE coffee_review(
coffee_id int,
review_id int,
 CONSTRAINT pk_coffee_review PRIMARY KEY (coffee_id, review_id),
  CONSTRAINT fkey_coffee_id FOREIGN KEY (coffee_id)
      REFERENCES coffee (coffee_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkey_review_id FOREIGN KEY (review_id)
      REFERENCES review (review_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION 
);

CREATE TABLE user_review(
user_id int,
review_id int,
 CONSTRAINT pk_user_review PRIMARY KEY (user_id, review_id),
  CONSTRAINT fkey_user_id FOREIGN KEY (user_id)
      REFERENCES app_user (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkey_review_id FOREIGN KEY (review_id)
      REFERENCES review (review_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION 
);

CREATE TABLE user_place(
user_id int,
google_place_id text,
 CONSTRAINT pk_user_place PRIMARY KEY (user_id, google_place_id),
  CONSTRAINT fkey_user_id FOREIGN KEY (user_id)
      REFERENCES app_user (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkey_place_id FOREIGN KEY (google_place_id)
      REFERENCES place (google_place_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION 
);

INSERT INTO place (google_place_id, coffee_shop_name) VALUES
('ChIJTfpr7Qj0NIgR7SfLYDcWJYc', 'MF Café at the Mattress Factory'),
('ChIJbarnmffzNIgRTTHTIIPolZg', 'J.R. Coffee Shop'),
('ChIJMc6ClVfxNIgRQmfbTZlgI2s', 'Crazy Mocha'),
('ChIJ2ZMPVPjzNIgRtFQHM-vRKYg', 'Big Red Room Cafe'),
('ChIJoYdANg_0NIgRPb8Dh39XL-Y', 'Commonplace Coffee MWS'),
('ChIJxw4q8gP0NIgRe9Z24doswug', 'Starbucks'),
('ChIJM1AdkfnzNIgRzGK6WKZ5-k8', 'The Flying Dutchman Cafe');

INSERT INTO coffee (coffee_name, origin, roaster, detail) VALUES
('Espresso Blend', 'Blend', 'Crazy Mocha', 'A blend of medium-roasted Ethiopian, Brazilian, Sumatran and Tanzanian beans created to stand out in lattes and cappuccinos, but tastes great on its own.'),
('House Blend', 'Blend', 'Crazy Mocha', 'A blend of Honduran and Nicaraguan coffees with chocolate overtones and medium citrus acidity, creating an excellent "wake me up" cup to start your day. Medium roast.'),
('Summer Blend', 'Blend', 'Crazy Mocha', 'It is easy to understand why our Summer Blend is a favorite. The warm, deep partnership of aromas in beans sourced from Costa Rica, Brazil, and Guatemala allow this blend to stand well alone as an americano or paired with a light biscotti. Full city roast.'),
('Ethiopian Natural', 'Ethiopia', 'Crazy Mocha', 'Our most popular single-origin bean, Ethiopian Natural offers a fresh sip with fruity cocoa undertones. Dark roast.'),
('Breakfast Blend', 'Blend', 'Starbucks', 'A lively and lighter roast with a crisp finish.'),
('Pike Place Blend', 'Blend', 'Starbucks', 'Well-rounded with subtle notes of cocoa and toasted nuts balancing the smooth mouthfeel.'),
('Sumatra', 'Blend', 'Starbucks', 'Full-bodied with a smooth mouthfeel and lingering herbal flavors. Stands up well to savory foods.'),
('Veranda Blend', 'Blend', 'Starbucks', 'Subtle with delicate nuances of soft cocoa and lightly toasted nuts.'),
('Heartmender Espresso', 'Blend', 'Commonplace Coffee', 'Creamy, big bodied and smooth. Good for bigger milk drinks or a heavier standalone shot.'),
('Perpetual Espresso', 'Blend', 'Commonplace Coffee', 'Nutty, cocoa balance. Our flagship espresso, perfect for straight shots or small milk drinks.'),
('Mormora', 'Ethiopia', 'Commonplace Coffee', 'Berries and lemon with an herbaceous finish.'),
('Kunjin', 'Papua New Guinea', 'Commonplace Coffee','Milk chocolate with a syrupy body and satisfying tartness.'),
('El Arbol', 'Colombia', 'Commonplace Coffee', 'Floral and fruity with a distinctive body and whiskey finish.');

INSERT INTO place_coffee (google_place_id, coffee_id) VALUES
('ChIJMc6ClVfxNIgRQmfbTZlgI2s', 1),
('ChIJMc6ClVfxNIgRQmfbTZlgI2s', 2),
('ChIJMc6ClVfxNIgRQmfbTZlgI2s', 3),
('ChIJMc6ClVfxNIgRQmfbTZlgI2s', 4),
('ChIJxw4q8gP0NIgRe9Z24doswug', 5),
('ChIJxw4q8gP0NIgRe9Z24doswug', 6),
('ChIJxw4q8gP0NIgRe9Z24doswug', 7),
('ChIJxw4q8gP0NIgRe9Z24doswug', 8),
('ChIJoYdANg_0NIgRPb8Dh39XL-Y', 9),
('ChIJoYdANg_0NIgRPb8Dh39XL-Y', 10),
('ChIJoYdANg_0NIgRPb8Dh39XL-Y', 11),
('ChIJoYdANg_0NIgRPb8Dh39XL-Y', 12),
('ChIJoYdANg_0NIgRPb8Dh39XL-Y', 13);

COMMIT;
