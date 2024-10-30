
USER(
 User_Id  VARCHAR(20),
 NIC      CHAR(20),
 F_name  VARCHAR(50),
 L_name  VARCHAR(50),
 DOB      DATE,
 Gender   VARCHAR(10),
 Address  VARCHAR(50),
 Contact_no VARCHAR(20),
 Email VARCHAR(50),
 Roles ENUM('STUDENT', 'LECTURER', 'DEAN', 'TO') NOT NULL,
 PRIMARY KEY(User_Id)
);

+------------+----------------------------------------+------+-----+---------+-------+
| Field      | Type                                   | Null | Key | Default | Extra |
+------------+----------------------------------------+------+-----+---------+-------+
| User_Id    | varchar(20)                            | NO   | PRI | NULL    |       |
| NIC        | char(20)                               | YES  |     | NULL    |       |
| F_name     | varchar(50)                            | YES  |     | NULL    |       |
| L_name     | varchar(50)                            | YES  |     | NULL    |       |
| DOB        | date                                   | YES  |     | NULL    |       |
| Gender     | varchar(10)                            | YES  |     | NULL    |       |
| Address    | varchar(50)                            | YES  |     | NULL    |       |
| Contact_no | varchar(20)                            | YES  |     | NULL    |       |
| Email      | varchar(50)                            | YES  |     | NULL    |       |
| Roles      | enum('STUDENT','LECTURER','DEAN','TO') | NO   |     | NULL    |       |
+------------+----------------------------------------+------+-----+---------+-------+


----------------------------------------------------------------

LECTURER(
 LEC_ID   VARCHAR(20),
 Position VARCHAR(50),
 PRIMARY KEY(LEC_ID),
 FOREIGN KEY(LEC_ID) REFERENCES USER(User_Id) ON DELETE CASCADE 
);

+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| LEC_ID   | varchar(20) | NO   | PRI | NULL    |       |
| Position | varchar(50) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

----------------------------------------------------------------
ADMIN(
 ADMIN_ID VARCHAR(20),
 A_Role   VARCHAR(50),
 PRIMARY KEY(ADMIN_ID),
 FOREIGN KEY(ADMIN_ID) REFERENCES USER(User_Id) ON DELETE CASCADE
);

+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| ADMIN_ID | varchar(20) | NO   | PRI | NULL    |       |
| A_Role   | varchar(50) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

-----------------------------------------------------------------

DEAN(
 DEAN_ID VARCHAR(20),
 PRIMARY KEY(DEAN_ID),
 FOREIGN KEY(DEAN_ID) REFERENCES USER(User_Id) ON DELETE CASCADE

);

+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| DEAN_ID | varchar(20) | NO   | PRI | NULL    |       |
+---------+-------------+------+-----+---------+-------+

-----------------------------------------------------------------

TECHNICAL_OFFICER(
 TO_ID   VARCHAR(20),
 T_Role  VARCHAR(50),
 PRIMARY KEY(TO_ID),
 FOREIGN KEY(TO_ID) REFERENCES USER(User_Id) ON DELETE CASCADE
);

+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| TO_ID  | varchar(20) | NO   | PRI | NULL    |       |
| T_Role | varchar(50) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

------------------------------------------------------------------
 DEPARTMENT (
    Dep_ID VARCHAR(20),
    D_Name VARCHAR(50),
    DEAN_ID VARCHAR(20),
    ADMIN_ID VARCHAR(20),
    PRIMARY KEY(Dep_ID),
    FOREIGN KEY(DEAN_ID) REFERENCES DEAN(DEAN_ID),
    FOREIGN KEY(ADMIN_ID) REFERENCES ADMIN(ADMIN_ID)
);

+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| Dep_ID   | varchar(20) | NO   | PRI | NULL    |       |
| D_Name   | varchar(50) | YES  |     | NULL    |       |
| DEAN_ID  | varchar(20) | YES  | MUL | NULL    |       |
| ADMIN_ID | varchar(20) | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+

-------------------------------------------------------------------
COURSE_UNIT(
 Course_ID  VARCHAR(20),
 C_Name    VARCHAR(50),
 Credit    INT,
 C_Type    VARCHAR(15),
 DEP_ID VARCHAR(20),
 PRIMARY KEY (Course_ID),
 FOREIGN KEY(DEP_ID) REFERENCES DEPARTMENT(Dep_ID)
);

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| Course_ID | varchar(20) | NO   | PRI | NULL    |       |
| C_Name    | varchar(50) | YES  |     | NULL    |       |
| Credit    | int(11)     | YES  |     | NULL    |       |
| C_Type    | varchar(15) | YES  |     | NULL    |       |
| DEP_ID    | varchar(20) | YES  | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

-------------------------------------------------------------------

