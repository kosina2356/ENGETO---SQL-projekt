SELECT 
nazev_potravina, 
round(avg(cena_potravina), 2) AS cena,
nazev_potravina, 
mnozstvi, jednotka, 
rok,
lag(round(avg(cena_potravina), 2)) OVER (ORDER BY nazev_potravina, rok) AS predchozi_rok_cena,
round((round(avg(cena_potravina), 2)-lag(round(avg(cena_potravina), 2)) OVER (ORDER BY nazev_potravina, rok))
/lag(round(avg(cena_potravina), 2)) OVER (ORDER BY nazev_potravina, rok), 2) AS mezirocni_rozdil 
FROM t_richard_kosina_project_sql_primary_final
GROUP BY nazev_potravina, rok;

SELECT 
nazev_potravina, 
round(avg(cena_potravina), 2) AS cena,
nazev_potravina, 
mnozstvi, jednotka, 
rok,
lag(round(avg(cena_potravina), 2)) OVER (ORDER BY nazev_potravina, rok) AS predchozi_rok_cena,
round((round(avg(cena_potravina), 2)-lag(round(avg(cena_potravina), 2)) OVER (ORDER BY nazev_potravina, rok))
/lag(round(avg(cena_potravina), 2)) OVER (ORDER BY nazev_potravina, rok), 2) AS mezirocni_rozdil 
FROM t_richard_kosina_project_sql_primary_final
WHERE rok = 2006 OR rok = 2018
GROUP BY nazev_potravina, rok;
