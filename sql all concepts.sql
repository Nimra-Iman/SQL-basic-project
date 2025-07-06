-- SQL is a language and MYSQL is an RDBMS, MYSQL is 
-- product developed by Oracle Corporation.
-- SQL is used to interact with various database systems, 
-- whereas MySQL is specifically a software system for managing databases.

create database vip;
use vip;
CREATE TABLE emp (
    e_id INT AUTO_INCREMENT,
    e_name VARCHAR(100) NOT NULL,
    dept VARCHAR(50),
    salary int,
    PRIMARY KEY (e_id)
);
INSERT INTO emp (e_id, e_name, dept, salary) VALUES
    (1, 'nimra', "HR", 1000),
	(2, 'kinza', "HR", 25000),
	(3, 'shiza', "IT", 5000),
	(4, 'nimra', "MRKT", 3000),
	(5, 'asad', "MRKT", 15000)
;

-- IF you want to add a new column
-- then you cannot directly insert values to it because y kesy pta lgy ga k 
-- is newly-made column ki value dusry columns k kis value k corresponding enter ho gi, 
-- for example: look below: 
alter table emp add column age int;
insert into emp(age) values (2),(3),(4); -- this line generate error because usy
-- nhi pta k kis e_name pr y value jay gi, e_id m issue nhi ay ga q k 
-- us ki value auto-increment ho rhi h , ab is ko esy solve kr skty 
-- hn k:
-- --- insert ki bijay update kr do k jha jha bhi name ki, dept or salary
-- ki value y h vha vha age m y value fill kr do 
--  agr yhan name notnull na hota to
-- ap insert kr skty age m values ko update_set use kiye bagher or vo is trah
-- hota k age m values add hoti sirf un un jga pr jha jha ID auto-incremented
-- values show kr rhi, baki hr jga NULL show hota



-- slect distinct
SELECT DISTINCT DEPT FROM EMP;

-- WHERE (FOR CONDITION)
SELECT E_NAME FROM EMP WHERE DEPT = "HR";

-- NOT
SELECT E_NAME FROM EMP WHERE NOT DEPT = "HR";

-- INSERT INTO ( TO INSERT VALUES IN TABLE)
INSERT INTO EMP( e_name, e_ID) VALUES("RERORO",34);
SELECT * FROM EMP;

