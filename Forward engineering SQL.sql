-- DROP TABLES IF THEY EXIST TO AVOID CONFLICTS
DROP TABLE IF EXISTS Match_Officials, Match_Participation, Tournament_Sponsors, Player_Coach, Injuries, Matches, Courts, Coaches, Sponsors, Tournaments, Players, Umpires;

-- TABLE: Players
CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    country VARCHAR(50),
    ranking INT
);

-- TABLE: Coaches
CREATE TABLE Coaches (
    coach_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    experience_years INT
);

-- TABLE: Player_Coach (Junction Table)
CREATE TABLE Player_Coach (
    player_id INT,
    coach_id INT,
    PRIMARY KEY (player_id, coach_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (coach_id) REFERENCES Coaches(coach_id)
);

-- TABLE: Tournaments
CREATE TABLE Tournaments (
    tournament_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    prize_money DECIMAL(10,2),
    start_date DATE,
    end_date DATE
);

-- TABLE: Matches
CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    tournament_id INT,
    round VARCHAR(50),
    date_played DATE,
    winner_id INT,
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id),
    FOREIGN KEY (winner_id) REFERENCES Players(player_id)
);

-- TABLE: Match_Participation (Junction Table)
CREATE TABLE Match_Participation (
    match_id INT,
    player_id INT,
    score VARCHAR(50),
    PRIMARY KEY (match_id, player_id),
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

-- TABLE: Courts
CREATE TABLE Courts (
    court_id INT PRIMARY KEY,
    surface_type VARCHAR(50),
    location VARCHAR(100)
);

-- TABLE: Umpires
CREATE TABLE Umpires (
    umpire_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    experience_level VARCHAR(50)
);

-- TABLE: Match_Officials (Junction Table)
CREATE TABLE Match_Officials (
    match_id INT,
    umpire_id INT,
    court_id INT,
    PRIMARY KEY (match_id, umpire_id, court_id),
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (umpire_id) REFERENCES Umpires(umpire_id),
    FOREIGN KEY (court_id) REFERENCES Courts(court_id)
);

-- TABLE: Sponsors
CREATE TABLE Sponsors (
    sponsor_id INT PRIMARY KEY,
    name VARCHAR(100),
    industry VARCHAR(50)
);

-- TABLE: Tournament_Sponsors (Junction Table)
CREATE TABLE Tournament_Sponsors (
    tournament_id INT,
    sponsor_id INT,
    PRIMARY KEY (tournament_id, sponsor_id),
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id),
    FOREIGN KEY (sponsor_id) REFERENCES Sponsors(sponsor_id)
);

-- TABLE: Injuries
CREATE TABLE Injuries (
    injury_id INT PRIMARY KEY,
    player_id INT,
    injury_type VARCHAR(100),
    severity VARCHAR(50),
    injury_date DATE,
    recovery_date DATE,
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

-- Optional VIEW: Top 5 players (based on ranking)
CREATE VIEW top5players AS
SELECT * FROM Players
ORDER BY ranking ASC
LIMIT 5;
