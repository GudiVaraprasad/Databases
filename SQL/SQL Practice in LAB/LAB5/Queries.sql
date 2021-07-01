SELECT * FROM EMPLOYEE;

create table dept(deptno number(2,0),dname varchar2(14),loc varchar2(13), constraint pk_dept primary key (deptno));

create table emp(empno number(4,0),ename varchar2(10),job varchar2(9),mgr number(4,0),hiredate date,sal number(7,2),comm number(7,2),deptno number(2,0),constraint pk_emp primary key (empno),constraint fk_deptno foreign key (deptno) references dept (deptno));

insert into dept
values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept
values(20, 'RESEARCH', 'DALLAS');
insert into dept
values(30, 'SALES', 'CHICAGO');
insert into dept
values(40, 'OPERATIONS', 'BOSTON');
 
insert into emp
values(
 7839, 'KING', 'PRESIDENT', null,
 to_date('17-11-1981','dd-mm-yyyy'),
 5000, null, 10
);

insert into emp
values(
 7698, 'BLAKE', 'MANAGER', 7839,
 to_date('1-5-1981','dd-mm-yyyy'),
 2850, null, 30
);

insert into emp
values(
 7782, 'CLARK', 'MANAGER', 7839,
 to_date('9-6-1981','dd-mm-yyyy'),
 2450, null, 10
);

insert into emp
values(
 7566, 'JONES', 'MANAGER', 7839,
 to_date('2-4-1981','dd-mm-yyyy'),
 2975, null, 20
);

insert into emp
values(
 7788, 'SCOTT', 'ANALYST', 7566,
 to_date('13-JUL-87','dd-mm-rr') - 85,
 3000, null, 20
);

insert into emp
values(
 7902, 'FORD', 'ANALYST', 7566,
 to_date('3-12-1981','dd-mm-yyyy'),
 3000, null, 20
);

insert into emp
values(
 7369, 'SMITH', 'CLERK', 7902,
 to_date('17-12-1980','dd-mm-yyyy'),
 800, null, 20
);

insert into emp
values(
 7499, 'ALLEN', 'SALESMAN', 7698,
 to_date('20-2-1981','dd-mm-yyyy'),
 1600, 300, 30
);

insert into emp
values(
 7521, 'WARD', 'SALESMAN', 7698,
 to_date('22-2-1981','dd-mm-yyyy'),
 1250, 500, 30
);

insert into emp
values(
 7654, 'MARTIN', 'SALESMAN', 7698,
 to_date('28-9-1981','dd-mm-yyyy'),
 1250, 1400, 30
);

insert into emp
values(
 7844, 'TURNER', 'SALESMAN', 7698,
 to_date('8-9-1981','dd-mm-yyyy'),
 1500, 0, 30
);

insert into emp
values(
 7876, 'ADAMS', 'CLERK', 7788,
 to_date('13-JUL-87', 'dd-mm-rr') - 51,
 1100, null, 20
);

insert into emp
values(
 7900, 'JAMES', 'CLERK', 7698,
 to_date('3-12-1981','dd-mm-yyyy'),
 950, null, 30
);

insert into emp
values(
 7934, 'MILLER', 'CLERK', 7782,
 to_date('23-1-1982','dd-mm-yyyy'),
 1300, null, 10
);

Select * from emp;

select * from dept;

select ename,job from emp;

select ename,sal from emp;

select empno,ename,sal,comm, sal+nvl(comm,0) as "total salary" from emp;

select ename, 12*(sal+nvl(comm,0)) as "annual Sal" from emp;

select emame from emp where deptno=10;

select ename from emp where job=’CLERK’ and sal>3000;

select empno,ename from emp where comm is not null;

select empno,ename from emp where comm is null;

select ename from emp where job='CLERK' OR JOB='SALESMAN' OR JOB='ANALYST' AND SAL>3000;

select ename from emp where to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY')>=5;

select ename from emp where hiredate < '30-JUN-1990' or hiredate >'31-DEC-90';

select sysdate from dual;

select username from all_users;

select tname from tab;

show user;

select ename from emp where deptno in(10,20,40) or job in('CLERKS','SALESMAN','ANALYST');

select ename from emp where ename like 'S%';

select ename from emp where ename like '%S';

select ename from emp where ename like '_A%';

select ename from emp where length(ename)=5;

select ename from emp where job not in('MANAGER');

select ename from emp where job not in('SALESMAN','CLERK','ANALYST');

set pause on;
set pause off;

select count(*) from emp;

select sum(sal) from emp;

select max(sal) from emp;

select min(sal) from emp;

select avg(sal) from emp;

select max(sal) from emp where job='CLERK';

select max(sal) from emp where deptno=20;

select min(sal) from emp where job='SALESMAN';

select avg(sal) from emp where job='MANAGER';

select sum(sal) from emp where job='ANALYST' and deptno=40;

select ename from emp order by sal;

select ename from emp order by sal desc;

select ename from emp order by ename;

select empno,ename,deptno,sal from emp order by ename,deptno,sal;

select ename,sal*12 from emp order by sal desc;

select ename,sal,sal/100*15 as hra,sal/100*5 as pf,sal/100*10 as da, sal+sal/100*15+sal/100*10-sal/100*5 as total from emp;

