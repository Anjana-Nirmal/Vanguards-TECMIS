CREATE VIEW CA_Result_With_Attendance AS 
SELECT 
    c.Course_ID,
    c.Stu_ID,
    a.Medical_With_Eligibility AS Attendance_Eligibility,
    c.Eligibility_Status AS CA_Eligibility,
    CASE 
        WHEN a.Medical_With_Eligibility = 'Eligible' AND c.Eligibility_Status = 'Eligible' THEN 'Eligible'
        WHEN a.Medical_With_Eligibility = 'Not Eligible' OR c.Eligibility_Status = 'Not Eligible' THEN 'Not Eligible'
        ELSE 'Unknown'  -- In case both are not determined
    END AS Final_Eligibility_Status
FROM 
    attendance_eligibility_summary a
JOIN 
    CA_marks_eligible c ON a.Stu_ID = c.Stu_ID AND a.Course_ID = c.Course_ID
GROUP BY 
    c.Stu_ID, c.Course_ID;


SELECT * FROM CA_Result_With_Attendance;
