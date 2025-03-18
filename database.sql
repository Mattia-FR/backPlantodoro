BEGIN;

-- Clean tables
DROP TABLE IF EXISTS user_plant;
DROP TABLE IF EXISTS plant;
DROP TABLE IF EXISTS user;

-- Create tables
CREATE TABLE user (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE plant (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    watering INT NOT NULL,
    info TEXT
);

CREATE TABLE user_plant (
    user_id INT UNSIGNED NOT NULL,
    plant_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (user_id, plant_id),
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (plant_id) REFERENCES plant(id) ON DELETE CASCADE
);

-- Insert users
INSERT INTO user (name, email, password) VALUES
('Kurenai Shinonome', 'kurenai@example.com', 'hashed_password_1'),
('Yūka Hanazono', 'yuka@example.com', 'hashed_password_2'),
('Mei Aoyama', 'mei@example.com', 'hashed_password_3');

-- Insert plants
INSERT INTO plant (name, watering, info) VALUES
('Monstera deliciosa', 7, 'Arrosage modéré, laisser sécher la surface du terreau entre deux arrosages.'),
('Sansevieria trifasciata (Langue de belle-mère)', 14, 'Très sobre en eau, arrosage toutes les 2 semaines en laissant bien sécher le terreau.'),
('Zamioculcas zamiifolia (Plante ZZ)', 10, 'Arrosage espacé, toutes les 8 à 15 jours, tolère bien les oublis.'),
('Howea forsteriana (Kentia)', 7, 'Arrosage modéré, garder le terreau légèrement humide sans excès.'),
('Epipremnum aureum (Pothos)', 7, 'Arrosage quand le terreau est sec en surface, tolère bien les oublis.'),
('Spathiphyllum (Lys de la paix)', 7, 'Arrosage régulier, terreau légèrement humide, réagit visiblement au manque d’eau.'),
('Dracaena (Dragonnier)', 7, 'Arrosage modéré, environ une fois par semaine, laisse sécher 2-3 cm de terre.'),
('Chlorophytum comosum (Plante araignée)', 7, 'Arrosage facile, environ une fois par semaine, supporte bien les oublis.'),
('Ficus elastica (Caoutchouc)', 10, 'Arrosage modéré, laisser sécher quelques cm de terre avant d’arroser.'),
('Pilea peperomioides (Plante à monnaie chinoise)', 7, 'Arrosage régulier mais modéré, éviter l’eau stagnante.'),
('Orchidée (Phalaenopsis)', 7, 'Arrosage modéré, environ une fois par semaine (réduire à environ toutes les deux semaines en période de repos); bien laisser égoutter pour éviter l’eau stagnante.'),
('Crassula ovata (Arbre de Jade)', 21, 'Très peu d’arrosage : attendre que le terreau soit bien sec avant d’arroser (supporte de longues périodes de sécheresse, surtout en hiver).'),
('Calathea', 5, 'En été, maintenir le substrat humide mais non détrempé; en hiver, laisser la surface du terreau sécher avant d’arroser de nouveau.'),
('Anthurium', 7, 'Arrosage régulier : environ 1 fois par semaine en automne/hiver et 2 fois par semaine en été; garder le terreau humide mais non détrempé (légèrement sec en surface avant d’arroser).'),
('Fougère de Boston', 3, 'Garder le terreau uniformément humide en permanence (sans le détremper), ne pas laisser le sol sécher complètement.'),
('Cactus', 30, 'Très faibles besoins : arroser uniquement lorsque le substrat est entièrement sec; ces plantes supportent aisément plusieurs semaines (voire mois) sans eau.');

-- Associate users with plants
INSERT INTO user_plant (user_id, plant_id) VALUES
(1, 1),  -- Kurenai a une Monstera
(1, 3),  -- Kurenai a aussi une Zamioculcas
(2, 2),  -- Yūka a une Sansevieria
(2, 5),  -- Yūka a un Pothos
(3, 4),  -- Mei a un Kentia
(3, 6);  -- Mei a un Spathiphyllum

COMMIT;
