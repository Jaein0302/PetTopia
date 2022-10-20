drop table ITEM cascade constraints purge;

create table ITEM (
   ITEM_ID              NUMBER(15) PRIMARY KEY,
   ITEM_NAME            VARCHAR2(30) NOT NULL,
   ITEM_CATEGORY         VARCHAR2(30) NOT NULL,
   ITEM_PRICE            NUMBER(20) NOT NULL,
   ITEM_CONTENT        VARCHAR2(1000) NOT NULL,
   ITEM_IMAGE_ORIGINAL  VARCHAR2(100) NOT NULL,
   ITEM_IMAGE_FILE      VARCHAR2(100) NOT NULL,
   ITEM_REG_DATE        DATE DEFAULT SYSDATE NOT NULL,
   ITEM_RSV_DATE       DATE DEFAULT SYSDATE NOT NULL,  -- 예약날짜
   ITEM_SCORE            NUMBER(20,1),  -- 후기
   ITEM_SEX            VARCHAR2(10), -- male, female
   ITEM_WEIGHT         VARCHAR2(5), -- L, M, S (수정)
   ITEM_SPECIES        VARCHAR2(10), -- dog, cat
   ITEM_ADDRESS         VARCHAR2(150),
   ITEM_SELLER          VARCHAR2(15), --안쓰는곳
   MEMBER_ID          VARCHAR2(15) references member(MEMBER_ID) --내가 등록한 상품에서 필요함 (추가), 등록한 사람의 아이디
);

select * from item;
delete item


drop sequence item_seq
create sequence item_seq start with 1 increment by 1;

-- 수술/치료
insert into item values(10001,'중성화 수술','treat',100000,'소형견 수컷 중성화 수술','소형견_수컷_중성화.jpg','/2022-10-10/소형견_수컷_중성화.jpg',sysdate,sysdate,null,'male','S','dog','서울특별시 종로구 신영동 249-6','treat1','treat1');
insert into item values(10002,'중성화 수술','treat',100000,'소형견 암컷 중성화 수술','소형견_암컷_중성화.jpg','/2022-10-10/소형견_암컷_중성화.jpg',sysdate,sysdate,null,'female','S','dog','서울특별시 종로구 신영동 249-6','treat1','treat1');
insert into item values(10003,'건강검진','treat',20000,'반려견 · 반려묘 건강검진','건강검진.jpg','/2022-10-10/건강검진.jpg',sysdate,sysdate,null,'male','S','dog','서울특별시 종로구 신영동 249-6','treat1','treat1');
insert into item values(10004,'스케일링','treat',50000,'반려견 · 반려묘 스케일링','스케일링.jpg','/2022-10-10/스케일링.jpg',sysdate,sysdate,null,'male','S','dog','서울특별시 종로구 신영동 249-6','treat1','treat1');
insert into item values(10005,'스케일링','treat',50000,'반려견 · 반려묘 스케일링','스케일링2.jpg','/2022-10-10/스케일링2.jpg',sysdate,sysdate,null,'male','S','dog','서울특별시 종로구 홍지동 126-8','treat2','treat2');
insert into item values(10006,'슬개골탈구','treat',200000,'반려견 · 반려묘 슬개골탈구 수술','슬개골탈구.jpg','/2022-10-10/슬개골탈구.jpg',sysdate,sysdate,null,'male','S','dog','서울특별시 종로구 홍지동 126-8','treat2','treat2');
insert into item values(10007,'중성화 수술','treat',200000,'중형견 수컷 중성화 수술','중형견_수컷_중성화.jpg','/2022-10-10/중형견_수컷_중성화.jpg',sysdate,sysdate,null,'male','M','dog','서울특별시 종로구 홍지동 126-8','treat2','treat2');
insert into item values(10008,'중성화 수술','treat',200000,'중형견 암컷 중성화 수술','중형견_암컷_중성화.jpg','/2022-10-10/중형견_암컷_중성화.jpg',sysdate,sysdate,null,'female','M','dog','서울특별시 종로구 홍지동 126-8','treat2','treat2');
insert into item values(10009,'중성화 수술','treat',300000,'대형견 수컷 중성화 수술','대형견_수컷_중성화.jpg','/2022-10-10/대형견_수컷_중성화.jpg',sysdate,sysdate,null,'male','L','dog','서울특별시 종로구 홍지동 126-8','treat2','treat2');
insert into item values(10010,'중성화 수술','treat',300000,'대형견 암컷 중성화 수술','대형견_암컷_중성화.jpg','/2022-10-10/대형견_암컷_중성화.jpg',sysdate,sysdate,null,'female','L','dog','서울특별시 종로구 홍지동 126-8','treat2','treat2');

