CREATE Course_Unit(
    Course_ID CHAR(10)N PRIMARY KEY,
    Course_Name VARCHAR(25),
    Course_Credit INT(5),
    Course_Theory VARCHAR(20),
    DepID VARCHAR(20)
);

CREATE ELIGIBILITY (
    El_ID VARCHAR(10) PRIMARY KEY,
    El_status varchar(25),
    StuID varchar(10),  
);