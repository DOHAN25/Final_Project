DROP SEQUENCE farmSeq;
DROP TABLE weekendFarm;

CREATE SEQUENCE farmSeq;

CREATE TABLE weekendFarm(
	farmSeq NUMBER PRIMARY KEY NOT NULL,
	farmName VARCHAR2(100) NOT NULL,
	farmAddress VARCHAR2(200) NOT NULL,
	farmPhone NUMBER(30) NOT NULL
	
);

INSERT INTO weekendFarm
VALUES (farmSeq.NEXTVAL, '대진이네 농장', '경기도 고양시', '01097954578');

SELECT * FROM WEEKENDFARM;

----------------------boardtable--------------------------------

DROP SEQUENCE entireBoardSeq;
DROP TABLE entireBoard;

CREATE SEQUENCE entireBoardSeq;

CREATE TABLE entireBoard(
	entireBoardSeq NUMBER PRIMARY KEY NOT NULL,
	eachBoardNum NUMBER NOT NULL,
	boardKind VARCHAR2(20) NOT NULL,
	boardDate DATE NOT NULL,
	boardTitle VARCHAR2(200),
	boardContents VARCHAR2(4000),
	userId VARCHAR2(30) NOT NULL,
	userSeq NUMBER NOT NULL,
	snsImg VARCHAR2(4000),
	likeCount NUMBER
);

--1. 시퀀스를 여러개 두는 방법(이건 안될듯)
DROP SEQUENCE snsSeq;
DROP SEQUENCE knowhowSeq;
DROP SEQUENCE noticeSeq;

CREATE SEQUENCE snsSeq;
CREATE SEQUENCE knowhowSeq;
CREATE SEQUENCE noticeSeq;

INSERT INTO entireBoard
VALUES (entireBoardSeq.NEXTVAL, snsSeq.NEXTVAL, );


--2. row_number를 이용해서 순차적 번호를 부여하는 방법...


















