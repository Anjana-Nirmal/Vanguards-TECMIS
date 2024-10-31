CREATE TABLE DEAN(
    DEAN_ID VARCHAR(20),
    PRIMARY KEY(DEAN_ID),
    FOREIGN KEY(DEAN_ID) REFERENCES USER(User_Id) ON DELETE CASCADE
);


CREATE TABLE TECHNICAL_OFFICER(
	TO_ID VARCHAR(20),
	T_Role VARCHAR(50),
	PRIMARY KEY(TO_ID),
	FOREIGN KEY(TO_ID) REFERENCES USER(User_Id) ON DELETE CASCADE
);


CREATE TABLE EXAM_MARK(
	Stu_ID VARCHAR(20),
	Course_ID VARCHAR(20),
	Quiz_1 DECIMAL(5,2),
	Quiz_2 DECIMAL(5,2),
	Quiz_3 DECIMAL(5,2),
	Assesment DECIMAL(5,2),
	mid_Theory DECIMAL(5,2),
	mid_Practical DECIMAL(5,2),
	end_Theory DECIMAL(5,2),
	end_Practical DECIMAL(5,2),
	ELI_ID VARCHAR(20), 
	PRIMARY KEY(Stu_ID, Course_ID)
);


CREATE TABLE MEDICAL(
	MED_ID VARCHAR(20),
	STU_ID VARCHAR(20),
	Course_ID CHAR(10),
	M_Description VARCHAR(50),
	SubmitDate DATE,
	PRIMARY KEY(Med_ID)
);


CREATE TABLE TO_ATTENDENCE(
 	TO_ID VARCHAR(20),
	COURSE_ID VARCHAR(20),
 	Stu_ID VARCHAR(20),
 	PRIMARY KEY(TO_ID, Course_ID, Stu_ID)
);


CREATE TABLE LECTURER_COURSE(
 	LEC_ID VARCHAR(20),
 	COURSE_ID VARCHAR(20),
 	Lec_in_charge VARCHAR(50),
 	Lec_hours DECIMAL(5,2),
 	PRIMARY KEY(LEC_ID, Course_ID)
);


CREATE TABLE LECTURER_STUDENT(
 	LEC_ID VARCHAR(20),
 	Stu_ID VARCHAR(20),
 	PRIMARY KEY(LEC_ID, Stu_ID)
);

