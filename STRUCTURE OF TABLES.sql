
USER(
 User_Id  CHAR(20),
 NIC      CHAR(20),
 F_name  VARCHAR(50),
 L_name  VARCHAR(50),
 DOB      DATE ,
 Gender   VARCHAR(10),
 Address  VARCHAR(50),
 Contact_no VARCHAR(20),
 Email VARCHAR(50),
 PRIMARY KEY(User_Id)
);
----------------------------------------------
STUDENT(
 Stu_ID   CHAR(20),
 S_Status CHAR(20),
 GPA   DECIMAL(1,2),
 PRIMARY KEY(Stu_ID),
 FOREIGN KEY(Stu_ID) REFERENCES USER(User_Id),
 FOREIGN KEY(Dep_ID) REFERENCES DEPARTMENT(Dep_ID),
 FOREIGN KEY(Dep_ID) REFERENCES DEPARTMENT(Dep_ID),
 FOREIGN KEY(ELI_ID) REFERENCES ELIGIBILITY(ELI_ID) 
 
);
--------------------------------------------

LECTURER(
 LEC_ID   CHAR(20),
 Position VARCHAR(50),
 PRIMARY KEY(LEC_ID),
 FOREIGN KEY(LEC_ID) REFERENCES USER(User_Id)  
 
);
----------------------------------------------

ADMIN(
 ADMIN_ID CHAR(20),
 A_Role   VARCHAR(50),
 PRIMARY KEY(ADMIN_ID)
 FOREIGN KEY(ADMIN_ID) REFERENCES USER(User_Id)
);
----------------------------------------------

DEAN(
 DEAN_ID CHAR(20),
 PRIMARY KEY(DEAN_ID),
 FOREIGN KEY(DEAN_ID) REFERENCES USER(User_Id)

);
----------------------------------------------

TO(
 TO_ID   CHAR(20),
 T_Role  VARCHAR(50),
 PRIMARY KEY(TO_ID),
 FOREIGN KEY(TO_ID) REFERENCES USER(User_Id)
);
---------------------------------------------

EXAM_MARK(
 Stu_ID   CHAR(20),
 Course_ID  CHAR(20),
 Quiz_1   DECIMAL(5,2),
 Quiz_2   DECIMAL(5,2),
 Quiz_3   DECIMAL(5,2),
 Assesment  DECIMAL(5,2),
 mid_Theory  DECIMAL(5,2),
 mid_Practical DECIMAL(5,2),
 end_Theory    DECIMAL(5,2),
 end_Practical  DECIMAL(5,2),
 PRIMARY KEY(Stu_ID, Course_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_Id),
 FOREIGN KEY(Course_ID) REFERENCES COURSE_UNIT(Course_ID),
 FOREIGN KEY(ELI_ID) REFERENCES ELIGIBILITY(ELI_ID)
);

--------------------------------------------

COURSE_UNIT(
 Course_ID  CHAR(20),
 C_Name    VARCHAR(50),
 Credit    INT,
 C_Type    VARCHAR(15),
 PRIMARY_KEY (Course_ID),
 FOREIGN KEY(DEP_ID) REFERENCES DEPARTMENT(DEP_ID)
 
);
--------------------------------------------

DEPARTMENT(
 Dep_ID  CHAR(20),
 D_Name VARCHAR(50),
 PRIMARY KEY(Dep_ID),
 FOREIGN KEY(DEAN_ID) REFERENCES DEAN(DEAN_ID),
 FOREIGN KEY(ADMIN_ID) REFERENCES ADMIN(ADMIN_ID)
);
--------------------------------------------

ATTENDENCE(
 Course_ID  CHAR(20),
 Stu_ID  CHAR(20),
 A_Status VARCHAR(20),
 A_DATE     DATE,
 PRIMARY KEY(Course_ID, Stu_ID),
 FOREIGN KEY(Course_ID) REFERENCES COURSE_UNIT(Course_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_Id),
 FOREIGN KEY(DEAN_ID) REFERENCES DEAN(DEAN_Id),
 FOREIGN KEY(MED_ID) REFERENCES MEDICAL(MED_Id)
 
);
-----------------------------------------

MEDICAL(
 MED_ID  CHAR(20),
 M_Description  VARCHAR(50),
 SubmitDate  DATE,
 Stu_ID  CHAR(20),
 PRIMARY KEY(Med_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_ID)
);
---------------------------------------
ELIGIBILITY(
 ELI_ID  CHAR(20),
 E_Status  VARCHAR(20),
 PRIMARY KEY(ELI_ID)
);
--------------------------------------
TO_Process_Attendence(
 TO_ID  CHAR(20),
 COURSE_ID CHAR(20),
 Stu_ID CHAR(20),
 PRIMARY KEY(TO_ID, Course_ID, Stu_ID),
 FOREIGN KEY(TO_ID) REFERENCES TO(TO_ID),
 FOREIGN KEY(COURSE_ID) REFERENCES COURSE_UNIT(Course_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_ID)

);
-------------------------------------
LEC_Works_Department(
  LEC_ID CHAR(20),
  Dep_ID CHAR(20),
  PRIMARY KEY(LEC_ID, Dep_ID),
  FOREIGN KEY(LEC_ID) REFERENCES LECTURER(LEC_ID),
  FOREIGN KEY(Dep_ID) REFERENCES DEPARTMENT(Dep_ID)
);

LEC_Conduct_COURSE(
 LEC_ID CHAR(20),
 COURSE_ID CHAR(20),
 Lec_in_charge VARCHAR(20),
 Lec_hours     DECIMAL(5,2),
 PRIMARY KEY(LEC_ID, Course_ID),
 FOREIGN KEY(LEC_ID) REFERENCES LECTURER(LEC_ID),
 FOREIGN KEY(COURSE_ID) REFERENCES COURSE_UNIT(Course_ID)
);
-----------------------------------------
LEC_Teches_STU(
 LEC_ID CHAR(20),
 Stu_ID CHAR(20),
 PRIMARY KEY(LEC_ID, Stu_ID),
 FOREIGN KEY(LEC_ID) REFERENCES LECTURER(LEC_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_ID)
);
----------------------------------------
STU_Learns_Course(
 Stu_ID CHAR(20),
 COURSE_ID CHAR(20),
 PRIMARY KEY(Stu_ID, Course_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_ID),
 FOREIGN KEY(COURSE_ID) REFERENCES COURSE_UNIT(Course_ID)

);
STU_Has_ELIG(
 Stu_ID CHAR(20),
 ELI_ID CHAR(20),
 PRIMARY KEY(Stu_ID, ELI_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_ID),
 FOREIGN KEY(ELI_ID) REFERENCES ELIGIBILITY(ELI_ID)
);
------------------------------------------
ATTEN_Depend_ELIG(
 ELI_ID CHAR(20),
 COURSE_ID CHAR(20),
 Stu_ID CHAR(20),
 PRIMARY KEY(ELI_ID, Course_ID, Stu_ID),
 FOREIGN KEY(ELI_ID) REFERENCES ELIGIBILITY(ELI_ID),
 FOREIGN KEY(COURSE_ID) REFERENCES COURSE_UNIT(Course_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_ID)
);