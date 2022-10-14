select concat(concat(initcap(ename),' has '), concat(trunc(months_between(sysdate,hiredate)/12), ' Years of Service')) AS YOS from emp;

select concat(concat(concat(concat(initcap(ename),' is '), job), ' and makes'), concat(to_char(sal, '$99,999'), ' per month.')) as "Monthly Salary" from emp

--1) SELECT job
--2) FROM emp
--3) WHERE
--4) GROUP BY JOB
--5) HAVING count(*) = 2
--6) ORDER BY

-- ****Where Clause*****
SELECT *
FROM EMP
WHERE job = 'MANAGER'


SELECT *
FROM EMP
WHERE JOB = 'SALESMAN'
AND SAL = 1600
AND COMM = 300
AND DEPTNO = 30


-- ****Operators*****
SELECT * FROM EMP
WHERE JOB != 'SALESMAN'


SELECT * FROM EMP
WHERE JOB = 'SALESMAN'
AND SAL = 1500


SELECT * FROM EMP
WHERE JOB != 'SALESMAN'
AND SAL < 2500


SELECT * FROM EMP
WHERE JOB != 'SALESMAN'
AND SAL < 3000


SELECT * FROM EMP
WHERE JOB != 'SALESMAN'
AND SAL <= 3000


SELECT * FROM EMP
WHERE JOB != 'SALESMAN'
AND SAL > 3000


-- Write a query that returns those employees who have a commission greater than their salary 
SELECT * FROM EMP
WHERE COMM > SAL


-- Get all employees that are not managers and have a salary greater than 2500 and also work in department no# 20 
SELECT * FROM EMP
WHERE JOB != 'MANAGER'
AND SAL > 2500
AND DEPTNO = 20

-- *****Query Filtering*****

SELECT ename, hiredate FROM EMP
WHERE DEPTNO IN (20,30)


SELECT ename, hiredate FROM EMP
WHERE ENAME IN ('FORD', 'SMITH', 'ALLEN', 'WARD', 'MARTIN')


SELECT ename, hiredate FROM EMP
WHERE ENAME NOT IN ('FORD', 'SMITH', 'ALLEN', 'WARD', 'MARTIN')


SELECT * from emp
where hiredate between '05/01/1981' and '12/09/1982'


SELECT * from emp
where SAL between 1000 AND 2000


SELECT * from emp
where SAL NOT BETWEEN 950 AND 1600

SELECT * FROM EMP
WHERE COMM IS NOT NULL;


SELECT * FROM EMP WHERE MGR IS NULL

-- Write a query that returns those employees that don't make any commision and have a salary greater than 1100
-- but less than 5000. Exclude those employees that have a salary equal to 3000
SELECT * FROM EMP WHERE ( COMM IS NULL
AND SAL > 1100 AND SAL < 5000
AND SAL <> 3000 )
OR COMM = 0


SELECT * FROM EMP
WHERE ( COMM IS NULL or COMM = 0)
AND SAL > 1100 AND SAL < 5000
AND SAL <> 3000


-- Returns those employees that are salesman and that make either 300 dollars in commission
--or greater than 1100 follars in collission
SELECT * FROM EMP
WHERE JOB = 'SALESMAN'
AND (COMM = 300 OR COMM > 1100)


SELECT * FROM EMP 
WHERE JOB LIKE 'S%'


SELECT * FROM EMP 
WHERE JOB LIKE '%GER'

-- ****Splitting Strings and adding characters*****
SELECT CONCAT(CONCAT(UPPER(SUBSTR(job, 1, 3)), ' - '),

       UPPER(SUBSTR(job, LENGTH(job) - 2)))

FROM emp;

select concat(concat(upper(substr(job,1, 3)), ' - '),  substr(job, -3)) from emp

SELECT ENAME "EMPLOYEE NAME", SAL SALARY, COMM COMMISSION
FROM EMP;


SELECT 'hello my name is ' || ename as "concatenated value"
FROM EMP
WHERE job = 'MANAGER'

-- Create Query that looks like:
-- King makes $5000 per month 
-- Blake makes $2850 per month 
-- Clark makes $2450 per month 
SELECT ename || ' makes $' || sal || ' per month' as "employee income"
FROM EMP


