CREATE TABLE medewerker (
    medewerker_id INT AUTO_INCREMENT PRIMARY KEY,
    volledige_naam VARCHAR(100) NOT NULL
);

CREATE TABLE klantaccount (
    klant_id INT AUTO_INCREMENT PRIMARY KEY,
    klantnaam VARCHAR(100) NOT NULL
);

CREATE TABLE klantencontact (
    klant_id INT NOT NULL,
    medewerker_id INT NOT NULL,
    contactmoment DATETIME NOT NULL,
    onderwerp VARCHAR(255),
    PRIMARY KEY (klant_id, medewerker_id, contactmoment),
    FOREIGN KEY (klant_id) REFERENCES klantaccount(klant_id),
    FOREIGN KEY (medewerker_id) REFERENCES medewerker(medewerker_id)
);


INSERT INTO medewerker (volledige_naam) VALUES
('Lisa Vermeer'),
('Tom Willems');

INSERT INTO klantaccount (klantnaam) VALUES
('Technisch BV'),
('Green Solutions');

INSERT INTO klantencontact (klant_id, medewerker_id, contactmoment, onderwerp) VALUES
(1, 1, '2025-06-03 09:00:00', 'Systeem werkt traag'),
(2, 2, '2025-06-03 13:15:00', 'Vraag over offerte');


SELECT
    kc.contactmoment,
    kc.onderwerp,
    ka.klantnaam,
    m.volledige_naam AS medewerker
FROM klantencontact kc
JOIN klantaccount ka ON kc.klant_id = ka.klant_id
JOIN medewerker m ON kc.medewerker_id = m.medewerker_id;
