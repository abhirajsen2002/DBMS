DROP TABLE A3_EMP;

CREATE TABLE A3_EMP
AS
SELECT E.EMP_CD AS EMPCODE, E.EMP_NAME AS NAME, D.DEPT_NAME AS DEPTNAME, E.BASIC_SAL AS BASIC
    FROM A3_EMPLOYEE E
    INNER JOIN A3_DEPARTMENT D
        ON E.DEPT_CD = D.DEPT_CD
    WHERE D.DEPT_CD = 101
    AND E.BASIC_SAL = 7000
;

INSERT INTO A3_EMP
SELECT E.EMP_CD AS EMPCODE, E.EMP_NAME AS NAME, D.DEPT_NAME AS DEPTNAME, E.BASIC_SAL AS BASIC
    FROM A3_EMPLOYEE E
    INNER JOIN A3_DEPARTMENT D
        ON E.DEPT_CD = D.DEPT_CD
    WHERE E.BASIC_SAL >= 7000;
COMMIT;

ALTER TABLE A3_EMP
    ADD NET_PAY NUMBER(38, 2);

UPDATE A3_EMP
    SET NET_PAY = 1.5 * BASIC;
COMMIT;

ALTER TABLE A3_EMP
    DROP COLUMN NET_PAY;