--교육
insert into item values(20001,'애견 유치원','education',220000,'반려견을 위한 애견 유치원','애견유치원.jpg','/2022-10-10/애견유치원.jpg',sysdate,sysdate,null,'null','null','null','서울특별시 도봉구 도봉로 586','edu1','edu1');
insert into item values(20002,'반려견 1:1 훈련','education',99000,'보호자와 함께하는 반려견 훈련!','반려견1대1훈련.jpg','/2022-10-10/반려견1대1훈련.jpg',sysdate,sysdate,null,'null','null','null','서울특별시 도봉구 도봉로 586','edu1','edu1');
insert into item values(20003,'기초 교육','education',80000,'초보 반려인을 위한 기본 교육','반려견훈련.jpg','/2022-10-10/반려견훈련.jpg',sysdate,sysdate,null,'null','null','null','서울특별시 도봉구 도봉로 586','edu1','edu1');
insert into item values(20004,'사회화 교육','education',120000,'반려견의 사회화 이론과 기초 교육 방법의 이해','애견유치원1.jpg','/2022-10-10/애견유치원1.jpg',sysdate,sysdate,null,'null','null','null','서울특별시 도봉구 도봉로 586','edu1','edu1');
insert into item values(20005,'애견 유치원','education',182000,'걱정없이 안심하는 완벽 개린이집!','애견유치원2.jpg','/2022-10-10/애견유치원2.jpg',sysdate,sysdate,null,'null','null','null','서울 중구 동호로12길 88','edu2','edu2');
insert into item values(20006,'1:1방문교육','education',150000,'편안한 집에서 편안한 마음으로 행동교정 받자!','방문교육.jpg','/2022-10-10/방문교육.jpg',sysdate,sysdate,null,'null','null','null','서울 중구 동호로12길 88','edu2','edu2');

--미용
insert into item values(30001,'소형견 미용','beauty',20000,'세상 귀여운 소형견 미용, 더 합리적으로 받자!','소형견미용.jpg','/2022-10-10/소형견미용.jpg',sysdate,sysdate,null,'null','null','null','서울 종로구 지봉로 72-1','beauty1','beauty1');
insert into item values(30002,'중형견 미용','beauty',28000,'전문가 선생님의 손길로 완전 대박 예쁘게~ ','애견미용1.jpg','/2022-10-10/애견미용1.jpg',sysdate,sysdate,null,'null','null','null','서울 종로구 지봉로 72-1','beauty1','beauty1');
insert into item values(30003,'강아지 목욕 서비스','beauty',30000,'아이 맞춤 목욕과 서비스를 경험해요!','목욕.jpg','/2022-10-10/목욕.jpg',sysdate,sysdate,null,'null','null','null','서울 종로구 지봉로 72-1','beauty1','beauty1');
insert into item values(30004,'단독 촬영','beauty',100000,'소중하고 아름다운 그 순간, 가장 예쁘게 담아보세요!','사진촬영1.jpg','/2022-10-10/사진촬영1.jpg',sysdate,sysdate,null,'null','null','null','서울 종로구 지봉로 72-1','beauty1','beauty1');
insert into item values(30005,'애견 미용','beauty',30000,'섬세한 애견 미용','애견미용.jpg','/2022-10-10/애견미용.jpg',sysdate,sysdate,null,'null','null','null','서울 서대문구 홍은중앙로3길 22','beauty2','beauty2');
insert into item values(30006,'애견 스파','beauty',50000,'애견 스파','애견스파.jpg','/2022-10-10/애견스파.jpg',sysdate,sysdate,null,'null','null','null','서울 서대문구 홍은중앙로3길 22','beauty2','beauty2');
insert into item values(30007,'사진 촬영','beauty',100000,'아이와 진짜 가족사진을 남겨보세요!','사진촬영.jpg','/2022-10-10/사진촬영.jpg',sysdate,sysdate,null,'null','null','null','서울 서대문구 홍은중앙로3길 22','beauty2','beauty2');