-- ORDER BY 
SELECT *
FROM emp
ORDER BY ENAME


SELECT *
FROM emp
ORDER BY SAL


-- ORDER BY descending order
SELECT *
FROM emp
ORDER BY SAL DESC


-- ORDER BY ascending order
SELECT *
FROM emp
ORDER BY SAL ASC


SELECT DEPTNO, SAL, ENAME
FROM EMP
ORDER BY DEPTNO, SAL


SELECT *
FROM EMP
ORDER BY DEPTNO, SAL


-- *****Dual Tables*****
SELECT 'my name is ' || ename
FROM EMP


SELECT concat('my name is ', ename)
FROM EMP


SELECT upper('hello')
from emp

SELECT 'hello'
from emp
where deptno = 20


select upper('hello')
from DUAL


select lower('hello')
from DUAL 


SELECT 'pizza' as FOOD, 'fanta' as drink, concat('hello', ' John') from dual


SELECT 'pizza' as FOOD, 'fanta' as drink, concat('hello', ' John') as "This is a func" from dual


SELECT concat(lower(ename), ' is the name') from emp


SELECT concat(lower(ename), upper(' is the name')) from emp
where deptno = 20

-- Solution to assignment 
SELECT concat(concat(lower(ename), upper(' is the name')), concat(' and their job is: ', job)) as "function call" from emp
where deptno = 20


-- ****Numeric Functions****
-- round 

SELECT round(107.088, 2) from dual


SELECT round(107.088, 3) from dual


SELECT round(107.0887, 3) from dual


SELECT round(107.9) from dual

-- trunc 

SELECT trunc(107.938439849) from dual


SELECT trunc(107.938439849, 3) from dual


SELECT trunc(107.938439849, 5) from dual

-- sysdate 

SELECT sysdate from dual

-- systimestamp 

SELECT systimestamp from dual

-- add_months 

SELECT add_months('11/17/2012', 3)
from dual


SELECT add_months('11/17/2012', -3)
from dual


SELECT add_months(sysdate, -3)
from dual


SELECT add_months(sysdate, +100)
from dual

-- months_between 

SELECT months_between('12/15/2012', '12/4/2013')
from dual


SELECT months_between('12/4/2013', '12/15/2012')
from dual


SELECT months_between('12/4/2013', '12/4/2012')
from dual


SELECT trunc(systimestamp) from dual


SELECT trunc(systimestamp, 'YEAR') from dual


SELECT trunc(systimestamp, 'MONTH') from dual


SELECT hiredate, trunc(hiredate, 'MONTH') from emp


SELECT ename, hiredate, trunc(hiredate, 'MONTH') from emp


SELECT ename, hiredate, trunc(hiredate, 'MONTH')
from emp
where trunc(hiredate, 'YEAR') = '01/01/1982'


-- ***** System Date Conversion*****

SELECT to_char(sysdate, 'mm-dd-yyyy') from dual


SELECT to_char(sysdate, 'mm/dd/yyyy') from dual


SELECT to_char(sysdate, 'dd-mm-yyyy') from dual


SELECT to_char(sysdate, 'ddth "of" month, yyyy') from dual

-- Solution to assignment at 10:52 

SELECT ename, sal, to_char(sal, '$99,999.99') salaries from emp

-- to_date function 

SELECT to_date('2012-08-27', 'yyyy-mm-dd')
from dual


SELECT add_months(to_date('2012-08-27', 'yyyy-mm-dd'), 2)
from dual


SELECT to_date('3 of June, 2012', 'dd "of" Month, YYYY')
from dual



select ename, job, sal, comm
from emp
where empno in (7839, 7698, 7566, 7654)


select ename, job, sal, NVL(comm, 0)
from emp
where empno in (7839, 7698, 7566, 7654)

-- Solution to Assginment at 4:00 

select ename, job, sal, NVL(to_char(comm), 'No Data Found')
from emp
where empno in (7839, 7698, 7566, 7654)


select ename, length(ename) from emp


select ename, length(ename), NULLIF(length(ename), 5) from emp


select ename, length(ename), nvl(NULLIF(length(ename), 5), 'length is 5') from emp /* Gives "invalid number" error */


