-- Create a new database called 'Warehouse'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'Warehouse'
)
CREATE DATABASE Warehouse
GO

 CREATE TABLE Warehouses (
   Code INTEGER PRIMARY KEY NOT NULL,
   Location TEXT NOT NULL ,
   Capacity INTEGER NOT NULL 
 );
 
 CREATE TABLE Boxes (
   Code INTEGER IDENTITY PRIMARY KEY NOT NULL,
   Contents TEXT NOT NULL ,
   Value REAL NOT NULL ,
   Warehouse INTEGER NOT NULL, 
   CONSTRAINT fk_Warehouses_Code FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 );

 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Contents,Value,Warehouse) VALUES('Rocks',180,3);
 INSERT INTO Boxes(Contents,Value,Warehouse) VALUES('Rocks',250,1);
 INSERT INTO Boxes(Contents,Value,Warehouse) VALUES('Scissors',190,4);
 INSERT INTO Boxes(Contents,Value,Warehouse) VALUES('Rocks',200,1);
 INSERT INTO Boxes(Contents,Value,Warehouse) VALUES('Papers',75,1);
 INSERT INTO Boxes(Contents,Value,Warehouse) VALUES('Papers',50,3);
 INSERT INTO Boxes(Contents,Value,Warehouse) VALUES('Papers',175,2);
 INSERT INTO Boxes(Contents,Value,Warehouse) VALUES('Rocks',140,4);
 INSERT INTO Boxes(Contents,Value,Warehouse) VALUES('Scissors',125,1);
 INSERT INTO Boxes(Contents,Value,Warehouse) VALUES('Scissors',150,2);
 INSERT INTO Boxes(Contents,Value,Warehouse) VALUES('Papers',90,5);

SELECT * FROM Warehouses
SELECT * FROM Boxes