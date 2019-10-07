SELECT bookCode, title, type
	FROM BOOK
	WHERE type IN ('ART','FIC','MYS');
	
SELECT bookCode, title, price, pubCode  
	FROM BOOK
	WHERE pubCode = 'FA' 
	AND (price > 10);
	
SELECT p.pubCode, i.qoh
	FROM PUBLISHER p, INVENTORY i, BOOK b
	WHERE p.pubcode = b.pubCode
	AND b.bookCode = i.bookCode
	AND (price > 6) 
	AND (qoh > 0)
	ORDER BY qoh;
	
SELECT b.bookCode, b.title, b.price, a.AuthFName, a.AuthLName, p.pubName
	FROM BOOK b, AUTHOR a, PUBLISHER p, WROTE w
	WHERE (b.bookCode = w.bookCode)
	AND (w.authorNo = a.authorNo)
	AND (b.pubCode = p.pubcode)
	AND price BETWEEN 10 AND 20
	ORDER BY PubName, price;
	
SELECT b.title, i.qoh, b.price * i.qoh OrderTotal
	FROM BOOK b, INVENTORY i
	WHERE b.bookCode = i.bookCode
	AND b.bookCode = '2281';
	
DELETE FROM INVENTORY;

BEGIN
	INSERT INTO Inventory
		VALUES ('0180', '1', 2);

	INSERT INTO Inventory
		VALUES ('0189', '2', 2);

	INSERT INTO Inventory
		VALUES ('0200', '1', 1);

	INSERT INTO Inventory
		VALUES ('0200', '2', 3);

	INSERT INTO Inventory
		VALUES ('0378', '3', 2);

	INSERT INTO Inventory
		VALUES ('079X', '2', 1);

	INSERT INTO Inventory
		VALUES ('079X', '3', 2);

	INSERT INTO Inventory
		VALUES ('079X', '4', 3);

	INSERT INTO Inventory
		VALUES ('0808', '2', 1);

	INSERT INTO Inventory
		VALUES ('1351', '2', 4);

	INSERT INTO Inventory
		VALUES ('1351', '3', 2);

	INSERT INTO Inventory
		VALUES ('1382', '2', 1);

	INSERT INTO Inventory
		VALUES ('138X', '2', 3);

	INSERT INTO Inventory
		VALUES ('2226', '1', 3);

	INSERT INTO Inventory
		VALUES ('2226', '3', 2);

	INSERT INTO Inventory
		VALUES ('2226', '4', 1);

	INSERT INTO Inventory
		VALUES ('2281', '4', 3);

	INSERT INTO Inventory
		VALUES ('2766', '3', 2);

	INSERT INTO Inventory
		VALUES ('2908', '1', 3);

	INSERT INTO Inventory
		VALUES ('2908', '4', 1);
	
		COMMIT;
		DBMS_OUTPUT.PUT_LINE('The transaction was executed and committed.');
EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			DBMS_OUTPUT.PUT_LINE('The transaction was rolled back.');			
END;
/



UPDATE BOOK
	SET cover = 'HC'
	WHERE (cover = 'hc')
	OR (cover = 'Hc')
	OR (cover = 'hC');

UPDATE BOOK
	SET cover = 'PB'
	WHERE (cover = 'pb')
	OR (cover = 'Pb')
	OR (cover = 'pB');

SAVEPOINT;

INSERT INTO BOOK
	VALUES('0809', 'Beyond Fire', 'MYS', 9.99, 'pb', 'JP');

SELECT * FROM BOOK
	WHERE bookCode = '0809';
	
ROLLBACK;