CREATE TABLE Technical_Officer(
    TO_ID VARCHAR(10) PRIMARY KEY,
    TO_Role VARCHAR(20),
    TO_FName VARCHAR(20),
    TO_LName VARCHAR(20),
    TO_Email VARCHAR(30),
    TO_Gender CHAR(1),
    TO_Address VARCHAR(30)
);

CREATE TABLE Dean(
    Dean_ID VARCHAR(10) PRIMARY KEY,
    Dean_Fname VARCHAR(20),
    Dean_LName VARCHAR(20),
    Dean_Contact varchar(10)
);

CREATE TABLE Medical(
    Med_ID VARCHAR(10) PRIMARY KEY,
    Discription VARCHAR(20),
    Stu_ID VARCHAR(10),
    TO_ID varchar(10),
    Submit_Date DATE(10)
);

CREATE TABLE Exam_mark(
    Quiz_01 FLOAT(9,2),
    Quiz_02 FLOAT(9,2),
    Quiz_03 FLOAT(9,2),
    Assesment FLOAT(9,2),
    Mid_Theory FLOAT(9,2),
    Mid_Practical FLOAT(9,2),
    End_Theory FLOAT(9,2),
    End_Practical FLOAT(9,2),
    Stu_ID VARCHAR(10),
    Course_ID VARCHAR(10)
);