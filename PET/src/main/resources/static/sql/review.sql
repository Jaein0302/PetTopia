create table item_ask(
item_ask_id varchar2(100) not null primary key,
item_ask_itemname varchar2(100) not null references item(item_id) on delete cascade,
item_ask_username varchar2(15) not null references member(MEMBER_ID),
item_ask_subjecet varchar2(100) not null,
item_ask_content varchar2(1000) not null,
item_ask_answer varchar2(2) not null,
item_ask_date date default sysdate
)
