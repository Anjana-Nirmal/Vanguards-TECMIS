
--Medical Table

INSERT INTO MEDICAL
(MED_ID,STU_ID,Course_ID,M_Description,SubmitDate)

VALUES
('MED001','TG/2022/1352','ICT1212','Anxiety or Panic Disorder','2024-08-06'),
('MED002','TG/2022/1357','TMS1233','Migraine Attacks','2024-08-14'),
('MED003','TG/2022/1354','ICT1242','Gastroenteritis, Stomach Flu','2024-08-15'),
('MED004','TG/2022/1349','TCS1212','Asthma Exacerbation','2024-08-23'),
('MED005','TG/2022/1352','ICT1212','Preventing Contagion','2024-08-27'),
('MED006','TG/2022/1354','ICT1242','Flu or Severe Cold','2024-09-05'),
('MED007','TG/2022/1357','TMS1233','Migraine Attacks','2024-09-18'),
('MED008','TG/2022/1351','ICT1233','Gastroenteritis, Stomach Flu','2024-10-07'),
('MED009','TG/2022/1354','ICT1242','Flu','2024-10-10'),
('MED010','TG/2022/1349','TCS1212','Stomach Flu','2024-10-25'),
('MED011','TG/2022/1355','ICT1253','Severe Cold','2024-10-31'),
('MED012','TG/2022/1357','TMS1233','Asthma Exacerbation','2024-11-06'),
('MED013','TG/2022/1355','ICT1253','Flu','2024-11-14');




--Exam_Mark_Table

INSERT INTO EXAM_MARK
(Stu_ID,Course_ID,Quiz_1,Quiz_2,Quiz_3,Assesment,mid_Theory,mid_Practical,end_Theory,end_Practical)
VALUES
('TG/2019/1018','ICT1212',68,72.3,70,55.5,64.4,0,66,0),
('TG/2020/1064','ICT1212',48,62.3,60,64.5,73.4,0,61,0),
('TG/2020/1095','ICT1212',78,84.5,100,74.8,69,0,86,0),
('TG/2021/1125','ICT1212',75.2,91.5,35,52,48,0,45,0),
('TG/2021/1152','ICT1212',44,35.8,56,47,52.5,0,32.7,0),
('TG/2021/1174','ICT1212',88.5,98,79.5,84,83,0,75,0),
('TG/2021/1232','ICT1212',54.2,65,75.6,85,98.7,0,95.8,0),
('TG/2021/1246','ICT1212',64,85.7,74,89,95.8,0,87.5,0),
('TG/2022/1346','ICT1212',78.2,91.5,35,52,45.8,0,45,0),
('TG/2022/1347','ICT1212',94.5,78,56.3,28,78,0,88,0),
('TG/2022/1348','ICT1212',74,89,69.5,87,89.2,0,96.7,0),
('TG/2022/1349','ICT1212',42.5,56.9,46,78.6,97,0,74,0),
('TG/2022/1350','ICT1212',75,89.8,78.2,69.5,84,0,87,0),
('TG/2022/1351','ICT1212',88.4,99.4,87,94.2,92,0,94.4,0),
('TG/2022/1352','ICT1212',85.7,100,96.1,87,94.5,0,92.5,0),
('TG/2022/1353','ICT1212',32,41.5,65,25,36.5,0,38,0),
('TG/2022/1354','ICT1212',65.5,100,85.5,96,100,0,86.5,0),
('TG/2022/1355','ICT1212',95,78.5,95,94,96.5,0,94.2,0),
('TG/2022/1356','ICT1212',36.5,42,38,28.5,52,0,45,0),
('TG/2022/1357','ICT1212',100,98.8,95,98.4,94,0,96,0),
('TG/2022/1358','ICT1212',95.5,84.6,86.5,74.2,85,0,86,0),
('TG/2022/1359','ICT1212',88,95,97.5,95,79.5,0,94,0),