select ename, length(ename), nvl(NULLIF(to_char(length(ename)), to_char(5)), 'length is 5') from emp 


select ename, length(ename), nvl(NULLIF(to_char(length(ename)), to_char(5)), 'length is 5') as result, sal from emp 
where sal > 2000



-- ****Grouping FUNCTIONS ****
select max(sal) from emp


select max(sal) as max_sal from emp


select min(sal) as min_sal from emp


select sum(sal) as sum_sal from emp


SELECT * from emp
where lower(job) like '%manager%'


SELECT max(sal) from emp
where lower(job) like '%manager%'


SELECT max(sal) from emp
where job = 'MANAGER'


SELECT avg(sal) as avg_sal from emp


SELECT count(ename) as count from emp


SELECT count(sal) as count from emp


SELECT count(*) as count from emp


SELECT count(comm) as count from emp


SELECT sum(sal) / count(*) as computed_avg, avg(sal) as native_avg from emp


SELECT sum(sal) + avg(sal) as computed from emp 


SELECT sum(sal) as sum, avg(sal) as avg, max(sal) as max, min(sal) as min, count(*)
from emp


SELECT avg(sal)
from emp
where job = 'SALESMAN'


SELECT avg(sal)
from emp
where job = 'CLERK'


SELECT avg(sal)
from emp
where job = 'MANAGER'



-- ****Group By *****


SELECT avg(sal), job
from emp
GROUP BY job


SELECT job
from emp
GROUP BY job


SELECT count(*), job
from emp
GROUP BY job


SELECT min(sal), job
from emp
GROUP BY job


SELECT distict job from emp


SELECT count(*), job
from emp
GROUP BY job
HAVING count(*) = 2


SELECT job
from emp
GROUP BY job
HAVING count(*) = 2


--1) SELECT job
--2) FROM emp
--3) WHERE
--4) GROUP BY JOB
--5) HAVING count(*) = 2
--6) ORDER BY


SELECT deptno
from emp
GROUP BY deptno
HAVING count(*) > 3


SELECT deptno, count(*)
from emp
GROUP BY deptno


SELECT deptno, count(*)
from emp
GROUP BY deptno
HAVING count(*) > 3SELECT avg(sal), job
from emp
GROUP BY job


SELECT job
from emp
GROUP BY job


SELECT count(*), job
from emp
GROUP BY job


SELECT min(sal), job
from emp
GROUP BY job


SELECT distict job from emp


SELECT count(*), job
from emp
GROUP BY job
HAVING count(*) = 2


SELECT job
from emp
GROUP BY job
HAVING count(*) = 2


--1) SELECT job
--2) FROM emp
--3) WHERE
--4) GROUP BY JOB
--5) HAVING count(*) = 2
--6) ORDER BY


SELECT deptno
from emp
GROUP BY deptno
HAVING count(*) > 3


SELECT deptno, count(*)
from emp
GROUP BY deptno


SELECT deptno, count(*)
from emp
GROUP BY deptno
HAVING count(*) > 3

-- ****More Grouping ******

SELECT * from emp


Select job, count(*)
from emp
group by job


Select job, count(*)
from emp
group by job, deptno


SELECT job, deptno
from emp


SELECT job, deptno
from emp
group by job, deptno


SELECT job, deptno, count(*)
from emp
group by job, deptno

-- *****Subqueries*****


SELECT * from dept


SELECT * from dept
where deptno = 30


SELECT * from dept
where deptno = ( select deptno from dept where deptno = 30)


SELECT * from dept
where deptno < ( select deptno from dept where deptno = 30)


SELECT * from dept
where deptno < ( select deptno from dept where deptno = 30)
and dname = 'ACCOUNTING'


SELECT * from dept
where deptno < 30
and dname = 'ACCOUNTING'


SELECT * from ( select * from dept)


SELECT * from ( select * from emp)


SELECT * from emp where deptno = (select deptno from dept where loc = 'CHICAGO')


SELECT * from emp where deptno in (select deptno from dept where deptno in (10,20))


SELECT * from emp where deptno in (select deptno, loc, dname from dept where deptno in (10,20)) --too many values


SELECT job, ename, (select job from emp)
from emp  -- single-row subquery returns more than one row


SELECT job, ename, (select job from emp where ename = 'KING')
from emp 


