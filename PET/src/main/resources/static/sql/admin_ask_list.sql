drop table Aam cascade constraints purge;
drop sequence Aam_seq

--Adn 테이블 == 공지사항 게시판
Aam  AAM_ANSCHECK

--admin_askmember == Aam
CREATE TABLE Aam(
 AAM_NUMBER      NUMBER, --글번호
 AAM_NAME       VARCHAR2(300) references member(member_id) on delete cascade, --작성자
 AAM_SUBJECT     VARCHAR2(300), --제목
 AAM_CONTENT      VARCHAR2(2000), -- 내용
 AAM_DATE         DATE,  --글의 작성날짜
 AAM_ANSCHECK      VARCHAR2(1000) DEFAULT '답변대기',
 PRIMARY KEY(AAM_NUMBER) --글은 삭제 되지 않으며 중복되지 않는다.
 );
 
delete Aam where AAM_NUMBER=23
select * from aam;
 
--1:1문의 글쓰기 시퀀스
create sequence Aam_seq;


select * from Aam order by aam_ansdate desc;
      order by aam_number
      

      
      
      
      
      
      
      
   
   
   
 