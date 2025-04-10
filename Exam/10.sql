CREATE OR REPLACE FUNCTION udf_spaceship_journeys_count(spaceship_name VARCHAR(60))
RETURNS INTEGER
AS
$$
DECLARE
    journeys_count INTEGER;
BEGIN
    SELECT COUNT(DISTINCT j.id)
    INTO
		journeys_count
    FROM
		journeys AS j
    JOIN
		spaceships AS s
	ON
		j.spaceship_id = s.id
    WHERE
		s.name = spaceship_name;

    IF journeys_count IS NULL THEN
        journeys_count := 0;
    END IF;

    RETURN journeys_count;
END;
$$
LANGUAGE plpgsql;