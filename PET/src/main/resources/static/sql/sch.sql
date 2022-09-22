create sch(
sch_id varchar2(10) not null primary key,
sch_name varchar2(100) not null references item(name) on delete cascade,
sch_seller varchar2(15) not null references member(member_id) on delete cascade,
sch_rsv_date date default sysdate
)