SELECT * FROM sales;

SELECT ABS(-21) "Absolute Value" FROM Sales;

SELECT QUANTITY, CEIL(QUANTITY) FROM Sales WHERE SALESPERSONNUMBER = 176;

SELECT COS(60 * 3.14) "Cosine value of 60 deg" FROM Sales;

SELECT COSH(45 * 3.14) "Hyperbolic Cosine of 45 deg" FROM Sales;

SELECT EXP(-0.5) "e power -0.5" FROM Sales;

SELECT FLOOR(-0.5227) "Floor value" FROM Sales;

SELECT POWER(3,-5) "exponent value" FROM Sales;

SELECT MOD(-33,4) "remainder" FROM Sales;

CREATE TABLE sampleTable(idno NUMBER(10));

INSERT INTO sampleTable VALUES(1422);

SELECT * FROM sampleTable;

SELECT ROUND(15.881299,-1) "Round" FROM sampleTable;

SELECT TRUNC(7.61889,-1) "Truncate" FROM sampleTable;

SELECT SQRT(37) "Square root" FROM sampleTable;

SELECT INITCAP('abc def gvp') "Capitalized Case" FROM sampleTable;

SELECT LOWER('I AM GUDI VARAPRASAD 19BCE7048') "lowercase" FROM sampleTable;

SELECT UPPER('19bce7048 gvp') "Uppercase" FROM sampleTable;

SELECT LTRIM('%!!!!!%GudiVaraprasad%!!!!%', '%%!') "LTRIM Example" FROM sampleTable;

SELECT RTRIM('%!!!!!%GudiVaraprasad%!!!!%', '%%!') "RTRIM Example" FROM sampleTable;

SELECT TRANSLATE('SQL*Plus User''s Guide', ' */''', '___') FROM sampleTable;

SELECT REPLACE('SQL Assignment', 'SQL', 'GVP') "After Replace" FROM sampleTable;

SELECT SUBSTR('EXAMPLESTRING',3,4) "Subs" FROM sampleTable;

SELECT SUBSTR('EXAMPLESTRING',-5,4) "Subs" FROM sampleTable;

SELECT LPAD('VaraPrasad',15,'!%') "LPAD example" FROM sampleTable;

SELECT RPAD('VaraPrasad',15,'!%') "RPAD example" FROM sampleTable;

SELECT CHR(71)||CHR(86)||CHR(80) "IAm" FROM sampleTable;

SELECT Length('I AM GUDI VARAPRASAD 19BCE7048') "total characters" FROM sampleTable;

SELECT * FROM sampleTable;

SELECT DECODE(IDNO,1422,'*4**') "decode example" FROM sampleTable;

SELECT ADD_MONTHS(DATE '2021-02-25',3) "After 3 months" FROM sampleTable;

SELECT LAST_DAY(DATE '2021-02-25') "LAST DAY" FROM sampleTable;

SELECT MONTHS_BETWEEN(DATE '2021-04-13', DATE '2021-02-25') "BETWEEN?" FROM sampleTable;

SELECT ROUND(DATE '2021-02-25','MONTH') "New Month", ROUND(DATE '2021-02-25','YEAR') "New Year" FROM sampleTable;

SELECT NEXT_DAY('25-FEB-2021','THURSDAY') "NEXT DAY" FROM sampleTable;

SELECT TRUNC(TO_DATE('25-FEB-21','DD-MON-YY'), 'YEAR') FROM sampleTable;

SELECT GREATEST(DATE '2021-04-13', DATE '2021-02-25') "GREATEST" FROM sampleTable;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';

SELECT NEW_TIME(TO_DATE('02-25-21 22:48:13', 'MM-DD-YY HH24:MI:SS'), 'AST', 'PST') "New Date and Time" FROM sampleTable;

SELECT TO_CHAR('02-25-21 22:48:13') "interval value" FROM sampleTable;

SELECT TO_DATE('February 25, 2021, 11:00 P.M.', 'Month dd, YYYY, HH:MI P.M.', 'NLS_DATE_LANGUAGE = American') "char to date" FROM sampleTable;

SELECT TO_NUMBER('2021') "expr to a value of NUMBER" FROM sampleTable;

DESC DUAL;

SELECT * FROM DUAL;

SELECT UID FROM DUAL;

SELECT USER, UID FROM DUAL;

SELECT NVL(NULL, 'N/A') FROM DUAL;

SELECT NVL(100,200) FROM DUAL;

SELECT VSIZE('Gudi Varaprasad 19BCE7048') FROM sampleTable;

DESC Sales;

SELECT * FROM Sales;

SELECT COUNT(*) "Total" FROM Sales;

SELECT COUNT(QUANTITY) "Total" FROM Sales;

SELECT COUNT(PRODUCTNUMBER) "Total" FROM Sales;

SELECT * FROM Sales;

SELECT MIN(QUANTITY) "Minimum Value" FROM Sales;

SELECT * FROM Sales;

SELECT MAX(PRODUCTNUMBER) "Maximum Value" FROM Sales;

SELECT * FROM Sales;

SELECT AVG(PRODUCTNUMBER) "Average = " FROM Sales;

SELECT * FROM Sales;

SELECT SUM(SALESPERSONNUMBER) "Sum = " FROM Sales;

SELECT * FROM Sales;

SELECT STDDEV_POP(QUANTITY) "Standard Deviation = " FROM Sales;

SELECT * FROM Sales;

SELECT VAR_POP(QUANTITY) "Variance = " FROM Sales;













