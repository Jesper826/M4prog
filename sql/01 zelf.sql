CREATE TABLE workouts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    gebruiker_id INT NOT NULL,
    activiteit VARCHAR(50) NOT NULL,
    duur_minuten INT NOT NULL,
    calorieën_verbrand INT,
    datum DATETIME NOT NULL,
    opmerking TEXT
);
