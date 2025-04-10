CREATE TABLE planets (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE spaceships (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(60) NOT NULL UNIQUE,
	manufacturer VARCHAR(50),
	speed INT NOT NULL DEFAULT 1000
);

CREATE TABLE colonists (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	identity CHAR(10) NOT NULL UNIQUE,
	birth_date DATE NOT NULL
);

CREATE TABLE stations (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	max_capacity INT NOT NULL,
	planet_id INT NOT NULL,

	CONSTRAINT ck_max_capacity
		CHECK (max_capacity >= 0),

	CONSTRAINT fk_stations_planets FOREIGN KEY (planet_id) REFERENCES planets(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE journeys (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	start_time TIMESTAMP,
	end_time TIMESTAMP,
	purpose VARCHAR(8) NOT NULL,
	station_id INT NOT NULL,
	spaceship_id INT NOT NULL,

	CONSTRAINT ck_purpose
		CHECK (purpose IN ('Civil', 'Military')),

	CONSTRAINT fk_journeys_stations FOREIGN KEY (station_id) REFERENCES stations (id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	CONSTRAINT fk_journeys_spaceships FOREIGN KEY (spaceship_id) REFERENCES spaceships(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE assignments (
    colonist_id INTEGER NOT NULL,
    journey_id INTEGER NOT NULL,
    task TEXT NOT NULL DEFAULT 'Engineering activities',

    CONSTRAINT pk_colonists_journeys
    	PRIMARY KEY (colonist_id, journey_id),

	CONSTRAINT fk_assignments_colonists FOREIGN KEY (colonist_id) REFERENCES colonists(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,

    CONSTRAINT fk_assignments_journeys FOREIGN KEY (journey_id) REFERENCES journeys(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);