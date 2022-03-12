-- Menggabungkan 2 Database menjadi 1


CREATE TABLE car (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    price NUMERIC(19,2) NOT NULL
);

CREATE TABLE person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50) NOT NULL,
    car_id BIGINT REFERENCES car (id),
    UNIQUE(car_id)
);


insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (1, 'Joline', 'Gilding', 'Male', 'jgilding0@prweb.com', '5/31/2002', 'Philippines');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (2, 'Rozalie', 'Chartres', 'Male', 'rchartres1@wordpress.org', '10/4/1983', 'Peru');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (3, 'Janaye', 'Chastey', 'Female', 'jchastey2@msn.com', '7/27/2000', 'Israel');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (4, 'Clint', 'Sikorski', 'Male', 'csikorski3@geocities.jp', '4/10/1972', 'Tanzania');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (5, 'Eugenie', 'Fairlaw', 'Female', 'efairlaw4@themeforest.net', '3/27/1990', 'Canada');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (6, 'Laughton', 'Kelland', 'Female', 'lkelland5@mediafire.com', '9/5/1985', 'North Korea');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (7, 'Xavier', 'Ovens', 'Female', 'xovens6@storify.com', '4/2/2000', 'Poland');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (8, 'Krystle', 'Mardall', 'Female', 'kmardall7@go.com', '11/28/2006', 'Indonesia');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (9, 'Stern', 'Huyghe', 'Female', 'shuyghe8@amazon.com', '11/28/1971', 'Turkmenistan');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (10, 'Gifford', 'Hymers', 'Male', 'ghymers9@ibm.com', '9/5/2001', 'Brazil');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (11, 'Phineas', 'Chaperling', 'Female', 'pchaperlinga@com.com', '1/26/1973', 'Bosnia and Herzegovina');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (12, 'Jeralee', 'Mountstephen', 'Male', 'jmountstephenb@hao123.com', '11/26/1994', 'New Zealand');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (13, 'Willamina', 'Rawlinson', 'Male', 'wrawlinsonc@bing.com', '8/4/1998', 'Colombia');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (14, 'Rowney', 'Feldbau', 'Male', 'rfeldbaud@nps.gov', '5/20/1972', 'Norway');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (15, 'Becki', 'Kareman', 'Male', 'bkaremane@bravesites.com', '12/11/1994', 'Macedonia');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (16, 'Allina', 'Leary', 'Female', 'alearyf@macromedia.com', '7/27/1981', 'United States');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (17, 'Tomkin', 'Picott', 'Male', 'tpicottg@npr.org', '1/2/2010', 'Indonesia');
insert into person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (18, 'Arabelle', 'Rosingdall', 'Male', 'arosingdallh@ycombinator.com', '1/24/2007', 'Poland');


insert into car (id, make, model, price) values (1, 'Cadillac', 'CTS', 2026282);
insert into car (id, make, model, price) values (2, 'Mercedes-Benz', 'SL-Class', 6000206);
insert into car (id, make, model, price) values (3, 'Mazda', 'RX-8', 346815);
insert into car (id, make, model, price) values (4, 'GMC', 'Yukon XL 1500', 4825632);
insert into car (id, make, model, price) values (5, 'Maybach', '62', 688183);
insert into car (id, make, model, price) values (6, 'Jeep', 'Wrangler', 9624181);
insert into car (id, make, model, price) values (7, 'Volkswagen', 'Cabriolet', 457571);
insert into car (id, make, model, price) values (8, 'BMW', 'M6', 5364697);

-- INNER JOIN
-- Menampilakn Seluruh data dengan person.car_id == car.id
SELECT * FROM person JOIN car ON person.car_id = car.id;

-- LEFT JOIN 
-- Menampilkan Nilai keseluruhan person dan yang mengirisnya
SELECT * FROM person LEFT JOIN car ON person.car_id = car.id;
-- Menampilkan nilai person dimana yang nilai carnya kosong
SELECT * FROM person LEFT JOIN car ON person.car_id = car.id WHERE car.* IS NULL;

-- Export Menjadi bentuk file CSV
\copy (SELECT * FROM person LEFT JOIN car ON person.car_id = car.id) TO '/Users/Administrator/Downloads/result.csv' DELIMITER ',' CSV HEADER;