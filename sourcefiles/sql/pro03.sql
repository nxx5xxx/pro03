
-- create database haman;
 USE haman;
-- set autocommit=true;
-- show variables like 'autocommit';


-- CREATE TABLE test01(id VARCHAR(20) PRIMARY KEY, pw VARCHAR(20) NOT NULL, regdate DATEtime DEFAULT now(), num INT);
-- mysql에서는 date가 date이다
-- INSERT INTO test01 VALUES('kim', '1234', DEFAULT,3456);
-- INSERT INTO test01 VALUES('lee', '2345', DEFAULT,1111);
-- SELECT * FROM test01;

COMMIT;

-- 함안 테이블
 DROP TABLE member;
 DROP TABLE notice;
DROP TABLE photog;
DROP TABLE food;
DROP TABLE complain;
DROP TABLE accom;

-- 멤버 테이블
create table USER1(ID	VARCHAR(20) PRIMARY KEY,  	
			NAME VARCHAR(20) NOT NULL, 	
			PW VARCHAR(100) NOT NULL, 	
			ADDR VARCHAR(200), 	
			TEL	VARCHAR(13) NOT NULL, 	
			EMAIL VARCHAR(100), 	
			REGDATE DATETIME DEFAULT NOW());

select * from member;

-- 공지사항 테이블
create table NOTICE(NNO	VARCHAR(5) PRIMARY KEY,  
			TITLE VARCHAR(50) NOT NULL, 
			CONTENT	VARCHAR(1000), 
			ID VARCHAR(20), 
			NAME VARCHAR(20), 
			FILE1 VARCHAR(1000), 
			FILE2 VARCHAR(1000), 
			FILE3 VARCHAR(1000), 
			REGDATE	DATETIME DEFAULT NOW(),
			VIEWS INT DEFAULT 0,FOREIGN KEY(ID) REFERENCES USER1(ID));
select * from notice;

-- 민원 테이블
create table COMPLAIN(CNO VARCHAR(5) PRIMARY KEY, 
			TITLE VARCHAR(50) NOT NULL, 
			CONTENT	VARCHAR(1000), 
			ID	VARCHAR(20),
			NAME VARCHAR(20), 
			COMPANY	VARCHAR(20), 
			ADDR VARCHAR(200), 
			TEL	VARCHAR(13) NOT NULL, 
			FILE1 VARCHAR(1000), 
			REGDATE DATETIME DEFAULT NOW(),
			COMSW INT NOT NULL DEFAULT 1,
			REFNO VARCHAR(5) NOT NULL,
			FOREIGN KEY(ID) REFERENCES USER1(ID));
-- DROP TABLE complain;
-- comsw 는 qna 스위치이다 1일경우 질문 2일경우 답변
-- refno는 참조번호

-- 포토갤러리 테이블
create table PHOTOG(PNO	VARCHAR(5) PRIMARY KEY, 
			TITLE VARCHAR(50) NOT NULL, 
			CONTENT	VARCHAR(1000), 
			ID	VARCHAR(20), 
			NAME VARCHAR(20), 
			FILE1 VARCHAR(1000) NOT NULL, 
			FILE2 VARCHAR(1000), 
			REGDATE	DATETIME DEFAULT NOW(),
			VIEWS INT DEFAULT 0,FOREIGN KEY(ID) REFERENCES USER1(ID));

-- 음식점테이블            
create table 	FOOD(FNO VARCHAR(5) PRIMARY KEY, 
			TITLE VARCHAR(50) NOT NULL, 
			ADDR VARCHAR(200) NOT NULL, 
			TEL VARCHAR(14) NOT NULL, 
			FILE1 VARCHAR(1000) NOT NULL, 
			REGDATE DATETIME DEFAULT NOW(),
			VIEWS INT DEFAULT 0);
            
-- 숙소 테이블
create table ACCOM(ANO VARCHAR(5) PRIMARY KEY, 
			TITLE VARCHAR(50) NOT NULL, 
			ADDR VARCHAR(200) NOT NULL, 
			TEL VARCHAR(14) NOT NULL, 
			FILE1 VARCHAR(1000) NOT NULL, 
			REGDATE	DATETIME DEFAULT NOW(),
			VIEWS INT DEFAULT 0);

