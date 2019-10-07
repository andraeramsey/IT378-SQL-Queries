CREATE TABLE employees
(empID CHAR(5),
empLast VARCHAR2(15),
empFirst VARCHAR2(10),
empJob VARCHAR2(4)	
);

ALTER TABLE employees
ADD
(empDate DATE DEFAULT SYSDATE,
endDate DATE
);
ALTER TABLE employees
MODIFY (empJob VARCHAR2(2));

TRUNCATE TABLE employees;

FLASHBACK TABLE employees
	TO BEFORE DROP;