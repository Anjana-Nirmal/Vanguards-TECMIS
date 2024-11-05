
CREATE TABLE STUDENT_ELIGIBILITY(
    Stu_ID VARCHAR(20),
    Course_ID VARCHAR(20),
	CA_marks DECIMAL(5, 2),
	Attendance_percentage DECIMAL(5, 2),
	Eligibility_status VARCHAR(20),
    PRIMARY KEY(Stu_ID, Course_ID)
);

INSERT INTO STUDENT_ELIGIBILITY (Stu_ID, Course_ID, CA_marks, Attendance_percentage, Eligibility_status)
SELECT 
    em.Stu_ID,
    em.Course_ID,
    
    (em.Quiz_1 + em.Quiz_2 + em.Quiz_3 + em.Assesment + em.mid_Theory + em.mid_Practical) / 6 AS CA_marks,
    
    (SUM(CASE WHEN att.A_Status = 'Present' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attendance_percentage,

    CASE 
        WHEN (em.Quiz_1 + em.Quiz_2 + em.Quiz_3 + em.Assesment + em.mid_Theory + em.mid_Practical) / 6 >= 50 
            AND (SUM(CASE WHEN att.A_Status = 'Present' THEN 1 ELSE 0 END) / COUNT(*)) * 100 >= 80
        THEN 'Eligible' 
        ELSE 'Not Eligible' 
    END AS Eligibility_status

FROM 
    EXAM_MARK em
JOIN 
    ATTENDENCE att 
ON 
    em.Stu_ID = att.Stu_ID 
    AND em.Course_ID = att.Course_ID

GROUP BY 
    em.Stu_ID, em.Course_ID;


------------------------ check eligibility  as individuals ----------------------------------
SELECT 
    Stu_ID,
    Course_ID,
    Eligibility_status
FROM 
    STUDENT_ELIGIBILITY
WHERE 
    Stu_ID='TG/2022/1353';

------------------------- check eligibility for the whole batch-------------------------------
SELECT 
    Stu_ID,
    Course_ID,
    Eligibility_status
FROM 
    STUDENT_ELIGIBILITY
WHERE 
    SUBSTRING(Stu_ID, 4, 4) = '2022';