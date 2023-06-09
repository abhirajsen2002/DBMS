-- Clear all table data
TRUNCATE TABLE A3_EMP_LEAVE_REGISTER;
TRUNCATE TABLE A3_LEAVE_TYPE_MASTER;
TRUNCATE TABLE A3_EMPLOYEE;
TRUNCATE TABLE A3_GRADE_MASTER;
TRUNCATE TABLE A3_DEPARTMENT;

-- Populate Department
INSERT INTO A3_DEPARTMENT VALUES (101, 'COMPUTER SCIENCE AND ENGINEERING');
INSERT INTO A3_DEPARTMENT VALUES (102, 'INFORMATION TECHNOLOGY');
INSERT INTO A3_DEPARTMENT VALUES (103, 'MECHANICAL');
INSERT INTO A3_DEPARTMENT VALUES (104, 'ELECTRICAL');
INSERT INTO A3_DEPARTMENT VALUES (105, 'CHEMICAL ENGINEERING');
COMMIT;

-- Populate Grade Master
INSERT INTO A3_GRADE_MASTER VALUES ('A');
INSERT INTO A3_GRADE_MASTER VALUES ('B');
INSERT INTO A3_GRADE_MASTER VALUES ('C');
COMMIT;

-- This insert will fail because of check constraint
INSERT INTO A3_GRADE_MASTER VALUES ('D');
COMMIT;

-- This update will fail because of check constraint
UPDATE A3_GRADE_MASTER
    SET GRADE_CD = 'D'
    WHERE GRADE_CD = 'C';
COMMIT;

-- Populate Leave Type Master
INSERT INTO A3_LEAVE_TYPE_MASTER VALUES (1, 'CL');
INSERT INTO A3_LEAVE_TYPE_MASTER VALUES (2, 'EL');
INSERT INTO A3_LEAVE_TYPE_MASTER VALUES (3, 'ML');
INSERT INTO A3_LEAVE_TYPE_MASTER VALUES (4, 'SL');
COMMIT;

-- Populate Employee
INSERT INTO A3_EMPLOYEE (EMP_CD, DEPT_CD, GRADE_CD, EMP_NAME, EMP_ADDRESS, EMP_CITY, BASIC_SAL)
    VALUES(10001, 101, 'A', 'ABHIRAJ SEN', 'Karunamoyee, Salt Lake City', 'Kolkata', 7000);
INSERT INTO A3_EMPLOYEE (EMP_CD, DEPT_CD, GRADE_CD, EMP_NAME, EMP_ADDRESS, EMP_CITY, BASIC_SAL)
    VALUES(10002, 101, 'A', 'RAJDEEP SEN', 'Karunamoyee, Salt Lake City', 'Kolkata', 5000);
INSERT INTO A3_EMPLOYEE (EMP_CD, DEPT_CD, GRADE_CD, EMP_NAME, EMP_ADDRESS, EMP_CITY, BASIC_SAL)
    VALUES(10003, 102, 'A', 'TOBY KAR', 'Karunamoyee, Salt Lake City', 'Kolkata', 9000);
INSERT INTO A3_EMPLOYEE (EMP_CD, DEPT_CD, GRADE_CD, EMP_NAME, EMP_ADDRESS, EMP_CITY, BASIC_SAL)
    VALUES(10004, 102, 'A', 'SANJOY KAR', 'Saptadeep, Baguihati', 'Kolkata', 7000);
INSERT INTO A3_EMPLOYEE (EMP_CD, DEPT_CD, GRADE_CD, EMP_NAME, EMP_ADDRESS, EMP_CITY, BASIC_SAL)
    VALUES(10005, 102, 'A', 'IMAN GHOSH', 'Golf Green', 'Kolkata', 5000);
INSERT INTO A3_EMPLOYEE (EMP_CD, DEPT_CD, GRADE_CD, EMP_NAME, EMP_ADDRESS, EMP_CITY, BASIC_SAL)
    VALUES(10006, 103, 'A', 'AMIT KUMAR SEN', 'Suhrid Lane', 'Jalpaiguri', 9000);
COMMIT;

-- Violate F-Key references
INSERT INTO A3_EMPLOYEE (EMP_CD, DEPT_CD, GRADE_CD, EMP_NAME, EMP_ADDRESS, EMP_CITY, BASIC_SAL)
    VALUES(10007, 100, 'A', 'KONINIKA NIYOGI', 'Kasba', 'Kolkata', 7000);
COMMIT;
UPDATE A3_EMPLOYEE SET GRADE_CD = 'D' WHERE EMP_CD = 10006;
COMMIT;

-- Violate Check constraints
INSERT INTO A3_EMPLOYEE (EMP_CD, DEPT_CD, GRADE_CD, EMP_NAME, EMP_ADDRESS, EMP_CITY, BASIC_SAL)
    VALUES(10007, 102, 'A', 'Koninica Niyogi', 'Kasba', 'Kolkata', 6000);
COMMIT;
INSERT INTO A3_EMPLOYEE (EMP_CD, DEPT_CD, GRADE_CD, EMP_NAME, EMP_ADDRESS, EMP_CITY, BASIC_SAL)
    VALUES(10007, 102, 'A', 'KONINIKA NIYOGI', 'Kasba', 'Kolkata', 4000);
COMMIT;
UPDATE A3_EMPLOYEE SET BASIC_SAL = 10000 WHERE EMP_CD = 10006;
COMMIT;

INSERT INTO A3_EMPLOYEE (EMP_CD, DEPT_CD, GRADE_CD, EMP_NAME, EMP_ADDRESS, EMP_CITY, BASIC_SAL)
    VALUES(10007, 102, 'A', 'KONINIKA NIYOGI', 'Kasba', 'Kolkata', 6000);
COMMIT;

-- Try to delete referenced Department
DELETE A3_DEPARTMENT WHERE DEPT_CD = 103;
COMMIT;

-- Populate Employee Leave Register
INSERT INTO A3_EMP_LEAVE_REGISTER VALUES (10001, '23-JAN-2023', '25-JAN-2023', 1);
INSERT INTO A3_EMP_LEAVE_REGISTER VALUES (10001, '14-FEB-2023', '15-FEB-2023', 2);
INSERT INTO A3_EMP_LEAVE_REGISTER VALUES (10007, '23-JAN-2023', '25-JAN-2023', 1);
INSERT INTO A3_EMP_LEAVE_REGISTER VALUES (10002, '15-FEB-2023', '15-FEB-2023', 2);
COMMIT;

-- Violate check constraint
INSERT INTO A3_EMP_LEAVE_REGISTER VALUES (10002, '17-FEB-2023', '16-FEB-2023', 2);
COMMIT;

SELECT * FROM A3_EMP_LEAVE_REGISTER;

-- Casecade delete of Leave Register record on deletion of Employee
--DELETE A3_EMPLOYEE WHERE EMP_CD = 10007;
--COMMIT;

--SELECT * FROM A3_EMP_LEAVE_REGISTER;