('TG/2019/1018','ICT1222',62,72.5,70,65.5,0,66,0,68.5),
('TG/2020/1064','ICT1222',78.5,98,79.5,74,0,71,0,86),
('TG/2020/1095','ICT1222',88,84.5,100,74.8,0,86,0,85),
('TG/2021/1125','ICT1222',70,85,69.5,87,0,96.7,0,72),
('TG/2021/1152','ICT1222',54,35.8,75,47,0,32.7,0,56),
('TG/2021/1174','ICT1222',88.5,98,79.5,74,0,75,0,86),
('TG/2021/1232','ICT1222',54.6,60,75.6,85,0,95.8,0,88.8),
('TG/2021/1246','ICT1222',74,85.7,74,89,0,87.5,0,90),
('TG/2022/1346','ICT1222',78.2,91.5,45,52,0,45,0,78.2),
('TG/2022/1347','ICT1222',94.5,68,56.3,48,0,88,0,68.5),
('TG/2022/1348','ICT1222',70,89,69.5,87,0,96.7,0,82),
('TG/2022/1349','ICT1222',52.5,56.9,46,78.6,0,74,0,66.7),
('TG/2022/1350','ICT1222',75,84.8,78.2,66.5,0,87,0,85.2),
('TG/2022/1351','ICT1222',88.4,99.4,87,94.2,0,84.4,0,90),
('TG/2022/1352','ICT1222',85.7,98,96.1,87,0,92.5,0,85),
('TG/2022/1353','ICT1222',32,51.5,65,25,0,38,0,78.4),
('TG/2022/1354','ICT1222',65.5,91,85.5,96,0,86.5,0,78.5),
('TG/2022/1355','ICT1222',85,78.5,100,94,0,94.2,0,82),
('TG/2022/1356','ICT1222',46.5,42,38,28.5,0,45,0,50),
('TG/2022/1357','ICT1222',100,98.8,95,98.4,0,96,0,90),
('TG/2022/1358','ICT1222',95.5,88,86.5,74.2,0,86,0,82.5),
('TG/2022/1359','ICT1222',76,95,97.5,95,0,94,0,89),


('TG/2019/1018','ICT1233',78,72.3,70,55.5,0,75,66,70),
('TG/2020/1064','ICT1233',54,65,75.6,85.3,0,66,95.8,70.5),
('TG/2020/1095','ICT1233',69,84.5,98,74.8,0,78,86,84),
('TG/2021/1125','ICT1233',74.5,78,56.3,28,0,35,78,78),
('TG/2021/1152','ICT1233',48,35.8,56,47,0,62.5,32.7,65.2),
('TG/2021/1174','ICT1233',82.5,98,79.5,84,0,95,75,80.5),
('TG/2021/1232','ICT1233',54.2,65,75.6,85,0,66,95.8,74.5),
('TG/2021/1246','ICT1233',64,85.7,74,100,0,78,87.5,72.5),
('TG/2022/1346','ICT1233',78.2,91.5,35,52,0,40.5,45,75),
('TG/2022/1347','ICT1233',84.5,78,56.3,28,0,35,88,84),
('TG/2022/1348','ICT1233',74.2,89,69.5,87,0,74.2,96.7,82.5),
('TG/2022/1349','ICT1233',42.5,56.9,46,78.6,0,65,74,60),
('TG/2022/1350','ICT1233',65,89.8,78.2,69.5,0,80,87,88),
('TG/2022/1351','ICT1233',100,99.4,87,94.2,0,91.2,94.4,72),
('TG/2022/1352','ICT1233',85.7,90,96.1,87,0,88,92.5,80.5),
('TG/2022/1353','ICT1233',32,41.5,65,25,0,30,38,28.2),
('TG/2022/1354','ICT1233',65.5,95,85.5,96,0,98,86.5,75),
('TG/2022/1355','ICT1233',95,78.5,95,94,0,84,94.2,85.5),
('TG/2022/1356','ICT1233',36.5,42,38,28.5,0,35,45,30),
('TG/2022/1357','ICT1233',95,98.8,95,98.4,0,90,96,82.8),
('TG/2022/1358','ICT1233',95.5,84.6,86.5,74.2,0,78.5,86,77),
('TG/2022/1359','ICT1233',85,95,97.5,95,0,80,94,81.5),


