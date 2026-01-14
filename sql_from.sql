-- 스키마부터 전부 나열해줘야 데이터베이스가 해석할 수 있음
-- 테이블을 하나만 참고할 때는 생략 가능!

select c##lg_db.emp.emp_id,
       c##lg_db.emp.name,
       c##lg_db.emp.job_level
  from c##lg_db.emp
 where c##lg_db.emp.job_level in ( 'P1',
                                   'P2' );

/*하지만 FROM에 테이블이 두 개 이상이면 테이블 간에 
동일한 컬럼명이 존재할 수 있기에 테이블명을 명시해야 합니다.*/
-- 테이블명을 함께 명시해주는게 일반적인 컨벤션
select emp.emp_id,
       emp.name,
       emp.dept_no  --이 컬럼은 EMP,DEPT 모두 가지고 있으므로 오류 발생
       ,
       dept.dept_name
  from emp,
       dept;

-- 별칭(알리아스) 사용하기
select a.emp_id,
       a.name,
       b.dept_no,
       b.dept_name
  from emp a,
       dept b;






/*

--설명을 위해 간단한 테스트용 테이블과 데이터를 추가하겠습니다.
--아래 코드를 그대로 복붙하여 실행해주세요. 
--전체 드래그 후 CTRL + ENTER 하면 실행됩니다. 

DROP TABLE 회원; 
DROP TABLE 회원연락처 ;

CREATE TABLE 회원 ( 
    회원ID VARCHAR2(20) PRIMARY KEY , 
      이름 VARCHAR2(50) 
);
INSERT INTO 회원 
SELECT 'A0001' , '동동일' FROM DUAL UNION ALL 
SELECT 'A0002' , '동동이' FROM DUAL UNION ALL 
SELECT 'A0003' , '동동삼' FROM DUAL UNION ALL
SELECT 'A0005' , '동동오' FROM DUAL ;

CREATE TABLE 회원연락처 ( 
    회원ID VARCHAR2(20) ,
    구분코드 VARCHAR2(20) , 
    연락처 VARCHAR2(30) ,
    PRIMARY KEY(회원ID , 구분코드 ) 
);

INSERT INTO 회원연락처
SELECT 'A0001' , '휴대폰' , '010-111-1111' FROM DUAL UNION ALL 
SELECT 'A0001' , '집전화' , '062-111-1111' FROM DUAL UNION ALL 
SELECT 'A0002' , '집전화' , '062-222-2222' FROM DUAL UNION ALL 
SELECT 'A0004' , '휴대폰' , '010-4444-4444' FROM DUAL ;

COMMIT; 


*/

select a.product_name,
       a.price,
       b.product_id,
       b.member_id,
       c.member_name,
       c.email
  from lg_product a,
       member_purchase b,
       lg_member c
 where a.product_id = b.product_id
   and b.member_id = c.member_id
   and a.product_id = 13;


select *
  from 회원 a,
       회원연락처 b
 where a.회원id = b.회원id;

 -- practice


 -- [1] EMP 테이블과 DEPT 테이블을 활용해서 퇴사한 사원들이 
 -- 각각 어떤 부서에 속해있었는지 함께 출력해주세요. 
select b.emp_id,
       b.name,
       a.dept_name
  from dept a,
       emp b
 where a.dept_no = b.dept_no
   and b.retire_yn = 'Y'
 order by b.emp_id;

 -- [2] PRODUCT_REVIEW 테이블에서 상품ID가 3인 상품의 
 -- 리뷰와 상품의 이름, 가격을 함게 출력하세요. 
select a.product_name,
       a.price,
       b.review_id,
       b.rating,
       b.review_text
  from lg_product a,
       product_review b
 where a.product_id = b.product_id
   and a.product_id = 3;

-- [3] (심화) 2025년 3월에 구매이력이 있는 회원들의 이름과 이메일, 
-- 그리고 어떤 상품을 구매했는지 상품명을 함께 출력하세요. 
-- 단, 구매 수량이 1개인 것만 대상으로 조회하시오. 
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

-- outer join
select *
  from 회원 a,
       회원연락처 b
 where a.회원id = b.회원id (+);

-- 상품을 한번도 구매하지 않은 회원 정보만 추출하시오.
select a.member_name,
       a.phone_number
  from lg_member a,
       member_purchase b
 where a.member_id = b.member_id (+)
   and b.purchase_date is null;

-- 회원이 한번도 구매한 경험이 없는 상품 리스트를 출력하시오.
select b.product_name,
       b.price,
       b.stock_qty
  from member_purchase a,
       lg_product b
 where a.product_id (+) = b.product_id
   and a.purchase_id is null;

-- other way to extract #1
-- minus 
-- A minu B => only A value

select product_id
  from lg_product
minus
select distinct product_id
  from member_purchase;

-- sub query 
select *
  from lg_product
 where product_id in (
   select product_id
     from lg_product
   minus
   select distinct product_id
     from member_purchase
);

-- other way to extract #2
select *
  from lg_product
 where not exists (
   select 1
     from member_purchase
    where product_id = lg_product.product_id
);