CREATE TABLE addresses(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE categories(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(10) NOT NULL
);

CREATE TABLE clients(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	full_name VARCHAR(50) NOT NULL,
	phone_number VARCHAR(50) NOT NULL
);

CREATE TABLE drivers (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	age INT NOT NULL,
	CONSTRAINT ck_drivers_age CHECK (age > 0),
	rating NUMERIC(3, 2) DEFAULT 5.5
);


CREATE TABLE cars(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	make VARCHAR(20) NOT NULL,
	model VARCHAR(20),
	year INT DEFAULT 1 NOT NULL,
	mileage INT DEFAULT 1,
	condition CHAR(1) NOT NULL,
	category_id INT NOT NULL,

	CONSTRAINT fk_cars_categories FOREIGN KEY (category_id) REFERENCES categories(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	CONSTRAINT ck_cars_year
	CHECK (year > 0),

	CONSTRAINT ck_cars_mileage
	CHECK (mileage > 0)
);

CREATE TABLE courses(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	from_address_id INT NOT NULL,
		CONSTRAINT fk_courses_addresses FOREIGN KEY (from_address_id) REFERENCES addresses(id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	start TIMESTAMP NOT NULL,
	bill NUMERIC(10, 2) DEFAULT 10,

	CONSTRAINT ck_courses_bill
		CHECK (bill > 0),

	car_id INT NOT NULL,
		CONSTRAINT fk_courses_cars FOREIGN KEY (car_id) REFERENCES cars(id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	client_id INT NOT NULL,
		CONSTRAINT fk_courses_clients FOREIGN KEY (client_id )REFERENCES clients(id)
			ON UPDATE CASCADE
			ON DELETE CASCADE
);

CREATE TABLE cars_drivers(
	car_id INT NOT NULL,
	driver_id INT NOT NULL,

	--CONSTRAINT pk_cars_drivers
		--PRIMARY KEY(car_id, driver_id),
	CONSTRAINT fk_cars_drivers_cars
		FOREIGN KEY(car_id)
		REFERENCES cars(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT fk_scars_drivers_drivers
		FOREIGN KEY(driver_id)
		REFERENCES drivers(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);