SELECT job, ename, (select 'Hello' from emp)
from emp -- single-row subquery returns more than one row


SELECT job, ename, (select * from dual)
from emp


SELECT job, ename, (select 'Hello there' from dual)
from emp


SELECT job, ename, (select 'Hello there' from dual)
from emp
where job = (select job from emp where job = 'PRESIDENT')


-- *****Joining Tables*****

SELECT * from emp
where deptno = (select deptno from dept where loc = 'CHICAGO')


SELECT * from emp


SELECT * from dept


SELECT *
from emp, dept
WHERE emp.deptno = dept.deptno


SELECT *
from emp, dept
WHERE emp.deptno = dept.deptno
and LOC = 'DALLAS'


SELECT ename, job, sal
from emp, dept
WHERE emp.deptno = dept.deptno
and dept.loc = 'DALLAS'


SELECT emp.ename, emp.job, emp.sal
from emp, dept
WHERE deptno = deptno
and dept.loc = 'DALLAS' -- column ambiguously defined


SELECT ename as first_name, job, sal
from emp, dept
WHERE emp.deptno = dept.deptno
and dept.loc = 'DALLAS'


SELECT e.ename as first_name, job, sal
from emp e, dept d
WHERE e.deptno = d.deptno
and loc = 'DALLAS'


SELECT e.ename as first_name, job, sal, e.deptno
from emp e, dept d
WHERE e.deptno = d.deptno
and loc = 'DALLAS'


SELECT e.ename as first_name, job, sal, e.deptno
from (select * from emp where job in ('MANAGER', 'CLERK')) e, (SELECT * from dept) d
WHERE e.deptno = d.deptno
and loc = 'DALLAS'

-- Solution to Assignment at 18:05

SELECT e.ename as first_name, job, sal, e.deptno
from (select * from emp where job in ('MANAGER', 'CLERK')) e, (SELECT * from dept where loc = 'DALLAS') d
WHERE e.deptno = d.deptno


-- *****Inner and Outer Joins*****

SELECT *
from emp, dept
WHERE emp.deptno = dept.deptno


SELECT *
from emp INNER JOIN dept
ON emp.deptno = dept.deptno


SELECT *
from emp RIGHT JOIN dept
ON emp.deptno = dept.deptno


SELECT *
from emp LEFT JOIN dept
ON emp.deptno = dept.deptno


SELECT *
from dept LEFT JOIN emp
ON emp.deptno = dept.deptno


SELECT *
from dept RIGHT JOIN emp
ON emp.deptno = dept.deptno


SELECT *
from emp RIGHT OUTER JOIN dept
ON emp.deptno = dept.deptno


SELECT *
from emp LEFT OUTER JOIN dept
ON emp.deptno = dept.deptno


SELECT *
from emp, dept
WHERE emp.deptno(+) = dept.deptno --RIGHT OUTER JOIN


SELECT *
from emp, dept
WHERE emp.deptno = dept.deptno(+) --LEFT OUTER JOIN


SELECT *
from emp FULL OUTER JOIN dept
ON emp.deptno = dept.deptno


SELECT *
from (select * from emp) emp FULL OUTER JOIN dept
ON emp.deptno = dept.deptno


SELECT *
from (select * from emp) e FULL OUTER JOIN dept
ON e.deptno = dept.deptno


SELECT *
from (select * from emp) e FULL OUTER JOIN (select * from dept) d
ON e.deptno = d.deptno


SELECT *
from (select * from emp) e, (select * from dept) d
WHERE e.deptno = d.deptno


SELECT *
from (select * from emp where job = 'SALESMAN') e FULL OUTER JOIN (select * from dept) d
ON e.deptno = d.deptno


-- Solution to Assignment from previous video
SELECT empno, ename, job, mgr, hiredate, sal, comm, e.deptno as deptno, d.deptno as deptno, dname, loc
from (select * from dept) d LEFT OUTER JOIN (select * from emp where job = 'SALESMAN') e
ON e.deptno = d.deptno


SELECT e.*, d.*
from (select * from dept) d LEFT OUTER JOIN (select * from emp where job = 'SALESMAN') e
ON e.deptno = d.deptno -- Further Simplified Version




