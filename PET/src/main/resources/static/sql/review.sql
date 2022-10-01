DROP TABLE review CASCADE CONSTRAINTS PURGE;
drop sequence review_seq;

create table review(
	review_num      number primary key,
	review_id 		varchar2(15) not null references member(member_id) on delete cascade,
	review_item_id  number(15) not null references item(item_id) on delete cascade,
	review_score    number(5) not null,
	reviw_content   varchar2(2000) not null,
	review_reg_date date default sysdate,
	review_image    varchar2(200)
)

-- 리뷰 시퀀스
create sequence review_seq;