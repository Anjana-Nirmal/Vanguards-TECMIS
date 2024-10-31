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

INSERT INTO STUDENT (Stu_ID, S_Status) VALUES
('TG/2019/1018', 'Repeat'),
('TG/2020/1095', 'Repeat'),
('TG/2021/1152', 'Repeat'),
('TG/2021/1174', 'Repeat'),
('TG/2021/1232', 'Repeat'),
('TG/2021/1246', 'Repeat'),
('TG/2020/1064', 'Suspended'),
('TG/2021/1125', 'Suspended'),
('TG/2022/1301', 'Proper'),
('TG/2022/1302', 'Proper'),
('TG/2022/1348', 'Proper'),
('TG/2022/1349', 'Proper'),
('TG/2022/1350', 'Proper'),
('TG/2022/1351', 'Proper'),
('TG/2022/1352', 'Proper'),
('TG/2022/1353', 'Proper'),
('TG/2022/1354', 'Proper'),
('TG/2022/1355', 'Proper'),
('TG/2022/1356', 'Proper'),
('TG/2022/1357', 'Proper'),
('TG/2022/1358', 'Proper'),
('TG/2022/1359', 'Proper');

