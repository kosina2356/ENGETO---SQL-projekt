
SELECT 
kod_odvetvi, 
nazev_odvetvi, 
rok,
round(avg(prumerna_mzda_odvetvi)) AS mzda,
lag(round(avg(prumerna_mzda_odvetvi))) OVER (ORDER BY kod_odvetvi, rok) AS predchozi_rok_mzda,
round(
(round(avg(prumerna_mzda_odvetvi))-lag(round(avg(prumerna_mzda_odvetvi))) OVER (ORDER BY kod_odvetvi, rok))
/lag(round(avg(prumerna_mzda_odvetvi))) OVER (ORDER BY kod_odvetvi, rok)
,2) AS rozdil_mzda_rok ,
	CASE 
		WHEN (round(avg(prumerna_mzda_odvetvi))-lag(round(avg(prumerna_mzda_odvetvi))) OVER (ORDER BY kod_odvetvi, rok))
				/lag(round(avg(prumerna_mzda_odvetvi))) OVER (ORDER BY kod_odvetvi, rok) > 0.001 THEN 1
		ELSE 0
	END AS rozdil
FROM t_richard_kosina_project_sql_primary_final
GROUP BY kod_odvetvi, rok;


