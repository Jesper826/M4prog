CREATE TABLE kaarten (
    id INT AUTO_INCREMENT PRIMARY KEY,
    naam VARCHAR(100) NOT NULL,
    kost INT NOT NULL,
    aanval INT,
    verdediging INT,
    flavor_text TEXT,
    beschrijving TEXT,
    zeldzaamheid ENUM('gewoon', 'zeldzaam', 'episch', 'legendarisch'),
    type ENUM('wezen', 'spreuk', 'val'),
    gemaakt_op TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
