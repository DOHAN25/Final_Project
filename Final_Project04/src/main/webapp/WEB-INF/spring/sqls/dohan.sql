DROP SEQUENCE USERSEQ;
DROP TABLE USERS;


CREATE SEQUENCE USERSEQ;

CREATE TABLE USERS(
	USERSEQ NUMBER PRIMARY KEY,
	USERID VARCHAR2(100) NOT NULL,
	PASSWORD VARCHAR2(100) NOT NULL,
	USEREMAIL VARCHAR2(1000) NOT NULL,
	USERPHONE VARCHAR2(1000) NOT NULL,
	USEROADDRESS VARCHAR2(4000) NOT NULL,
	USERADDRESS VARCHAR2(4000) NOT NULL,
	USERDETAILADDRESS VARCHAR2(4000) NOT NULL,
	USERROLE VARCHAR2(100) CHECK(USERROLE IN ('admin', 'user')),
	USERNAME VARCHAR2(100) NOT NULL,
	USERBIRTHDAY VARCHAR2(100) NOT NULL
);
ALTER TABLE USERS ADD UserImg VARCHAR2(1000);
ALTER TABLE USERS ADD UserProfileImg VARCHAR2(1000);

ALTER TABLE USERS ADD UNIQUE (USERID);

SELECT * FROM USERS;

DELETE FROM USERS WHERE USERSEQ = 104;



SELECT * FROM PRODUCT;



DROP TABLE CHATROOM;
DROP TABLE MESSAGE;

DROP SEQUENCE MESSAGE_ID;
DROP SEQUENCE CHATROOM_ID;

CREATE SEQUENCE MESSAGE_ID;
CREATE SEQUENCE CHATROOM_ID;


CREATE TABLE MESSAGE (
   MESSAGE_ID NUMBER PRIMARY KEY,
   MESSAGE_SENDER VARCHAR2(45) NOT NULL,
   MESSAGE_RECEIVER VARCHAR2(45) NOT NULL,
   MESSAGE_CONTENT VARCHAR2(4000) NOT NULL,
   MESSAGE_REGDATE DATE NOT NULL,
   CHATROOM_ID NUMBER,
   CONSTRAINT FK_CHATROOM_ID FOREIGN KEY(CHATROOM_ID) REFERENCES CHATROOM (CHATROOM_ID)
);

SELECT * FROM ADMINPRODUCT;

CREATE TABLE CHATROOM ( 
   CHATROOM_ID NUMBER PRIMARY KEY,
   CHATROOM_BUYER VARCHAR2(100) NOT NULL,
   CHATROOM_SELLER VARCHAR2(100) NOT NULL,
   CHATROOM_TITLE VARCHAR2(100) NOT NULL,
   CHATROOM_REGDATE DATE NOT NULL,
   CONSTRAINT FK_CHATROOM_BUYER FOREIGN KEY(CHATROOM_BUYER) REFERENCES USERS (USERID)
);

ALTER TABLE CHATROOM ADD CHATROOM_TITLE VARCHAR2(100) NOT NULL;
ALTER TABLE CHATROOM ADD CHATROOM_SELLER VARCHAR2(100) NOT NULL;
ALTER TABLE CHATROOM RENAME COLUMN CREATE_CHATROOM_USER TO CHATROOM_BUYER;
ALTER TABLE MESSAGE MODIFY MESSAGE_REGDATE DATE NOT NULL;


SELECT * FROM MESSAGE;
SELECT * FROM CHATROOM;

INSERT INTO MESSAGE VALUES(MESSAGE_ID.NEXTVAL, 'dodo010', 'kim1234', '대화를 시작하세요. 욕설과 비속어 사용은 금지입니다. 매너있는 채팅 부탁드립니다.', SYSDATE, 44);



SELECT * FROM CHATROOM WHERE CHATROOM_SELLER = 'kim1234' AND CHATROOM_BUYER = 'dodo010' AND CHATROOM_TITLE = '당근하나';
DELETE FROM CHATROOM WHERE CHATROOM_ID = 43;
SELECT * FROM PRODUCT
WHERE USERROLE = 'ADMIN'
ORDER BY PRODUCTPRICE DESC;



