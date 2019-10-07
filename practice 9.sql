SELECT *
	FROM BOOKS;
	
SELECT Name, Contact "Contact Person", Phone
	FROM PUBLISHER;
	
SELECT DISTINCT Customer#
	FROM ORDERS;
	
SELECT Lastname ||','|| Firstname "Name", Address , City||' '||State "Location", Zip
	FROM CUSTOMERS;

SELECT Title, (Retail-Cost)/Cost*100 "Profit %" 
	FROM BOOKS;