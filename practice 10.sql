SELECT b.title, p.contact, p.phone
	FROM CUSTOMERS c, ORDERS o, ORDERITEMS oi, BOOKS b, PUBLISHER p
	WHERE c.customer# = o.customer# 
		AND o.order# = oi.order# 
		AND oi.isbn = b.isbn 
		AND b.pubID = p.pubID
		
SELECT b.title, p.contact, p.phone
	FROM CUSTOMERS c JOIN ORDERS o USING (customer#)
		JOIN ORDERITEMS oi USING (order#)
		JOIN BOOKS b USING(isbn)
		JOIN PUBLISHER p USING(pubID)


