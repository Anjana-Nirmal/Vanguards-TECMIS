--------------------------Attendance-----------------------------------

--view all viewes
SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW' ;

SHOW PROCEDURE STATUS WHERE DB= 'vanguards';
---------------------------------------------------------------

--Drop view
DROP VIEW IF EXISTS view_name;

--------------------------------------------------------------

-- medical duration view

CREATE VIEW medical_view AS
SELECT 
    MED_ID,
    Stu_ID,
    Course_ID,
    1 AS medical_duration 
FROM 
    MEDICAL;

-------------------------------------------------------
-- Calculate  VIEW  CA_Result_With_Attendance  



-- CREATE VIEW CA_Result_With_Attendance AS 
-- SELECT 
--     c.course_code,
--     c.student_id,
--     a.Eligibility AS 
--         Attendace_Eligibility,
--         c.Eligibility AS CA_Eligibility,

--     IF(a.Eligibility='Eligible' AND c.Eligibility='Eligible','Eligible','Not Eligible') AS Eligibility
-- FROM AttendanceEligibilitySummary a,
--   CA_Result_Without_Attendance c
-- WHERE 
--    a.student_id=c.student_id AND c.course_code=a.course_code
-- GROUP BY c.student_id,course_code;

---------------------------------------------------------

-- 80% eligibility without medical


CREATE VIEW Attendance_Eligibility AS
SELECT
    STUDENT.Stu_ID,
    ATTENDENCE.Course_ID,
    ATTENDENCE.A_Type,
    COUNT(ATTENDENCE.A_Status) / 15 * 100 AS "Percentage",
    IF((COUNT(ATTENDENCE.A_Status) / 15 * 100) >= 80, "Eligible", "Not Eligible") AS "Eligibility"
FROM
    ATTENDENCE, STUDENT
WHERE
    ATTENDENCE.Stu_ID = STUDENT.Stu_ID
    AND ATTENDENCE.A_Status = "Present"
    AND STUDENT.S_Status = 'Proper'
GROUP BY
    STUDENT.Stu_ID, ATTENDENCE.Course_ID, ATTENDENCE.A_Type;

	
----------------------------------------------------------------

-- 80% eligibility with  medical

-- CREATE VIEW Attendance_mediEligibility AS
-- SELECT
--     STUDENT.Stu_ID,
--     ATTENDENCE.Course_ID,
--     ATTENDENCE.A_Type,
--     (COUNT(CASE WHEN a.A_Status = 'Present' OR m.MED_ID IS NOT NULL THEN 1 END) / 15 * 100) AS "Percentage",
--     IF((COUNT(CASE WHEN a.A_Status = 'Present' OR m.MED_ID IS NOT NULL THEN 1 END) / 15 * 100) >= 80, "Eligible", "Not Eligible") AS "Eligibility"
-- FROM
--     ATTENDENCE ,STUDENT,MEDICAl
-- JOIN
--     STUDENT s ON a.Stu_ID = s.Stu_ID
-- LEFT JOIN
--     MEDICAL m ON a.Stu_ID = m.STU_ID 
--                AND a.Course_ID = m.Course_ID
--                AND a.A_DATE = m.SubmitDate
-- WHERE
--     s.S_Status = 'Proper'
-- GROUP BY
--     s.Stu_ID, a.Course_ID, a.A_Type;


	

------------------------ check eligibility  as individuals ----------------------------------
SELECT 
    Stu_ID,
    Course_ID,
    Eligibility
FROM 
    attendance_eligibility
WHERE 
    Stu_ID='TG/2022/1350';


 SELECT
       Stu_ID,
       Course_ID,
       Eligibility
 FROM
       attendance_eligibility
 WHERE
       Stu_ID='TG/2022/1350' AND Course_ID='ICT1212';


    ------------------------- check eligibility for the whole batch-------------------------------
SELECT 
    Stu_ID,
    Course_ID,
    Eligibility
FROM 
     attendance_eligibility
WHERE 
    SUBSTRING(Stu_ID, 4, 4) = '2022';

---------------------------------------  procedure-------------------------------

DELIMITER //
CREATE PROCEDURE attendance_check_courseID(IN input_Course_ID VARCHAR(20))
BEGIN
    SELECT 
        ae.Course_ID,
        a.Stu_ID,
        ae.Percentage AS Total_Percentage,
        ae.Eligibility AS Total_Eligibility,
        COUNT(CASE WHEN a.A_Type = 'T' AND a.A_Status = 'Present' THEN 1 END) / 15 * 100 AS Theory_Percentage,
        IF(COUNT(CASE WHEN a.A_Type = 'T' AND a.A_Status = 'Present' THEN 1 END) / 15 * 100 >= 80, 'Eligible', 'Not Eligible') AS Theory_Eligibility,
        COUNT(CASE WHEN a.A_Type = 'P' AND a.A_Status = 'Present' THEN 1 END) / 15 * 100 AS Practical_Percentage,
        IF(COUNT(CASE WHEN a.A_Type = 'P' AND a.A_Status = 'Present' THEN 1 END) / 15 * 100 >= 80, 'Eligible', 'Not Eligible') AS Practical_Eligibility
    FROM 
        ATTENDENCE a
        JOIN attendance_eligibility ae ON ae.Stu_ID = a.Stu_ID
    WHERE 
        ae.Course_ID = input_Course_ID AND
        (a.A_Status = 'Present' OR EXISTS (
            SELECT 1 FROM MEDICAL m 
            WHERE m.Stu_ID = a.Stu_ID AND m.Course_ID = a.Course_ID AND m.SubmitDate = a.A_DATE
        ))
    GROUP BY 
        ae.Course_ID, a.Stu_ID
    ORDER BY 
        a.Stu_ID;  -- Order by Student ID for better readability
