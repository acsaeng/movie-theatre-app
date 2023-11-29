DROP DATABASE IF EXISTS THEATREDB;
CREATE DATABASE THEATREDB; 
USE THEATREDB;

DROP TABLE IF EXISTS THEATRE;
CREATE TABLE THEATRE (
	TId						integer auto_increment,
    TName					varchar(30)	not null,
	primary key (TId)
);

INSERT INTO THEATRE (TId, TName)
VALUES
(1, 'Cineplex'),
(2, 'LandMark'),
(3, 'Galaxy'),
(4, 'AMC');

DROP TABLE IF EXISTS AUDITORIUM;
CREATE TABLE AUDITORIUM (
    TId			integer	not null,
    ANumber		integer,
    Capacity	integer,
	primary key (ANumber, TId),
    foreign key (TId) references THEATRE(TId)
);

INSERT INTO AUDITORIUM (TId, ANumber, Capacity)
VALUES
(1, 1, 30),
(2, 2, 30),
(3,3, 30 ),
(4, 4, 30);

DROP TABLE IF EXISTS SEAT;
CREATE TABLE SEAT (
	seatNumber		integer not null,
    auditorium		integer not null,
    availability	boolean,
    TId				integer	not null,
	primary key (seatNumber, auditorium, TId),
    foreign key (auditorium) references AUDITORIUM(ANumber),
    foreign key (TId) references THEATRE(TId)
);

INSERT INTO SEAT (seatNumber, auditorium, availability, TId)
VALUES
(1, 1, true, 1),
(2, 1, true, 1),
(3, 1, true, 1),
(4, 1, false, 1),
(5, 1, true, 1),
(6, 1, true, 1),
(7, 1, false, 1),
(8, 1, true, 1),
(9, 1, true, 1),
(10, 1, false, 1),
(11, 1, true, 1),
(12, 1, true, 1),
(13, 1, false, 1),
(14, 1, true, 1),
(15, 1, false, 1),
(16, 1, true, 1),
(17, 1, true, 1),
(18, 1, true, 1),
(19, 1, true, 1),
(20, 1, true, 1),
(1, 2, true, 2),
(2, 2, false, 2),
(3, 2, true, 2),
(4, 2, true, 2),
(5, 2, true, 2),
(6, 2, true, 2),
(7, 2, false, 2),
(8, 2, true, 2),
(9, 2, true, 2),
(10, 2, false, 2),
(11, 2, true, 2),
(12, 2, true, 2),
(13, 2, false, 2),
(14, 2, true, 2),
(15, 2, false, 2),
(16, 2, true, 2),
(17, 2, true, 2),
(18, 2, true, 2),
(19, 2, false, 2),
(20, 2, false, 2),
(1, 3, true, 3),
(2, 3, false, 3),
(3, 3, true, 3),
(4, 3, true, 3),
(5, 3, true, 3),
(6, 3, true, 3),
(7, 3, false, 3),
(8, 3, true, 3),
(9, 3, true, 3),
(10, 3, true, 3),
(11, 3, true, 3),
(12, 3, false, 3),
(13, 3, true, 3),
(14, 3, true, 3),
(15, 3, false, 3),
(16, 3, true, 3),
(17, 3, true, 3),
(18, 3, true, 3),
(19, 3, false, 3),
(20, 3, true, 3),
(1, 4, false, 4),
(2, 4, false, 4),
(3, 4, true, 4),
(4, 4, true, 4),
(5, 4, true, 4),
(6, 4, true, 4),
(7, 4, false, 4),
(8, 4, true, 4),
(9, 4, true, 4),
(10, 4, true, 4),
(11, 4, true, 4),
(12, 4, false, 4),
(13, 4, false, 4),
(14, 4, false, 4),
(15, 4, true, 4),
(16, 4, false, 4),
(17, 4, true, 4),
(18, 4, true, 4),
(19, 4, false, 4),
(20, 4, true, 4);

DROP TABLE IF EXISTS MOVIE;
CREATE TABLE MOVIE (
	TId					integer	not null,
    MId					integer,
    MName				varchar(30)	not null,
    auditorium			integer,
	primary key (MId),
    foreign key (TId) references THEATRE(TId),
    foreign key (auditorium) references AUDITORIUM(ANumber)
);

