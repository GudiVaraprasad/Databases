CREATE TABLE Bus(bid number(1) NOT NULL, bdriver varchar2(8), bloc varchar2(10), bcap number(2), PRIMARY KEY(bid));

CREATE TABLE Passenger(pid number(3) NOT NULL, fname varchar2(6), lname varchar2(7), page number(2), psex varchar2(1), bid number(1), PRIMARY KEY(pid), FOREIGN KEY(bid) REFERENCES Bus);

CREATE TABLE Schedule(
	sid number(3) NOT NULL, bid number(1), 
	sdate DATE, stime varchar2(5), 
	PRIMARY KEY(sid), FOREIGN KEY(bid) REFERENCES Bus
);

CREATE TABLE Place(
	plid number(2) NOT NULL, sid number(3), name varchar2(8), 
	location varchar2(10), latitude decimal(9,6), longitude decimal(9,6),
	PRIMARY KEY(plid), FOREIGN KEY(sid) REFERENCES Schedule
);

CREATE TABLE Booking(
	boid number(2) NOT NULL,pid number(3),bid number(1), 
	sid number(3), plid number(2), bodate DATE, 
	PRIMARY KEY(boid), FOREIGN KEY(pid) REFERENCES Passenger,
	FOREIGN KEY(bid) REFERENCES Bus, FOREIGN KEY(sid) REFERENCES Schedule, 
	FOREIGN KEY(plid) REFERENCES Place
);

INSERT INTO Bus VALUES(&bid, '&bdriver', '&bloc', &bcap);

INSERT INTO Passenger VALUES(&pid, '&fname', '&lname', &page, '&psex', &bid);

INSERT INTO Schedule VALUES(&sid, &bid, '&sdate', '&stime');

INSERT INTO Place VALUES(&plid, &sid, '&name', '&location', &latitude, &longitude);

INSERT INTO Booking VALUES(&boid, &pid, &bid, &sid, &plid, '&bodate');

SELECT * FROM Passenger;

SELECT pid, bid, lname FROM Passenger;

SELECT fname, lname FROM Passenger WHERE page>18;

SELECT DISTINCT psex AS Gender FROM Passenger;

SELECT DISTINCT Bus.bid, Schedule.sdate FROM Bus JOIN Schedule ON Bus.bid=Schedule.bid WHERE Bus.bloc='Vijayawada';

UPDATE Passenger SET bid=3 WHERE fname='Burra';
SELECT * FROM Passenger;

ALTER TABLE Passenger ADD mobile number(10);
UPDATE Passenger SET mobile=9391589364 WHERE pid=101;
UPDATE Passenger SET mobile=9715089301 WHERE pid=102;
UPDATE Passenger SET mobile=8091539340 WHERE pid=103;
UPDATE Passenger SET mobile=6300148711 WHERE pid=104;
UPDATE Passenger SET mobile=7386661270 WHERE pid=105;
UPDATE Passenger SET mobile=8844122571 WHERE pid=106;
SELECT * FROM Passenger;

ALTER TABLE Passenger MODIFY mobile number(11);

ALTER TABLE Passenger RENAME COLUMN mobile TO phone;
DESC Passenger;

RENAME Bus TO Vehicle;
DESC Vehicle;

ALTER TABLE Passenger DROP COLUMN phone;
DESC Passenger;

CREATE TABLE CopyOfVehicle AS SELECT * FROM Vehicle;
SELECT * FROM Vehicle;
SELECT * FROM CopyOfVehicle;

DELETE FROM CopyOfVehicle;
SELECT * FROM CopyOfVehicle;

DROP TABLE CopyOfVehicle;

SELECT * FROM Passenger ORDER BY age DESC;

-- RENAME Vehicle TO Bus;

SELECT COUNT(case when psex='M' then 1 end) as male, COUNT(case when psex='F' then 1 end) as female, COUNT(*) as total FROM Passenger;

SELECT Passenger.lname FROM Passenger JOIN Booking ON Passenger.pid=Booking.pid WHERE Booking.bodate='25-May-2021';

SELECT Passenger.fname FROM Passenger JOIN Bus ON Passenger.bid=Bus.bid WHERE Bus.bcap>=80 AND Bus.bcap<=100;

SELECT Passenger.fname, Passenger.psex FROM Passenger JOIN Bus ON Passenger.bid=Bus.bid WHERE Bus.bdriver='Balraju';

