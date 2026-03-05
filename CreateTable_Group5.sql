IF DB_ID('Group5') IS NULL
BEGIN
    CREATE DATABASE Group5;
END
GO

-- Step 1: Create a login at the server level

use master;

CREATE LOGIN NandaSurendra

WITH PASSWORD = 'MI$T353Instructor';



-- Step 2: Switch to your target database

USE MIST_353_Group5;



-- Step 3: Create a database user mapped to the login

CREATE USER NandaSurendra

FOR LOGIN NandaSurendra;



-- Step 4: Grant EXECUTE permission on all stored procedures and UDFs

GRANT EXECUTE TO NandaSurendra;



-- Read access to all tables

GRANT SELECT TO NandaSurendra;


DROP TABLE IF EXISTS AttendanceExcuse;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Officer;
DROP TABLE IF EXISTS AppUSER;
GO

-- Drop child tables first
DROP TABLE IF EXISTS AttendanceExcuse;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Officer;
DROP TABLE IF EXISTS AppUSER;
GO

-- Create parent table first
CREATE TABLE AppUSER (
    UID INT NOT NULL PRIMARY KEY,
    UFirstName VARCHAR(255) NOT NULL,
    ULastName VARCHAR(255) NOT NULL,
    UEmail VARCHAR(255) NOT NULL,
    UPhone VARCHAR(255) NOT NULL
);
GO

-- Child tables
CREATE TABLE Event (
    EID INT NOT NULL PRIMARY KEY,
    EDateTime DATETIME NOT NULL,
    EDescription VARCHAR(600) NOT NULL,
    EExcuseCutoffTime DATETIME NOT NULL,
    UID INT NOT NULL,
    FOREIGN KEY (UID) REFERENCES AppUSER(UID)
);
GO

CREATE TABLE Officer (
    UID INT PRIMARY KEY,
    OPosition VARCHAR(255),
    FOREIGN KEY (UID) REFERENCES AppUSER(UID)
);
GO

CREATE TABLE AttendanceExcuse (
    EID INT ,
    UID INT ,
    ExcuseDescription VARCHAR(600) ,
    ExcuseSubmissionTime DATETIME ,
    ExcuseApprovalStatus BIT,
    PRIMARY KEY (EID, UID),
    FOREIGN KEY (EID) REFERENCES Event(EID),
    FOREIGN KEY (UID) REFERENCES AppUSER(UID)
);
GO