INSERT INTO MOVIE (TId, MId,  MName, auditorium)
VALUES
(1, 1, 'Lethal Weapon', 1),
(2, 2, 'LOTR', 2),
(3, 3, 'Inception', 3),
(4, 4, 'Fight Club', 4);

DROP TABLE IF EXISTS SHOWTIME;
CREATE TABLE SHOWTIME (
	MId				integer,
    TId				integer	not null,
	auditorium   	integer,
	showtime    	DateTime,
    primary key (showtime, MId, TId, auditorium),
    foreign key (MId) references MOVIE(MId),
    foreign key (TId) references THEATRE(TId),
    foreign key (auditorium) references AUDITORIUM(ANumber)
);

INSERT INTO SHOWTIME (TId, MId, auditorium, showtime)
VALUES
(1, 1, 1, "2021-12-30 10:20:22"),
(2, 2, 1, "2021-07-11 10:20:23"),
(3, 3, 1, "2021-07-11 10:20:24"),
(4, 4, 1, "2021-07-11 10:20:25");

DROP TABLE IF EXISTS TICKET;
CREATE TABLE TICKET (
	ticketId		integer not null auto_increment,
	seatNumber		integer not null,
    auditorium		integer not null,
    MId				integer,
    TId				integer	not null,
	showtime		datetime,
    email			varchar(30),
    Tstatus			varchar(30),
	primary key (ticketId),
    foreign key (MId) references MOVIE(MId),
    foreign key (auditorium) references AUDITORIUM(ANumber),
    foreign key (showtime) references SHOWTIME(showtime),
    foreign key (TId) references THEATRE(TId),
    foreign key (seatNumber) references SEAT(seatNumber)
);

INSERT INTO TICKET(seatNumber, auditorium, MId, TId, showtime, email, Tstatus)
VALUES
(1, 1, 1, 1, "2021-12-30 10:20:22", 'rohinesh', 'available'),
(1, 1, 2, 2, "2021-07-11 10:20:23", 'rohinesh', 'available'),
(1, 1, 3, 3, "2021-07-11 10:20:24", 'rohinesh', 'available'),
(1, 1, 4, 4, "2021-07-11 10:20:25", 'rohinesh', 'available');

DROP TABLE IF EXISTS NEW_MOVIE;
CREATE TABLE NEW_MOVIE (
    NewMovieId					integer,
    NewMovieName				varchar(30)	not null,
    News						varchar(300),
    DatePosted					datetime,
	primary key (NewMovieId)
);

INSERT INTO NEW_MOVIE (NewMovieId,  NewMovieName, News, DatePosted)
VALUES
(1, 'Dune', "Synopsis: Feature adaptation of Frank Herbert's science fiction novel about the son of a noble family entrusted with the protection of the most valuable asset and most vital element in the galaxy. \n\nOrder now!", "2021-07-11 10:20:22"),
(2, 'Eternals', "Synopsis: The saga of the Eternals, a race of immortal beings who lived on Earth and shaped its history and civilizations. \n\nOrder now!", "2021-07-11 10:20:23"),
(3, 'Spider-Man: No Way Home', "Synopsis: With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man. \n\nOrder now!", "2021-07-11 10:20:24"),
(4, 'The Matrix: Resurrections', "Synopsis: Plagued by strange memories, Neo's life takes an unexpected turn when he finds himself back inside the Matrix. \n\nOrder now!", "2021-07-11 10:20:25");

DROP TABLE IF EXISTS CREDIT;
CREATE TABLE CREDIT (
	creditid		integer auto_increment,
    email			varchar(30)	not null,
    amount			double,
	primary key (creditid)
);

SELECT * FROM THEATRE;
SELECT * FROM AUDITORIUM;
SELECT * FROM SEAT;
SELECT * FROM MOVIE;
SELECT * FROM SHOWTIME;
SELECT * FROM TICKET;
SELECT * FROM NEW_MOVIE;
SELECT * FROM CREDIT;