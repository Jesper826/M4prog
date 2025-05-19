CREATE TABLE IF NOT EXISTS games (
  id INT(11) NOT NULL AUTO_INCREMENT,
  titel VARCHAR(100) NOT NULL,
  platform VARCHAR(50) NOT NULL,
  jaar INT(4) NOT NULL,
  verkrijgbaar BOOLEAN NOT NULL,
  prijs DECIMAL(6,2) NOT NULL,
  genre VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO games (titel, platform, jaar, verkrijgbaar, prijs, genre) VALUES
('Elden Ring', 'PlayStation 5', 2022, TRUE, 59.99, 'RPG'),
('Halo Infinite', 'Xbox Series X', 2021, TRUE, 49.99, 'Shooter'),
('Starfield', 'PC', 2024, FALSE, 69.99, 'RPG'),
('Mario Kart 8', 'Nintendo Switch', 2017, TRUE, 39.99, 'Racing'),
('FIFA 25', 'PlayStation 5', 2025, FALSE, 69.99, 'Sport'),
('Hollow Knight: Silksong', 'PC', 2025, FALSE, 29.99, 'Platformer'),
('Forza Horizon 5', 'Xbox Series X', 2021, TRUE, 59.99, 'Racing');

SELECT * FROM games
WHERE platform = 'PlayStation 5' AND prijs < 60;

SELECT * FROM games
WHERE (genre = 'RPG' OR genre = 'Racing') AND verkrijgbaar = TRUE;

SELECT * FROM games
WHERE prijs = 69.99 AND genre = 'Sport' AND verkrijgbaar = FALSE;
