set echo on 
set feedback off
set verify off
set heading on 

/* start C:\Users\evana\Desktop\100Queries\100Queries.sql */

/* #1 Supplies who supply pruduc P1 */
SELECT S.Sname from S,SP
	WHERE SP.P= 'P1'
	AND S.S = SP.S;

/* #2 Display name and weight which supplied by supplier S3 */
SELECT P.PNAME, P.WEIGHT FROM P, SP 
	WHERE SP.S ='S3'
	AND P.P = SP.P;

/* #3 Display quantity of Green Bolts supplied by Smith */
SELECT SP.QTY FROM SP,P,SP
	WHERE P.PNAME = 'Bolt'
	AND S.Sname = 'Smith'
	AND S.S = SP.S
	AND P.P = SP.P;

/* #4 Display S# amd Sname of supplier who supplys Red Nuts */
SELECT S.S, S.Sname FROM S,P,SP
	WHERE P.COLOR = 'Red'
	AND P.PNAME = 'Nut'
	AND S.S = SP.S
	AND P.P = SP.P;

/* #5 Display p# and names of parts which are supplied by Blake */
SELECT P.P, P.PNAME FROM SP,P,S
	WHERE S.Sname = 'Blake'
	AND SP.S = S.S 
	AND SP.P = P.P;

/* #6 Display names of all parts whcih are supplied by suppliers whose status is higher than 25 */
SELECT P.PNAME FROM P, S, SP
	WHERE status > 25
	AND SP.S = S.S 
	AND SP.P = P.P; 


/* #7 Display S# and P# pairs of which the supplier and the part are from the same city and the supplier has supplier that part */
SELECT S.S, P.P FROM P, S, SP
	WHERE S.CITY = P.CITY
	AND SP.S = S.S 
	AND SP.P = P.P;

/* #8 */
SELECT P.PNAME FROM P,SP
	WHERE SP.QTY = (SELECT MAX(SP.QTY) FROM SP)
	AND P.P = SP.P;

/* #9 */
SELECT * FROM SP,P 
	WHERE SP.P = P.P
	ORDER BY SP.QTY DESC;

/* #10 */
SELECT * FROM P,SP
WHERE P.P = SP.P
MINUS
SELECT * FROM P,SP
	WHERE SP.QTY = (SELECT MAX(SP.QTY) FROM SP)
	AND P.P = SP.P;

/* #11 */
SELECT MEDIAN(QTY) FROM SP;

/* #12 */
SELECT AVG(QTY) FROM SP;

/* #13 */
SELECT STATS_MODE(QTY) FROM SP;

/* #14 */
SELECT QTY  FROM SP;

/* #15 */
SELECT SP.QTY, P.PNAME AS Products, S.Sname AS Suppliers FROM SP,S,P
	WHERE SP.QTY < (SELECT AVG(SP.QTY) FROM SP)
	AND SP.S = S.S
	AND SP.P = P.P;

/* #16 */
SELECT SUM(SP.Qty) AS Total_QTY FROM SP;

/* #17 */
SELECT COUNT(SP.Qty) AS Total_QTY FROM SP
	WHERE SP.QTY = 400;

/* #18 Display the Avg of Qty */
SELECT AVG(QTY) FROM SP;

/* #19 Display S#, P# and Qty of that have QTY under the Av */
SELECT * FROM SP
	WHERE QTY <  (SELECT AVG(QTY) FROM SP)
	ORDER BY QTY DESC;

/* #20 All P# in P and SP tables */
SELECT P FROM SP
UNION 
SELECT P FROM P;

/* #21 Finding the products that are currently in stock */
SELECT P FROM SP
INTERSECT 
SELECT P FROM P;

/* #22 Finding the Suppliers that dont have product */
SELECT S From S
MINUS 
SELECT S FROM SP;

/* #23 Changing the City name Rome to Oslo */
UPDATE P 
	SET CITY = 'Oslo'
	WHERE P = 'P3';

/* #24 Concat S and P From SP */ 
SELECT S||P, QTY FROM SP;

/* #25 Descend by Qty then by Status */ 
SELECT S.S,P.P,S.Status,SP.QTY 
	FROM S,P,SP
	Where S.S = SP.S
	AND P.P = SP.P 
	ORDER BY SP.QTY DESC, S.Status ASC;

/* #26 Finding the Second Highest */ 
SELECT MAX(QTY) FROM SP 
	WHERE QTY NOT IN (SELECT MAX(QTY) FROM SP);

/* #27 */ 
SELECT MAX(QTY) FROM Sp 
	Limit 2;

/* #28 */
SELECT SUBSTR (SName,2) FROM S 
	WHERE SName = 'Blake';

/* #29 Select the Total Qty of Red parts */
SELECT sum(qty) FROM SP, P 
	WHERE P.COLOR= 'Red';

/* #30 Select the Names of the Supplies who have the max Qty */
SELECT S.SName FROM S,SP
	WHERE QTY = (SELECT MAX(QTY) FROM SP)
	AND S.S = SP.S;

/* GROUP BY */
/* #40 Find the number of Total Quantity per Item and Color */
SELECT P.COLOR,P.PName, SUM(QTY) AS Total_QTY
	FROM SP,P
	WHERE P.P = SP.P
	GROUP BY P.COLOR,P.PName
	ORDER BY SUM(QTY) DESC;

/* #41 Find the Number of total Qty per Color */
SELECT P.COLOR, SUM(QTY) AS Total_QTY
	FROM SP,P
	GROUP BY P.COLOR
	ORDER BY SUM(QTY) DESC;

/* #42 Display the Name of supplier and total QTY */
SELECT S.SName, SUM(QTY) AS Total_QTY
	FROM SP, S 
	WHERE SP.S = S.S
	GROUP BY S.SName 
	ORDER BY SUM(QTY) DESC;

/* #43 Display the Status and total QTY each status has */
SELECT S.Status, SUM(QTY) AS Total_QTY
	FROM S, SP 
	WHERE SP.S = S.S 
	GROUP BY S.Status
	ORDER BY S.Status DESC;

/* #44 Display the Qty being stored in each location */
SELECT CITY, SUM(QTY) AS Total
	FROM P, SP 
	WHERE SP.P = P.P 
	GROUP BY CITY 
	ORDER BY SUM(QTY);

/* #45 Display the Qty being produced in location */
SELECT CITY, SUM(QTY) AS Total
	FROM S,SP 
	WHERE SP.S = S.S 
	GROUP BY CITY
	ORDER BY SUM(QTY);

/* #46 */