('TG/2019/1018','ICT1242',78,82.3,80,65.5,74.4,0,76,0),
('TG/2020/1064','ICT1242',67,45,66,67,70.5,0,78,0),
('TG/2020/1095','ICT1242',88,84.5,90,74.8,79,0,76,0),
('TG/2021/1125','ICT1242',100,91.5,55,62,45.8,0,55,0),
('TG/2021/1152','ICT1242',64,45.8,66,67,72.5,0,42.7,0),
('TG/2021/1174','ICT1242',68.5,100,89.5,74,83,0,87,0),
('TG/2021/1232','ICT1242',74.2,65,75.6,95,98.7,0,75.8,0),
('TG/2021/1246','ICT1242',87,85.7,100,89,95.8,0,77.5,0),
('TG/2022/1346','ICT1242',100,91.5,35,62,45.8,0,55,0),
('TG/2022/1347','ICT1242',94.5,78,76.3,28,78,0,88,0),
('TG/2022/1348','ICT1242',84,89,69.5,87,89.2,0,78.7,0),
('TG/2022/1349','ICT1242',78.5,56.9,45,78.6,97,0,74,0),
('TG/2022/1350','ICT1242',100,89.8,78.2,79.5,84,0,87,0),
('TG/2022/1351','ICT1242',86.4,99.4,87,94.2,92,0,74.4,0),
('TG/2022/1352','ICT1242',95.7,100,96.1,87,94.5,0,92.5,0),
('TG/2022/1353','ICT1242',32,41.5,55,25,36.5,0,38,0),
('TG/2022/1354','ICT1242',78.5,100,85.5,96,100,0,86.5,0),
('TG/2022/1355','ICT1242',95,78.5,95,94,96.5,0,84.5,0),
('TG/2022/1356','ICT1242',36.5,42,38,28.5,52,0,42.2,0),
('TG/2022/1357','ICT1242',90,98.8,95,98.4,94,0,96,0),
('TG/2022/1358','ICT1242',95.5,84.6,76.5,74.2,85,0,86,0),
('TG/2022/1359','ICT1242',88,75,97.5,95,79.5,0,74,0),


('TG/2019/1018','ICT1253',68,72.3,70,55.5,0,65.5,66,78),
('TG/2020/1064','ICT1253',57.2,75,68.6,85,0,73.5,95.8,61),
('TG/2020/1095','ICT1253',78,84.5,100,74.8,0,70,86,66.5),
('TG/2021/1125','ICT1253',82.2,91.5,35,62,0,50,45,74.2),
('TG/2021/1152','ICT1253',44,35.8,56,47,0,89.5,32.7,52.2),
('TG/2021/1174','ICT1253',88.5,98,79.5,72,0,80,75,70),
('TG/2021/1232','ICT1253',54.2,65,75.6,85,0,73.5,95.8,65),
('TG/2021/1246','ICT1253',64,85.7,74,89,0,81.5,87.5,68),
('TG/2022/1346','ICT1253',78.2,91.5,35,52,0,50,45,74.2),
('TG/2022/1347','ICT1253',94.5,78,56.3,28,0,82.5,88,80),
('TG/2022/1348','ICT1253',74,89,69.5,87,0,77,96.7,87.5),
('TG/2022/1349','ICT1253',42.5,56.9,46,78.6,0,60,74,64),
('TG/2022/1350','ICT1253',75,89.8,78.2,69.5,0,72.2,87,73.5),
('TG/2022/1351','ICT1253',88.4,99.4,87,94.2,0,85,94.4,83.2),
('TG/2022/1352','ICT1253',85.7,100,96.1,87,0,78.4,92.5,90),
('TG/2022/1353','ICT1253',32,41.5,65,25,0,40,38,52.5),
('TG/2022/1354','ICT1253',65.5,100,85.5,96,0,74.5,86.5,70),
('TG/2022/1355','ICT1253',95,78.5,95,94,0,85,94.2,78.6),
('TG/2022/1356','ICT1253',36.5,42,38,28.5,0,36,45,52),
('TG/2022/1357','ICT1253',100,98.8,95,98.4,0,90.4,96,88.5),
('TG/2022/1358','ICT1253',95.5,84.6,86.5,74.2,0,72.5,86,74),
('TG/2022/1359','ICT1253',88,95,97.5,95,0,81,94,79),


