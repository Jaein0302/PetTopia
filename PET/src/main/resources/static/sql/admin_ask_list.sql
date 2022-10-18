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
 AAM_ANSDATE      DATE, --답변일자
 AAM_DATE         DATE,  --글의 작성날짜
 AAM_ANSCHECK      VARCHAR2(1000) DEFAULT '답변대기',
 PRIMARY KEY(AAM_NUMBER) --글은 삭제 되지 않으며 중복되지 않는다.
 );
 
--1:1문의 글쓰기 시퀀스
create sequence Aam_seq;


select * from Aam;


insert into member values ('cha4','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','차승희2','12345','서울','admin@pet.pet','010-1234-5678',null,null,'ROLE_ADMIN');
insert into Aam(AAM_NUMBER, AAM_NAME, AAM_SUBJECT, AAM_CONTENT, AAM_ANSWER, AAM_ANSDATE, 
AAM_EMIALSEND, AAM_KAKAOSEND, AAM_DATE,AAM_ANSCHECK) 
values(Aam_seq.nextval, 'cha3', '테스트','내용 없음','답변대기',,
'0', '0', sysdate,0 );

select * from aam;
   <select id="getAskMemberList" parameterType="java.util.Map" resultType="Aam">
      select * from
         (select rownum rnum, b.*
          from
             (select * from Aam where AAM_NAME = 'cha3'
              order by AAM_NUMBER desc) b
          where rownum <= 3
         )
      where rnum >= 1 and rnum <= 3   
   </select>




select * from Aam where AAM_NUMBER = 23




  select count(*) from Aam where AAM_NAME = 'cha3'







--0일때는 일반 글 
--1일때는 공지사항 메인으로 글 메인글일시 - 1 을 입력 -
--test는 1234번 글을 생성하고 2,3번글을 메인공지로 갈수있도록 해보기


select * from
         (select rownum rnum, b.*
          from
             (select * from Adn
              order by ADN_MAINCOLUMN desc,
              ADN_DATE desc)b
          where rownum <= 10
         )
      where rnum  >=  1 and rnum <= 10;   
      
 
 SELECT * FROM BOARD2;
 
 
 select *
 from emp,dept;
 
 select nvl(max(board_num),0)+1 from board
 
 
    delete from board
     select * from comm
     
  select * from board;
  
  
  
  
select *  from(select b.*, rownum rnum  
                 from(select * from member  
                        where id != 'admin' and id like ? order by id) 
                        b) 
                          where rnum>=? and rnum<=?  
                          
                          
 트리거 문제
 create table emp01
 as
 select * from emp;
 
 select * from emp;
 
create table temp
as
select ename,job,empno from EMP 
where 1=0

create or replace trigger emp01_temp
after delete
on emp01
for each row
begin
   insert into temp
   values(:old.ename, :old.job, :old.empno);
   end;
   
   cmd에서는 /추가.
   
   select * from emp01;
   
     7369 SMITH  CLERK     7902 1980-12-17 00:00:00.0  800 NULL     20
  7499 ALLEN  SALESMAN  7698 1981-02-20 00:00:00.0 1600  300     30
  7521 WARD   SALESMAN  7698 1981-02-22 00:00:00.0 1250  500     30
  7566 JONES  MANAGER   7839 1981-04-02 00:00:00.0 2975 NULL     20
  7654 MARTIN SALESMAN  7698 1981-09-28 00:00:00.0 1250 1400     30
  7698 BLAKE  MANAGER   7839 1981-05-01 00:00:00.0 2850 NULL     30
  7782 CLARK  MANAGER   7839 1981-06-09 00:00:00.0 2450 NULL     10
  7788 SCOTT  ANALYST   7566 1987-07-13 00:00:00.0 3000 NULL     20
  7839 KING   PRESIDENT NULL 1981-11-17 00:00:00.0 5000 NULL     10
  7844 TURNER SALESMAN  7698 1981-09-08 00:00:00.0 1500    0     30
  7876 ADAMS  CLERK     7788 1987-07-13 00:00:00.0 1100 NULL     20
  7900 JAMES  CLERK     7698 1981-12-03 00:00:00.0  950 NULL     30
  7902 FORD   ANALYST   7566 1981-12-03 00:00:00.0 3000 NULL     20
  7934 MILLER CLERK     7782 1982-01-23 00:00:00.0 1300 NULL     10

   total 14
   
   select * from temp;
   
   0
   
   delete emp01 where deptno=20;
   
 select *from user_triggers

   drop trigger EMP01_TEMP;
 
   select *from temp;
   
   
 select * 
     from ( select rownum rnum, b.*
             from  (select * 
                    from member  
                    where member_id != 'admin'
                    <include refid="search_"/>
                      order by member_id
                     )b 
              where rownum &lt;=  #{end}    
           ) 
     where rnum &gt;= #{start} and rnum  &lt;=  #{end}   
     
     
