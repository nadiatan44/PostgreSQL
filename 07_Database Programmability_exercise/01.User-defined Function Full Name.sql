CREATE OR REPLACE FUNCTION fn_full_name(first_name VARCHAR(30), last_name VARCHAR(30))
RETURNS VARCHAR(61) AS
$$
	DECLARE
		full_name VARCHAR(61);
	BEGIN
		full_name := INITCAP(CONCAT(first_name, ' ', last_name));
		RETURN
			full_name;
	END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_full_name_1(first_name VARCHAR,last_name VARCHAR)
RETURNS VARCHAR AS
$$
	DECLARE
		full_name VARCHAR;
	BEGIN
		first_name = INITCAP(first_name);
		last_name= INITCAP(last_name);
		IF first_name IS NULL AND last_name IS NULL THEN
			full_name := NULL;
		ELSIF first_name IS NULL THEN
			full_name := last_name;
		ELSIF last_name IS NULL THEN
			full_name := first_name;
		ELSE
			full_name := CONCAT($1, ' ', $2);
		END IF;
		RETURN  full_name;
	END
$$
LANGUAGE plpgsql
;