-- 회원 더미 데이터
insert into 	USER1	 values('admin','관리자','1234','경기도 고양시','010-0000-0000','admin@naver.com',default);
update user1 set pw='LySS6ru/2ewkkXvE4EQjkqUhNBaUxmI0vs3nMbcDlxI/ZWQQAG1upbOe4eerLQdFYFrCMg==' where id='admin';
insert into 	USER1	 values('kim','김길동','1111','경기도 고양시','010-1111-1111','test1@naver.com',default);
update user1 set pw='5y3DrnUnN97CuOYVhaLZF1zVGQo4HB3VA++YiuW3kfetg5mppm8OJt9wgYSUTHZiH/zLMw==' where id='kim';
insert into 	USER1	 values('park','박길은','2222','경기도 고양시','010-2222-2222','test2@naver.com',default);
update user1 set pw='HPkV4oNAfzoXBEzTrhdUo1Vi2u1+484v2RYianbDyDqAfFJKmOinMr1KB3wY2JopYO3ehg==' where id='park';
insert into 	USER1	 values('lee','이길금','3333','경기도 고양시','010-3333-3333','test3@naver.com',default);
update user1 set pw='Hr0QEQoV0lPNdpv0tYDytDsmUkksMxzMke8aX59tJLH55MpQmyh6gL93lvmsLzQg+v041g==' where id='lee';
insert into 	USER1	 values('choi','최백금','4444','경기도 고양시','010-1111-1112','test4@naver.com',default);
update user1 set pw='xBhtj7wP33kLpksfV5t9VV0w8tPHtkQTg+lE4leQ99K6UnSyGkPCc2gV97kmcFo2AVODhQ==' where id='choi';
insert into 	USER1	 values('jho','조백은','5555','경기도 고양시','010-2222-2223','test5@naver.com',default);
update user1 set pw='QE8/7ZT6N7WeqAEt8a+aqvmAOHbtOZ4j8yrD0tP0hZ/l/mPOdlThnIOwJ96WkE2UUeF04w==' where id='jho';
insert into 	USER1	 values('whitekim','김백동','6666','경기도 고양시','010-3333-3334','test6@naver.com',default);
update user1 set pw='Yz6oIY1WqSIzrvF1c5ZwXTZoPFEcfoAmTl3J5j3fOrgfBLxP2sorg3CF7y+bXcjrwjn4zQ==' where id='whitekim';


-- 기존 더미데이터 삭제하고 한글이름으로 전환
-- delete from member where mno >= '10001';

-- sql인서트문
-- insert into USER1 values(?,?,?,?,?,?,default);
-- 특정회원 검색문
-- 이것때문에 id 해야할듯해요
-- select * from member where 



-- 공지사항 더미 데이터
desc notice;
insert into	notice values('20001','더미제목1','더미본문입니다1','admin','관리자','','','',default,default);
insert into	notice values('20002','더미제목2','더미본문입니다2','admin','관리자','','','',default,default);
insert into	notice values('20003','더미제목3','더미본문입니다3','admin','관리자','','','',default,default);
insert into	notice values('20004','더미제목4','더미본문입니다4','admin','관리자','','','',default,default);
insert into	notice values('20005','더미제목5','더미본문입니다5','admin','관리자','','','',default,default);
insert into	notice values('20006','더미제목6','더미본문입니다6','admin','관리자','','','',default,default);
insert into	notice values('20007','더미제목7','더미본문입니다7','admin','관리자','','','',default,default);
insert into	notice values('20008','더미제목8','더미본문입니다8','admin','관리자','','','',default,default);
insert into	notice values('20009','더미제목9','더미본문입니다9','admin','관리자','','','',default,default);
insert into	notice values('20010','더미제목10','더미본문입니다10','admin','관리자','','','',default,default);
insert into	notice values('20011','더미제목11','더미본문입니다11','admin','관리자','','','',default,default);
insert into	notice values('20012','더미제목12','더미본문입니다12','admin','관리자','','','',default,default);
-- sql 인서트문 
-- insert into notice values(?,?,?,?,?,?,?,?,default,default);
desc complain;