('TG/2019/1018','TCS1212',67,72.3,50,55.5,64.4,0,66.5,0),
('TG/2020/1064','TCS1212',72.5,83,79.2,84,83,0,71,0),
('TG/2020/1095','TCS1212',65,74.5,90,74.8,79,0,56,0),
('TG/2021/1125','TCS1212',68,69,69.5,87,89.2,0,92.5,0),
('TG/2021/1152','TCS1212',74,35.8,56,65,52.5,0,55.7,0),
('TG/2021/1174','TCS1212',78.5,88,79.5,84,83,0,75.6,0),
('TG/2021/1232','TCS1212',86.2,65,75.6,85,98.7,0,85.8,0),
('TG/2021/1246','TCS1212',56,85.7,74,89,95.8,0,87.5,0),
('TG/2022/1346','TCS1212',78.2,91.5,48,52,45.8,0,45,0),
('TG/2022/1347','TCS1212',94.5,78,56.3,28,78,0,80,0),
('TG/2022/1348','TCS1212',74,69,69.5,87,89.2,0,96.5,0),
('TG/2022/1349','TCS1212',42.5,56.9,46,78.6,65,0,74,0),
('TG/2022/1350','TCS1212',65.6,89.8,78.2,69.5,84,0,87.4,0),
('TG/2022/1351','TCS1212',88.4,99.4,87,94.2,92,0,94.4,0),
('TG/2022/1352','TCS1212',75.7,90,96.1,87,94.5,0,92,0),
('TG/2022/1353','TCS1212',42,41.5,65,25,36.5,0,38,0),
('TG/2022/1354','TCS1212',100,96,85.5,96,100,0,86.5,0),
('TG/2022/1355','TCS1212',85,78.5,95,94,76.5,0,74.2,0),
('TG/2022/1356','TCS1212',36.5,42,38,28.5,52,0,55,0),
('TG/2022/1357','TCS1212',95,98.8,95,98.4,94,0,66,0),
('TG/2022/1358','TCS1212',84.5,84.6,86.5,74.2,85,0,86,0),
('TG/2022/1359','TCS1212',95,75,97.5,95,79.5,0,74.7,0),


