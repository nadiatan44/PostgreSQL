CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
	IN animal_name VARCHAR(30),
	OUT animal_owner_name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT
        o.name
    INTO
        animal_owner_name
    FROM
        animals AS a
    LEFT JOIN
        owners AS o
    ON
        a.owner_id = o.id
    WHERE
        a.name = animal_name;

    IF animal_owner_name IS NULL THEN
        animal_owner_name := 'For adoption';
    END IF;

    RAISE NOTICE '%', animal_owner_name;
END;
$$;
