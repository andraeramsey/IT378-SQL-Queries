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
MODIFY
(empJob VARCHAR2(2)
);

TRUNCATE TABLE employees;

DROP TABLE employees;

FLASHBACK TABLE employees
	TO BEFORE DROP;

ALTER TABLE acctmanager
ADD
(comm_id NUMBER(2,0) DEFAULT 10,
ben_id NUMBER(2,0)
);

CREATE TABLE store_reps
  (rep_ID NUMBER(5),
    last VARCHAR2(15),
    first VARCHAR2(10),
    comm CHAR(1), 
    CONSTRAINT store_reps_repID_pk PRIMARY KEY(rep_ID), 
    CONSTRAINT store_reps_comm_ck CHECK (comm IN ('Y') )
    );

ALTER TABLE store_reps
MODIFY (last CONSTRAINT store_reps_last_nn NOT NULL,
		first CONSTRAINT store_reps_first_nn NOT NULL);

ALTER TABLE store_reps
ADD(
	base_salary NUMBER(7,2)
	CONSTRAINT store_reps_base_salary_ck CHECK (base_salary > 0) );

CREATE TABLE PROJECT
(proj# NUMBER(8),
p_name VARCHAR2(20) NOT NULL,
p_desc VARCHAR2(30) NOT NULL,
p_budget NUMBER(9,2),

CONSTRAINT project_proj#_pk PRIMARY KEY(proj#),
CONSTRAINT project_p_name_uk UNIQUE (p_name)
);	

CREATE TABLE WORKORDERS
(wo# NUMBER(8),
proj# NUMBER(8) NOT NULL,
wo_des VARCHAR2(30) NOT NULL,
wo_assigned VARCHAR2(30),
wo_hours NUMBER(2) NOT NULL,
wo_start DATE,
wo_end DATE,
wo_complete CHAR(1),

CONSTRAINT workorders_wo#_pk PRIMARY KEY (wo#),
CONSTRAINT workorders_proj#_fk FOREIGN KEY (proj#)
    REFERENCES project (proj#),
CONSTRAINT workorders_wo_des_uk UNIQUE (wo_des),
CONSTRAINT workorders_wo_hours_ck CHECK (wo_hours > 0),
CONSTRAINT workorders_wo_complete_ck CHECK (wo_complete IN ('Y','N'))
);