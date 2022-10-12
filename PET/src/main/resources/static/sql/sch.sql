drop table sch cascade constraints purge;

create table sch(
sch_id number(30) not null primary key, --구분을 위해
sch_title varchar2(100), --스케줄 제목
sch_start varchar2(100), --시작 시간
sch_seller varchar2(100) --판매자id
)

select * from sch

insert into sch
values (1, '예방주사', '2022-10-11 20:00', 'treat1');

drop sequence sch_seq
create sequence sch_seq start with 1000 increment by 1;