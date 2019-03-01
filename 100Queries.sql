set echo on 
set feedback off
set verify off
set heading on 

/* start C:\Users\evana\Desktop\100Queries\100Queries.sql */


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


/* #45 Display the Qty being produced in location */
SELECT CITY, SUM(QTY) AS Total
	FROM S,SP 
	WHERE SP.S = S.S 
	GROUP BY CITY
	ORDER BY SUM(QTY);

/* #46 */
