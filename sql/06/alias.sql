SELECT * FROM `huisdieren`;

SELECT naam,leeftijd,sum(leeftijd) as leeftijdTotaal FROM `huisdieren`;

select pets.naam, pets.leeftijd 
from huisdieren as pets 
where pets.leeftijd > 5;