('TG/2019/1018','TMS1233',64,85.7,74,89,95.8,0,87.5,0),
('TG/2020/1064','TMS1233',74,79,69.5,87,89.2,0,78.7,0),
('TG/2020/1095','TMS1233',65.5,100,85.5,96,100,0,86.5,0),
('TG/2021/1125','TMS1233',46.5,42,38,28.5,52,0,49,0),
('TG/2021/1152','TMS1233',42.5,56.9,46,78.6,97,0,74,0),
('TG/2021/1174','TMS1233',95,78.5,95,94,96.5,0,94.2,0),
('TG/2021/1232','TMS1233',78.2,91.5,35,52,45.8,0,45,0),
('TG/2021/1246','TMS1233',68,72.3,70,55.5,64.4,0,66,0),
('TG/2022/1346','TMS1233',75,89.8,78.2,69.5,84,0,87,0),
('TG/2022/1347','TMS1233',78,84.5,100,74.8,69,0,86,0),
('TG/2022/1348','TMS1233',36.5,42,38,28.5,52,0,45,0),
('TG/2022/1349','TMS1233',94.5,78,56.3,28,78,0,88,0),
('TG/2022/1350','TMS1233',44,35.8,56,47,52.5,0,32.7,0),
('TG/2022/1351','TMS1233',74,89,69.5,87,89.2,0,96.7,0),
('TG/2022/1352','TMS1233',32,41.5,65,25,36.5,0,38,0),
('TG/2022/1353','TMS1233',100,98.8,95,98.4,94,0,96,0),
('TG/2022/1354','TMS1233',88.5,98,79.5,84,83,0,75,0),
('TG/2022/1355','TMS1233',85.7,100,96.1,87,94.5,0,92.5,0),
('TG/2022/1356','TMS1233',88,95,97.5,95,79.5,0,94,0),
('TG/2022/1357','TMS1233',54.2,65,75.6,85,98.7,0,95.8,0),
('TG/2022/1358','TMS1233',95.5,84.6,86.5,74.2,85,0,86,0),
('TG/2022/1359','TMS1233',88.4,99.4,87,94.2,92,0,94.4,0),


('TG/2019/1018','ENG1222',88,95,97.5,95,79.5,0,94,0),
('TG/2020/1064','ENG1222',94.5,88,56.3,38,78,0,85,0),
('TG/2020/1095','ENG1222',95.5,84.6,86.5,74.2,85,0,86,0),
('TG/2021/1125','ENG1222',84.5,98,79.5,88,83,0,72,0),
('TG/2021/1152','ENG1222',100,98.8,95,98.4,94,0,96,0),
('TG/2021/1174','ENG1222',32,41.5,65,25,36.5,0,38,0),
('TG/2021/1232','ENG1222',65.5,100,85.5,96,100,0,86.5,0),
('TG/2021/1246','ENG1222',85.7,100,96.1,87,94.5,0,92.5,0),
('TG/2022/1346','ENG1222',88.4,99.4,87,94.2,92,0,94.4,0),
('TG/2022/1347','ENG1222',36.5,42,38,28.5,52,0,45,0),
('TG/2022/1348','ENG1222',78,84.5,100,74.8,69,0,86,0),
('TG/2022/1349','ENG1222',88.5,98,79.5,84,83,0,75,0),
('TG/2022/1350','ENG1222',95,78.5,95,94,96.5,0,94.2,0),
('TG/2022/1351','ENG1222',94.5,78,56.3,28,78,0,88,0),
('TG/2022/1352','ENG1222',78.2,91.5,35,52,45.8,0,45,0),
('TG/2022/1353','ENG1222',64,85.7,74,89,95.8,0,87.5,0),
('TG/2022/1354','ENG1222',75,89.8,78.2,69.5,84,0,87,0),
('TG/2022/1355','ENG1222',74,89,69.5,87,89.2,0,96.7,0),
('TG/2022/1356','ENG1222',54.2,65,75.6,85,98.7,0,95.8,0),
('TG/2022/1357','ENG1222',44,35.8,56,47,52.5,0,32.7,0),
('TG/2022/1358','ENG1222',68,72.3,70,55.5,64.4,0,66,0),
('TG/2022/1359','ENG1222',42.5,56.9,46,78.6,97,0,74,0);


--Technical Officer Table

INSERT INTO TECHNICAL_OFFICER
(TO_ID, T_Role)
VALUES
('Systems Administrator'),
('T002','Network Engineer'),
('T003','Technical Support Specialist'),
('Systems Administrator'),
('Database Administrator'),
('T006','Security Officer'),
('T007','Technical Support Specialist'),
('T008','Security Officer');


--DEAN Table

INSERT INTO DEAN
(DEAN_ID)
VALUES
('D001');


--LECTURER COURSE Table

INSERT INTO LECTURER_COURSE
(LEC_ID,COURSE_ID,Lec_in_charge,Lec_hours)

