SELECT * FROM `eigen data voor 03` ORDER BY `tijd gebruikt` LIMIT 0, 25;
SELECT COUNT(*) FROM `eigen data voor 03` LIMIT 0, 25;

SELECT
    leeftijd,
    SUM(leeftijd) AS totale_leeftijd,
FROM
    tijd gebruikt
GROUP BY
    waarde
ORDER BY
    nuttig DESC
;
