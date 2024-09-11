
SELECT 
rok,
round((round(avg(prumerna_mzda_odvetvi))-lag(round(avg(prumerna_mzda_odvetvi))) OVER (ORDER BY rok))
/lag(round(avg(prumerna_mzda_odvetvi))) OVER (ORDER BY rok), 2) AS rozdil_mzda,
round((round(avg(cena_potravina))-lag(round(avg(cena_potravina))) OVER (ORDER BY rok))
/lag(round(avg(cena_potravina))) OVER (ORDER BY rok), 2) AS rozdil_cena,
round((round(avg(HDP))-lag(round(avg(HDP))) OVER (ORDER BY rok))
/lag(round(avg(HDP))) OVER (ORDER BY rok), 2) AS rust_HDP
FROM t_richard_kosina_project_sql_primary_final
GROUP BY rok;