END //
DELIMITER ;

-- Call the procedure with the desired Course_ID
CALL attendance_check_courseID('ICT1212');

DROP PROCEDURE IF EXISTS attendance_check_courseID;

-------------------------------------------------------------------
CREATE VIEW AttendanceBatchSummary AS
SELECT 
    a.Course_ID,
    a.Stu_ID,
    COUNT(CASE WHEN a.A_Type = 'T' AND (a.A_Status = 'Present' OR EXISTS (
        SELECT 1 
        FROM MEDICAL m 
        WHERE m.Stu_ID = a.Stu_ID 
          AND m.Course_ID = a.Course_ID 
          AND m.SubmitDate = a.A_DATE)) 
        THEN 1 
    END) / 15 * 100 AS Theory_Percentage,
    
    IF(COUNT(CASE WHEN a.A_Type = 'T' AND (a.A_Status = 'Present' OR EXISTS (
        SELECT 1 
        FROM MEDICAL m 
        WHERE m.Stu_ID = a.Stu_ID 
          AND m.Course_ID = a.Course_ID 
          AND m.SubmitDate = a.A_DATE)) 
        THEN 1 
    END) / 15 * 100 >= 80, 'Eligible', 'Not Eligible') AS Theory_Eligibility,

    CASE 
        WHEN a.Course_ID IN ('ICT1233', 'ICT1253') THEN COUNT(CASE WHEN a.A_Type = 'P' AND (a.A_Status = 'Present' OR EXISTS (
            SELECT 1 
            FROM MEDICAL m 
            WHERE m.Stu_ID = a.Stu_ID 
              AND m.Course_ID = a.Course_ID 
              AND m.SubmitDate = a.A_DATE)) 
            THEN 1 
        END) / 15 * 100 
        ELSE NULL
    END AS Practical_Percentage,

    CASE 
        WHEN a.Course_ID IN ('ICT1233', 'ICT1253') THEN IF(COUNT(CASE WHEN a.A_Type = 'P' AND (a.A_Status = 'Present' OR EXISTS (
            SELECT 1 
            FROM MEDICAL m 
            WHERE m.Stu_ID = a.Stu_ID 
              AND m.Course_ID = a.Course_ID 
              AND m.SubmitDate = a.A_DATE)) 
            THEN 1 
        END) / 15 * 100 >= 80, 'Eligible', 'Not Eligible')
        ELSE NULL
    END AS Practical_Eligibility

FROM 
    ATTENDENCE a
GROUP BY 
    a.Course_ID, a.Stu_ID
ORDER BY 
    a.Course_ID, a.Stu_ID;


------------------------------------------- SHOW RESULTS--------------------------------------------------


SELECT * FROM AttendanceBatchSummary WHERE Course_ID = 'ICT1212' AND Stu_ID = 'TG/2022/1348';

CALL attendance_check_courseID('ICT1212');
CALL CA_Summary('ICT1242');


DELIMITER //
CREATE PROCEDURE combined_eligibility_check(
    IN input_Course_ID VARCHAR(20)
)
BEGIN
    SELECT 
        a.Stu_ID,
        a.Course_ID,

        -- Attendance Percentage Calculation
        (SUM(CASE WHEN a.A_Status = 'Present' OR EXISTS (
            SELECT 1 FROM MEDICAL m 
            WHERE m.Stu_ID = a.Stu_ID AND m.Course_ID = a.Course_ID AND m.SubmitDate = a.A_DATE
        ) THEN 1 ELSE 0 END) / 30 * 100) AS Attendance_Percentage,

        -- Attendance Eligibility based on >= 80%
        IF((SUM(CASE WHEN a.A_Status = 'Present' OR EXISTS (
            SELECT 1 FROM MEDICAL m 
            WHERE m.Stu_ID = a.Stu_ID AND m.Course_ID = a.Course_ID AND m.SubmitDate = a.A_DATE
        ) THEN 1 ELSE 0 END) / 30 * 100) >= 80, 'Eligible', 'Not Eligible') AS Attendance_Eligibility,

        -- Total CA Marks Calculation
        em.Quiz_1 + em.Quiz_2 + em.Quiz_3 + em.Assesment + em.mid_Theory + em.mid_Practical AS Total_CA_Marks,

        -- CA Eligibility based on >= 50 marks
        IF(em.Quiz_1 + em.Quiz_2 + em.Quiz_3 + em.Assesment + em.mid_Theory + em.mid_Practical >= 50, 
            'Eligible', 
            'Not Eligible') AS CA_Eligibility,

        -- Final Combined Eligibility (Eligible only if both attendance and CA are eligible)
        IF(
            (SUM(CASE WHEN a.A_Status = 'Present' OR EXISTS (
                SELECT 1 FROM MEDICAL m 
                WHERE m.Stu_ID = a.Stu_ID AND m.Course_ID = a.Course_ID AND m.SubmitDate = a.A_DATE
            ) THEN 1 ELSE 0 END) / 30 * 100) >= 80 
            AND 
            (em.Quiz_1 + em.Quiz_2 + em.Quiz_3 + em.Assesment + em.mid_Theory + em.mid_Practical >= 50), 
            'Eligible', 
            'Not Eligible'
        ) AS Combined_Eligibility

    FROM 
        ATTENDENCE a
    LEFT JOIN 
        EXAM_MARK em ON em.Stu_ID = a.Stu_ID AND em.Course_ID = a.Course_ID
    WHERE 
        a.Course_ID = input_Course_ID
    GROUP BY 
        a.Course_ID, a.Stu_ID
    HAVING 
        Combined_Eligibility = 'Eligible'  
    ORDER BY 
        a.Stu_ID;
END //
DELIMITER ;
