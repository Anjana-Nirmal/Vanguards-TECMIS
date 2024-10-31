CREATE TABLE COURSE_UNIT(
    Course_ID VARCHAR(20) PRIMARY KEY,
    C_Name VARCHAR(50),
    Credit INT,
	C_Type VARCHAR(30),
    Dep_ID VARCHAR(20)
);

CREATE TABLE ELIGIBILITY (
    ELI_ID VARCHAR(20) PRIMARY KEY,
    E_Status varchar(25)
);

CREATE TABLE STUDENT_COURSE(
    Stu_ID VARCHAR(20),
    COURSE_ID VARCHAR(20),
    PRIMARY KEY(Stu_ID, Course_ID)
);

