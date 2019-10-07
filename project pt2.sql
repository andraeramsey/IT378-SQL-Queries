CREATE TABLE PUBLISHER1
(pubCode CHAR(2),
pubName VARCHAR2(30) NOT NULL,
pubCity VARCHAR2(20) NOT NULL,
CONSTRAINT publisher1_pubCode_pk PRIMARY KEY(pubCode)
);

CREATE TABLE BRANCH1
(branchNum NUMBER(1),
branchName VARCHAR2(30) NOT NULL,
branchLoc VARCHAR2(30) NOT NULL,
numOfEmp NUMBER(2) NOT NULL,
CONSTRAINT branch1_branchNum_pk PRIMARY KEY(branchNum)
);

CREATE TABLE AUTHOR1
(authorNo NUMBER(2),
authorF_Name VARCHAR2(20),
authorL_Name VARCHAR2(20),
CONSTRAINT author1_authorNo_pk PRIMARY KEY(authorNo)
);

CREATE TABLE BOOK1
(bookCode CHAR(4),
bookTitle VARCHAR2(45) NOT NULL,
bookType CHAR(3) NOT NULL,
bookCover CHAR(2),
price NUMBER(4,2) NOT NULL,
pubCode CHAR(2) NOT NULL,
CONSTRAINT book1_bookCode_pk PRIMARY KEY(bookCode),
CONSTRAINT book1_pubCode_fk FOREIGN KEY(pubCode)
	REFERENCES publisher1(pubCode),
CONSTRAINT book1_bookTitle_uk UNIQUE(bookTitle)
);

CREATE TABLE INVENTORY1
(branchNum NUMBER(1),
bookCode CHAR(4),
qtyOnHand NUMBER(1),
CONSTRAINT inventory1_branch#bookCode_pk PRIMARY KEY(branchNum, bookCode),
CONSTRAINT inventory1_branchNum_fk FOREIGN KEY(branchNum)
	REFERENCES branch1 (branchNum),
CONSTRAINT inventory1_bookCode_fk FOREIGN KEY(bookCode)
	REFERENCES book1 (bookcode)
);

CREATE TABLE WROTE1
(bookCode CHAR(4),
authorNo NUMBER(2) NOT NULL,
authorSeq NUMBER(1) DEFAULT 1,
CONSTRAINT wrote1_bookCodeauthorNo_pk PRIMARY KEY(bookCode,authorNo),
CONSTRAINT wrote1_bookCode_fk FOREIGN KEY(bookCode)
	REFERENCES book1 (bookCode),
CONSTRAINT wrote1_authorNo_fk FOREIGN KEY(authorNo)
	REFERENCES author1(authorNo)
);

