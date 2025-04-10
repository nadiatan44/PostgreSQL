CREATE OR REPLACE PROCEDURE udp_update_max_capacity(
	planet_name VARCHAR(60),
	increment INT
)
AS
$$
BEGIN
    UPDATE
		stations AS s
    SET
		max_capacity = max_capacity + increment
    FROM
		planets AS p
    WHERE
		s.planet_id = p.id
    		AND
		p.name = planet_name;
END;
$$
LANGUAGE plpgsql
;