-- 민원 더미데이터
insert into complain values('30001', '민원제목1', '민원에대한 본문입니다1','kim', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,DEFAULT,'30001');
insert into complain values('30002', '민원제목2', '민원에대한 본문입니다2','kim', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,default,'30002');
insert into complain values('30003', '민원제목3', '민원에대한 본문입니다3','kim', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,default,'30003');
insert into complain values('30004', '민원제목4', '민원에대한 본문입니다4','kim', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,default,'30004');
insert into complain values('30005', '민원제목5', '민원에대한 본문입니다5','kim', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,default,'30005');
-- 민원 답변 더미 데이터
insert into complain values('30006', '답변제목1', '민원에대한 답변입니다1','admin', '관리자', '함안군청','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,2,'30001');
SELECT * FROM complain where refno='30001' and comsw=2;
desc photog;

-- 포토갤러리 더미데이터
INSERT INTO photog VALUES('40001','포토갤러리 제목1','포토갤러리의 내용입니다1','kim','김길동','첨부파일 없음','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO photog VALUES('40002','포토갤러리 제목2','포토갤러리의 내용입니다2','kim','김길동','첨부파일 없음','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO photog VALUES('40003','포토갤러리 제목3','포토갤러리의 내용입니다3','kim','김길동','첨부파일 없음','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO photog VALUES('40004','포토갤러리 제목4','포토갤러리의 내용입니다4','kim','김길동','첨부파일 없음','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO photog VALUES('40005','포토갤러리 제목5','포토갤러리의 내용입니다5','kim','김길동','첨부파일 없음','첨부파일 없음',DEFAULT,DEFAULT);


-- insert into photog values()


DESC food;
SELECT * FROM food;
-- 음식점 더미데이터
INSERT INTO food VALUES('50001','함안음식점1','경상남도 함안군','0505-0101-0101','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO food VALUES('50002','함안음식점2','경상남도 함안군','0505-0202-0202','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO food VALUES('50003','함안음식점3','경상남도 함안군','0505-0303-0303','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO food VALUES('50004','함안음식점4','경상남도 함안군','0505-0404-0404','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO food VALUES('50005','함안음식점5','경상남도 함안군','0505-0505-0505','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO food VALUES('50006','함안음식점6','경상남도 함안군','0505-0606-0606','첨부파일 없음',DEFAULT,DEFAULT);

-- 
DESC accom;

INSERT INTO accom VALUES('60001','함안숙박업소1','경상남도 함안군','070-0101-0101','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO accom VALUES('60002','함안숙박업소2','경상남도 함안군','070-0202-0202','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO accom VALUES('60003','함안숙박업소3','경상남도 함안군','070-0303-0303','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO accom VALUES('60004','함안숙박업소4','경상남도 함안군','070-0404-0404','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO accom VALUES('60005','함안숙박업소5','경상남도 함안군','070-0505-0505','첨부파일 없음',DEFAULT,DEFAULT);
INSERT INTO accom VALUES('60006','함안숙박업소6','경상남도 함안군','070-0606-0606','첨부파일 없음',DEFAULT,DEFAULT);

SELECT * FROM notice ORDER BY nno DESC LIMIT 1;

DESC notice;

SELECT * FROM complain order by cno DESC;

SELECT * FROM complain;
DESC complain;

SELECT * FROM complain where id='kim' order by cno DESC;
SELECT * FROM complain where refno='30001';

SELECT * FROM complain where id='kim' order by cno DESC LIMIT 0,10;

DESC photog;
SELECT * FROM photog ORDER BY pno DESC;
SELECT * FROM photog ORDER BY pno DESC LIMIT 1;

commit;
SELECT * FROM USER1;

SHOW TABLES;

SELECT * FROM complain where id='kim' order by cno desc LIMIT 0,10;