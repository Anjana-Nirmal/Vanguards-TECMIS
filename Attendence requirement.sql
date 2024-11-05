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



-----------------------------80% eligibility without medical----------------------------

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


    SELECT * FROM Attendance_Eligibility;


-----------------------------80% eligibility with the medical------------------------------

CREATE VIEW attendance_eligibility_with_medical AS
SELECT 
    a.Stu_ID,
    a.Course_ID,
    
    -- Total attendance calculation with medical inclusion
    (SUM(CASE 
        WHEN a.A_Status = 'Present' THEN 1
        WHEN EXISTS (
            SELECT 1 FROM MEDICAL m 
            WHERE m.Stu_ID = a.Stu_ID AND m.Course_ID = a.Course_ID AND m.SubmitDate = a.A_DATE
        ) THEN 1
        ELSE 0 
    END) / 15 * 100) AS Attendance_Percentage,

    -- Final attendance eligibility status based on medical considerations
    CASE 
        WHEN COUNT(CASE 
            WHEN a.A_Status = 'Present' OR EXISTS (
                SELECT 1 FROM MEDICAL m 
                WHERE m.Stu_ID = a.Stu_ID AND m.Course_ID = a.Course_ID AND m.SubmitDate = a.A_DATE
            ) THEN 1 
            ELSE NULL 
        END) >= 12 
            THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS Medical_With_Eligibility

FROM 
    ATTENDENCE a
GROUP BY 
    a.Stu_ID, a.Course_ID;



SELECT * FROM attendance_eligibility_with_medical;

DROP VIEW attendance_eligibility_with_medical;
	
---------------------------------ATTENDENCE _Summary whole batch------------------------------------------



CREATE VIEW attendance_eligibility_summary AS
SELECT 
    a.Stu_ID,
    a.Course_ID,
    
    -- Attendance Percentage including medical
    (SUM(CASE 
        WHEN a.A_Status = 'Present' THEN 1
        WHEN EXISTS (
            SELECT 1 FROM MEDICAL m 
            WHERE m.Stu_ID = a.Stu_ID AND m.Course_ID = a.Course_ID AND m.SubmitDate = a.A_DATE
        ) THEN 1
        ELSE 0 
    END) / 15 * 100) AS Attendance_Percentage,

    -- Attendance Eligibility WITHOUT medical check
    IF((SUM(CASE 
        WHEN a.A_Status = 'Present' THEN 1
        ELSE 0 
    END) / 15 * 100) >= 80, 'Eligible', 'Not Eligible') AS Attendance_Eligibility,

    -- Total attendance count including medical
    COUNT(CASE 
        WHEN a.A_Status = 'Present' OR EXISTS (
            SELECT 1 FROM MEDICAL m 
            WHERE m.Stu_ID = a.Stu_ID AND m.Course_ID = a.Course_ID AND m.SubmitDate = a.A_DATE
        ) THEN 1 
        ELSE NULL 
    END) AS Total_Attendance_Count,

    -- Medical-based Eligibility
    CASE 
        WHEN COUNT(CASE 
            WHEN a.A_Status = 'Present' OR EXISTS (
                SELECT 1 FROM MEDICAL m 
                WHERE m.Stu_ID = a.Stu_ID AND m.Course_ID = a.Course_ID AND m.SubmitDate = a.A_DATE
            ) THEN 1 
            ELSE NULL 
        END) >= 12 
            THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS Medical_With_Eligibility

FROM 
    ATTENDENCE a
GROUP BY 
    a.Stu_ID, a.Course_ID;



SELECT * FROM attendance_eligibility_summary;

DROP view attendance_eligibility_summary;


SELECT * FROM attendance_eligibility_summary WHERE Course_ID = 'ICT1212' AND Stu_ID = 'TG/2022/1348';


-----------------------------------------

