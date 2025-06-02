SELECT 
  tml.voornaam,
  tml.achternaam,
  t.teamnaam
FROM teamlid AS tml
JOIN team AS t ON tml.teamid = t.id;

SELECT 
  tml.voornaam,
  tml.achternaam,
  t.teamnaam
FROM teamlid AS tml
JOIN team AS t ON tml.teamid = t.id
WHERE t.teamnaam = 'poisonshroom';

SELECT 
  tml.voornaam,
  tml.achternaam,
  t.teamnaam
FROM teamlid AS tml
JOIN team AS t ON tml.teamid = t.id
WHERE t.teamnaam IN ('flowerpower', 'the toad army');