--  NULL VALUES  (SAARI VO ROWS SHOW KRVAO JIS KI SALARY NULL H
SELECT * FROM EMP WHERE SALARY IS NULL;

--  CHANGE THE DEPARTMENT OF EMPLOYES WHOSE SALARY IS LESS THAN 3000
UPDATE EMP SET DEPT = "UPDATED" WHERE SALARY>3000;
SELECT * FROM EMP;
  
-- SHOW THE NAME OF EMPLOYEES WHERE SALARY IS FROM 1000 TO 5000  (BETWEEN)
SELECT * FROM EMP WHERE SALARY BETWEEN 1000 AND 5000;

SELECT * FROM EMP WHERE E_NAME BETWEEN "ASAD" AND "NIMRA";   -- Y ALPHABETICALLY KRY GA

-- WRITE A QUERY TO DISPLAY ALL THE DEPT NAMES ALONG WITH THE NUMBER OF EMPLOYESS WORKING IN IT:
--  ------ ab hm yha select ko use nhi kr skty q k bhhhtttt saary departments hn, ab hm yhan pr
-- group by ko use kryn gy, group by dept, yani ek dept alag ho jay ga ayni HR valy sary ek traf
-- MRKT valy saary ek traf and IT valy sab ek traf,,, 
--  CONDITIONS FOR GROUPBY:    vo cheez groupby m likhi h hr haal m usi attribute ko
-- select k baad likhna h, agar select k baad kuch likhna h to aggregate function hi use krna h
-- such as min, max, sum, avg etc.

select dept, count(*) from emp group by dept;

-- CANDIDATE KEYS: 
-- all unique keys of cadidate are cadidate jeys, e.g id card number, roll number, registeration number,
-- phone number etc. but unique and not null keys are primary keys. e.g roll number, registeration
-- number. primary key valy tuple ko kabhi bhi khali nhi chor skty, ab student k case m bhht 
-- appropriate primary key roll number ya registeration number bny gi, q k it is possible k studenst
-- ka id card number ho hi na

-- forign keys:
-- thses keys take reference from primary key. "FOREIGN KEYS ARE USED TO MAINTAIN REFERENTIAL
-- INTEGRITY"  this is VIP question for interview. 
-- agar 2 tables apas m relate krty hn to in m koi na koi attribute same hona chahye tabhi hm unhy join kr skty
-- jis table m primary key exist krti h us ko referenced table ya base table bolty hn and jis m 
-- foreign key hoti h us table ko hm referencing table bolty hn
-- forgein key m vi values ay gi vo primary key m already present hon gi. agar roll number ko hm n
-- primary key bnaya h or pk m 10 koi vaue nhi h to hm fk m bhi 10 nhi likh skty
-- roll number int references student (roll number) -> is trah s foreign key ko represent krty hn
-- student is name of base table ,, or agar table already bna ho to fk is trah s lgaty:
-- alter table table_name add constraint fk foreign key ( roll_no) references student(roll_no)
-- pk and fk ka name different ho skta h zruri nhi k column ka name same hi hon or ek table m ek 
-- s ziada fk ho skti hn but pk ek table m ek hi hoti h 

-- ------------------  SQL JOINS  ---------------------------------
-- joins tab hi use hoty hn jab hmy ek table ki bijay 2 tables m kuch get krna ho, yani condition hi is
-- trah ki ho k kuch data ek table m ho or kuch doosry table m,
-- or join tab hi use krty hn jab dono tables m kuch common ho, 

-- SELECT ProductID, ProductName, CategoryName FROM Products INNER JOIN Categories 
-- ON Products.CategoryID = Categories.CategoryID; 

-- SELECT Customers.CustomerName, Orders.OrderID FROM Customers LEFT JOIN Orders
-- ON Customers.CustomerID = Orders.CustomerID
    
--  ---------------------------  WINDOW FUNCTIONS  ---------------------------------------
-- window functions apply aggregate, ranking and analytic functions
-- over a specific window
-- OVER clause: is used with wondow functions to create that window.
-- EXPRESSION: vo column jis k uper ap window function lgaty ho
-- PARTITION BY: divide the rows into partition so that we can specify which
-- rows to use to compute the window function, THIS IS optional,
-- yani hm btaty hn k hmy window m kon kon c rows daalni hn or jo rows 
-- window m gi un sab pr function perform ho ga, agar m n partition nhi dia
-- to jitni rows thi table m un sab or function perform ho ga
-- ROWS: is used if you furthur want to limit the rows within our
-- partition and it is optional and mostly not used 

-- RANK FUNCTIONS: row_number, rank, dense_rank, percent_rank
-- ANALYTIC/VALUE FUNCTIONS: LEAD, LAG, FIRST_VALUE, LAST_VALUE
-- e.g:
-- BASIC SYNTAX:  select col1, col2, fun() over( partition by, order by, rows)
-- from table_name;



use test;
drop table test_data;
create table test_data (
new_id int,
new_cat varchar(30)
);
insert into test_data (new_id, new_cat) values
(100, "agni"),(200, "agni"),(200, "vayu"),(300, "vayu"),(500, "vayu"),
(500, "dharti"),
(700, "dharti")
;
select * from test_data;
-- ---------  aggregate fun ---------
select new_id, new_cat, sum(new_id) over () as sum from test_data; -- ab yhan 
-- over() likh kr m n window create k li or partition by nhi likha to is ka 
-- matlab y hua k sab ki sab rows window m chli gai or un sab rows m 
-- sum(new_id) kia gya,, but like the following example, ab sum(new_id)
-- unhi pr ho ga jo window k ander hn:
select new_id, new_cat , sum(new_id) 
over(partition by new_cat ) as sum
from test_data order by new_id desc;

select new_id, new_cat , avg(new_id) 
over(partition by new_cat order by new_id) as sum
from test_data ;
-- --- 1st it will partition (mean make mini tables), then sort data based on
-- order and then apply fun()
-- ---  with order by: CUMULATIVE FUNCTION
-- --- without order by, just partition by: TOTAL COUNT/AVG/SUM ETC
-- ---  min, max, count, avg, sum  ARE AGGREGATE FUNCTIONS

-- -----------  rank functions  ----
-- IN ALL RANK FUNCTIONS, OVER() K ANDR ORDER BY LIKHNA ZRURI H VRNA 
-- HR ROW KO EQUAL CONSIDER KIA JAY GA AND EACH TIME, EACH ROW 
-- WILL GET RANK 1
-- ROW NUMBER() : ek window k ander jitni bhi rows hon gi un sab ko row number
-- de ga, e. agar ek window k ander 3 rows hn to 1st row ka row number 1
-- then 2nd row ka row number 2 then 3rd ka 3 , it is just like serial number
-- so easy

-- RANK() : ek window k ander jitni bhi rows hn un sab ko rank is trah s deta h 
-- k agr column value same ho gi to rank bhi same ho ga or rank ki beech
-- vali values jo same value hony ki vja s same a gi, to vo value skip ho
-- jay gi jo us same rank valy ki jga pr ani thi, e.g: column m 
-- phli value thi nimra to rank a gya 1 then value ki kinza to rank a gya 2
-- then again value thi kinza to rank phir s 2 a gya then value thi shiza
-- to rnk 3 nhi ay ga bal k 4 ay ga, q k 3 to skip ho jay ga jab same rank
-- aya yani 3 ki jga or jab 2 dubara aya,,, jo cheex order by m den gy us ki
-- base pr y rank vala duplication and skip vala concept lgy ga 
-- DENSE RANK():  same as rank but value ko skip nhi kry ga, yani
-- same column value ki vja s dense rank to same rhy ga but value ko skip
-- nhi kry ga, yani value shiza ai to dense rank 3 hi rkhy ga 4 nhi rkhy ga
-- PERCENT RANK(): yani kitny percent rows ap k data m fulfill ho chuki hn
-- yani window m mojood first row ka percent rank 0 ho ga, mis vali ka 0.5
-- and last vali ka 1 ho ga

--  jo cheex order by m den gy us ki
-- base pr y vala duplication and skip vala concept lgy ga 

select new_cat , new_id,
 row_number() over( order by new_id) as "row_number", 
 rank() over(order by new_id) as "rank", 
 dense_rank() over(order by new_id) as "dense_rank", 
 percent_rank() over( order by new_id) as "percent_rank"
from test_data; -- over k ander kam s kam koi ek parameter zrur do vrna
-- y functions nhi chalty
 
 
SELECT new_cat,
       RANK() OVER (ORDER BY new_cat) AS "rank"
FROM test_data;
 
 
select new_cat , new_id,
 row_number() over(partition by new_cat order by new_id) as "row_number", 
 rank() over(partition by new_cat order by new_id) as "rank", 
 dense_rank() over(partition by new_cat order by new_id) as "dense_rank", 
 percent_rank() over(partition by new_cat order by new_id) as "percent_rank"
from test_data;

-- YHAN PHLY PARTITION KRY GA OR PHIR HR PARTITION M ORDER KRY GA 

select new_cat , 
 row_number() over(partition by new_cat ) as "row_number", 
 rank() over(partition by new_cat ) as "rank", 
 dense_rank() over(partition by new_cat ) as "dense_rank", 
 percent_rank() over(partition by new_cat ) as "percent_rank"
from test_data;
    
    
    
-- ---------------  ANALYTIC/VALUE FUNCTIONS  -------------------------
-- first value: give 1st value in window
-- last value:  give last value in window, agar partition by ya rows ka use nhi kia
-- to last value poora column as it is show kr deti h 
-- lead:  show next value
-- lag: show previous value

select new_id, new_cat,
first_value(new_id) over(order by new_id) from test_data;

select new_id, new_cat,
last_value(new_id) over ( partition by new_cat order by new_id ) from test_data;

select new_id, new_cat,
lead(new_id) over ( partition by new_cat order by new_id ) from test_data;

select new_id, new_cat,
lag(new_id) over ( partition by new_cat order by new_id ) from test_data;



select new_id, new_cat,
lead(new_id,2 ) over ( partition by new_cat order by new_id ) from test_data;
-- lead(new_id,2 ) to increase upto 2 jumps

select new_id, new_cat,
lag(new_id ,2) over ( partition by new_cat order by new_id ) from test_data;


SELECT new_id, new_cat,
last_value(new_id) OVER (PARTITION BY new_cat)
FROM test_data;


-- EXCEPTIONAL BEHAVIOUR:

-- => in all AGGREGATE FUNCTION, if we use ORDER BY inside over() then 
-- 	   we will get commulative sum/avg/count etc etc
-- => in LAST_VALUE function of analytic functions, if we do not write 
-- ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING na likhyu to 
-- result ajeeb mily ga q k by defaukt vo UNBOUNDED PRECEDING AND  
-- CURRENT ROW valy rule ko follow krta h,,,,, UNBOUNDED PRECEDING AND 
-- UNBOUNDED FOLLOWING ka matlab y hota h k partition ki start row s le kr end 
-- vali row tak but UNBOUNDED PRECEDING AND CURRECT ROW ka matlab y 
-- hota h k partition ki start s le kr current row tk consider kro
-- to is s current row hi last row ho gi asal m so this is the 
-- abnormal beheviour.
-- the following is the correct aproach
select new_cat, new_id, last_value(new_id) 
over(partition by new_cat order by new_id 
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as true_last_val
from test_data;