CREATE VIEW attendance_summary AS
SELECT 
    a.Course_ID,
    a.Stu_ID,
    COUNT(CASE WHEN a.A_Status = 'Present' THEN 1 END) AS Present_Count,
    COUNT(*) AS Total_Sessions,
    ROUND(COUNT(CASE WHEN a.A_Status = 'Present' THEN 1 END) * 100.0 / COUNT(*), 4) AS Percentage,
    CASE
        WHEN COUNT(CASE WHEN a.A_Status = 'Present' THEN 1 END) * 100.0 / COUNT(*) >= 80 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS Eligibility
FROM 
    ATTENDENCE a
GROUP BY 
    a.Course_ID, 
    a.Stu_ID;

SELECT * FROM attendance_summary;

-------------------SLECT  Not eligible (without medical ) --------------------------------
CREATE VIEW Not_Eligible_Students AS
SELECT 
    Stu_ID,
    Course_ID,
    A_Type,
    Percentage,
    Eligibility
FROM 
    attendance_eligibility
WHERE 
    (Percentage < 80 OR (A_Type = 'M' AND Percentage < 80)) 
    AND Eligibility = 'Not Eligible';  

SELECT * FROM Not_Eligible_Students;

-------------------SLECT  Not eligible (without medical ) --------------------


SELECT *
FROM attendance_eligibility
WHERE Medical_With_Eligibility = 'Not Eligible';
	
-----------------selct eligible (without medicle)------------------------
SELECT *
FROM attendance_eligibility
WHERE Eligibility = 'Eligible';


-------------------SLECT  Not eligible (without medical ) --------------------


SELECT *
FROM attendance_eligibility_with_medical
WHERE Medical_With_Eligibility = 'Not Eligible';


-----------------selct eligible (with medicle)------------------------
SELECT * FROM attendance_eligibility_with_medical
     WHERE Medical_With_Eligibility='Eligible';



------------------------ check eligibility  as individuals ----------------------------------
SELECT 
    Stu_ID,
    Course_ID,
    Medical_With_Eligibility
FROM 
    attendance_eligibility_summary
WHERE 
    Stu_ID='TG/2022/1350';


 SELECT
       Stu_ID,
       Course_ID,
       Medical_With_Eligibility
 FROM
       attendance_eligibility_summary
 WHERE
       Stu_ID='TG/2022/1350' AND Course_ID='ICT1212';



SELECT * FROM attendance_eligibility_summary 
 WHERE Course_ID = 'ICT1212' AND Stu_ID = 'TG/2022/1348';



--------------------------- check eligibility for the whole batch-------------------------------
SELECT 
    Stu_ID,
    Course_ID,
    Eligibility
FROM 
     attendance_eligibility
WHERE 
    SUBSTRING(Stu_ID, 4, 4) = '2022';

----------------------------------------procedure-------------------------------

DELIMITER //

CREATE PROCEDURE GetAttendanceByCourse(IN input_Course_ID VARCHAR(20))
BEGIN
    SELECT 
        ae.Stu_ID,
        a.A_DATE,
        ae.Attendance_Percentage AS Percentage,
        ae.Medical_with_Eligibility AS Eligibility
    FROM 
        attendance_eligibility_summary ae
        JOIN ATTENDENCE a ON ae.Stu_ID = a.Stu_ID AND ae.Course_ID = a.Course_ID
    WHERE 
        ae.Course_ID = input_Course_ID
    ORDER BY 
        ae.Stu_ID, a.A_DATE;
END //

DELIMITER ;

CALL GetAttendanceByCourse('ICT1253');

DROP PROCEDURE GetAttendanceByCourse;

--------------------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE GetOverallAttendanceByStudent(IN input_Stu_ID VARCHAR(20))
BEGIN
    SELECT 
        ae.Course_ID,
        ae.Stu_ID,
        ae.Attendance_Percentage AS Percentage,
        ae.Medical_with_Eligibility AS Eligibility
    FROM 
        attendance_eligibility_summary ae
    WHERE 
        ae.Stu_ID = input_Stu_ID
    ORDER BY 
        ae.Course_ID;
