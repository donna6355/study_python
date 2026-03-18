select *
  from emp
 where emp_id = 'EMP005';

select *
  from emp
 where retire_yn = 'Y';

select *
  from lg_product
 where price >= 2000000;

select *
  from product_review
 where rating <= 2;

-- practice
-- DEPT 테이블에서 부서 번호(DEPT_NO)가 ‘D003’인 부서만 조회하시오. 
select *
  from dept
 where dept_no = 'D003';

-- EMP 테이블에서 사원 이름(NAME)이 '김영희'인 직원만 조회하시오.
select name,
       gender,
       job_title
  from emp
 where name = '김영희';

-- LG_PRODUCT 테이블에서 상품 잔여 수량이 200개 이하인 대상을 조회하시오. 
select *
  from lg_product
 where stock_qty <= 200;

-- PRODUCT_REVIEW 테이블에서 리뷰의 문자수가 1000을 초과하는 데이터만 추출하시오. 
select *
  from product_review
 where length(review_text) > 1000;


 ---------------------------------------------------------------------------
 -- and, or 조건
 ---------------------------------------------------------------------------
select *
  from emp
 where job_title = '선임'
   and leave_amount <= 5;

select *
  from as_request
 where status = 'DONE'
    or status = 'IN_PROGRESS';

-- practice
/*
문제1. MEMBER_PURCHASE 테이블에는 LG사용자가 어떤 상품을 몇개 구매했는지 구매내역 정보가 담겨있는 테이블입니다.  
전체 데이터 중에서 PRODUCT_ID 가 10이고, 이 상품을 구매한 개수(QUANTITY)가 2개 이상인 구매내역 정보만 추출하시오. 
*/
select *
  from member_purchase
 where product_id = 10
   and quantity >= 2;

-- 문제2. PRODUCT_REVIEW 에서 상품ID가 13인 상품에 대해 리뷰의 격차에 따른 반응을 보고자 합니다. 
-- 평점이 5이거나 1인 대상만 추출해주세요. 
select *
  from product_review
 where product_id = 13
   and ( rating = 5
    or rating = 1 );

select rating,
       count(*)
  from product_review
 where product_id = 13
 group by rating;

-- 문제3. EMP 에서 직원중에 퇴사한 팀장급의 남직원만 조회하시오. 
select *
  from emp
 where gender = 'M'
   and retire_yn = 'Y'
   and job_title = '팀장';


--문제4. LG 상품 중에서 상품 가격이 100만원 이상 200만원 이하이면서 , 동시에 잔여 수량이 200개 이상 400개 이하인 상품을 조회하시오.
select *
  from lg_product
 where ( price >= 1000000
   and price <= 2000000 )
   and ( stock_qty >= 200
   and stock_qty <= 400 );



 ---------------------------------------------------------------------------
 -- NOT 조건
 ---------------------------------------------------------------------------

select *
  from emp
 where job_title != '선임';


select *
  from emp
 where not job_title = '선임';

-- 문제 1] EMP 테이블에서 성별이 'M'이 아니면서, 퇴사 여부가 'Y'인 사원을 조회하시오.
select *
  from emp
 where gender != 'M'
   and retire_yn = 'Y';


-- 문제 2] PRODUCT_REVIEW 테이블에서 상품ID가 13이면서 평점이 5점과 4점이 아닌 대상만 조회하시오. 
select *
  from product_review
 where product_id = 13
   and rating != 5
   and rating != 4;


 ---------------------------------------------------------------------------
 -- NULL 조건
 ---------------------------------------------------------------------------

select *
  from emp
 where retire_date is null
   and job_title = '선임';

select *
  from emp
 where retire_date is not null;



 ---------------------------------------------------------------------------
 -- SQL 연산자
 ---------------------------------------------------------------------------

-- equivalent to multiple or conditions
select *
  from dept
 where dept_no in ( 'D001',
                    'D002',
                    'D003' );
/*
SELECT * 
FROM DEPT
WHERE DEPT_NO = 'D001'
    OR DEPT_NO = 'D002' 
    OR DEPT_NO = 'D004' ;
*/

-- range condition
-- between A and B : A <= value <= B
select *
  from emp
 where job_title = '선임'
   and retire_yn = 'N'
   and leave_amount between 5 and 10;

/*
SELECT * 
FROM EMP 
WHERE JOB_TITLE = '선임' 
   AND RETIRE_YN = 'N' 
   AND LEAVE_AMOUNT >=5 
   AND LEAVE_AMOUNT <=10 ;   
*/

-- pattern matching
-- % : zero or more characters
-- _ : exactly one character

select *
  from emp
 where name like '김%';

select *
  from emp
 where name like '_미_';

select *
  from emp
 where name like '%하%';

select *
  from product_review
 where product_id = 2
   and review_text like '%스탠바이미%';

select *
  from lg_member
 where email like '%hotmail.com'
   and member_name like '%늘%';


--1. 전체 사원 중에 2025년에 퇴사한 사원들을 추출하시오.
select *
  from emp
 where retire_yn = 'Y'
   and to_char(
   retire_date,
   'YYYY'
) = '2025';

select *
  from emp
 where retire_date is not null
   and retire_date >= to_date('20250101000000','YYYYMMDDHH24MISS')
   and retire_date <= to_date('20251231235959','YYYYMMDDHH24MISS');


select *
  from emp
 where birth_date >= '19980101'
   and birth_date <= '20001231';


-- practice

-- [1] 2024년 이후로 입사한 사람들 중에 선임, 수석 정보만 뽑아주시고, 퇴사한 사원들 정보도 포함해서 뽑아주세요. 
-- 필요한 정보는 사원아이디, 이름, 입사일자, 잔여연차수에요. (인사팀 요청) 
select emp_id,
       name,
       hire_date,
       leave_amount
  from emp
 where job_title in ( '수석',
                      '선임' )
   and hire_date > '20231231';


--[2] 우리 서비스를 이용하는 회원 중에 2023년도에 가입했으면서 
-- 주소가 부산광역시로 시작하는 대상을 출력해주세요. ( JOIN_DATE는 가입일시를 의미) 
select *
  from lg_member
 where to_char(
      join_date,
      'YYYY'
   ) = '2023'
   and address like '부산광역시%';

-- [3] 사내 복지 이벤트로 “우주최강”페스티벌 이벤트를 진행하려 합니다, 
-- 사원중에 재직자를 대상으로 성이 “우” ,“주”,”최”,”강” 으로 시작하는 대상을 찾아주세요.
select *
  from emp
 where retire_yn = 'N'
  --  and ( name like '우%'
  --   or name like '주%'
  --   or name like '최%'
  --   or name like '강%' );
   and substr(
   name,
   1,
   1
) in ( '우',
       '주',
       '최',
       '강' );


-- [4] 전체 상품 리뷰 데이터 중에 2025년 8월치 리뷰 데이터 중에 
-- 평점이 3점 이하인 것들만 아래와 같이 추출해주세요. 어떤 리뷰에서 고객 불만이 있는지 분석하려고 해요. 
select product_id,
       created_at,
       rating,
       review_text
  from product_review
 where rating <= 3
   and to_char(
   created_at,
   'YYYYMM'
) = '202508';