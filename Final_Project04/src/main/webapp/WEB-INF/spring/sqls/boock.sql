CREATE TABLE payment (
	orderSeq NUMBER PRIMARY KEY,
	productSeq NUMBER,
	productName VARCHAR2(100) NOT NULL,
	productPrice NUMBER(30) NOT NULL,
	quantity NUMBER(30) NOT NULL,
	deliveryfee NUMBER(30) NOT NULL,
	orderAmount NUMBER NOT NULL,
	pay_method VARCHAR2(100) NOT NULL,
	userSeq NUMBER(30) NOT NULL,
	userId VARCHAR2(200) NOT NULL,
	receiveName VARCHAR2(100) NOT NULL,
	receiverPhone VARCHAR2(200) NOT NULL,
	receiverOaddress VARCHAR2(4000) NOT NULL,
	receiverRaddress VARCHAR2(4000) NOT NULL,
	receiverDetailaddress VARCHAR2(4000) NOT NULL,
	orderDate DATE NOT NULL,
	CONSTRAINT FK_productSeq FOREIGN KEY(productSeq) REFERENCES Product (productSeq)
);