-- *****Subqueries continued*****
--  -- *****EXISTS & Not Exists*****


SELECT * 
from emp
WHERE EXISTS (select 'random' from dual)


SELECT * 
from emp
WHERE NOT EXISTS (select 'random' from dual)


SELECT * 
from emp
WHERE EXISTS (select null from dual)


SELECT * 
from emp
WHERE NOT EXISTS (select * from emp where job = 'PROGRAMMER')


SELECT d.*
FROM dept d
WHERE EXISTS (SELECT * FROM emp WHERE d.deptno = emp.deptno)


SELECT d.*
FROM dept d
WHERE NOT EXISTS (SELECT * FROM emp WHERE d.deptno = emp.deptno)
AND LOC = 'CHICAGO' -- no data found


SELECT d.*
FROM dept d
WHERE NOT EXISTS (SELECT * FROM emp WHERE d.deptno = emp.deptno)
AND LOC = 'BOSTON' -- returns Boston Record


SELECT d.*
FROM dept d
WHERE NOT EXISTS (SELECT * FROM emp WHERE d.deptno = emp.deptno)
OR LOC = 'CHICAGO' -- returns Boston & Chicago Record


-- *****Joining Tables using subqueries******

select e.ename,e.job,m.ename as Manager, e.empno
from emp e left join emp m
on e.mgr = m.empno


--***** https://sqlzoo.net/wiki/The_JOIN_operation******
-- Join operation practice
-- show the name of all players who scored a goal against Germany.
SELECT DISTINCT player FROM 
	game JOIN goal ON (id = matchid)
	WHERE (team1 = 'GER' OR team2 = 'GER') 
		AND teamid != 'GER' 

-- Show teamname and the total number of goals scored.
SELECT teamname, COUNT(teamid) FROM 
	goal JOIN eteam ON (teamid = id)
	GROUP BY teamname

-- Show the stadium and the number of goals scored in each stadium.

SELECT stadium, COUNT(teamid) FROM 
	GOAL JOIN GAME ON (id = matchid)
	GROUP BY stadium

-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
select matchid, mdate, count(*)
from GOAL JOIN GAME ON (id = matchid)
 WHERE teamid= 'GER'
	GROUP BY matchid, mdate

-- *****Natural Join Operation*****

-- This returns the same thing as . . .
select ename, mgr, loc, deptno
from emp natural join dept

-- This 
SELECT ename, mgr, loc, emp.deptno
from emp RIGHT OUTER JOIN dept
ON emp.deptno = dept.deptno

-- Without the natural join the deptno table must be specified as well as ON qualifier included.

-- *****This also returns the same results by applying the USING Keyword
-- -- **** Joing column must be in (Parentheses)*****
-- -- -- If joining columns has 2 different names include both in ie. (table1.col1, table2.col2)
select ename, mgr, loc, deptno
from emp right join dept using (deptno)

select ename, mgr, loc, deptno
from emp right join dept using (deptid, deptno)


CREATE TABLE job_grade
   (Grade_level varchar(2) not null,
    lowest_sal number not null,
    highest_sal number not null);


INSERT ALL
    INTO job_grade
    VALUES ('A', 0, 1000)
    INTO job_grade
    VALUES ('B', 1001, 2000)
    INTO job_grade
    VALUES ('C', 2001, 3000)
    INTO job_grade
    VALUES ('D', 3001, 4000)
    INTO job_grade
    VALUES ('E', 4001, 5000)
SELECT * FROM DUAL;

-- *****Joining by applying job grade to Sal*****
select e.ename, e.sal, j.grade_level
from emp e join job_grade j
on e.sal between j.lowest_sal and j.highest_sal


-- *****Case Statements*****
SELECT ename, job, (CASE job
 WHEN 'PRESIDENT' THEN 'big shot'
 WHEN 'MANAGER' THEN 'decides the pay'
 WHEN 'ANALYST' THEN 'good at pay'
 WHEN 'CLERK' THEN 'hard working'
 ELSE 'no comment'
 END) as "COMMENT"
FROM emp;

-- Solution to Assignment

SELECT ename, sal, CASE
 WHEN sal >= 3000 THEN 'big shot'
 WHEN sal < 3000 THEN 'need more money'
 END as salary_comment
FROM emp;







