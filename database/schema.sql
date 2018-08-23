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
address varchar(256) NOT NULL,
photo_reference text NOT NULL,
constraint pk_place primary key(google_place_id)
);

CREATE TABLE coffee(
coffee_id serial,
coffee_name varchar(256) NOT NULL,
origin varchar(256) NOT NULL,
roaster varchar(256) NOT NULL,
detail text,
constraint pk_coffee primary key(coffee_id)
); 

CREATE TABLE review(
review_id serial,
rating int NOT NULL,
detail text NOT NULL,
review_date Date NOT NULL DEFAULT CURRENT_DATE,
constraint pk_review primary key(review_id)
)

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

COMMIT;