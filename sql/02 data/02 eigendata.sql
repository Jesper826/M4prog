INSERT INTO `eigen data` (`id`, `opera`, `klok`, `huisdier`, `vs`, `blijheid/status`) 
VALUES (NULL, 'gebruik ik veel', '1448', 'niet', 'veel gebruikt de laatste tijd', '7');

SELECT opera FROM 'eigen data';

SELECT * FROM 'eigen data';

SELECT vs,opera FROM 'eigen data';

SELECT klok,huisdier FROM 'eigen data';

SELECT sum(leeftijd) as gemiddeldeLeeftijd FROM `huisdieren`;
SELECT AVG(leeftijd) FROM `huisdieren`;