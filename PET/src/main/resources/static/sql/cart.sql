create table CART (
   CART_ID         VARCHAR2(15) primary key,
   CART_ITEM_ID      VARCHAR2(15) not null,
   CART_ITEM_NAME      VARCHAR2(20) not null references ITEM(ITEM_NAME),
   CART_ITEM_IMAGE      VARCHAR2(100) not null references ITEM(ITEM_IMAGE),
   CART_AMOUNT      NUMBER(20) not null,
   ITEM_RSV_DATE      DATE default sysdate not null,
   CART_ITEM_PRICE      NUMBER(20) not null references ITEM(ITEM_PRICE)
)