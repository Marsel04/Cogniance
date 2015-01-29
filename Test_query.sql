CREATE DATABASE Tennis_db;

CREATE TABLE Players
(
PlayerID int NOT NULL,
Name varchar(30),
Age int,
primary key(PlayerID)
);

CREATE TABLE Tournaments
(
TournamentID int NOT NULL,
Name varchar(50),
TournamentDate date,
Location varchar(50),
PlayersQuantity int,
primary key(TournamentID)
);

CREATE TABLE Results
(
ResultID int NOT NULL,
TournamentID int,
Player1ID int,
Player2ID int,
Score varchar (10),
primary key(ResultID),
foreign key(TournamentID) references Tournaments(TournamentID),
foreign key(Player1ID) references Players(PlayerID),
foreign key(Player2ID) references Players(PlayerID)
);

INSERT INTO Players 
VALUES
(1, 'Andrei', 19),
(2, 'Petr', 33),
(3, 'Michael',23),
(4, 'Vasya', 22);

INSERT INTO Tournaments 
VALUES
(1, 'Championship Odessa', '2014-04-12','Odessa', 4),
(2, 'Championship Karpaty', '2014-07-23','Uzhgorod', 3),
(3, 'Masters Kiev', '2014-09-06', 'Kiev', 3);

INSERT INTO Results 
VALUES
(1, 1, 1, 2, '6-2'),
(2, 1, 1, 3, '2-6'),
(3, 1, 1, 4, '7-5'),
(4, 1, 2, 3, '6-0'),
(5, 1, 2, 4, '4-6'),
(6, 1, 3, 4, '7-5');

SELECT * FROM Results;
SELECT Name from Players WHERE Age BETWEEN 19 AND 24;
SELECT Name, Location, TournamentDate from Tournaments WHERE Location ='Odessa';

SELECT p.Name AS Player1, p2.Name AS Player2, r.Score, t.TournamentDate 
FROM Results AS r
INNER JOIN Players AS p ON p.PlayerID = r.Player1ID
INNER JOIN Players AS p2 ON p2.PlayerID = r.Player2ID
INNER JOIN Tournaments AS t ON t.TournamentID = r.TournamentID;


SELECT COUNT(*) AS NumberOfPlayers FROM Players;
SELECT COUNT(DISTINCT Location) AS NumberofLocations FROM Tournaments;

SELECT AVG(Age) as AverageAge FROM Players;




