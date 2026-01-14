---- creat table ----

create table users (
   id    number primary key,
   name  varchar2(50) not null,
   email varchar2(50)
);


---- insert data ----
/*
insert into $tableName (col1, col2) values (val1, val2)
*/

insert into users (
   id,
   name,
   email
) values ( 1,
           'Isaac',
           'isaac@example.com' );


insert into users values ( 3,
                           'Moomin',
                           'moomin@moomin.com' );

-- copy column only --
create table emp_bu
   as
      select *
        from emp
       where 1 = 0;
-- insert-select --
-- though insert allows only 1 row only, insert selected data makes it possible for multi data insertion
insert into emp_bu
   select *
     from emp
    where retire_yn = 'N';
select *
  from emp_bu;





---- update data ----

update users
   set name = 'Alice',
       email = 'alice@gmail.com'
 where name = 'alice';

select *
  from users;



---- delete data ----
delete from users
 where name = 'Isaac';




------------------------------------------
-----------------practice-----------------
------------------------------------------

-- [1] 신규 사원 ‘김연경’이 팀장으로 입사했습니다. 
-- 부서는 ‘전장사업본부(VS)’ 입니다. 적절한 DEPT_NO를 찾아서 다음 데이터를 추가해주세요. 
insert into emp (
   emp_id,
   name,
   gender,
   emp.birth_date,
   emp.hire_date,
   emp.job_title,
   emp.job_level,
   emp.dept_no,
   emp.leave_amount,
   emp.retire_yn,
   emp.retire_date,
   emp.created_at
) values ( 'EMP101',
           '김연경',
           'F',
           '19801212',
           '20250718',
           '팀장',
           'P1',
           (
              select dept_no
                from dept
               where dept_name = '전장사업본부'
           ),
           15,
           'N',
           null,
           sysdate );

select *
  from emp
 where name = '김연경';


-- AS_REQUEST는 고객의 AS요청 접수 데이터가 들어있습니다. 
-- REQUEST_ID 가 10인 접수건이 완료되어 상태를 변경하려고 합니다. 
-- 기존의 상태였던 IN_PROGRESS 를 DONE으로, COMPLETED_AT 를 NULL 에서 현재 시점(SYSDATE) 날짜로 변경해주세요. 

update as_request
   set status = 'DONE',
       completed_at = sysdate
 where request_id = 10;

select *
  from as_request;



-- 아래 5건의 리뷰를 한번 조회해보고 대상을 삭제해주세요. (단, in 연산자를 활용하세요) 
-- 삭제할 리뷰ID : 496, 1196, 1208, 1371, 1587 

select *
  from product_review
 where review_id in ( 496,
                      1196,
                      1208,
                      1371,
                      1587 );

select *
  from product_review;

delete from product_review
 where review_id in ( 496,
                      1196,
                      1208,
                      1371,
                      1587 );

-- 리뷰 내용 중에서 내용에 “#이벤트참여” 멘트가 있거나 
-- “#이벤트참여” 멘트가 있는 대상중에서 리뷰가 3점 이하인 대상을 삭제해주세요. 
-- 아래 REVIEW_ID가 삭제되도록 해야 합니다. (2639, 2620)
delete from product_review
 where review_text like '%#이벤트참여%'
   and rating < 4;


-- LG멤버의 고객 '서하늘'님은 LG상품인 'LG 디오스 오브제컬렉션 광파오븐' 을 
-- 2개 구매하였습니다. 해당 요청에 맞게 적절하게 데이터를 INSERT 하거나 UPDATE 해보세요. 

-- purchase history insert
insert into member_purchase (
   purchase_id,
   member_id,
   product_id,
   quantity,
   total_price,
   purchase_date
) values ( (
   select max(purchase_id)
     from member_purchase
) + 1,
           (
              select member_id
                from lg_member
               where member_name = '서하늘'
           ),
           (
              select product_id
                from lg_product
               where product_name = 'LG 디오스 오브제컬렉션 광파오븐'
           ),
           2,
           (
              select price
                from lg_product
               where product_name = 'LG 디오스 오브제컬렉션 광파오븐'
           ) * 2,
           sysdate );

-- product stock qty update

update lg_product
   set
   stock_qty = stock_qty - 2
 where product_name = 'LG 디오스 오브제컬렉션 광파오븐';

select *
  from lg_product
 where product_name = 'LG 디오스 오브제컬렉션 광파오븐';