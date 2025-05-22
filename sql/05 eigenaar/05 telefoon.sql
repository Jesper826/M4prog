CREATE TABLE `klantTelefoonGesprek` (
    `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `naam` varchar(220) NOT NULL,
    `leeftijd` int(11) NOT NULL,
    `telefoonnummer` varchar(12) NOT NULL,
    `gesprekStart` DATETIME NOT NULL,
    `gesprekEind` DATETIME NOT NULL,
    `gesprekNaarTelefoonnummer` varchar(12) NOT NULL,
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE


) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- telefoonnummer
-- naam
-- leeftijd

-- is allemaal gelijk
