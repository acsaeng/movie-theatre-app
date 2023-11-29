DROP DATABASE IF EXISTS FINANCIALDB;
CREATE DATABASE FINANCIALDB; 
USE FINANCIALDB;


DROP TABLE IF EXISTS TRANSACTIONS;
CREATE TABLE TRANSACTIONS (
	TransactionId			integer auto_increment,
    TicketId				integer	not null,
    Amount					double,
    Email					varchar(30),
    FName					varchar(30),
    LName					varchar(30),
	primary key (TransactionId)
);

INSERT INTO TRANSACTIONS (TicketID,Amount,Email,FName,LName)
VALUES
(123,10.25,"test@test.com","Test","User"),
(456,100,"test2@test.com","Test2","User2"),
(789,69,"test3@test.com","Test3","User3");


DROP TABLE IF EXISTS CARDINFO;
CREATE TABLE CARDINFO (
    CardNumber				varchar(30) not null,
    Funds					double,
    Type				varchar(30),
	primary key (CardNumber)
);

INSERT INTO CARDINFO (CardNumber,Funds,Type)
VALUES
("1234567890123456",1000.99,"Credit"),
("4567890123456789",99.50,"Debit"),
("7891234567890123",420,"Credit"),
("4206912345678901",420.69,"Debit");

SELECT * FROM TRANSACTIONS;
SELECT * FROM CARDINFO;