CREATE TABLE Product (
	productSeq NUMBER PRIMARY KEY NOT NULL,
	productName VARCHAR2(100) NOT NULL,
	productPrice NUMBER(30) NOT NULL,
	sellerAddress VARCHAR2(1000),
	productRegDate DATE,
	productInfo VARCHAR2(4000),
	productImg VARCHAR2(4000),
	productThumb VARCHAR2(4000),
	saleStatus VARCHAR2(20),
	userRole VARCHAR2(10) NOT NULL,
	userSeq NUMBER NOT NULL,
	userId VARCHAR2(30),
	userLatitude VARCHAR2(1000),
	userLongitude VARCHAR2(1000) 
);

SELECT * FROM Product WHERE userRole = 'USER';
SELECT * FROM Product;
DELETE FROM Product WHERE productPrice = 1800;

SELECT userLatitude, userLongitude FROM Product;
DELETE FROM Product 

SELECT productName, userLatitude, userLongitude FROM Product WHERE userRole = 'USER' AND userLatitude IS NOT NULL AND userLongitude IS NOT NULL



CREATE SEQUENCE orderSeq;

CREATE TABLE Order (
	orderSeq PRIMARY KEY,
	productPrice NUMBER NOT NULL,
	receiveName VARCHAR2(100) NOT NULL,
	receiverOaddress VARCHAR2(4000) NOT NULL,
	receiverRaddress VARCHAR2(4000) NOT NULL,
	receiverDetailaddress VARCHAR2(4000) NOT NULL,
	quantity NUMBER NOT NULL,
	productName VARCHAR(200) NOT NULL,
	orderDate DATE NOT NULL,
	userId VARCHAR2(200) NOT NULL,
	orderAmount NUMBER NOT NULL,
	receiverPhone VARCHAR2(200) NOT NULL
	
);
select * from message;



CREATE TABLE entireBoard(
	entireBoardSeq NUMBER PRIMARY KEY NOT NULL,
	boardKind NUMBER NOT NULL,
	boardDate DATE NOT NULL,
	boardTitle VARCHAR2(200),
	boardContents VARCHAR2(4000), 
	userId VARCHAR2(30) NOT NULL,
	userSeq NUMBER NOT NULL,
	boardImg VARCHAR2(4000),
	boardThumbImg VARCHAR2(4000),
	likeCount NUMBER
);

INSERT INTO entireBoard
VALUES (entireBoardSeq.NEXTVAL, 3, SYSDATE, '판매금지 물품(필독)', '주류, 담배, 전자담배, 총, 유류, 유통기한이 지난 제품, 음란물, 암표매매 행위, 이외 법률을 위반하는 모든 제품/물품', 'admin', 1, NULL, NULL, 0);
INSERT INTO entireBoard
VALUES (entireBoardSeq.NEXTVAL, 3, SYSDATE, '로컬마켓 거래 및 환불(필독)', '기본적으로 거래 당사자들끼리 자유롭게 거래할 수 있습니다. 저희 당근팜은 중개자이며 운영정책에 따라 운영되고 있습니다. 모든 책임은 기본적으로 거래 당사자에게 있습니다.', 'admin', 1, NULL, NULL, 0);
INSERT INTO entireBoard
VALUES (entireBoardSeq.NEXTVAL, 3, SYSDATE, '당근팜 이용시 지켜야 할 매너(필독)', '1.서로 존중해주세요. 2.시간 약속을 잘 지켜주세요. 3.따뜻한 감사 인사로 마무리 지어주세요. 4.어떤 상황에서도 욕설, 비방, 명예훼손 등읜 언행은 지양해 주세요. 5.직접 촬영한 사진만 사용해 주세요.', 'admin', 1, NULL, NULL, 0);


SELECT * FROM entireBoard;


DELETE FROM entireBoard WHERE entireBoardSeq = 5;









