DROP SEQUENCE farmSeq;
DROP TABLE weekendFarm;

CREATE SEQUENCE farmSeq;

--위도 경도 추가해야할듯
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
	boardKind NUMBER NOT NULL,
	boardDate DATE NOT NULL,
	boardTitle VARCHAR2(200),
	boardContents VARCHAR2(4000), 
	userId VARCHAR2(30) NOT NULL,
	userSeq NUMBER NOT NULL,
	snsImg VARCHAR2(4000),
	likeCount NUMBER
);

ALTER TABLE entireBoard
ADD CONSTRAINT BOARD_USER_FK
FOREIGN KEY (userSeq)
REFERENCES USERS (userSeq)
ON DELETE CASCADE;

---sns:1, knowhow:2, notice:3

INSERT INTO entireBoard
VALUES (entireBoardSeq.NEXTVAL, 1, SYSDATE, '테스트글입니다.', '테스트내용입니다.', 'test01', 1, NULL, NULL);

INSERT INTO entireBoard
VALUES (entireBoardSeq.NEXTVAL, 1, SYSDATE, '테스트글입니다2.', '테스트내용입니다2.', 'dh', 2, NULL, NULL);

SELECT * FROM ENTIREBOARD;

SELECT *
FROM entireBoard
WHERE boardKind = 1
ORDER BY boardDate ASC;
----------------------------------------------------


















