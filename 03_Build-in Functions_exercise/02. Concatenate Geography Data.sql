CREATE OR REPLACE VIEW view_continents_countries_currencies_details
AS
SELECT
	CONCAT(
		ct.continent_name,
		' : ',
		ct.continent_code
	) AS  "continent_details",
	CONCAT_WS(
		' - ',
		cn.country_name,
		cn.capital,
		cn.area_in_sq_km,
		' km2'
	) AS "country_information",
	CONCAT(
		cr.description,
		' (',
		cr.currency_code,
		')'
	) AS "currencies"
FROM
	continents AS ct,
	countries AS cn,
	currencies AS cr
WHERE
	ct.continent_code = cn.continent_code
	AND
	cn.currency_code = cr.currency_code
ORDER BY
	country_information,
	"currencies"
;

SELECT * FROM view_continents_countries_currencies_details;


	