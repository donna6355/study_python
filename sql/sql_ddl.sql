------------------CREATE--------------------

create table product_test (
   product_id          number,
   product_name        varchar2(255) not null,
   category            varchar2(100) not null,
   price               number default 0 not null,
   stock               number default 0 not null,
   product_description varchar2(4000),
   created_date        date not null
);

insert into product_test (
   product_id,
   product_name,
   category,
   product_description,
   created_date
) values ( 1,
           'product1',
           'Home Appliances',
           'When i find my self in times of trouble mother mary comes to me',
           sysdate );

select *
  from product_test;


------------------ALTER--------------------
create table mytest (
   col1 varchar2(10),
   col2 varchar2(10)
);

select *
  from mytest;


alter table mytest add col3 varchar2(200) default 'X' not null;

alter table mytest modify
   col1 number not null;


alter table mytest drop column col3;

alter table mytest rename column col1 to 컬럼1;



------------------DROP--------------------
drop table mytest;


---------------PRIMARY KEY----------------
-- --제약조건 이름 지정 가능(디버깅 편리), 다중 설정 가능
-- alter table product_test add constraint product_test_pk primary key ( product_id );
-- -- 이름 지정 불가, 1개 설정 가능
-- create table testone (
--    col1 number primary key,
--    col2 number,
--    col3 number
-- );
-- --이름 지정 불가, 다중 설정 가능
-- create table testtwo (
--    col1 number,
--    col2 number,
--    col3 number,
--    primary key ( col1,
--                  col2 )
-- );
-- --이름 지정 가능, 다중 설정 가능
-- create table testthree (
--    col1 number,
--    col2 number,
--    col3 number,
--    constraint testthree_pk primary key ( col1,
--                                          col2 )
-- );


---------------SEQUENCE----------------

create sequence seq_member_purchase start with 52 increment by 1;


insert into member_purchase (
   purchase_id,
   member_id,
   product_id,
   quantity,
   total_price,
   purchase_date
) values ( seq_member_purchase.nextval,
           :memberid,
           :productid,
           :quantity,
           :price * :quantity,
           sysdate );

select *
  from member_purchase;