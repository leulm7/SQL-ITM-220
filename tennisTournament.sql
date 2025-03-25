-- Creating the Tennis Tournament Database
CREATE DATABASE TennisTournament;
USE TennisTournament;

-- Players Table
CREATE TABLE Players (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    country VARCHAR(50),
    ranking INT
);

-- Coaches Table
CREATE TABLE Coaches (
    coach_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    experience_years INT
);

-- Player-Coach Relationship Table (Many-to-Many)
CREATE TABLE Player_Coach (
    player_id INT,
    coach_id INT,
    PRIMARY KEY (player_id, coach_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (coach_id) REFERENCES Coaches(coach_id)
);

-- Tournaments Table
CREATE TABLE Tournaments (
    tournament_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    prize_money DECIMAL(10,2),
    start_date DATE,
    end_date DATE
);

-- Matches Table
CREATE TABLE Matches (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    tournament_id INT,
    round VARCHAR(50),
    date_played DATE,
    winner_id INT,
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id),
    FOREIGN KEY (winner_id) REFERENCES Players(player_id)
);

-- Match Participation Table (Many-to-Many: Players in Matches)
CREATE TABLE Match_Participation (
    match_id INT,
    player_id INT,
    score VARCHAR(50),
    PRIMARY KEY (match_id, player_id),
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

-- Sponsors Table
CREATE TABLE Sponsors (
    sponsor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    industry VARCHAR(50)
);

-- Tournament-Sponsor Relationship Table (Many-to-Many)
CREATE TABLE Tournament_Sponsors (
    tournament_id INT,
    sponsor_id INT,
    PRIMARY KEY (tournament_id, sponsor_id),
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id),
    FOREIGN KEY (sponsor_id) REFERENCES Sponsors(sponsor_id)
);

-- Umpires Table
CREATE TABLE Umpires (
    umpire_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    experience_level VARCHAR(50)
);

-- Courts Table
CREATE TABLE Courts (
    court_id INT AUTO_INCREMENT PRIMARY KEY,
    surface_type VARCHAR(50),
    location VARCHAR(100)
);

-- Match-Umpire-Court Relationship Table
CREATE TABLE Match_Officials (
    match_id INT,
    umpire_id INT,
    court_id INT,
    PRIMARY KEY (match_id, umpire_id, court_id),
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (umpire_id) REFERENCES Umpires(umpire_id),
    FOREIGN KEY (court_id) REFERENCES Courts(court_id)
);

-- Sample INSERT Statements
INSERT INTO Players (first_name, last_name, age, country, ranking) VALUES
('Roger', 'Federer', 40, 'Switzerland', 3),
('Rafael', 'Nadal', 37, 'Spain', 2),
('Novak', 'Djokovic', 37, 'Serbia', 1);

INSERT INTO Coaches (first_name, last_name, experience_years) VALUES
('Toni', 'Nadal', 20),
('Ivan', 'Lendl', 25);

INSERT INTO Player_Coach VALUES
(1, 1),
(2, 2);

INSERT INTO Tournaments (name, location, prize_money, start_date, end_date) VALUES
('Wimbledon', 'London', 2500000, '2024-06-25', '2024-07-10');

INSERT INTO Matches (tournament_id, round, date_played, winner_id) VALUES
(1, 'Final', '2024-07-10', 1);

INSERT INTO Match_Participation VALUES
(1, 1, '6-4 6-7 7-5'),
(1, 2, '4-6 7-6 5-7');

INSERT INTO Players (first_name, last_name, age, country, ranking) VALUES
('Serena', 'Williams', 42, 'USA', 5),
('Venus', 'Williams', 43, 'USA', 8);

select * from players;

