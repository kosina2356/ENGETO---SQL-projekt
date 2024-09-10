CREATE TABLE t_Richard_Kosina_project_SQL_secondary_final AS
	SELECT
	e.country, e.`year`, round(e.GDP) AS GDP, e.gini, e.population, round(round(e.GDP)/e.population) AS 	GDP_per_person
	FROM economies e 
	LEFT JOIN countries c 
		ON e.country = c.country
	WHERE c.continent = 'Europe' AND e.`year` < 2019 AND e.`year` > 2005 AND c.capital_city != 'Praha';