VALUES
('L001','ICT1233','Chinthaka Chandrakumara',60),
('L002','ICT1212','W.Chandradasa Perera',30),
('L003','ICT1242','L.Manjula Vithanapathirana',30),
('L004','ICT1222','J.M.Samudra Senarath',30),
('L005','ENG1222','S.D.Indiaka Divakara',30),
('L006','ICT1233','Chinthaka Chandrakumara',60),
('L007','ENG1222','S.D.Indiaka Divakara',30),
('L008','ICT1253','B.A.Nipuna Heminda',60),
('L009','TMS1233','J.Uditha Garusinghe',45),
('L010','ENG1222','S.D.Indiaka Divakara',30),
('L011','TMS1233','J.Uditha Garusinghe',45),
('L012','TCS1212','G.A.Madara Karunarathne',30);


--LECTURER_STUDENT Table

INSERT INTO LECTURER_STUDENT
(LEC_ID,Stu_ID)

VALUES
('L001','TG/2021/1174'),
('L001','TG/2022/1346'),
('L001','TG/2022/1347'),
('L001','TG/2022/1348'),
('L001','TG/2022/1349'),
('L001','TG/2022/1350'),
('L001','TG/2022/1351'),
('L001','TG/2022/1352'),
('L001','TG/2022/1353'),
('L001','TG/2022/1354'),
('L001','TG/2022/1355'),
('L001','TG/2022/1356'),
('L001','TG/2022/1357'),
('L001','TG/2022/1358'),
('L001','TG/2022/1359'),

('L002','TG/2022/1346'),
('L002','TG/2022/1347'),
('L002','TG/2022/1348'),
('L002','TG/2022/1349'),
('L002','TG/2022/1350'),
('L002','TG/2022/1351'),
('L002','TG/2022/1352'),
('L002','TG/2022/1353'),
('L002','TG/2022/1354'),
('L002','TG/2022/1355'),
('L002','TG/2022/1356'),
('L002','TG/2022/1357'),
('L002','TG/2022/1358'),
('L002','TG/2022/1359'),

('L003','TG/2019/1018'),
('L003','TG/2020/1095'),
('L003','TG/2021/1174'),
('L003','TG/2022/1346'),
('L003','TG/2022/1347'),
('L003','TG/2022/1348'),
('L003','TG/2022/1349'),
('L003','TG/2022/1350'),
('L003','TG/2022/1351'),
('L003','TG/2022/1352'),
('L003','TG/2022/1353'),
('L003','TG/2022/1354'),
('L003','TG/2022/1355'),
('L003','TG/2022/1356'),
('L003','TG/2022/1357'),
('L003','TG/2022/1358'),
('L003','TG/2022/1359'),

('L004','TG/2022/1346'),
('L004','TG/2022/1347'),
('L004','TG/2022/1348'),
('L004','TG/2022/1349'),
('L004','TG/2022/1350'),
('L004','TG/2022/1351'),
('L004','TG/2022/1352'),
('L004','TG/2022/1353'),
('L004','TG/2022/1354'),
('L004','TG/2022/1355'),
('L004','TG/2022/1356'),
('L004','TG/2022/1357'),
('L004','TG/2022/1358'),
('L004','TG/2022/1359'),

('L005','TG/2021/1152'),
('L005','TG/2022/1346'),
('L005','TG/2022/1347'),
('L005','TG/2022/1348'),
('L005','TG/2022/1349'),
('L005','TG/2022/1350'),
('L005','TG/2022/1351'),
('L005','TG/2022/1352'),
('L005','TG/2022/1353'),
('L005','TG/2022/1354'),
('L005','TG/2022/1355'),
('L005','TG/2022/1356'),
('L005','TG/2022/1357'),
('L005','TG/2022/1358'),
('L005','TG/2022/1359'),

