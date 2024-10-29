CREATE TABLE USER(                           --USER Table structure
    User_Id CHAR(20),
    NIC CHAR(20) UNIQUE,
    F_name VARCHAR(50),
    L_name VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    Address VARCHAR(50),
    Contact_no VARCHAR(20),
    Email VARCHAR(50),
    Roles ENUM('STUDENT', 'LECTURER', 'DEAN', 'TO') NOT NULL,
    PRIMARY KEY(User_Id)
);