select deptno,count(deptno)from emp group by deptno;

select job,count(job)from emp group by job;

select deptno,sum(sal) from emp group by deptno;

select deptno,max(sal) from emp group by deptno;

select job,sum(sal) from emp group by job;

select job,min(sal) from emp group by job;

select deptno,count(deptno) from emp group by deptno having count(*)>3;

select job,sum(sal) from emp group by job having sum(sal)>4000;

select job,count(empno) from emp group by job having count(job)>3;

select ename from emp where sal=(select max(sal) from emp);

select empno,ename from emp where where job='CLERK' and sal=(select max(sal) from emp where job='CLERK');

select ename,sal from emp where job='SALESMAN' and sal>(select max(sal) from emp where job='CLERK');

select ename from emp where job='CLERK' and sal>(select min(sal) from emp where job='SALESMAN');

select ename,sal from emp where sal> (select sal from emp where ename='JONES')and sal> (select sal from emp where ename='SCOTT');

select ename,sal,deptno from emp where sal in(select max(sal) from emp group by deptno);

select ename,sal,job from emp where sal in(select max(sal) from emp group by job);

select ename from emp where deptno=(select deptno from dept where dname='ACCOUNTING');

select ename from emp where deptno=(select deptno from dept where LOC='CHICAGO');

SELECT JOB,SUM(SAL) FROM EMP GROUP BY JOB HAVING SUM(SAL)>(SELECT MAX(SAL) FROM EMP WHERE JOB='MANAGER');

select ename from emp where deptno=10 and sal>any(select sal from emp where deptno not in 10);

select upper(ename)from emp;

select lower(ename)from emp;

select initcap(ename)from emp;

select length('Varaprasad') from dual;

select length(ename) from emp;

select ename||empno from emp;

select substr('oracle',3,2) from dual;

SELECT INSTR('Computer Maintenance Corporation','a',1) as "1st occurrence" FROM DUAL;

select translate('Allens','A','B') from dual;

select replace(JOB,'MANAGER','BOSS') FROM EMP;

select empno,ename,decode(deptno,10,'ACCOUNTING',20,'RESEARCH',30,'SALES',40,'OPRATIONS') from emp;

select to_date(sysdate)-to_date('22-oct-01') as "Total Days" from dual;

select months_between(sysdate,'22-oct-01') as "Total Months" from dual;

select to_char(sysdate,'ddth Month day year') from dual;

select ENAME||' HAS JOINED THE COMPANY ON '||to_char(HIREDATE,'day ddth Month year') from EMP;

SELECT NEXT_DAY(SYSDATE,'SATURDAY')FROM DUAL;

select to_char(sysdate,'hh:MM:ss') from dual;

select add_months(sysdate,3) from dual;

select job from emp where deptno=10 and job in(select job from emp where deptno=20);

select distinct(job) from emp where deptno=10 or deptno=20;

select distinct(job) from emp where deptno=10;

select e.ename from emp,emp e where emp.mgr=e.empno group by e.ename having count(*)=1;

CREATE TABLE salgrade (
  grade NUMBER,
  losal NUMBER,
  hisal NUMBER
);

INSERT INTO salgrade VALUES (1, 700, 1200);
INSERT INTO salgrade VALUES (2, 1201, 1400);
INSERT INTO salgrade VALUES (3, 1401, 2000);
INSERT INTO salgrade VALUES (4, 2001, 3000);
INSERT INTO salgrade VALUES (5, 3001, 9999);

select * from emp where deptno=(select deptno from dept where dname='SALES')and sal between(select losal from salgrade where grade=3)and (select hisal from salgrade where grade=3);

select distinct(m.ename) from emp e,emp m where m.empno=e.mgr;

select ename from emp where ename not in(select distinct(m.ename) from emp e,emp m where m.empno=e.mgr);

select ename from emp where length(ename)>4;

select dname from dept where dname like 'S%' and loc like '%K';

select p.ename from emp e,emp p where e.empno=p.mgr and e.ename='JONES';

select ename,sal from emp where (sal+sal*.2)>3000;

select ename,dname from emp,dept where emp.deptno=dept.deptno;

select ename from emp where deptno=(select deptno from dept where dname='SALES');

select ename,dname,sal,comm from emp,dept where sal between 2000 and 5000 and loc='CHICAGO' and emp.deptno=dept.deptno;

select p.ename from emp e,emp p where e.empno=p.mgr and p.sal>e.sal;

select p.ename from emp e,emp p where e.empno=p.mgr and p.deptno=e.deptno;

select ename from emp where mgr is null;

select ename,grade from emp,salgrade where sal between losal and hisal and deptno in(10,30) and grade<>4 and hiredate<'31-DEC-82';

update emp set sal=sal+sal*10/100 where comm is null;

SELECT EMPNO,ENAME,HIREDATE,DNAME,LOC FROM EMP,DEPT WHERE (EMP.DEPTNO=DEPT.DEPTNO)AND HIREDATE <'31-DEC-82' AND DEPT.LOC IN('CHICAGO','NEW YORK');

select ename,JOB,DNAME,LOC from emp,DEPT where mgr is not null;

SELECT P.ENAME FROM EMP E, EMP P WHERE E.EMPNO=P.MGR AND E.ENAME='JONES';