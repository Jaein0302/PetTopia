drop table Abn cascade constraints purge;
CREATE TABLE Abn(
 ABN_NUMBER   NUMBER, --글번호
 ABN_NAME      VARCHAR2(30), --작성자
 ABN_DIVISION VARCHAR2(100), --'일반' '공지' 구분
 ABN_SUBJECT  VARCHAR2(300), --제목
 ABN_CONTENT   VARCHAR2(4000), --내용
 ABN_DATE DATE,  --글의 작성날짜
 ABN_FILE   VARCHAR2(1000), --첨부파일명 가공
 ABN_ORIGINAL VARCHAR2(1000), --첨부파일명
 PRIMARY KEY(ABN_NUMBER)
 );
 
 
 SELECT * FROM ABN;
 
 UPDATE ABN
 SET ABN_SUBJECT ='공지 수정 해봄', ABN_CONTENT='내용수정'
 WHERE  ABN_NUMBER = 14
 
 
 select * from Adn;
insert into Abn values
(Abn_seq.nextval,'admin','테스트','내용입니다',sysdate,'0','0');
        

drop sequence Abn_seq;
create sequence Abn_seq;


--
                                                                
--0일때는 일반 글 
--1일때는 공지사항 메인으로 글 메인글일시 - 1 을 입력 -
--test는 1234번 글을 생성하고 2,3번글을 메인공지로 갈수있도록 해보기


