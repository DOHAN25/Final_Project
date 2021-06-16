DROP TABLE USERS;

CREATE SEQUENCE userSeq;

CREATE TABLE USERS(
	userSeq NUMBER PRIMARY KEY,
	userId VARCHAR2(100) NOT NULL,
	password VARCHAR2(100) NOT NULL,
	userEmail VARCHAR2(1000) NOT NULL,
	userPhone NUMBER NOT NULL,
	userAddress VARCHAR2(4000) NOT NULL,
	userRole VARCHAR2(100) CHECK(userRole IN ('admin', 'user')),
	userName VARCHAR2(100) NOT NULL,
	userBirthday VARCHAR2(100) NOT NULL
);


INSERT INTO USERS
VALUES(userSeq.NEXTVAL, 'test01', '1234', 'jd@naver.com', 01012311231, '경기도 고양시', 
'admin', '김대진', '931031');


INSERT INTO USERS
VALUES(userSeq.NEXTVAL, 'dh', '3333', 'dh@naver.com', 010123423112, '경기도 남양주시', 
'admin', '김도한', '950511');

INSERT INTO USERS
VALUES(userSeq.NEXTVAL, 'taerin', '1234', 'tr@naver.com', 010123423112, '서울 건대근처', 
'user', '김태린', '941211');


select * from users;