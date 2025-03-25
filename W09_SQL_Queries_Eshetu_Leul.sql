-- Retrieve all records from the Players table
USE TennisTournament;
SELECT * FROM Players;

-- Retrieve players with a ranking above 5
SELECT first_name, last_name, ranking 
FROM Players
WHERE ranking > 5;

-- Count how many players come from each country
SELECT country, COUNT(*) AS num_players
FROM Players
GROUP BY country;

-- Retrieve countries with more than 2 players
SELECT country, COUNT(*) AS num_players
FROM Players
GROUP BY country
HAVING COUNT(*) > 2;

-- List players in descending order of their ranking
SELECT first_name, last_name, ranking
FROM Players
ORDER BY ranking DESC;

-- Retrieve a list of players and their coaches using INNER JOIN
SELECT p.first_name AS player_name, p.last_name AS player_last_name, c.first_name AS coach_name, c.last_name AS coach_last_name
FROM Players p
INNER JOIN Player_Coach pc ON p.player_id = pc.player_id
INNER JOIN Coaches c ON pc.coach_id = c.coach_id;

-- Retrieve all players and their coaches, including players without a coach
SELECT p.first_name AS player_name, p.last_name AS player_last_name, c.first_name AS coach_name, c.last_name AS coach_last_name
FROM Players p
LEFT OUTER JOIN Player_Coach pc ON p.player_id = pc.player_id
LEFT OUTER JOIN Coaches c ON pc.coach_id = c.coach_id;

-- Retrieve all possible combinations of players and tournaments (CROSS JOIN)
SELECT p.first_name AS player_name, t.name AS tournament_name
FROM Players p
CROSS JOIN Tournaments t;

-- Find the players with the highest ranking using a subquery
SELECT first_name, last_name, ranking
FROM Players
WHERE ranking = (SELECT MIN(ranking) FROM Players);

-- Combine player names and tournament names using UNION
SELECT first_name AS name FROM Players
UNION
SELECT name AS name FROM Tournaments;

-- ------------EXTRA CREDIT---------------------------- --

-- Return a message based on the player's ranking using CASE
SELECT first_name, last_name, ranking,
    CASE
        WHEN ranking <= 5 THEN 'Top Player'
        WHEN ranking BETWEEN 6 AND 20 THEN 'Good Player'
        ELSE 'Needs Improvement'
    END AS player_status
FROM Players;

-- Start transaction
START TRANSACTION;

-- Add a new player
INSERT INTO Players (first_name, last_name, age, country, ranking) 
VALUES ('John', 'Doe', 25, 'USA', 10);

-- Rollback or commit based on the result
COMMIT; -- or ROLLBACK;

-- Create an index on the ranking column
CREATE INDEX idx_ranking ON Players (ranking);

-- Add a CHECK constraint to the Players table
ALTER TABLE Players
ADD CONSTRAINT age_check CHECK (age >= 16);

-- Create a view for the top 5 players
CREATE VIEW Top5Players AS
SELECT first_name, last_name, ranking
FROM Players
ORDER BY ranking ASC
LIMIT 5;














