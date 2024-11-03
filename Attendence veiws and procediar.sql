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



CREATE VIEW CA_Result_With_Attendance AS 
SELECT 
    c.course_code,
    c.student_id,
    a.Eligibility AS 
        Attendace_Eligibility,
        c.Eligibility AS CA_Eligibility,

    IF(a.Eligibility='Eligible' AND c.Eligibility='Eligible','Eligible','Not Eligible') AS Eligibility
FROM AttendanceEligibilitySummary a,
  CA_Result_Without_Attendance c
WHERE 
   a.student_id=c.student_id AND c.course_code=a.course_code
GROUP BY c.student_id,course_code;

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

CREATE PROCEDURE attendance_check_courseID(IN  Course_ID VARCHAR(20))
BEGIN
	SELECT 
		attendance_eligibility_view.stu_id,
		attendance.date,
		attendance_eligibility_view.Percentage,
		attendance_eligibility_view.Eligibility
	from 
		attendance,
		attendance_eligibility_view
	where 
		attendance_eligibility_view.stu_id=attendance.stu_id 
		AND attendance_eligibility_view.Course_code=Course_code 
		AND attendance_eligibility_view.Type!='E_T' AND attendance_eligibility_view.Type!='E_TP' AND attendance_eligibility_view.Type!='E_P'; 
	END //
	DELIMITER ;
	
	CALL get_attendance_by_course_code('ICT1212');

