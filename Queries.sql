-- Query 1
USE EMPLOYEES;
SELECT
TITLE
,COUNT(EMP.EMP_NO) AS NUMBER_OF_EMPLOYEES
FROM EMPLOYEES AS EMP
INNER JOIN TITLES AS T
	ON EMP.EMP_NO = T.EMP_NO
WHERE EMP.BIRTH_DATE > '1965-01-01'
GROUP BY TITLE;

-- Query 2
USE EMPLOYEES;
SELECT
TITLE
,AVG(S.SALARY) AS AVG_SALARY
FROM EMPLOYEES AS EMP
INNER JOIN SALARIES AS S
	ON EMP.EMP_NO = S.EMP_NO
INNER JOIN TITLES AS T
	ON T.EMP_NO = EMP.EMP_NO
GROUP BY TITLE;

-- Query 3
USE EMPLOYEES;
SELECT
DEPT_NAME
,SUM(S.SALARY) AS TOTAL_SALARY
FROM EMPLOYEES AS EMP
INNER JOIN SALARIES AS S
	ON EMP.EMP_NO = S.EMP_NO
INNER JOIN DEPT_EMP AS EMPD
	ON EMPD.EMP_NO = EMP.EMP_NO
INNER JOIN DEPARTMENTS AS DEPT
	ON DEPT.DEPT_NO = EMPD.DEPT_NO
WHERE DEPT.DEPT_NO = 'd001' -- Marketing
AND YEAR(EMPD.FROM_DATE) >= 1990
AND YEAR(EMPD.TO_DATE) <= 1992
GROUP BY DEPT_NAME;