ELIGIBILITY(
 ELI_ID  VARCHAR(20),
 E_Status  VARCHAR(20),
 PRIMARY KEY(ELI_ID)
);

+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| ELI_ID   | varchar(20) | NO   | PRI | NULL    |       |
| E_Status | varchar(20) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

-------------------------------------------------------------------

STUDENT(
 Stu_ID   VARCHAR(20),
 S_Status VARCHAR(20),
 GPA DECIMAL(4,2),  
 Dep_ID VARCHAR(20), 
 ELI_ID VARCHAR(20),
 PRIMARY KEY(Stu_ID),
 FOREIGN KEY(Stu_ID) REFERENCES USER(User_Id) ON DELETE CASCADE ,
 FOREIGN KEY(Dep_ID) REFERENCES DEPARTMENT(Dep_ID),
 FOREIGN KEY(ELI_ID) REFERENCES ELIGIBILITY(ELI_ID) 
);

+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| Stu_ID   | varchar(20)  | NO   | PRI | NULL    |       |
| S_Status | varchar(20)  | YES  |     | NULL    |       |
| GPA      | decimal(4,2) | YES  |     | NULL    |       |
| Dep_ID   | varchar(20)  | YES  | MUL | NULL    |       |
| ELI_ID   | varchar(20)  | YES  | MUL | NULL    |       |
+----------+--------------+------+-----+---------+-------+

--------------------------------------------------------------------

EXAM_MARK(
 Stu_ID   VARCHAR(20),
 Course_ID  VARCHAR(20),
 Quiz_1   DECIMAL(5,2),
 Quiz_2   DECIMAL(5,2),
 Quiz_3   DECIMAL(5,2),
 Assesment  DECIMAL(5,2),
 mid_Theory  DECIMAL(5,2),
 mid_Practical DECIMAL(5,2),
 end_Theory    DECIMAL(5,2),
 end_Practical  DECIMAL(5,2),
 ELI_ID VARCHAR(20), 
 PRIMARY KEY(Stu_ID, Course_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_ID),
 FOREIGN KEY(Course_ID) REFERENCES COURSE_UNIT(Course_ID),
 FOREIGN KEY(ELI_ID) REFERENCES ELIGIBILITY(ELI_ID)
);

+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| Stu_ID        | varchar(20)  | NO   | PRI | NULL    |       |
| Course_ID     | varchar(20)  | NO   | PRI | NULL    |       |
| Quiz_1        | decimal(5,2) | YES  |     | NULL    |       |
| Quiz_2        | decimal(5,2) | YES  |     | NULL    |       |
| Quiz_3        | decimal(5,2) | YES  |     | NULL    |       |
| Assesment     | decimal(5,2) | YES  |     | NULL    |       |
| mid_Theory    | decimal(5,2) | YES  |     | NULL    |       |
| mid_Practical | decimal(5,2) | YES  |     | NULL    |       |
| end_Theory    | decimal(5,2) | YES  |     | NULL    |       |
| end_Practical | decimal(5,2) | YES  |     | NULL    |       |
| ELI_ID        | varchar(20)  | YES  | MUL | NULL    |       |
+---------------+--------------+------+-----+---------+-------+

----------------------------------------------------------------------
MEDICAL(
 MED_ID  VARCHAR(20),
 M_Description  VARCHAR(50),
 SubmitDate  DATE,
 STU_ID  VARCHAR(20),
 PRIMARY KEY(Med_ID),
 FOREIGN KEY(STU_ID) REFERENCES STUDENT(Stu_ID)
);

+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| MED_ID        | varchar(20) | NO   | PRI | NULL    |       |
| M_Description | varchar(50) | YES  |     | NULL    |       |
| SubmitDate    | date        | YES  |     | NULL    |       |
| STU_ID        | varchar(20) | YES  | MUL | NULL    |       |
+---------------+-------------+------+-----+---------+-------+

-----------------------------------------------------------------------

ATTENDENCE(
 Course_ID  VARCHAR(20),
 Stu_ID  VARCHAR(20),
 A_Status VARCHAR(20),
 A_DATE     DATE,
 A_Type   VARCHAR(20),
 DEAN_ID VARCHAR(20),
 MED_ID VARCHAR(20),
 PRIMARY KEY(Course_ID, Stu_ID),
 FOREIGN KEY(Course_ID) REFERENCES COURSE_UNIT(Course_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_Id),
 FOREIGN KEY(DEAN_ID) REFERENCES DEAN(DEAN_Id),
 FOREIGN KEY(MED_ID) REFERENCES MEDICAL(MED_Id)
);

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| Course_ID | varchar(20) | NO   | PRI | NULL    |       |
| Stu_ID    | varchar(20) | NO   | PRI | NULL    |       |
| A_Status  | varchar(20) | YES  |     | NULL    |       |
| A_DATE    | date        | YES  |     | NULL    |       |
| A_Type    | varchar(20) | YES  |     | NULL    |       |
| DEAN_ID   | varchar(20) | YES  | MUL | NULL    |       |
| MED_ID    | varchar(20) | YES  | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

