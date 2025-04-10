CREATE TABLE search_results (
	id SERIAL PRIMARY KEY,
    address_name VARCHAR(100),
    full_name VARCHAR(50),
    level_of_bill VARCHAR(10),
    car_make VARCHAR(20),
    car_condition CHAR(1),
    category_name VARCHAR(10)
);

CREATE OR REPLACE PROCEDURE sp_courses_by_address(
    IN address_name VARCHAR(100)
) AS
$$
BEGIN
    TRUNCATE TABLE search_results;

    INSERT INTO search_results (address_name, full_name, level_of_bill, car_make, car_condition, category_name)
    SELECT
        a.name AS address_name,
        c.full_name,
        CASE
            WHEN co.bill <= 20 THEN 'Low'
            WHEN co.bill <= 30 THEN 'Medium'
            ELSE 'High'
        END AS level_of_bill,
        car.make AS car_make,
        car.condition AS car_condition,
        cat.name AS category_name
    FROM
        courses co
    JOIN
        addresses a ON co.from_address_id = a.id
    JOIN
        clients c ON co.client_id = c.id
    JOIN
        cars car ON co.car_id = car.id
    JOIN
        categories cat ON car.category_id = cat.id
    WHERE
        a.name = address_name
    ORDER BY
        car.make, c.full_name;

END;
$$
 LANGUAGE plpgsql;