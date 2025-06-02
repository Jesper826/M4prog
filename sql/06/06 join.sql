SELECT 
  h.hobbyid, 
  h.hobby, 
  p.id AS persoonid, 
  p.naam 
FROM hobby AS h 
JOIN persoon AS p ON h.hobbyid = p.hobbyid;

SELECT T.naam, T.leeftijd, T.telefoonnummer, T.klantid, T.gesprekstart, T.gesprekEind FROM klant AS K JOIN klantTelefoonGesprek AS T ON K.klantid = T.klantid;