------------------------------------------------------------------------

TO_ATTENDENCE(
 TO_ID  VARCHAR(20),
 COURSE_ID VARCHAR(20),
 Stu_ID VARCHAR(20),
 PRIMARY KEY(TO_ID, Course_ID, Stu_ID),
 FOREIGN KEY(TO_ID) REFERENCES TECHNICAL_OFFICER(TO_ID),
 FOREIGN KEY(COURSE_ID) REFERENCES COURSE_UNIT(Course_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_ID)

);

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| TO_ID     | varchar(20) | NO   | PRI | NULL    |       |
| COURSE_ID | varchar(20) | NO   | PRI | NULL    |       |
| Stu_ID    | varchar(20) | NO   | PRI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

--------------------------------------------------------------------------
LECTURER_DEPARTMENT(
  LEC_ID VARCHAR(20),
  Dep_ID VARCHAR(20),
  PRIMARY KEY(LEC_ID, Dep_ID),
  FOREIGN KEY(LEC_ID) REFERENCES LECTURER(LEC_ID),
  FOREIGN KEY(Dep_ID) REFERENCES DEPARTMENT(Dep_ID)
);

+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| LEC_ID | varchar(20) | NO   | PRI | NULL    |       |
| Dep_ID | varchar(20) | NO   | PRI | NULL    |       |
+--------+-------------+------+-----+---------+-------+

---------------------------------------------------------------------------
LECTURER_COURSE(
 LEC_ID VARCHAR(20),
 COURSE_ID VARCHAR(20),
 Lec_in_charge VARCHAR(20),
 Lec_hours     DECIMAL(5,2),
 PRIMARY KEY(LEC_ID, Course_ID),
 FOREIGN KEY(LEC_ID) REFERENCES LECTURER(LEC_ID),
 FOREIGN KEY(COURSE_ID) REFERENCES COURSE_UNIT(Course_ID)
);

+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| LEC_ID        | varchar(20)  | NO   | PRI | NULL    |       |
| COURSE_ID     | varchar(20)  | NO   | PRI | NULL    |       |
| Lec_in_charge | varchar(20)  | YES  |     | NULL    |       |
| Lec_hours     | decimal(5,2) | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+

-----------------------------------------------------------------------------
LECTURER_STUDENT(
 LEC_ID VARCHAR(20),
 Stu_ID VARCHAR(20),
 PRIMARY KEY(LEC_ID, Stu_ID),
 FOREIGN KEY(LEC_ID) REFERENCES LECTURER(LEC_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_ID)
);

+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| LEC_ID | varchar(20) | NO   | PRI | NULL    |       |
| Stu_ID | varchar(20) | NO   | PRI | NULL    |       |
+--------+-------------+------+-----+---------+-------+

-----------------------------------------------------------------------------
STUDENT_COURSE(
 Stu_ID VARCHAR(20),
 COURSE_ID VARCHAR(20),
 PRIMARY KEY(Stu_ID, Course_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_ID),
 FOREIGN KEY(COURSE_ID) REFERENCES COURSE_UNIT(Course_ID)
);

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| Stu_ID    | varchar(20) | NO   | PRI | NULL    |       |
| COURSE_ID | varchar(20) | NO   | PRI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

-------------------------------------------------------------------------------

STUDENT_ELIGIBILITY(
 Stu_ID VARCHAR(20),
 ELI_ID VARCHAR(20),
 PRIMARY KEY(Stu_ID, ELI_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_ID),
 FOREIGN KEY(ELI_ID) REFERENCES ELIGIBILITY(ELI_ID)
);

+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| Stu_ID | varchar(20) | NO   | PRI | NULL    |       |
| ELI_ID | varchar(20) | NO   | PRI | NULL    |       |
+--------+-------------+------+-----+---------+-------+

-------------------------------------------------------------------------------

ATTENDENCE_ELIGIBILITY(
 ELI_ID VARCHAR(20),
 COURSE_ID VARCHAR(20),
 Stu_ID VARCHAR(20),
 PRIMARY KEY(ELI_ID, Course_ID, Stu_ID),
 FOREIGN KEY(ELI_ID) REFERENCES ELIGIBILITY(ELI_ID),
 FOREIGN KEY(COURSE_ID) REFERENCES COURSE_UNIT(Course_ID),
 FOREIGN KEY(Stu_ID) REFERENCES STUDENT(Stu_ID)
);

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| ELI_ID    | varchar(20) | NO   | PRI | NULL    |       |
| COURSE_ID | varchar(20) | NO   | PRI | NULL    |       |
| Stu_ID    | varchar(20) | NO   | PRI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+