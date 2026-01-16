-- window function table ddl

-- CREATE TABLE branch_sales (
--     ID NUMBER PRIMARY KEY,
--     BRANCH_ID VARCHAR2(10),
--     PRODUCT_NAME VARCHAR2(100),
--     MONTH NUMBER(2),
--     SALES_AMOUNT NUMBER
-- );

-- INSERT INTO branch_sales (ID, BRANCH_ID, PRODUCT_NAME, MONTH, SALES_AMOUNT) VALUES (1, '001', '상품A', 1, 5000);
-- INSERT INTO branch_sales (ID, BRANCH_ID, PRODUCT_NAME, MONTH, SALES_AMOUNT) VALUES (2, '001', '상품B', 2, 8000);
-- INSERT INTO branch_sales (ID, BRANCH_ID, PRODUCT_NAME, MONTH, SALES_AMOUNT) VALUES (3, '001', '상품C', 3, 11000);
-- INSERT INTO branch_sales (ID, BRANCH_ID, PRODUCT_NAME, MONTH, SALES_AMOUNT) VALUES (4, '002', '상품D', 1, 25000);
-- INSERT INTO branch_sales (ID, BRANCH_ID, PRODUCT_NAME, MONTH, SALES_AMOUNT) VALUES (5, '002', '상품E', 2, 25000);
-- INSERT INTO branch_sales (ID, BRANCH_ID, PRODUCT_NAME, MONTH, SALES_AMOUNT) VALUES (6, '002', '상품F', 3, 15000);
-- INSERT INTO branch_sales (ID, BRANCH_ID, PRODUCT_NAME, MONTH, SALES_AMOUNT) VALUES (7, '003', '상품G', 1, 7000);
-- INSERT INTO branch_sales (ID, BRANCH_ID, PRODUCT_NAME, MONTH, SALES_AMOUNT) VALUES (8, '003', '상품H', 2, 8000);
-- INSERT INTO branch_sales (ID, BRANCH_ID, PRODUCT_NAME, MONTH, SALES_AMOUNT) VALUES (9, '003', '상품I', 3, 9000);
-- INSERT INTO branch_sales (ID, BRANCH_ID, PRODUCT_NAME, MONTH, SALES_AMOUNT) VALUES (10, '004', '상품J', 1, 40000);
-- INSERT INTO branch_sales (ID, BRANCH_ID, PRODUCT_NAME, MONTH, SALES_AMOUNT) VALUES (11, '004', '상품K', 2, 50000);

-- COMMIT; 


---------rank

select branch_id,
       product_name,
       sales_amount,
       rank()
      --  over(
      --      order by sales_amount desc
      --  ) as ranking,
      --  dense_rank()
      --  over(
      --      order by sales_amount desc
      --  ) as ranking2,
      --  row_number()
       over(partition by branch_id
            order by sales_amount desc
       ) as ranking3
  from branch_sales;



  /*
  LG_PRODUCT 테이블을 이용해서 각 카테고리별로 가격이 비싼 순서대로 고유한 순위를 부여해보세요. 
  (RN 컬럼은 alias이며, 각 카테고리별로 가격이 높은 순으로 고유 순위가 있는 것을 볼 수 있습니다) 
  */

select row_number()
       over(partition by category
            order by price desc
) as rn,
       product_id,
       product_name,
       price,
       category
  from lg_product;


--위 결과를 인라인 뷰로 감싼다음 카테고리별로 가장 비싼 상품과, 2번째로 비싼 상품도 출력해보세요. 
select *
  from (
   select row_number()
          over(partition by category
               order by price desc
   ) as rn,
          product_id,
          product_name,
          price,
          category
     from lg_product
)
 where rn = 1;

select *
  from (
   select row_number()
          over(partition by category
               order by price desc
   ) as rn,
          product_id,
          product_name,
          price,
          category
     from lg_product
)
 where rn = 2;

 -- 이번에는 상품을 카테고리별로 가장 최근에 등록된 제품만 출력해주세요.
select product_name,
       price,
       created_at
  from (
   select product_name,
          price,
          created_at,
          row_number()
          over(partition by category
               order by created_at desc
          ) as latest
     from lg_product
)
 where latest = 1;

 /*
 3. HR부서(인적자원관리부)를 제외한 나머지 부서에 대해 재직중인 사원들을 대상으로 연차 사용을 촉진하려고 합니다. 
 HR부서를 제외한 부서별로 연차가 많이 남아 있는 순서대로 순위를 부여해서 표현해주세요.  
 단, **동일한 값은 동순위를 부여하고, 그 다음값은 순위를 건너뛰지 않습니다.** 
 **(DENSE_RANK 쓰라는 뜻)** 
    
    즉, 부서별로 연차가 많이 남은 3순위까지 출력해주세요.
 */

select *
  from (
   select emp_id,
          name,
          dept_no,
          job_title,
          leave_amount,
          dense_rank()
          over(partition by dept_no
               order by leave_amount desc
          ) as rank
     from emp
    where dept_no != 'D005'
      and retire_yn = 'N'
)
 where rank <= 3;




 -----------------WINDOWING--------------
 -- 행의 범위를 지정한다.

 --[예] 아래 쿼리를 실행해봅시다. 
--지점별로(PARTITION BY BRANCH_ID) 월을 기준으로 오름차정렬해서(ORDER BY MONTH)
--매출합계를 구할건데( SUM(SALES_AMOUNT) ) 결과가 어떻게 나올까?? 
select branch_id,
       product_name,
       sales_amount,
       month,
       sum(sales_amount)
       over(partition by branch_id
            order by month
          range between unbounded preceding and current row -- default windowing
       ) as 누적합
  from branch_sales;

select ts,
       power_w,
       log_no,
       sum(power_w)
       over(
           order by log_no
       ) as 파워누적합
  from log_ac
 where to_char(
   ts,
   'yyyymmdd'
) = '20251007';



---------------LAG-----------------
-- 이전 행을 가져옴
-- 지점별 월별 판매액과 그 전달 판매액을 보고 싶을 때
select branch_id,
       product_name,
       sales_amount,
       month,
       lag(sales_amount,
           1,
           0)
       over(partition by branch_id
            order by month
       ) as prev
  from branch_sales;

---------------LEAD-----------------
-- 다음 행 가져오기
select branch_id,
       product_name,
       sales_amount,
       month,
       lead(sales_amount,
            1,
            0)
       over(partition by branch_id
            order by month
       ) as next
  from branch_sales;