SELECT TO_CHAR(sdate, 'DDth Month YYYY') AS DDth_Month_YYYY FROM Schedule;

SELECT Bus.bdriver FROM Bus JOIN Schedule ON Bus.bid=Schedule.bid WHERE Schedule.sdate<='04-JUNE-2021';

SELECT Passenger.fname, Passenger.lname FROM Passenger JOIN Schedule ON Passenger.bid=Schedule.bid JOIN Place ON Schedule.sid=Place.sid WHERE Place.name='Koti';

SELECT bdriver FROM Bus WHERE bdriver LIKE 'B%';

SELECT bdriver FROM Bus WHERE bdriver LIKE '%a';

SELECT Passenger.pid, Passenger.fname, Passenger.lname FROM Passenger JOIN Bus ON Passenger.bid=Bus.bid WHERE Bus.bid=2 OR Bus.bid=3;

SELECT UPPER(name) AS Caps, LOWER(name) AS Small FROM Place;

SELECT SUBSTR(name,1,3) AS first, SUBSTR(name,-3) AS last FROM Place;

SELECT SUBSTR(bloc,2,5) AS subloc FROM Bus;

SELECT sdate AS before, TRUNC(ADD_MONTHS(sdate, 5)) AS After FROM Schedule;

SELECT ROUND(longitude, 3) AS roundoff FROM Place;

SELECT LAST_DAY(bodate) AS lastday, NEXT_DAY(bodate, 1) AS nextday FROM Booking;

SELECT SUBSTR('VARAPRASAD',5,10) AS gvp FROM dual;

SELECT REPLACE('VARAPRASAD','VARA','HARI') AS gvp FROM dual;

SELECT location, LENGTH(location) AS length FROM Place;

SELECT TO_DATE(bodate, 'YYYY/MM/DD') AS format FROM Booking;

SELECT SYSDATE AS before, TRUNC(ADD_MONTHS(SYSDATE, 6)) AS After FROM dual;

SELECT SYSDATE AS before, NEXT_DAY(SYSDATE, 'Monday') AS After FROM dual;

SELECT COUNT(DISTINCT location) FROM Place;

SELECT MAX(Passenger.page) AS maximum, MIN(Passenger.page) AS mimimum FROM Passenger JOIN Schedule ON Passenger.bid=Schedule.bid JOIN Place ON Schedule.sid=Place.sid GROUP BY location;

SELECT AVG(bcap) AS average FROM Bus;

SELECT COUNT(DISTINCT page) FROM Passenger WHERE page>20;
SELECT COUNT(page) FROM Passenger WHERE page>20;

SELECT Passenger.lname FROM Passenger JOIN Schedule ON Passenger.bid=Schedule.bid WHERE Schedule.sdate=SYSDATE;

CREATE TABLE new_booking AS SELECT Place.plid, Place.name, Place.location, Place.latitude, Place.longitude FROM Place JOIN Booking ON Place.plid=Booking.plid WHERE Booking.bodate='25-May-2021';
SELECT * FROM new_booking;

CREATE TABLE new_bus AS SELECT Passenger.pid, Passenger.fname, Passenger.lname, Passenger.page, Passenger.psex, Bus.bcap FROM Passenger JOIN Bus ON Passenger.bid=Bus.bid WHERE Bus.bcap>80;
SELECT * FROM new_bus;

CREATE TABLE new_passenger AS SELECT Passenger.pid, Passenger.fname, Passenger.lname, Passenger.page, Passenger.psex, Booking.bodate FROM Passenger JOIN Booking ON Passenger.pid=Booking.pid;
SELECT * FROM new_passenger;

SELECT Bus.bdriver, Passenger.lname, Place.name FROM Bus JOIN Passenger ON Bus.bid = Passenger.bid JOIN Booking ON Booking.pid = Passenger.pid JOIN Place ON Booking.plid=Place.plid WHERE Booking.bodate='28-MAY-2021';

SELECT Passenger.pid, Passenger.lname, Bus.bid, Place.name, Schedule.sdate, Booking.bodate FROM Bus JOIN Passenger ON Bus.bid = Passenger.bid JOIN Schedule ON Passenger.bid = Schedule.bid JOIN Place ON Schedule.sid=Place.sid JOIN Booking ON Place.plid=Booking.plid WHERE Place.name='Kazipet';