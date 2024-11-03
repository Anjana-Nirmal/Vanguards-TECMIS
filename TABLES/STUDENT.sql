-----STUDENT Table structure

CREATE TABLE STUDENT(                       
    Stu_ID VARCHAR(20),
    S_Status ENUM('proper', 'repeat', 'suspended'),
    --GPA DECIMAL(4, 2),
    Dep_ID VARCHAR(20), 
    ELI_ID VARCHAR(20),
    PRIMARY KEY(Stu_ID),
    FOREIGN KEY(Stu_ID) REFERENCES USER(User_Id),
    FOREIGN KEY(Dep_ID) REFERENCES DEPARTMENT(Dep_ID),
    FOREIGN KEY(ELI_ID) REFERENCES ELIGIBILITY(ELI_ID)
);

-------------INSERT DATA TO  STUDENT 

INSERT INTO STUDENT (Stu_ID, S_Status, Dep_ID) VALUES
('TG/2019/1018', 'Repeat', 'D_ICT'),
('TG/2020/1095', 'Repeat', 'D_ICT'),
('TG/2021/1152', 'Repeat', 'D_ICT'),
('TG/2021/1174', 'Repeat', 'D_ICT'),
('TG/2021/1232', 'Repeat', 'D_ICT'),
('TG/2021/1246', 'Repeat', 'D_ICT'),
('TG/2020/1064', 'Suspended', 'D_ICT'),
('TG/2021/1125', 'Suspended', 'D_ICT'),
('TG/2022/1346', 'Proper', 'D_ICT'),
('TG/2022/1347', 'Proper', 'D_ICT'),
('TG/2022/1348', 'Proper', 'D_ICT'),
('TG/2022/1349', 'Proper', 'D_ICT'),
('TG/2022/1350', 'Proper', 'D_ICT'),
('TG/2022/1351', 'Proper', 'D_ICT'),
('TG/2022/1352', 'Proper', 'D_ICT'),
('TG/2022/1353', 'Proper', 'D_ICT'),
('TG/2022/1354', 'Proper', 'D_ICT'),
('TG/2022/1355', 'Proper', 'D_ICT'),
('TG/2022/1356', 'Proper', 'D_ICT'),
('TG/2022/1357', 'Proper', 'D_ICT'),
('TG/2022/1358', 'Proper', 'D_ICT'),
('TG/2022/1359', 'Proper', 'D_ICT');

