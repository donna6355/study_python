-- -- [ORACLE에서 사용한 방식] 
-- select a.name,
--        a.age,
--        b.order_id,
--        b.order_date,
--        b.payment_status
--   from member a,
--        orders b
--  where a.member_id = b.member_id;

-- -- [ANSI 조인으로 바꾼 방식] 
-- select a.name,
--        a.age,
--        b.order_id,
--        b.order_date,
--        b.payment_status
--   from member a
--  inner join orders b
-- on ( a.member_id = b.member_id );

-- -- [ORACLE에서 사용한 방식] 
-- SELECT A.ORDER_DATE
--      , A.MEMBER_ID           
--   FROM ORDERS A
--      , PAYMENT B 
--  WHERE A.ORDER_ID = B.ORDER_ID(+)
--    AND B.ORDER_ID IS NULL; 
  
-- --  [ANSI 조인으로 바꾼 방식] 
-- SELECT A.ORDER_DATE
--      , A.MEMBER_ID     
--   FROM ORDERS A LEFT OUTER JOIN PAYMENT B ON (A.ORDER_ID = B.ORDER_ID)
--  WHERE B.ORDER_ID IS NULL;


---------------------------------------------------------------------

--1번 
select a.emp_id,
       a.name,
       b.dept_name
  from emp a,
       dept b
 where a.dept_no = b.dept_no
   and a.retire_yn = 'Y';


select a.emp_id,
       a.name,
       b.dept_name
  from emp a
 inner join dept b
on ( a.dept_no = b.dept_no )
 where a.retire_yn = 'Y'; 




--2번
select a.product_name,
       a.price,
       b.review_id,
       b.rating,
       b.review_text
  from lg_product a,
       product_review b
 where a.product_id = b.product_id
   and a.product_id = 3;

select a.product_name,
       a.price,
       b.review_id,
       b.rating,
       b.review_text
  from lg_product a
 inner join product_review b
on ( a.product_id = b.product_id )
 where a.product_id = 3;


--3번 
select a.purchase_date,
       a.quantity,
       b.member_name,
       b.email,
       c.product_name
  from member_purchase a,
       lg_member b,
       lg_product c
 where a.member_id = b.member_id
   and a.product_id = c.product_id
   and to_char(
   a.purchase_date,
   'YYYYMM'
) = '202503'
   and a.quantity = 1;

select a.purchase_date,
       a.quantity,
       b.member_name,
       b.email,
       c.product_name
  from member_purchase a
 inner join lg_member b
on a.member_id = b.member_id
 inner join lg_product c
on a.product_id = c.product_id
 where to_char(
      a.purchase_date,
      'YYYYMM'
   ) = '202503'
   and a.quantity = 1;

--4번 
select member_name,
       phone_number
  from member_purchase a,
       lg_member b
 where b.member_id = a.member_id (+)
   and a.member_id is null;

select member_name,
       phone_number
  from member_purchase a
 right outer join lg_member b
on ( b.member_id = a.member_id )
 where a.member_id is null;

--5번 
select product_name,
       price,
       stock_qty
  from member_purchase a,
       lg_product b
 where b.product_id = a.product_id (+)
   and a.product_id is null;


select product_name,
       price,
       stock_qty
  from member_purchase a
 right join lg_product b
on ( b.product_id = a.product_id )
 where a.product_id is null;