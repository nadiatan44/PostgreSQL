CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(searched_volunteers_department VARCHAR(30))
RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE
    volunteer_count INT;
BEGIN
    SELECT COUNT(*)
    INTO volunteer_count
    FROM
		volunteers AS v
    JOIN
		volunteers_departments AS vd
	ON
		v.department_id = vd.id
    WHERE
		vd.department_name = searched_volunteers_department;

    RETURN volunteer_count;
END;
$$;

SELECT fn_get_volunteers_count_from_department('Zoo events')