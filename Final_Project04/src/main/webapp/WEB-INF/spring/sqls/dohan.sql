
DROP SEQUENCE USERSEQ;
DROP TABLE USERS;


CREATE SEQUENCE USERSEQ;

CREATE TABLE USERS(
	USERSEQ NUMBER PRIMARY KEY,
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
VALUES(USERSEQ.NEXTVAL, 'test01', '1234', 'jd@naver.com', 01012311231, '��⵵ ����', 
'admin', '�����', '931031');


INSERT INTO USERS
VALUES(USERSEQ.NEXTVAL, 'dh', '3333', 'dh@naver.com', 010123423112, '��⵵ �����ֽ�', 
'admin', '�赵��', '950511');

INSERT INTO USERS
VALUES(USERSEQ.NEXTVAL, 'taerin', '1234', 'tr@naver.com', 010123423112, '���� �Ǵ��ó', 
'user', '���¸�', '941211');


select * from users;