--sql 파일에 있는것 실행해보기

     select * from
         (select rownum rnum, b.*
          from
             (select * from Adn
              order by ADN_MAINCOLUMN desc,
              ADN_DATE desc) b
          where rownum <=10
         )
      where rnum >= 1 and rnum <= 10   
     
   -- search_word가 null이면 어떻게될까?..............
   
      select *
      from Aam
      where AAM_SUBJECT like ''
      --되는데 sql에서 #{search_word} 이게 널이면 어떻게 되지?
      
      
       select *
      from Aam
      where AAM_SUBJECT like ''
     
                  
                  
                  
                  
                  
                  <when test="CHECK=='NOT'">
                  AAM_ANSCHECK = '답변대기' and 
                  </when>
                  <when test="CHECK=='DONE">
                  AAM_ANSCHECK = '답변완료' and 
                  </when>
                  
                  </choose>
       <choose>
          <when test="search_field=='SUBJECT'">AAM_SUBJECT  like #{search_word} </when>
          <when test="search_field=='NAME'">AAM_NAME  like #{search_word} </when>
       </choose>
      
      -- 분류가 전체선택을 했을때 전체보기 일때에서는 where이 문제가 된다고 생각됨?
      
       
      
       
                  
                  --여기서 AAM_ANSCHECK 값을 선택하지 못하면? 
                  --검색어에서 where을 써야한다.
                  --아래와 같이 해야함.
                  --그냥 추즈 추즈 선택해야하고 싶은데 이거 못쓰는걸로암?..
                  --쿼리를 둘다 선택하지 않는다면 그냥 id를 따로 만들던지
                  --where이 계속 문제면 그냥 값을 넣던지..
                 
       create table aam;
       
      select *  
      from (select b.*, rownum rnum  
             from (select * 
                  from Aam 
                  where AAM_AAM = 1
                and aam_subject =''
                order by AAM_NUMBER
               ) b
               where rownum <10
             )
      where rnum > 1 and rnum <10
      
                
      -- 옵션 전체보기 제목 검색 
          select *  
      from (select b.*, rownum rnum  
             from (select * 
                  from Aam 
                  --aam 두가지값 부르는 쿼리문?.. 잇었나?..
                  
                  -- choose search_field == '전체보기' 전체보기 
                  AAM_ANSCHECK IN ('답변대기','답변완료')
                  
                  -- choose search_field = '답변대기'
                  AAM_AAM_ANSCHECK = #{search_field_one}
                  
                  
                  
                  
                  
                and aam_subject =''
                
                order by AAM_NUMBER
               ) b
               where rownum <10
             )
      where rnum > 1 and rnum <10
      
      --옵션 미답변 검색
            select *  
      from (select b.*, rownum rnum  
             from (select * 
                  from Aam 
                  
                  where AAM_ANSCHECK = 1     --방법 1
                and aam_subject =''
                
                where  aam_subject =''  --방법 2
                
                
                order by AAM_NUMBER
               ) b
               where rownum <10
             )
      where rnum > 1 and rnum <10
      
      
      
      
      
      
      
      
      
      
      
      -- 옵션 미답변 제목           
      -- 옵션 답변  제목 
      
      
      
      
          -- 체크 null일때 검색어 널이라면
          -- 일단 where aam_aam = 1 을 쓰고
          -- *** and가 필요함. 
                
          -- 체크 null일때 검색어가 있다면
          -- 일단 where aam_aam =1 을 쓰고
          -- and       
                
                
                
                  
                  
                  
                  
                  
                  
             select * from aam;     
       
                  
                  
             where AAM_SUBJECT like ''
             
             order by AAM_NUMBER
               ) b
               where rownum <10
             )
      where rnum > 1 and rnum <10
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  <when test="CHECK=='NOT'">
                  AAM_ANSCHECK = '답변대기' and 
                  </when>
                  <when test="CHECK=='DONE">
                  AAM_ANSCHECK = '답변완료' and 
                  </when>
                  
                  </choose>
       <choose>
          <when test="search_field=='SUBJECT'">AAM_SUBJECT  like #{search_word} </when>
          <when test="search_field=='NAME'">AAM_NAME  like #{search_word} </when>
       </choose>
               order by AAM_NUMBER
               ) b
               where rownum &lt;= #{end}
             )
      where rnum &gt;= #{start} and rnum &lt;= #{end}
   </select>    
      
      
      
      
      
   --like = 안쓴다
   --where ename like ' '
       <select id ="getSearchMemberList"  parameterType="map" resultType="member">
      
       
       select * from
         (select rownum rnum, b.*
          from
             (select * from member
              where member_id != 'admin'
              
                            and              
                            MEMBER_ID
                               like '관리자'
              
              order by member_id desc
              ) b
          where rownum <=10 
         )
      where rnum >=1 and rnum <=10
    
    
    </select>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
 