('L006','TG/2021/1174'),
('L006','TG/2022/1346'),
('L006','TG/2022/1347'),
('L006','TG/2022/1348'),
('L006','TG/2022/1349'),
('L006','TG/2022/1350'),
('L006','TG/2022/1351'),
('L006','TG/2022/1352'),
('L006','TG/2022/1353'),
('L006','TG/2022/1354'),
('L006','TG/2022/1355'),
('L006','TG/2022/1356'),
('L006','TG/2022/1357'),
('L006','TG/2022/1358'),
('L006','TG/2022/1359'),

('L007','TG/2021/1152'),
('L007','TG/2022/1346'),
('L007','TG/2022/1347'),
('L007','TG/2022/1348'),
('L007','TG/2022/1349'),
('L007','TG/2022/1350'),
('L007','TG/2022/1351'),
('L007','TG/2022/1352'),
('L007','TG/2022/1353'),
('L007','TG/2022/1354'),
('L007','TG/2022/1355'),
('L007','TG/2022/1356'),
('L007','TG/2022/1357'),
('L007','TG/2022/1358'),
('L007','TG/2022/1359'),

('L008','TG/2020/1095'),
('L008','TG/2022/1346'),
('L008','TG/2022/1347'),
('L008','TG/2022/1348'),
('L008','TG/2022/1349'),
('L008','TG/2022/1350'),
('L008','TG/2022/1351'),
('L008','TG/2022/1352'),
('L008','TG/2022/1353'),
('L008','TG/2022/1354'),
('L008','TG/2022/1355'),
('L008','TG/2022/1356'),
('L008','TG/2022/1357'),
('L008','TG/2022/1358'),
('L008','TG/2022/1359'),

('L009','TG/2022/1346'),
('L009','TG/2022/1347'),
('L009','TG/2022/1348'),
('L009','TG/2022/1349'),
('L009','TG/2022/1350'),
('L009','TG/2022/1351'),
('L009','TG/2022/1352'),
('L009','TG/2022/1353'),
('L009','TG/2022/1354'),
('L009','TG/2022/1355'),
('L009','TG/2022/1356'),
('L009','TG/2022/1357'),
('L009','TG/2022/1358'),
('L009','TG/2022/1359'),

('L010','TG/2021/1152'),
('L010','TG/2022/1346'),
('L010','TG/2022/1347'),
('L010','TG/2022/1348'),
('L010','TG/2022/1349'),
('L010','TG/2022/1350'),
('L010','TG/2022/1351'),
('L010','TG/2022/1352'),
('L010','TG/2022/1353'),
('L010','TG/2022/1354'),
('L010','TG/2022/1355'),
('L010','TG/2022/1356'),
('L010','TG/2022/1357'),
('L010','TG/2022/1358'),
('L010','TG/2022/1359'),

('L011','TG/2022/1346'),
('L011','TG/2022/1347'),
('L011','TG/2022/1348'),
('L011','TG/2022/1349'),
('L011','TG/2022/1350'),
('L011','TG/2022/1351'),
('L011','TG/2022/1352'),
('L011','TG/2022/1353'),
('L011','TG/2022/1354'),
('L011','TG/2022/1355'),
('L011','TG/2022/1356'),
('L011','TG/2022/1357'),
('L011','TG/2022/1358'),
('L011','TG/2022/1359'),

('L012','TG/2021/1174'),
('L012','TG/2021/1232'),
('L012','TG/2021/1246'),
('L012','TG/2022/1346'),
('L012','TG/2022/1347'),
('L012','TG/2022/1348'),
('L012','TG/2022/1349'),
('L012','TG/2022/1350'),
('L012','TG/2022/1351'),
('L012','TG/2022/1352'),
('L012','TG/2022/1353'),
('L012','TG/2022/1354'),
('L012','TG/2022/1355'),
('L012','TG/2022/1356'),
('L012','TG/2022/1357'),
('L012','TG/2022/1358'),
('L012','TG/2022/1359');