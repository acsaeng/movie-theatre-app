DROP DATABASE IF EXISTS USERDB;
CREATE DATABASE USERDB; 
USE USERDB;

DROP TABLE IF EXISTS RUSER;
CREATE TABLE RUSER (
	UserID		integer auto_increment,
    UserName	varchar(30),
    Password	varchar(30),
    FName		varchar(30),
    LName		varchar(30),
    Email		varchar(30),
    Credit		varchar(30),
    Debit		varchar(30),
    Expiry		varchar(30),
	primary key (UserID)
);

INSERT INTO RUSER (UserID, FName, LName, UserName, Password,  Email, Credit, Debit, Expiry)
VALUES
(1, 'Rohinesh', 'Ram', 'user1', '1234', 'rram@email.com', 1234567890123456, 1234567890123456, '2021-12-05'),
(2, 'Ammaar', 'Rahain', 'user2', '1234', 'araihan@email.com', 4567890123456789, 4567890123456789, '2021-12-05'),
(3, 'Brandon', 'Quan', 'user3', '1234', 'bquan@email.com', 7891234567890123, 7891234567890123, '2021-12-05'),
(4, 'Aron', 'Saengchan', 'user4', '1234', 'asaengchan@email.com', 6969696969696969, 6969696969696969, '2021-12-05');

Select * FROM RUSER;