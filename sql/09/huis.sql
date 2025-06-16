-- 09_huis.sql

-- Tabel aanmaken
CREATE TABLE `huis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `straat` VARCHAR(120) NOT NULL,
  `huisnummer` INT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- Twee rijen toevoegen
INSERT INTO `huis` (`straat`, `huisnummer`) VALUES
('Kerkstraat', 12),
('Lindelaan', 45);
