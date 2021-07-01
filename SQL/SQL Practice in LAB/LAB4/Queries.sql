CREATE TABLE employee(name VARCHAR2(10), dob DATE, doj DATE, gender VARCHAR2(1), skill1 VARCHAR2(10), skill2 VARCHAR2(10), salary NUMBER(5));

DESC employee;

INSERT INTO employee VALUES('ANITHA', '30-JUN-60', '28-APR-75', 'F', 'C++', 'ASP.NET', 1000);

INSERT INTO employee VALUES('KAMALA', '28-APR-75', '20-MAY-92', 'F', 'DBASE', 'C#.NET', 2000);

INSERT INTO employee VALUES('MARY', '30-MAR-91', '09-APR-05', 'F', 'C++', 'DBASE', 2020);

INSERT INTO employee VALUES('ANAND', '02-JAN-89', '20-APR-09', 'M', 'ORACLE', 'C', 2100);

INSERT INTO employee VALUES('KARTHICK', '11-FEB-70', '15-JUN-12', 'M', 'JAVA', 'C++', 2500);

INSERT INTO employee VALUES('VIJAY', '29-OCT-82', '15-JUN-12', 'M', 'C#.NET', 'C++', 2520);

INSERT INTO employee VALUES('JAGADESH', '19-DEC-87', '15-JUN-12', 'M', 'COBOL', 'C++', 2500);

SELECT * FROM employee;

SELECT COUNT(gender) FROM employee WHERE gender='F';

SELECT AVG(salary) FROM employee;

SELECT COUNT(NAME) AS employee FROM employee WHERE skill1 IN ('COBOL' ,'PASCAL' ) OR skill2 IN ('COBOL' ,'PASCAL' );

SELECT AVG(FLOOR((SYSDATE - dob)/365)) FROM employee WHERE gender = 'F';

ALTER TABLE employee ADD packages NUMBER(3);

DESC employee;

UPDATE employee set packages = 3 WHERE name='ANITHA';

UPDATE employee set packages = 1 WHERE name='KAMALA';

UPDATE employee set packages = 4 WHERE name='MARY';

UPDATE employee set packages = 4 WHERE name='ANAND';

UPDATE employee set packages = 5 WHERE name='KARTHICK';

UPDATE employee set packages = 0 WHERE name='VIJAY';

UPDATE employee set packages = 2 WHERE name='JAGADESH';

SELECT * FROM employee;

SELECT name, packages from employee;

SELECT count(gender) "Male, Female" from employee GROUP BY gender;

SELECT name, packages from employee;

SELECT AVG(salary) AS Average FROM employee WHERE skill1 IN ('C++') OR skill2 IN ('C++');

SELECT name,skill1,skill2 FROM employee WHERE salary IN (SELECT MAX(salary) FROM employee);

SELECT name FROM employee WHERE salary IN (SELECT MIN(salary) FROM employee);

SELECT SUM(salary) AS Sum FROM employee WHERE skill1 IN ('C#.NET') OR skill2 IN ('C#.NET');