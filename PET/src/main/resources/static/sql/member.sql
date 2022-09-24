DROP TABLE MEMBER CASCADE CONSTRAINTS PURGE;
create table member(
   MEMBER_ID VARCHAR2(15) primary key,       --아이디
   MEMBER_PASSWORD VARCHAR2(60),   --패스워드
   MEMBER_NAME VARCHAR2(15),      --이름(기업명)
   MEMBER_POST CHAR(5),           --우편번호
   MEMBER_ADDRESS VARCHAR2(90),   --주소
   MEMBER_EMAIL VARCHAR2(30),     --이메일
   MEMBER_TELL VARCHAR2(30),      --연락처
   MEMBER_BTYPE VARCHAR2(30),     --업종
   MEMBER_REGNUM CHAR(10),        --사업자 등록번호
   AUTH VARCHAR2(50) not null     --권한
);

delete member

-- 아이디 : admin / 비번 : 123
insert into member values ('admin','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','관리자','12345','서울','admin@pet.pet','010-1234-5678',null,null,'ROLE_ADMIN');

-- update member set auth='ROLE_ADMIN' where member_id='admin';

select * from member

select * from member
where member_id='admin'
and member_name ='관리자'
and member_email='admin@pet.pet'