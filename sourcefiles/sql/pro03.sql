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

-- 멤버 테이블
create table MEMBER(MNO	VARCHAR(5) PRIMARY KEY,  	
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
			MNO VARCHAR(5), 
			NAME VARCHAR(20), 
			FILE1 VARCHAR(1000), 
			FILE2 VARCHAR(1000), 
			FILE3 VARCHAR(1000), 
			REGDATE	DATETIME DEFAULT NOW(),
			VIEWS INT DEFAULT 0,FOREIGN KEY(MNO) REFERENCES MEMBER(MNO));
select * from notice;

-- 민원 테이블
create table COMPLAIN(CNO VARCHAR(20), 
			TITLE VARCHAR(50) NOT NULL, 
			CONTENT	VARCHAR(1000), 
			MNO	VARCHAR(5),
			NAME VARCHAR(20), 
			COMPANY	VARCHAR(20), 
			ADDR VARCHAR(200), 
			TEL	VARCHAR(13) NOT NULL, 
			FILE1 VARCHAR(1000), 
			REGDATE DATETIME DEFAULT NOW(),
			COMSW INT NOT NULL DEFAULT 1,FOREIGN KEY(MNO) REFERENCES MEMBER(MNO));
-- comsw 는 qna 스위치이다 1일경우 질문 2일경우 답변


-- 포토갤러리 테이블
create table PHOTOG(PNO	VARCHAR(5), 
			TITLE VARCHAR(50) NOT NULL, 
			CONTENT	VARCHAR(1000), 
			MNO	VARCHAR(5), 
			NAME VARCHAR(20), 
			FILE1 VARCHAR(1000) NOT NULL, 
			FILE2 VARCHAR(1000), 
			REGDATE	DATETIME DEFAULT NOW(),
			VIEWS INT DEFAULT 0,FOREIGN KEY(MNO) REFERENCES MEMBER(MNO));

-- 음식점테이블            
create table 	FOOD(FNO VARCHAR(5), 
			TITLE VARCHAR(50) NOT NULL, 
			ADDR VARCHAR(200) NOT NULL, 
			TEL VARCHAR(14) NOT NULL, 
			FILE1 VARCHAR(1000) NOT NULL, 
			REGDATE DATETIME DEFAULT NOW(),
			VIEWS INT DEFAULT 0);
            
-- 숙소 테이블
create table ACCOM(ANO VARCHAR(5), 
			TITLE VARCHAR(50) NOT NULL, 
			ADDR VARCHAR(200) NOT NULL, 
			TEL VARCHAR(14) NOT NULL, 
			FILE1 VARCHAR(1000) NOT NULL, 
			REGDATE	DATETIME DEFAULT NOW(),
			VIEWS INT DEFAULT 0);

-- 회원 더미 데이터
insert into 	MEMBER	 values('10000','admin','1234','경기도 고양시','010-0000-0000','admin@naver.com',default);
insert into 	MEMBER	 values('10001','김길동','1111','경기도 고양시','010-1111-1111','test1@naver.com',default);
insert into 	MEMBER	 values('10002','박길은','2222','경기도 고양시','010-2222-2222','test2@naver.com',default);
insert into 	MEMBER	 values('10003','이길금','3333','경기도 고양시','010-3333-3333','test3@naver.com',default);
insert into 	MEMBER	 values('10004','최백금','4444','경기도 고양시','010-1111-1112','test4@naver.com',default);
insert into 	MEMBER	 values('10005','조백은','5555','경기도 고양시','010-2222-2223','test5@naver.com',default);
insert into 	MEMBER	 values('10006','김백동','6666','경기도 고양시','010-3333-3334','test6@naver.com',default);


-- 기존 더미데이터 삭제하고 한글이름으로 전환
-- delete from member where mno >= '10001';

-- sql인서트문
-- insert into MEMBER values(?,?,?,?,?,?,default);
-- 특정회원 검색문
-- 이것때문에 id 해야할듯해요
-- select * from member where 



-- 공지사항 더미 데이터
desc notice;
insert into	notice values('20001','더미제목1','더미본문입니다1','10000','admin','','','',default,default);
insert into	notice values('20002','더미제목2','더미본문입니다2','10000','admin','','','',default,default);
insert into	notice values('20003','더미제목3','더미본문입니다3','10000','admin','','','',default,default);
insert into	notice values('20004','더미제목4','더미본문입니다4','10000','admin','','','',default,default);
insert into	notice values('20005','더미제목5','더미본문입니다5','10000','admin','','','',default,default);
insert into	notice values('20006','더미제목6','더미본문입니다6','10000','admin','','','',default,default);
insert into	notice values('20007','더미제목7','더미본문입니다7','10000','admin','','','',default,default);
insert into	notice values('20008','더미제목8','더미본문입니다8','10000','admin','','','',default,default);
insert into	notice values('20009','더미제목9','더미본문입니다9','10000','admin','','','',default,default);
insert into	notice values('20010','더미제목10','더미본문입니다10','10000','admin','','','',default,default);
insert into	notice values('20011','더미제목11','더미본문입니다11','10000','admin','','','',default,default);
insert into	notice values('20012','더미제목12','더미본문입니다12','10000','admin','','','',default,default);
-- sql 인서트문 
-- insert into notice values(?,?,?,?,?,?,?,?,default,default);
desc complain;

-- 민원 더미데이터
insert into complain values('30001', '민원제목1', '민원에대한 본문입니다1','10001', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,default);
insert into complain values('30002', '민원제목2', '민원에대한 본문입니다2','10001', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,default);
insert into complain values('30003', '민원제목3', '민원에대한 본문입니다3','10001', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,default);
insert into complain values('30004', '민원제목4', '민원에대한 본문입니다4','10001', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,default);
insert into complain values('30005', '민원제목5', '민원에대한 본문입니다5','10001', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,default);

desc photog;

-- 포토갤러리 더미데이터

-- insert into photog values()
