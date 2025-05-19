CREATE TABLE IF NOT EXISTS kleren (
  id INT(11) NOT NULL AUTO_INCREMENT,
  beschrijving VARCHAR(100) NOT NULL,
  kledingtype VARCHAR(100) NOT NULL,
  kleur VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO kleren (beschrijving, kledingtype, kleur)
VALUES 
('olymp overhemd', 'overhemd', 'wit'),
('jakes overhemd', 'overhemd', 'blauw'),
('eigen merk overhemd', 'overhemd', 'rood'),

('mario tshirt', 'tshirt', 'rood'),
('planet tshirt', 'tshirt', 'blauw'),
('wit tshirt', 'tshirt', 'wit'),

('spijker broek', 'broek', 'blauw'),
('ripped spijker broek', 'broek', 'blauw'),
('spijker broek', 'broek', 'zwart'),
('nette witte broek', 'broek', 'wit');

SELECT * FROM kleren
WHERE kleur = 'rood' OR kleur = 'wit';

SELECT * FROM kleren
WHERE kleur = 'zwart' OR kleur = 'blauw';

SELECT * FROM kleren
WHERE kleur = 'zwart' OR kleur = 'wit';

SELECT * FROM kleren
WHERE kledingtype = 'broek' OR kledingtype = 'tshirt';


SELECT * FROM kleren
WHERE kledingtype = 'broek' AND (kleur = 'zwart' OR kleur = 'wit');

SELECT * FROM kleren
WHERE (kledingtype = 'broek' OR kledingtype = 'overhemd') AND (kleur = 'zwart' OR kleur = 'wit');

SELECT * FROM kleren
WHERE (kledingtype = 'tshirt' OR kledingtype = 'overhemd') AND (kleur = 'rood' OR kleur = 'blauw');

SELECT * FROM huisdieren
WHERE leeftijd = 1 OR eigenaar = 'joep';

SELECT * FROM huisdieren
WHERE (eigenaar = 'marije' AND typedier = 'hamster') OR leeftijd > 2;
