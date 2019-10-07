INSERT INTO ORDERS (order#, customer#, orderDate)
	VALUES (1021, 1009, '20-JUL-09');

UPDATE ORDERS
	SET shipZip = '33222'
	WHERE order# = 1017;
	
COMMIT;

INSERT INTO ORDERS (order#, customer#, orderDate)
	VALUES (1022, 2000,'06-AUG-09');
	/* No customer with number equal to 2000 */
DELETE FROM ORDERITEMS
  WHERE  order# = 1005;
  
DELETE FROM ORDERS
	WHERE	order#=1005;
	
ROLLBACK;

CREATE TABLE CATEGORY
	(catCode VARCHAR2(3),
	catDesc VARCHAR2(11) NOT NULL,
	 CONSTRAINT category_catCode_pk PRIMARY KEY (catCode)
	);
	
INSERT INTO CATEGORY (catCode,catDesc)
	VALUES('BUS','BUSINESS');
INSERT INTO CATEGORY (catCode,catDesc)  
  VALUES('CHN','CHILDREN');
INSERT INTO CATEGORY (catCode,catDesc)
  VALUES('COK','COOKING');
INSERT INTO CATEGORY (catCode,catDesc)
  VALUES('COM','COMPUTER');
INSERT INTO CATEGORY (catCode,catDesc)
  VALUES('FAL','FAMILY LIFE');
INSERT INTO CATEGORY (catCode,catDesc)
  VALUES('FIT','FITNESS');
INSERT INTO CATEGORY (catCode,catDesc)
  VALUES('SEH','SELF HELP');
INSERT INTO CATEGORY (catCode,catDesc)
  VALUES('LIT','LITERATURE');

COMMIT;

ALTER TABLE BOOKS
	ADD catCode VARCHAR2(3);
  
ALTER TABLE BOOKS  
	ADD CONSTRAINT books_catCode_fk FOREIGN KEY (catCode)
    REFERENCES CATEGORY (catCode);
    
UPDATE BOOKS 
  SET catCode= 'BUS'
    WHERE category= 'BUSINESS'; 
UPDATE BOOKS
	SET catCode= 'CHN'
    WHERE category= 'CHILDREN';
UPDATE BOOKS  
	SET catCode= 'COK'
    WHERE category= 'COOKING';
UPDATE BOOKS
	SET catCode= 'COM'
    WHERE category= 'COMPUTER';
UPDATE BOOKS  
	SET catCode= 'FAL'
    WHERE category= 'FAMILY LIFE';
UPDATE BOOKS  
	SET catCode= 'FIT'
    WHERE category= 'FITNESS';
UPDATE BOOKS  
	SET catCode= 'SEH'
    WHERE category= 'SELF HELP';
UPDATE BOOKS 
	SET catCode= 'LIT'
    WHERE category= 'LITERATURE';

COMMIT;

ALTER TABLE BOOKS
	DROP COLUMN category;

	