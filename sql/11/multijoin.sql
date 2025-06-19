SELECT k.naam, SUM(CAST(d.MBs AS UNSIGNED)) AS totaal_mbs
FROM tel_klant k
JOIN tel_dataverbruik d ON k.id = d.klant_id
GROUP BY k.naam;

SELECT k.naam, SUM(s.aantalpaginas) AS totaal_sms
FROM tel_klant k
JOIN tel_smsverbruik s ON k.id = s.klant_id
GROUP BY k.naam;

SELECT k.naam, SUM(TIMESTAMPDIFF(SECOND, g.startdatum, g.einddatum)) AS totaal_seconden
FROM tel_klant k
JOIN tel_gesprekken g ON k.id = g.klant_id
GROUP BY k.naam;

SELECT k.naam, SUM(CAST(d.MBs AS UNSIGNED)) AS totaal_mbs
FROM tel_klant k
JOIN tel_dataverbruik d ON k.id = d.klant_id
WHERE MONTH(d.datum) = 2 AND YEAR(d.datum) = 2024
GROUP BY k.naam;

SELECT k.naam, SUM(s.aantalpaginas) AS totaal_sms
FROM tel_klant k
JOIN tel_smsverbruik s ON k.id = s.klant_id
WHERE MONTH(s.datum) = 2 AND YEAR(s.datum) = 2024
GROUP BY k.naam;

SELECT k.naam, SUM(TIMESTAMPDIFF(SECOND, g.startdatum, g.einddatum)) AS totaal_seconden
FROM tel_klant k
JOIN tel_gesprekken g ON k.id = g.klant_id
WHERE MONTH(g.startdatum) = 2 AND YEAR(g.startdatum) = 2024
GROUP BY k.naam;

SELECT k.naam, c.id AS contract_id, a.abonnementtype
FROM tel_klant k
JOIN tel_klant_has_contract kc ON k.id = kc.klant_id
JOIN tel_contract c ON kc.contract_id = c.id
JOIN tel_abonnement a ON c.abonnement_id = a.id;

SELECT k.naam, c.id AS contract_id, a.abonnementtype, t.tariefnaam, t.perunit
FROM tel_klant k
JOIN tel_klant_has_contract kc ON k.id = kc.klant_id
JOIN tel_contract c ON kc.contract_id = c.id
JOIN tel_abonnement a ON c.abonnement_id = a.id
JOIN tel_abonnement_has_tarief at ON a.id = at.abonnement_id
JOIN tel_tarief t ON at.tarief_id = t.id;