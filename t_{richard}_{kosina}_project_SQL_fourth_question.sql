SELECT 
rok, 
round(avg(cena_potravina)) AS prumerna_cena_zakladnich_potravin, 
round(avg(prumerna_mzda_odvetvi)) AS prumerna_mzda,
round((round(avg(cena_potravina))-lag(round(avg(cena_potravina))) OVER (ORDER BY nazev_potravina, rok))
/lag(round(avg(cena_potravina))) OVER (ORDER BY nazev_potravina, rok)
-(round(avg(prumerna_mzda_odvetvi))-lag(round(avg(prumerna_mzda_odvetvi))) OVER (ORDER BY nazev_potravina, rok))
/lag(round(avg(prumerna_mzda_odvetvi))) OVER (ORDER BY nazev_potravina, rok), 2)  AS rozdil
FROM t_richard_kosina_project_sql_primary_final
GROUP BY rok;
