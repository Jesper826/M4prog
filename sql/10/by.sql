SELECT *
FROM verkochtproduct;

SELECT 
    product,
    SUM(aantal) AS totaal_aantal,
    SUM(totaalbedrag) AS totaal_bedrag
FROM verkochtproduct
WHERE product = 'mario wonder'
GROUP BY product;

SELECT 
    product,
    SUM(aantal) AS totaal_aantal,
    SUM(totaalbedrag) AS totaal_bedrag
FROM verkochtproduct
GROUP BY product;

SELECT COUNT(*) AS totaal_huisdieren
FROM huisdieren;

SELECT COUNT(*) AS totaal_producten
FROM producten;

SELECT COUNT(*) AS totaal_bestellingen
FROM bestellingen;

SELECT 
    eigenaar_id,
    COUNT(*) AS aantal_huisdieren
FROM huisdieren
GROUP BY eigenaar_id;
