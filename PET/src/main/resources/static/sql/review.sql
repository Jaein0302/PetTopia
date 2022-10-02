DROP TABLE review CASCADE CONSTRAINTS PURGE;

create table review(
	review_num      number primary key,
	review_id 		varchar2(15) not null references member(member_id) on delete cascade,
	review_item_id  number(15) not null references item(item_id) on delete cascade,
	review_score    number(5) not null,
	review_subject   varchar2(50) not null,
	review_content   varchar2(2000) not null,
	review_reg_date date default sysdate,
	review_image    varchar2(200)
)

select * from review