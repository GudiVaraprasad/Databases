CREATE TABLE Trip_guides(eno number(3) NOT NULL, ename varchar2(18), hrate number(2), monthsemp number(2), PRIMARY KEY(eno));

CREATE TABLE Trip_locations(lcode number(4) NOT NULL, lname varchar2(21), PRIMARY KEY(lcode));

CREATE TABLE Trip_Expenditions(lcode number(4) NOT NULL, eno number(3) NOT NULL, hworked number(1), tgsize number(2), FOREIGN KEY(eno) REFERENCES Trip_guides, FOREIGN KEY(lcode) REFERENCES Trip_locations);

INSERT INTO Trip_guides values(&eno, '&ename', &hrate, &monthsemp);

INSERT INTO Trip_locations values(&lcode, '&lname');

INSERT INTO Trip_Expenditions values(&lcode, &eno, &hworked, &tgsize);

SELECT * FROM Trip_guides;

SELECT * FROM Trip_locations;

SELECT * FROM Trip_Expenditions;

SELECT DISTINCT Trip_guides.ename, Trip_locations.lname FROM Trip_guides 
LEFT JOIN Trip_Expenditions ON Trip_guides.eno = Trip_Expenditions.eno 
LEFT JOIN Trip_locations ON Trip_locations.lcode = Trip_Expenditions.lcode;

SELECT DISTINCT Trip_guides.eno FROM Trip_guides 
LEFT JOIN Trip_Expenditions ON Trip_guides.eno = Trip_Expenditions.eno 
LEFT JOIN Trip_locations ON Trip_locations.lcode = Trip_Expenditions.lcode 
WHERE Trip_locations.lname = 'Table Mountain';

SELECT ALL Trip_guides.eno, Trip_guides.ename, Trip_locations.lname FROM Trip_guides
JOIN Trip_Expenditions ON Trip_guides.eno = Trip_Expenditions.eno 
JOIN Trip_locations ON Trip_locations.lcode = Trip_Expenditions.lcode;

SELECT Trip_guides.ename FROM Trip_guides WHERE Trip_guides.ename IN 
(
	SELECT DISTINCT Trip_guides.ename FROM Trip_guides 
	JOIN Trip_Expenditions ON Trip_guides.eno = Trip_Expenditions.eno 
	JOIN Trip_locations ON Trip_locations.lcode = Trip_Expenditions.lcode WHERE Trip_Expenditions.tgsize>10
);

SELECT e1.ename FROM Trip_guides e1,Trip_guides e2 WHERE e1.hrate = e2.hrate AND e2.ename = 'Siyabonge Nomvete';

SELECT Trip_guides.eno, Trip_guides.ename FROM Trip_guides WHERE Trip_guides.ename IN 
(
	SELECT DISTINCT Trip_guides.ename FROM Trip_guides 
	JOIN Trip_Expenditions ON Trip_guides.eno = Trip_Expenditions.eno 
	JOIN Trip_locations ON Trip_locations.lcode = Trip_Expenditions.lcode WHERE Trip_Expenditions.hworked>3
);

SELECT * FROM Trip_guides ORDER BY (hrate) ASC;

SELECT Trip_Expenditions.lcode, Trip_locations.lname FROM Trip_Expenditions 
LEFT JOIN Trip_locations ON Trip_Expenditions.lcode = Trip_locations.lcode 
GROUP BY Trip_Expenditions.lcode, Trip_locations.lname HAVING count(Trip_Expenditions.lcode)>1;
