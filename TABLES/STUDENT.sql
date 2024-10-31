CREATE TABLE STUDENT(                       --STUDENT Table structure
    Stu_ID VARCHAR(20),
    S_Status ENUM('proper', 'repeat', 'suspended'),
    GPA DECIMAL(4, 2),
    Dep_ID VARCHAR(20),
    ELI_ID VARCHAR(20),
    PRIMARY KEY(Stu_ID),
    FOREIGN KEY(Stu_ID) REFERENCES USER(User_Id),
    FOREIGN KEY(Dep_ID) REFERENCES DEPARTMENT(Dep_ID),
    FOREIGN KEY(ELI_ID) REFERENCES ELIGIBILITY(ELI_ID)
);

