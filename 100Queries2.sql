set echo off
set feedback on
set verify on
set heading on

/* start C:\Users\evana\Desktop\100Queries\100Queries2.sql */

/* 1-10 */
/* #1 Display the names of suppliers who supply product number P1 */
select Sname As 'P1| Suppliers'
	from S,SP
	where P = 'P1'
	and S.S = SP.S;

/* #2 Display the name and weight of parts which are supplier by S3 */
select PNAME AS Product,
	WEIGHT||' lbs' As Weight
	from S,P,SP
	where S.S = 'S3'
	and S.S = SP.S
	and P.P = SP.P;

/* #3 Display Qty of blue screws supplied by S1 */
select QTY
	from SP,P
	where S = 'S1'
	and COLOR = 'Blue'
	and PNAME = 'Screw'
	and SP.P = P.P;

/* #4 Display the Qty of Green Bolts supplied by Smith */
select QTY
	from SP,P,S
	where PNAME = 'Bolt'
	and COLOR = 'Green'
	and Sname = 'Smith'
	and SP.P = P.P
	and S.S = Sp.S;

/* #5 Display S# and Sname of supplier who supply Red Nut */
select S.S, Sname
	from S,P,SP 
	where COLOR = 'Red'
	and PNAME = 'Nut'
	and SP.P = P.P
	and S.S = SP.S;

/* #6 Display p# and names of parts supplied by Blake */
select P.P, PNAME
	from SP,P,S 
	where S.Sname = 'Blake'
	and SP.S = S.S
	and SP.P = P.P;

/* #7 Display names of all parts which are supplied by suppliers whose status us higher than 25 */
select PNAME,COLOR
	from S,SP,P
	where Status > 25 
	and SP.S = S.S
	and SP.P = P.P;

/* #8 Display S# P# pair which are produced and supplied in the same city */
select S.S, P.P
	from S,P,SP 
	where S.CITY = P.CITY 
	and SP.S = S.S 
	and SP.P = P.P;

/* #9 Display Products supplied in Paris */
select P
	from S,SP 
	where S.CITY = 'Paris'
	and S.S = SP.S;

/* #10 Display Products heavier than 15 pounds */
select PNAME
	from P 
	where Weight > 15;

/* 11 - 20 */
/* #11 Display all supplies who supply in both London and Paris */
select sname 
	from S,P
	where P.City = 'London'
intersect
select sname
	from S,P 
	where P.City = 'Paris';

/* #12 Find Product numbers that aren't current */
select P
	from P
MINUS 
select P
	from SP;

/* #13 Find Supplies who currently dont have products */
select S
	from S
minus 
select S
	from SP;

/* #14 Supplies name who currently dont have products */
select Sname 
	from S 
	where S = (select S from S minus select S from SP);

/* #15 Finding the products that are currently in stock */
select P from P
intersect
select P from SP;

/* #16 display the second max qty Pname */
select max(QTY) as "Max Qty"
	from SP
	where QTY != (select max(QTY) from SP);

/* display the total Qty per supplier */
select S.S, sum(QTY)
	from S,SP 
	where S.S = SP.S
	group by S.S
	order by S.S;

/* display the Qty of Products and Qty being stored in each city */
select P.P as "P#", CITY as "City Stored", sum(QTY) as QTY
	from P,SP 
	where P.P = SP.P 
	group by P.P,CITY; 

/* display S# and P# where S# is supplying P# and the # is the same */
select S,P
	from SP 
	where substr(S,2,3) = substr(P,2,3);