INSERT ALL
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('AH', 'Arkham House', 'Sauk City') 
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('AP', 'Arcade Publishing', 'New York')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('BA', 'Basic Books', 'Boulder')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('BP', 'Berkley Publishing', 'Boston')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('BY', 'Back Bay Books', 'New York')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('CT',	'Course Technology',	'Boston')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('FA', 'Fawcett Books', 'New York')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('FS', 'Farrar Straus and Giroux', 'New York')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('HC', 'HarperCollins Publishers', 'New York')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('JP', 'Jove Publications', 'New York')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('JT', 'Jeremy P. Tarcher', 'Los Angeles')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('LB', 'Lb Books', 'New York')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('MP', 'McPherson and Co.', 'Kingston')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('PE', 'Penguin USA', 'New York')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('PL', 'Plume', 'New York')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('PU', 'Putnam Publishing Group', 'New York')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('RH', 'Random House', 'New York')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('SB', 'Schoken Books', 'New York')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('SC', 'Scribner', 'New York')
	INTO PUBLISHER1 (pubCode,pubName,pubCity)
		VALUES('SS', 'Simon and Schuster' ,'New York')

	INTO BRANCH1 (branchNum,branchName,branchLoc,numOfEmp)
		VALUES(1, 'Henry Downtown', '16 Riverview', 10)
	INTO BRANCH1 (branchNum,branchName,branchLoc,numOfEmp)
		VALUES(2, 'Henry On The Hill', '1289 Bedford', 6)
	INTO BRANCH1 (branchNum,branchName,branchLoc,numOfEmp)
		VALUES(3, 'Henry Brentwood', 'Brentwood Mall', 15)
	INTO BRANCH1 (branchNum,branchName,branchLoc,numOfEmp)
        VALUES(4, 'Henry Eastshore', 'Eastshore Mall', 9)
	
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(1, 'Morrison', 'Toni')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(2, 'Solotaroff', 'Paul')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(3, 'Vintage', 'Vernon')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(4, 'Francis', 'Dick')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(5, 'Straub', 'Peter')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(6, 'King', 'Stephen')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(7, 'Pratt', 'Philip')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(8, 'Chase', 'Trudy')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(9, 'Collins', 'Bradley')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(10, 'Heller', 'Joseph')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(11, 'Wills', 'Gary')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(12, 'Hofstadter', 'Douglas R.')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(13, 'Lee', 'Harper')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(14, 'Ambrose', 'Stephen E.')
	INTO AUTHOR1 (authorNo,authorL_Name,authorF_Name)
		VALUES(15, 'Rowling', 'J.K.')
	
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('0180', 'A Deepness in the Sky', 'SFI', 'PB', 7.19, 'LB')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('0189', 'Magic Terror', 'HOR', 'PB', 7.99, 'FA')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('0200', 'The Stranger', 'FIC', '', 8, 'SB')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('0378', 'Venice', 'ART', 'HC', 24.5, 'SS')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('079X', 'Second Wind', 'MYS', 'HC', 24.95, 'PU')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('0808', 'The Edge', 'MYS', 'PB', 6.95, 'JP')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('1351',	'Dreamcatcher: A Novel',	'HOR',	'HC',	19.6,	'SC')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('1382',	'Treasure Chests',	'ART',	'', 24.46,	'FA')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('138X','Beloved',	'FIC',	'PB', 12.95,	'PL')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('2226',	'Harry Potter and the Prisoner of Azkaban',	'SFI',	'HC',	13.96,	'JT')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('2281',	'Van Gogh and Gauguin',	'ART',	'HC',	21,	'MP')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('2766',	'Of Mice and Men',	'FIC',	'PB',	6.95,	'PE')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('2908',	'Electric Light',	'POE',	'HC',	14,	'FS')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('3350',	'Group: Six People in Search of a Life',	'PSY',	'PB',	10.4,	'BP')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('3743',	'Nine Stories',	'PSY',	'PB',	5.99,	'LB')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('3906',	'The Soul of a New Machine',	'SCI',	'PB',	11.16,	'BY')
	INTO BOOK1 (bookCode,bookTitle,bookType,bookCover,price,pubCode)
		VALUES('5163',	'Travels with Charley',	'TRA',	'PB',	7.95,	'PE')

	
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(1,	'0180',	2)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(2,	'0189',	2)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(1,	'0200',	1)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(2,	'0200',	3)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(3,	'0378',	2)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(2,	'079X',	1)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(3,	'079X',	2)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(4,	'079X',	3)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(2,	'0808',	1)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(2,	'1351',	4)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(3,	'1351',	2)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(2,	'1382',	1)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(2,	'138X',	3)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(1,	'2226',	3)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(3,	'2226',	2)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(4,	'2226',	1)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(4,	'2281',	3)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(3,	'2766',	2)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(1,	'2908',	3)
	INTO INVENTORY1 (branchNum,bookCode,qtyOnHand)
		VALUES(4,	'2908',	1)

	
	INTO WROTE1 (bookCode,authorNo,authorSeq)
		VALUES('0180',	3,	1)
	INTO WROTE1 (bookCode,authorNo,authorSeq)
		VALUES('0189',	5,	1)
	INTO WROTE1 (bookCode,authorNo,authorSeq)
		VALUES('0200',	8,	1)
	INTO WROTE1 (bookCode,authorNo,authorSeq)
		VALUES('0378',	11,	1)
	INTO WROTE1 (bookCode,authorNo,authorSeq)
		VALUES('079X',	4,	1)
	INTO WROTE1 (bookCode,authorNo,authorSeq)
		VALUES('0808',	4,	1)
	INTO WROTE1 (bookCode,authorNo,authorSeq)
		VALUES('1351',	6,	1)
	INTO WROTE1 (bookCode,authorNo,authorSeq)
		VALUES('1382',	15,	2)
	INTO WROTE1 (bookCode,authorNo,authorSeq)
		VALUES('138X',	1,	1)
SELECT * FROM dual;

COMMIT;