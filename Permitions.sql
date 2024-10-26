
-- ADMIN PRIVILEGES

CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'admin_123';

GRANT ALL PRIVILEGES ON vanguards.* 
TO 'admin'@'localhost'
WITH GRANT OPTION ;

FLUSH PRIVILEGES;




-- DEAN PRIVILEGES

CREATE USER 'Dean'@'localhost' IDENTIFIED BY 'dean_123';

GRANT ALL PRIVILEGES ON vanguards.* 
TO 'Dean'@'localhost';

FLUSH PRIVILEGES;




-- LECTURER PRIVILEGES

CREATE USER 'Lecturer'@'localhost' IDENTIFIED BY 'lecturer_123';

GRANT SELECT, INSERT, UPDATE, DELETE ON vanguards.* 
TO 'Lecturer'@'localhost';

FLUSH PRIVILEGES;




-- TO PRIVILEGES

CREATE USER 'Technical_Officer'@'localhost' IDENTIFIED BY 'To_123';

GRANT SELECT, INSERT, UPDATE ON vanguards.ATTENDENCE 
TO 'Technical_Officer'@'localhost';

FLUSH PRIVILEGES;




-- STUDENT PRIVILEGES

CREATE USER 'Student'@'localhost' IDENTIFIED BY 'student_123';

GRANT SELECT ON vanguards.ATTENDENCE 
TO 'Student'@'localhost';

FLUSH PRIVILEGES;


GRANT SELECT ON vanguards.EXAM_MARK 
TO 'Student'@'localhost';

FLUSH PRIVILEGES;




SHOW GRANTS FOR 'Admin'@'localhost';
SHOW GRANTS FOR 'Dean'@'localhost';
SHOW GRANTS FOR 'Lecturer'@'localhost';
SHOW GRANTS FOR 'Technical_Officer'@'localhost';
SHOW GRANTS FOR 'Student'@'localhost';

USE mysql;
SELECT user,host FROM user;
exit;

mysql -u Admin -p
mysql -u Dean -p
mysql -u Lecturer -p
mysql -u Technical_Officer -p
mysql -u Student -p