END //

DELIMITER ;

CALL GetOverallAttendanceByStudent('TG/2022/1348');

---------------------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE GetAttendanceByStudentAndCourse(IN input_Stu_ID VARCHAR(20), IN input_Course_ID VARCHAR(20))
BEGIN
    SELECT 
        ae.Stu_ID,
        ae.Course_ID,
        ae.Attendance_Percentage AS Percentage,
        ae.Medical_with_Eligibility AS Eligibility
    FROM 
        attendance_eligibility_summary ae
    WHERE 
        ae.Stu_ID = input_Stu_ID
        AND ae.Course_ID = input_Course_ID
    ORDER BY 
        ae.Stu_ID, ae.Course_ID;
END //

DELIMITER ;

CALL GetAttendanceByStudentAndCourse('TG/2022/1348', 'ICT1212');

----------------------------------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE GetStudentAttendanceDetails(
    IN input_Course_ID VARCHAR(20),
    IN input_Stu_ID VARCHAR(20)
)
BEGIN
    DECLARE has_theory BOOLEAN DEFAULT FALSE;
    DECLARE has_practical BOOLEAN DEFAULT FALSE;

    
    IF EXISTS (SELECT 1 FROM ATTENDENCE 
               WHERE Course_ID = input_Course_ID AND Stu_ID = input_Stu_ID AND A_Type = 'T') THEN
        SET has_theory = TRUE;
    END IF;

    
    IF EXISTS (SELECT 1 FROM ATTENDENCE 
               WHERE Course_ID = input_Course_ID AND Stu_ID = input_Stu_ID AND A_Type = 'P') THEN
        SET has_practical = TRUE;
    END IF;

    
    IF has_theory = TRUE AND has_practical = FALSE THEN
        -- Theory-only course
        SELECT 
            ae.Course_ID,
            ae.Stu_ID,
            ae.Attendance_Percentage AS Percentage,
            'Theory' AS A_Type
        FROM 
            attendance_eligibility_summary ae
        WHERE 
            ae.Course_ID = input_Course_ID AND ae.Stu_ID = input_Stu_ID;
    
    ELSEIF has_theory = FALSE AND has_practical = TRUE THEN
        -- Practical-only course
        SELECT 
            ae.Course_ID,
            ae.Stu_ID,
            ae.Attendance_Percentage AS Percentage,
            'Practical' AS A_Type
        FROM 
            attendance_eligibility_summary ae
        WHERE 
            ae.Course_ID = input_Course_ID AND ae.Stu_ID = input_Stu_ID;

    ELSEIF has_theory = TRUE AND has_practical = TRUE THEN
       
        SELECT 
            ae.Course_ID,
            ae.Stu_ID,
            ae.Attendance_Percentage AS Percentage,
            'Theory/Practical' AS A_Type
        FROM 
            attendance_eligibility_summary ae
        WHERE 
            ae.Course_ID = input_Course_ID AND ae.Stu_ID = input_Stu_ID;
    ELSE
        
        SELECT 'No attendance records found for the specified course and student' AS Message;
    END IF;
END //

DELIMITER ;

CALL GetStudentAttendanceDetails('ICT1222', 'TG/2022/1356');


--------------------------------------------------------------------------
-- -- Step 1: Add the new 'eligibility_presentage' column to 'attendance_eligibility_summary' table
-- ALTER TABLE attendance_eligibility_summary 
-- ADD COLUMN Attendance_Percentage DECIMAL(5, 2);

-- -- Step 2: Copy 'Attendance_Percentage' values from 'attendance_eligibility' to 'eligibility_presentage' in 'attendance_eligibility_summary'
-- UPDATE attendance_eligibility_summary AS aes
-- JOIN attendance_eligibility AS ae
-- ON aes.Course_ID = ae.Course_ID AND aes.Stu_ID = ae.Stu_ID
-- SET aes.Attendance_Percentage = ae.Percentage;
