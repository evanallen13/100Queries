Set Echo On 

drop table SP;
drop table S;
drop table P;

create table S( 
	S varchar(2) PRIMARY KEY,
	Sname varchar(15),
	status number(2,0),
	CITY varchar(20));

create table P(
	P varchar(2) PRIMARY KEY,
	PNAME varchar(15),
	COLOR varchar(10),
	WEIGHT number(2),
	CITY varchar(15));

create table SP(
	S varchar(2) references S(S),
	P varchar(2) references P(P),
	QTY number(3),
	PRIMARY KEY (S,P));

INSERT INTO S VALUES('S1','Smith',20,'London');
INSERT INTO S VALUES('S2','Jones',10,'Paris');
INSERT INTO S VALUES('S3','Blake',30,'Paris');
INSERT INTO S VALUES('S4','Clark',20,'London');
INSERT INTO S VALUES('S5','Adams',30,'Athens');

INSERT INTO P VALUES('P1','Nut','Red',12,'London');
INSERT INTO P VALUES('P2','Bolt','Green',17,'Paris');
INSERT INTO P VALUES('P3','Screw','Blue',17,'Rome');
INSERT INTO P VALUES('P4','Screw','Red',14,'London');
INSERT INTO P VALUES('P5','Cam','Blue',12,'Paris');
INSERT INTO P VALUES('P6','Cog','Red',19,'London');

INSERT INTO SP VALUES('S1','P1',300);
INSERT INTO SP VALUES('S1','P2',200);
INSERT INTO SP VALUES('S1','P3',400);
INSERT INTO SP VALUES('S1','P4',200);
INSERT INTO SP VALUES('S1','P5',100);
INSERT INTO SP VALUES('S1','P6',100);
INSERT INTO SP VALUES('S2','P1',300);
INSERT INTO SP VALUES('S2','P2',400);
INSERT INTO SP VALUES('S3','P2',200);
INSERT INTO SP VALUES('S4','P2',200);
INSERT INTO SP VALUES('S4','P4',300);
INSERT INTO SP VALUES('S4','P5',400);
