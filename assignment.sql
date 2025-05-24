-- Active: 1747458460690@@localhost@5432@conservarion_db
-- Active: 1747458460690@@localhost@5432@postgres
CREATE DATABASE conservarion_db;

-- Create the rangers table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(100)
);

-- Create the species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100),
    scientific_name VARCHAR(150),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

-- Create the sightings table
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    location VARCHAR(100),
    sighting_time TIMESTAMP,
    notes TEXT
);

-- Insert 3 ranger records
INSERT INTO rangers (ranger_id, name, region) VALUES
(1, 'Alice Johnson', 'North Forest'),
(2, 'Brian Smith', 'South Hills'),
(3, 'Carla Reyes', 'East Valley');


-- Insert 7 species
INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Shadow Leopard', 'Panthera nebulosa', '1984-06-12', 'Endangered'),
(2, 'Crimson Frog', 'Rana rubra', '1799-04-18', 'Vulnerable'),
(3, 'Azure Sparrow', 'Passerina caerulea', '2001-09-05', 'Near Threatened'),
(4, 'Golden Lynx', 'Lynx aurum', '1778-11-23', 'Endangered'),
(5, 'Mossback Turtle', 'Testudo muscata', '1989-07-30', 'Critically Endangered'),
(6, 'Glacier Fox', 'Vulpes glacialis', '1996-12-02', 'Least Concern'),
(7, 'Dusk Antelope', 'Antilocapra vespera', '2005-03-14', 'Vulnerable');



-- Insert sightings
INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;


--problem-1 Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers (ranger_id, name, region) VALUES (4, 'Derek Fox', 'Coastal Plains');

--problem-2 Count unique species ever sighted
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;

--problem-3 Find all sightings where the location includes "Pass"
SELECT * FROM sightings WHERE location ILIKE '%Pass%';

--problem-4 List each ranger's name and their total number of sightings.
SELECT r.name AS ranger_name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.ranger_id, r.name 
ORDER BY total_sightings DESC;

--problem-5 List species that have never been sighted.
SELECT sp.common_name FROM species sp
LEFT JOIN sightings s ON sp.species_id = s.species_id
WHERE s.sighting_id IS NULL;

--problem-6 Show the most recent 2 sightings.
SELECT sp.common_name, s.sighting_time, r.name FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY sighting_time DESC LIMIT 2;

--problem -7 Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

--problem-8 Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT sighting_id, sighting_time,
CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 5 AND 11 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
    END AS time_of_day FROM sightings;

--problem-9 Delete rangers who have never sighted any species
DELETE FROM rangers
WHERE ranger_id IN (
    SELECT r.ranger_id
    FROM rangers r
    LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
    WHERE s.sighting_id IS NULL
);
