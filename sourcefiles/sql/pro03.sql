-- create database haman;
-- USE haman;
-- set autocommit=true;
-- show variables like 'autocommit';


-- CREATE TABLE test01(id VARCHAR(20) PRIMARY KEY, pw VARCHAR(20) NOT NULL, regdate DATEtime DEFAULT now(), num INT);
-- mysql에서는 date가 date이다
-- INSERT INTO test01 VALUES('kim', '1234', DEFAULT,3456);
-- INSERT INTO test01 VALUES('lee', '2345', DEFAULT,1111);
SELECT * FROM test01;

COMMIT;

